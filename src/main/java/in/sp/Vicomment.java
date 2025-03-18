package in.sp;

import java.io.Serializable;


public class Vicomment implements Serializable {
	private static final long serialVersionUID = 1L;

    private String come;
   
    public int blog;
   
    public String email;
    
    private String date;
    public Vicomment(String come,int blog,String email, String date) {
        this.come = come;
        this.blog = blog;
        this.email=email;
        this.date=date;
        
    }
    
    public String getCome() {
		return come;
	}

	public void setCome(String come) {
		this.come = come;
	}

	public int getBlog() {
		return blog;
	}

	public void setBlog(int blog) {
		this.blog = blog;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


    // Constructor
 

//    // Getters and Setters (You can generate these using your IDE)
//
//    public String getComm() {
//        return come;
//    }
//
//    public void setComm(String come) {
//        this.come = come;
//    }
//
//
//    public int getID() {
//        return blog;
//    }
//
//    public void setID(int blog) {
//        this.blog = blog;
//    }
//    
//    public String getemail()
//    {
//    	return email;
//    }
//  
}
