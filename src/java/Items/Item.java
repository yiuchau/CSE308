
package Items;


import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "Item")
public class Item implements Serializable {
   
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String isbn; 
    private String title;   
    private String author;
    private String publisher;  //if no publisher, "none" in database
    private String releaseDate;
    private String pageCount;   //if no pageCount available, "none" in database
    private String categories;
    private String description;
    private String previewLink;
    private double averageRating; //default 0
    private int totalCopies;
    private int availableCopies;
    private String imageURL;
    private int type; 
    //0 ebook, 1 audio, 2 movie 
    
    public Item() {
        
    }
    public int getID(){
        return id;
    }
    public void setID(int id){
        this.id=id;
    }
    public String getISBN() {
        return isbn;
    }
    public void setISBN(String isbn) {
        this.isbn = isbn;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getAuthor(){
        return author;
    }
    public void setAuthor(String author){
        this.author=author;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getPublisher() {
        return publisher;
    }
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    public String getReleaseDate() {
        return releaseDate;
    }
    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }
    public String getPageCount(){
        return pageCount;
    }
    public void setPageCount(String pageCount){
        this.pageCount=pageCount;
    }
    public String getCategories(){
        return categories;
    }
    public void setCategories(String categories){
        this.categories=categories;
    }
    public String getPreviewLink(){
        return previewLink;
    }
    public void setPreviewLink(String previewLink){
        this.previewLink=previewLink;
    }
    public double getAverageRating() {
        return averageRating;
    }
    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }
    public int getTotalCopies() {
        return totalCopies;
    }
    public void setTotalCopies(int totalCopies) {
        this.totalCopies = totalCopies;
    }
    public int getAvailableCopies() {
        return availableCopies;
    }
    public void setAvailableCopies(int availableCopies) {
        this.availableCopies = availableCopies;
    }
    public String getImageURL(){
        return imageURL;
    }
    public void setImageURL(String imageURL){
        this.imageURL=imageURL;
    }
    public int getType(){
        return type;
    }
    public void setType(int type){
        this.type=type;
    }
       
}
