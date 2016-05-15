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
@Table(name = "Holds")
@IdClass(HoldsKey.class)
public class Holds implements Serializable {
    
    @Id
    private String isbn;
    @Id
    private String userName;
    @Temporal(TemporalType.TIMESTAMP)
    private Date placeHoldTime;
    @Temporal(TemporalType.TIMESTAMP)
    private Date suspendHold;
    private String checkOutType; //email or automatic

    public Date getSuspendHold() {
        return suspendHold;
    }

    public void setSuspendHold(Date suspendHold) {
        this.suspendHold = suspendHold;
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
     public Date getPlaceHoldTime(){
        return placeHoldTime;
    }
    public void setPlaceHoldTime(Date placeHoldTime){
        this.placeHoldTime=placeHoldTime;
    }
    public String getCheckOutType(){
        return checkOutType;
    }
    public void setCheckOutType(String checkOutType){
        this.checkOutType=checkOutType;
    }
}

