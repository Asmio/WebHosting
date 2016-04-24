package by.bntu.hosting.dao;

import java.util.List;

import by.bntu.hosting.model.Video;

public interface VideoDAO {

    public void addVideo(Video video);

    public void removeVideo(Video video);

    public Video getVideo(String name);

    public Video getVideo(Long id);

    public List<Video> listVideo();

    public List<Video> listVideo(String userName);
}
