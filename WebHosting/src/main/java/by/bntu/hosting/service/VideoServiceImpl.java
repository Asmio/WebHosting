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
    public void removeVideo(Video video) {
	videoDAO.removeVideo(video);
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
    public Video getVideo(Long id) {
	return videoDAO.getVideo(id);
    }

}
