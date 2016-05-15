package by.bntu.hosting.model;

import org.springframework.stereotype.Component;

@Component
public class Search {

    private String dataSearch;

    public Search() {

    }

    public String getDataSearch() {
	return dataSearch;
    }

    public void setDataSearch(String dataSearch) {
	this.dataSearch = dataSearch;
    }
}
