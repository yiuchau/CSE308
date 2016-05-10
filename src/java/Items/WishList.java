/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Items;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author zhaoy
 */
@Entity
@Table(name = "WishList")
@IdClass(WishlistKey.class)
public class WishList implements Serializable{
    
    @Id
    private String isbn;
    @Id
    private String userName;
     @Temporal(TemporalType.TIMESTAMP)
    private Date wishtime;

    public String getIsbn(){
        return isbn;
    }
    public void setIsbn(String isbn){
        this.isbn=isbn;
    }
    public String getUserName(){
        return userName;
    }
    public void setUserName(String userName){
        this.userName=userName;
    }

    public Date getWishtime() {
        return wishtime;
    }

    public void setWishtime(Date wishtime) {
        this.wishtime = wishtime;
    }
    
    
}
