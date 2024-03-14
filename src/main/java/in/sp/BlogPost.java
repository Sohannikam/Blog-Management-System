package in.sp;

import java.io.Serializable;
import java.sql.Blob;

public class BlogPost implements Serializable {
    private static final long serialVersionUID = 1L;

    private String title;
    private String description;
    private String date;
    public int id;
    private Blob image;

    // Constructor
    public BlogPost(String title, String description, String date,int id,Blob image) {
        this.title = title;
        this.description = description;
        this.date = date;
        this.id=id;
        this.image = image;
    }

    // Getters and Setters (You can generate these using your IDE)

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    public int getID() {
        return id;
    }

    public void setID(int id) {
        this.id = id;
    }
    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }
}
