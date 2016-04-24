package by.bntu.hosting.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.Iterator;
import java.util.Locale;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.xuggle.xuggler.ICodec;
import com.xuggle.xuggler.IContainer;
import com.xuggle.xuggler.IPacket;
import com.xuggle.xuggler.IStream;
import com.xuggle.xuggler.IStreamCoder;
import com.xuggle.xuggler.IVideoPicture;
import com.xuggle.xuggler.Utils;

import by.bntu.hosting.model.UploadedFile;
import by.bntu.hosting.model.Video;
import by.bntu.hosting.service.VideoService;
import by.bntu.hosting.utils.EditVideoName;

@Controller
public class UploadController {

    private static final String SERVERHOME_NAME = "catalina.home";
    private static final String DOWNLOAD_DIR = "hostingDownload";
    private static final String DOWNLOAD_DIR_V = "video";
    private static final String DOWNLOAD_DIR_I = "image";

    @Autowired
    MessageSource messageSource;

    @Autowired
    VideoService videoService;

    UploadedFile uploadedFile = null;

    @RequestMapping(value = "/uploadpage", method = RequestMethod.GET)
    public String getUploadPage() {
	return "upload";
    }

    @RequestMapping(value = "/download", method = RequestMethod.POST, produces = { "text/html; charset=UTF-8" })
    public @ResponseBody String upload(MultipartHttpServletRequest request, HttpServletResponse response, Locale locale,
	    Principal user) {

	Iterator<String> itr = request.getFileNames();
	MultipartFile mpf = null;
	while (itr.hasNext()) {

	    mpf = request.getFile(itr.next());

	    uploadedFile = new UploadedFile();
	    uploadedFile.setFileName(mpf.getOriginalFilename());
	    uploadedFile.setFileSize(mpf.getSize() / 1024 + " Kb");
	    uploadedFile.setFileType(mpf.getContentType());
	    try {
		uploadedFile.setBytes(mpf.getBytes());

		File outdir = createDir(DOWNLOAD_DIR_V);

		FileCopyUtils.copy(mpf.getBytes(),
			new FileOutputStream(outdir.getAbsolutePath() + File.separator + mpf.getOriginalFilename()));
		getImageFromVideo(outdir.getAbsolutePath());
		addVideoDB(uploadedFile.getFileName(), user.getName());
	    } catch (Exception e) {
		e.printStackTrace();
		return messageSource.getMessage("upload.file.error", null, locale);
	    }
	}
	return messageSource.getMessage("upload.file", null, locale) + " '" + uploadedFile.getFileName() + "' "
		+ messageSource.getMessage("upload.file.success", null, locale);

    }

    public void getImageFromVideo(String videoPath) throws Exception {
	try {

	    File outdir = createDir(DOWNLOAD_DIR_I);
	    String filename = videoPath + File.separator + uploadedFile.getFileName();
	    IContainer container = IContainer.make();
	    if (container.open(filename, IContainer.Type.READ, null) < 0) {
		throw new IllegalArgumentException("could not open file: " + filename);
	    }
	    int numStreams = container.getNumStreams();
	    int videoStreamId = -1;
	    IStreamCoder videoCoder = null;

	    for (int i = 0; i < numStreams; i++) {
		IStream stream = container.getStream(i);
		IStreamCoder coder = stream.getStreamCoder();
		if (coder.getCodecType() == ICodec.Type.CODEC_TYPE_VIDEO) {
		    videoStreamId = i;
		    videoCoder = coder;
		    break;
		}
	    }
	    if (videoStreamId == -1)
		throw new RuntimeException("could not find video stream in container: " + filename);

	    if (videoCoder.open() < 0)
		throw new RuntimeException("could not open video decoder for container: " + filename);

	    IPacket packet = IPacket.make();
	    // с 3-ей по 5-ую микросекунду
	    long start = 6 * 1000 * 1000;
	    long end = 12 * 1000 * 1000;
	    // с разницей в 100 милисекунд
	    long step = 500 * 1000;

	    END: while (container.readNextPacket(packet) >= 0) {
		if (packet.getStreamIndex() == videoStreamId) {
		    IVideoPicture picture = IVideoPicture.make(videoCoder.getPixelType(), videoCoder.getWidth(),
			    videoCoder.getHeight());
		    int offset = 0;
		    while (offset < packet.getSize()) {
			int bytesDecoded = videoCoder.decodeVideo(picture, packet, offset);
			// Если что-то пошло не так
			if (bytesDecoded < 0)
			    throw new RuntimeException("got error decoding video in: " + filename);
			offset += bytesDecoded;

			if (picture.isComplete()) {
			    IVideoPicture newPic = picture;
			    long timestamp = picture.getTimeStamp();
			    if (timestamp > start) {
				BufferedImage javaImage = Utils.videoPictureToImage(newPic);
				String fileName = EditVideoName.editName(uploadedFile.getFileName()) + ".png";
				ImageIO.write(javaImage, "PNG", new File(outdir, fileName));
				start += step;
			    }
			    if (timestamp > end) {
				break END;
			    }
			}
		    }
		}
	    }
	    if (videoCoder != null) {
		videoCoder.close();
		videoCoder = null;
	    }
	    if (container != null) {
		container.close();
		container = null;
	    }

	} catch (Exception e) {
	    e.printStackTrace();
	}
    }

    private File createDir(String dirName) {
	String rootPath = System.getProperty(SERVERHOME_NAME);
	File dir = new File(rootPath + File.separator + DOWNLOAD_DIR + File.separator + dirName);
	if (!dir.exists()) {
	    dir.mkdirs();
	}
	return dir;
    }

    public void addVideoDB(String videoName, String userName) {
	Video video = new Video(videoName, userName);
	videoService.addVideo(video);
    }
}
