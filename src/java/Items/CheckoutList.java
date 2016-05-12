/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Items;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author yixxie
 */
@Entity
@Table(name = "CheckoutList")
@IdClass(CheckoutKey.class)
public class CheckoutList implements Serializable {
    
    @Id
    private String isbn;
    @Id
    private String userName;
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkoutTime;
    @Temporal(TemporalType.TIMESTAMP)
    private Date dueTime;

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
    
    public Date getCheckoutTime(){
        return checkoutTime;
    }
    public void setCheckoutTime(Date checkoutTime){
        this.checkoutTime=checkoutTime;
    }
     public Date getDueTime(){
        return dueTime;
    }
    public void setDueTime(Date dueTime){
        this.dueTime=dueTime;
    }
            
}
