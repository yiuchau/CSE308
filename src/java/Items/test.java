/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Items;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.io.File;


/**
 *
 * @author yixxie
 * Used to test database
 */
public class test {
    public static void main(String[] args){
        
      try {

	File fXmlFile = new File("src/java/information.xml");
	DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	Document doc = dBuilder.parse(fXmlFile);
			
	//optional, but recommended
	//read this - http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
	doc.getDocumentElement().normalize();

	System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
			
	NodeList nList = doc.getElementsByTagName("book");
			
	System.out.println("----------------------------");

	for (int temp = 0; temp < nList.getLength(); temp++) {

		Node nNode = nList.item(temp);
				
		System.out.println("\nCurrent Element :" + nNode.getNodeName());
				
		if (nNode.getNodeType() == Node.ELEMENT_NODE) {

			Element eElement = (Element) nNode;

			//System.out.println("Staff id : " + eElement.getAttribute("id"));
			System.out.println("Title: " + eElement.getElementsByTagName("title").item(0).getTextContent());
			System.out.println("ISBN : " + eElement.getElementsByTagName("isbn").item(0).getTextContent());
			System.out.println("subject : " + eElement.getElementsByTagName("subject").item(0).getTextContent());
			//System.out.println("Salary : " + eElement.getElementsByTagName("salary").item(0).getTextContent());

		}
	}
    } catch (Exception e) {
	e.printStackTrace();
    }
  }

}