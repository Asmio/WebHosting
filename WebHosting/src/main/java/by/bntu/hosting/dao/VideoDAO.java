package by.bntu.hosting.dao;

import java.util.List;

import by.bntu.hosting.model.Video;

public interface VideoDAO {

    public void addVideo(Video video);

    public Boolean removeVideo(Long id);

    public Video getVideo(String name);

    public Video getVideo(Long id);

    public List<Video> listVideo();

    public List<Video> listVideo(String userName);

    public List<Video> listVideo(Integer firstResult, Integer maxResults);

    public List<Video> listVideo(String userName, Integer firstResult, Integer maxResults);

    public void updateVideo(Video video);

}
