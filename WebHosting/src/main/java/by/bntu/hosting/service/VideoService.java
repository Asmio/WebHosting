package by.bntu.hosting.service;

import java.util.List;

import by.bntu.hosting.model.Video;

public interface VideoService {

    public void addVideo(Video video);

    public void removeVideo(Video video);

    public Video getVideo(String name);

    public List<Video> listVideo();

    public List<Video> listVideo(String userName);
}
