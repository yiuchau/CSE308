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
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author yixxie
 */
@Entity
@Table(name = "CheckoutList")
public class CheckoutList implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String isbn;
    private String userName;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date checkoutTime;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dueTime;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
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
