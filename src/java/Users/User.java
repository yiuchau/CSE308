
package Users;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table

public class User implements Serializable {
    /**
    public enum Role {
    MEMBER, ADMINISTRATOR, PUBLISHER
}
*/
   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)
    //Role role;  //not set yet
    //private Long userId; //not set yet
    private String username;
    private String password; //might change later
    private String rePassword;
    private String firstName;
    private String lastName;
    private String email;
    //private Address address;
    
    public void setUserName(String username){
        this.username=username;
    }
    public String getUserName(){
        return username;
    }
    public void setPassword(String password){
        this.password=password;
    }
    public String getPassword(){
        return password;
    }
    public void setRePassword(String rePassword){
        this.rePassword=rePassword;
    }
    public String getRePassword(){
        return rePassword;
    }
    public void setFirstName(String firstName){
        this.firstName=firstName;
    }
    public String getFirstName(){
        return firstName;
    }
    public void setLastName(String lastName){
        this.lastName=lastName;
    }
    public String getLastName(){
        return lastName;
    }
    public void setEmail(String email){
        this.email=email;
    }
    public String getEmail(){
        return email;
    }
    public int sendMessage() {
        return 0;
    }
    
    public int logout()
    {
        return 0;
    }     
}
