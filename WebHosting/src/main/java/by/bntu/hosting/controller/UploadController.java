package by.bntu.hosting.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
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
import org.springframework.web.bind.annotation.RequestParam;
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
import by.bntu.hosting.utils.ManagementResourses;

@Controller
public class UploadController {

    private static final String DIR_VIDEO_KEY = "download.dir.video";
    private static final String DIR_IMAGE_KEY = "download.dir.image";

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

		File outdir = createDir(DIR_VIDEO_KEY);

		FileCopyUtils.copy(mpf.getBytes(),
			new FileOutputStream(outdir.getAbsolutePath() + File.separator + mpf.getOriginalFilename()));
		getImageFromVideo(outdir.getAbsolutePath(), uploadedFile.getFileName());
		addVideoDB(uploadedFile.getFileName(), user.getName());
	    } catch (Exception e) {
		e.printStackTrace();
		return messageSource.getMessage("upload.file.error", null, locale);
	    }
	}
	return messageSource.getMessage("upload.file", null, locale) + " '" + uploadedFile.getFileName() + "' "
		+ messageSource.getMessage("upload.file.success", null, locale);

    }

    @RequestMapping(value = "webcam/downloadFromWebcam", method = RequestMethod.GET, produces = {
	    "text/html; charset=UTF-8" })
    @ResponseBody
    public String uploadFromWebcam(@RequestParam String fileURL, Locale locale, Principal user) throws IOException {

	File outdir = createDir(DIR_VIDEO_KEY);
	String fileName = EditVideoName.getName(fileURL);
	URL link = new URL(fileURL);

	BufferedInputStream bis = new BufferedInputStream(link.openStream());
	FileOutputStream fis = new FileOutputStream(outdir.getAbsolutePath() + File.separator + fileName);

	try {
	    byte[] buffer = new byte[1024];
	    int count = 0;
	    while ((count = bis.read(buffer, 0, 1024)) != -1) {
		fis.write(buffer, 0, count);
	    }
	    fis.close();
	    bis.close();

	    getImageFromVideo(outdir.getAbsolutePath(), fileName);
	    addVideoDB(fileName, user.getName());
	} catch (Exception e) {
	    e.printStackTrace();
	    return messageSource.getMessage("webcam.upload.error", null, locale);
	}
	return messageSource.getMessage("webcam.upload.success", null, locale);
    }

    public void getImageFromVideo(String videoPath, String fileName) throws Exception {
	try {

	    File outdir = createDir(DIR_IMAGE_KEY);
	    String pathFile = videoPath + File.separator + fileName;
	    IContainer container = IContainer.make();
	    if (container.open(pathFile, IContainer.Type.READ, null) < 0) {
		throw new IllegalArgumentException("could not open file: " + pathFile);
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
		throw new RuntimeException("could not find video stream in container: " + pathFile);

	    if (videoCoder.open() < 0)
		throw new RuntimeException("could not open video decoder for container: " + pathFile);

	    IPacket packet = IPacket.make();
	    // с 3-ей по 5-ую микросекунду
	    long start = 6 * 1000 * 100;
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
			    throw new RuntimeException("got error decoding video in: " + pathFile);
			offset += bytesDecoded;

			if (picture.isComplete()) {
			    IVideoPicture newPic = picture;
			    long timestamp = picture.getTimeStamp();
			    if (timestamp > start) {
				BufferedImage javaImage = Utils.videoPictureToImage(newPic);
				String nameImg = EditVideoName.editName(fileName) + ".png";
				ImageIO.write(javaImage, "PNG", new File(outdir, nameImg));
				break END;
				/* start += step; */
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

    private File createDir(String dirKey) {
	File dir = new File(ManagementResourses.getPath(dirKey));
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
