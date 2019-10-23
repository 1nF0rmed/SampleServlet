package backend.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.ServerAddress;

import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;

import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.Arrays;

import com.mongodb.BasicDBList;
import com.mongodb.Block;

import com.mongodb.client.MongoCursor;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.result.DeleteResult;
import static com.mongodb.client.model.Updates.*;
import com.mongodb.client.result.UpdateResult;
import java.util.ArrayList;
import java.util.List;


public class DatabaseInterface {
	MongoClient mongoClient;
	
	
	DatabaseInterface(){
		mongoClient = new MongoClient("localhost", 27017);
	}
	
	protected void getCourses(String USN){
		MongoDatabase database = mongoClient.getDatabase("test");
		
		MongoCollection<Document> collection4 = database.getCollection("student");
		MongoCollection<Document> collection1 = database.getCollection("course");
		
		Document selected_doc= collection4.find(eq("USN",USN)).first();
		
		ArrayList list = (ArrayList)selected_doc.get("Course_id");
		for(Object i: list){
			Document course_reco= collection1.find(eq("_id",i.toString())).first();
			System.out.println(course_reco.get("Course_name"));
		}
	}
	
	public String getCourseCode(String Name) {
		MongoDatabase database = mongoClient.getDatabase("test");
		MongoCollection<Document> courseCollection = database.getCollection("course");
		
		Document selected_doc= courseCollection.find(eq("Course_name",Name)).first();
		
		// If a document was found
		if(selected_doc != null) {
			return selected_doc.getString("_id");
		}
		return "0"; // If not found.
	}
	
	public ArrayList<Document> getResults(String sec, int year, int sem) {
		MongoDatabase database = mongoClient.getDatabase("test");
		MongoCollection<Document> resultCollection = database.getCollection("result");
		
		// filter
		Bson filter = and(eq("Sec", sec), eq("Sem", sem), eq("Year", year));
		
		// An array to store all the documents
		ArrayList<Document> filteredResultsArray = new ArrayList();
		
		// Loop through filtered documents and add to array
		for(Document doc:resultCollection.find(filter)) {
			filteredResultsArray.add(doc);
		}
		
		// return the filtered result array
		return filteredResultsArray;
	}

	protected void getResults(String USN){
		MongoDatabase database = mongoClient.getDatabase("test");
		
		MongoCollection<Document> collection1 = database.getCollection("course");
		MongoCollection<Document> collection2 = database.getCollection("subjectresult");
		MongoCollection<Document> collection3 = database.getCollection("result");
		MongoCollection<Document> collection4 = database.getCollection("student");
		
		Document selected_doc= collection4.find(eq("USN",USN)).first();
		ArrayList list= (ArrayList)selected_doc.get("Result_id");
		
		for(Object i:list){
			Document result_reco= collection3.find(eq("_id",Integer.parseInt(i.toString()))).first();
			
			System.out.println("SEM: " + result_reco.get("Sem"));
			System.out.println("YEAR: " + result_reco.get("Year"));
			
			ArrayList list2= (ArrayList)result_reco.get("Subjectresult_id");
			
			for(Object i2:list2){
				Document subjectresult_reco= collection2.find(eq("_id",Integer.parseInt(i2.toString()))).first();
				Object temp= subjectresult_reco.get("Course_id");
				Document course_reco= collection1.find(eq("_id",temp.toString())).first();
				
				System.out.println("Course_name: "+ course_reco.get("Course_name"));
				System.out.println("CIE: " + subjectresult_reco.get("Cie"));
				System.out.println("SEE: "+ subjectresult_reco.get("See"));
				System.out.println("GRADE: "+subjectresult_reco.get("Grade"));
			}
			System.out.println("SGPA: " + result_reco.get("Sgpa"));
			System.out.println("CGPA: " + result_reco.get("Cgpa"));
	    }
	}

	protected void getInfo(String USN){
		MongoDatabase database = mongoClient.getDatabase("test");
		
		MongoCollection<Document> collection3 = database.getCollection("result");
		MongoCollection<Document> collection4 = database.getCollection("student");
		
		Document selected_doc= collection4.find(eq("USN",USN)).first();
		
		System.out.println("NAME: "+ selected_doc.get("Name"));
		System.out.println("USN: "+ selected_doc.get("USN"));
		System.out.println("CURRENT SEM: "+ selected_doc.get("Sem"));
		System.out.println("SEC: "+ selected_doc.get("Sec"));
		System.out.println("CGPA: "+ selected_doc.get("Cgpa"));
		}
}
