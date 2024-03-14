package in.sp;
import java.io.Serializable;
public class User implements Serializable {
    private int userId;
    private String username;
    private String email;

    public User() {
    }

    public User(int userId, String username,String email) {
        this.userId = userId;
        this.username = username;
        this.email = email;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // You might want to override equals and hashCode for proper comparison in collections

}
