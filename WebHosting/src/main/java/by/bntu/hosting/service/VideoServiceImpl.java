package by.bntu.hosting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.bntu.hosting.dao.VideoDAO;
import by.bntu.hosting.model.Video;

@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    VideoDAO videoDAO;

    @Override
    @Transactional
    public void addVideo(Video video) {
	videoDAO.addVideo(video);

    }

    @Override
    @Transactional
    public Boolean removeVideo(Long id) {
	return videoDAO.removeVideo(id);
    }

    @Override
    @Transactional
    public Video getVideo(String name) {
	return videoDAO.getVideo(name);
    }

    @Override
    @Transactional
    public List<Video> listVideo() {
	return videoDAO.listVideo();
    }

    @Override
    @Transactional
    public List<Video> listVideo(String userName) {
	return videoDAO.listVideo(userName);
    }

    @Override
    @Transactional
    public List<Video> listVideo(Integer firstResult, Integer maxResults) {
	return videoDAO.listVideo(firstResult, maxResults);
    }

    @Override
    @Transactional
    public Video getVideo(Long id) {
	return videoDAO.getVideo(id);
    }

    @Override
    @Transactional
    public void updateDescription(String description, Long id) {
	Video video = videoDAO.getVideo(id);
	video.setDescription(description);
	videoDAO.updateVideo(video);
    }

    @Override
    @Transactional
    public void updateName(String nameVideo, Long id) {
	Video video = videoDAO.getVideo(id);
	video.setName(nameVideo);
	videoDAO.updateVideo(video);
    }

    @Override
    @Transactional
    public List<Video> listVideo(String userName, Integer firstResult, Integer maxResults) {
	return videoDAO.listVideo(userName, firstResult, maxResults);
    }

}
