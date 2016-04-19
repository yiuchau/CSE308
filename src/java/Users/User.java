
package Users;

public abstract class User {
    
    public enum Role {
    MEMBER, ADMINISTRATOR, PUBLISHER
}
    
    Role role;
    Long userId;
    String username;
    Byte[] password;
    String firstName;
    String lastName;
    Address address;
    
    public int deleteAccount() {
        return 0;
    }
    
    public int sendMessage() {
        return 0;
    }
    
    public int logout()
    {
        return 0;
    }    
    
    
    
    
    
}
