
package Users;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "USER_TABLE")
public class User implements Serializable {
 
    @Id
    //@GeneratedValue(strategy = GenerationType.AUTO)
    private String username;
    private String password; //might change later
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private int role; //1:member,2:admin,3:publisher
    private String lendingPeriod; //default value:3 days
    private String maturityLevel;//default adult 
    
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
    public String getPhoneNumber(){
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber){
        this.phoneNumber=phoneNumber;
    }
    public String getLendingPeriod(){
        return lendingPeriod;
    }
    public void setLendingPeriod(String lendingPeriod){
        this.lendingPeriod=lendingPeriod;
    }
    public String getMaturityLevel(){
        return maturityLevel;
    }
    public void setMaturityLevel(String maturityLevel){
        this.maturityLevel=maturityLevel;
    }
}
