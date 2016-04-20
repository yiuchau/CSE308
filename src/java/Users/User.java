
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
 
   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)
    private String username;
    private String password; //might change later
    //private String rePassword;
    private String firstName;
    private String lastName;
    private String email;
    private int role; //1:member, 2:admin,3:publisher
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
     public void setRole(int role){
        this.role=role;
    }
    public int getRole(){
        return role;
    }
    public int sendMessage() {
        return 0;
    }
    
    public int logout()
    {
        return 0;
    }     
}
