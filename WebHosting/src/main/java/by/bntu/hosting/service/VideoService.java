package by.bntu.hosting.service;

import java.util.List;

import by.bntu.hosting.model.Video;

public interface VideoService {

    public void addVideo(Video video);

    public Boolean removeVideo(Long id);

    public Video getVideo(String name);

    public Video getVideo(Long id);

    public List<Video> listVideo();

    public List<Video> listVideo(String userName);

    public List<Video> listVideo(Integer firstResult, Integer maxResults);

    public List<Video> listVideo(String userName, Integer firstResult, Integer maxResults);

    public void updateDescription(String description, Long id);

    public void updateName(String nameVideo, Long id);
}
