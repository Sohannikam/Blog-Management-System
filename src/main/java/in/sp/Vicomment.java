package in.sp;

import java.io.Serializable;

public class Vicomment implements Serializable {
	private static final long serialVersionUID = 1L;

    private String come;
   
    public int blog;
   

    // Constructor
    public Vicomment(String come,int blog) {
        this.come = come;
        this.blog = blog;
        
    }

    // Getters and Setters (You can generate these using your IDE)

    public String getComm() {
        return come;
    }

    public void setComm(String come) {
        this.come = come;
    }


    public int getID() {
        return blog;
    }

    public void setID(int blog) {
        this.blog = blog;
    }
  
}
