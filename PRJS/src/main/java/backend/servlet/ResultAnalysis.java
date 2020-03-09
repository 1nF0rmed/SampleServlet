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
import com.mongodb.client.DistinctIterable;
import com.mongodb.client.MongoCollection;

import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.Arrays;
import java.util.HashMap;

import com.mongodb.Block;

import com.mongodb.client.MongoCursor;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.result.DeleteResult;
import static com.mongodb.client.model.Updates.*;
import com.mongodb.client.result.UpdateResult;
import com.mongodb.session.ClientSession;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class ResultAnalysis
 */
public class ResultAnalysis extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MongoClient mongoClient;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultAnalysis() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// Setup database connection
		mongoClient = new MongoClient("localhost", 27017);
		
		// Load the result handling web page
		String type = request.getParameter("type");
		System.out.println("TYPE: "+type);
		
		// Handle get requests for year info
		if(type.equals("year")) {
			//
			// INFO: Get distinct year values
			//
			
			JSONArray record= new JSONArray(); 
			
			MongoDatabase database = mongoClient.getDatabase("test");
			MongoCollection<Document> resultCollection = database.getCollection("result");
			
			DistinctIterable<Integer> resultSet = resultCollection.distinct("Year", Integer.class);
			
			System.out.println("[LOG] TYPE: YEAR, Getting data");
			for(int year:resultSet) {
				record.put(year);
				
				System.out.println("Year: "+year);
			}
			
			response.getWriter().println(record);
		}// end of type 'year'
		
		// Handle get requests for sem info
		else if(type.equals("sem")) {
			//
			// INFO: Get distinct sem values
			// REQ: Year value
			//
			int year = Integer.parseInt(request.getParameter("year"));
			
			JSONArray record= new JSONArray(); 
			
			MongoDatabase database = mongoClient.getDatabase("test");
			MongoCollection<Document> resultCollection = database.getCollection("result");
			
			Bson filter = eq("Year", year);
			
			DistinctIterable<Integer> resultSet = resultCollection.distinct("Sem", filter, Integer.class);
			
			System.out.println("[LOG] TYPE: YEAR, Getting data");
			for(int sem:resultSet) {
				record.put(sem);
				
				System.out.println("Sem: "+sem);
			}
			
			response.getWriter().println(record);
		}
		
		// Handles the request for section
		/*else if(type.equals("section")) {
			//
			// INFO: Get distinct sem values
			// REQ: Year value
			//
			int year = Integer.parseInt(request.getParameter("year"));
			int semester = Integer.parseInt(request.getParameter("sem"));
			
			JSONArray record= new JSONArray(); 
			
			MongoDatabase database = mongoClient.getDatabase("test");
			MongoCollection<Document> resultCollection = database.getCollection("result");
			
			Bson filter = and(eq("Year", year), eq("Sem", semester));
			
			DistinctIterable<String> resultSet = resultCollection.distinct("Sec", filter, String.class);
			
			System.out.println("[LOG] TYPE: Section, Getting data");
			for(String sec:resultSet) {
				record.put(sec);
				
				System.out.println("Sec: "+sec);
			}
			
			response.getWriter().println(record);
		}*/
		
		// Handles the request for section
		else if(type.equals("subject")) {
		//
		// INFO: Get distinct sem values
		// REQ: Year value
		//
		int semester = Integer.parseInt(request.getParameter("sem"));
		
		JSONArray record= new JSONArray(); 
					
		MongoDatabase database = mongoClient.getDatabase("test");
		MongoCollection<Document> resultCollection = database.getCollection("course");
					
		Bson filter = eq("Sem", semester);
					
		DistinctIterable<String> resultSet = resultCollection.distinct("Course_name", filter, String.class);
					
		System.out.println("[LOG] TYPE: Course, Getting data");
		for(String sec:resultSet) {
			record.put(sec);
						
			System.out.println("Course: "+sec);
		}
					
		response.getWriter().println(record);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		// Handle analysis of request data
		//
		// Get request data
		String subject = request.getParameter("sub");
		//String section = request.getParameter("sec");
		int year = Integer.parseInt(request.getParameter("year"));
		int semester = Integer.parseInt(request.getParameter("sem"));
		
		mongoClient = new MongoClient("localhost", 27017);
		MongoDatabase database = mongoClient.getDatabase("test");
		MongoCollection<Document> subResultCollection = database.getCollection("subjectresult");
		
		DatabaseInterface dbi = new DatabaseInterface();
		// Get the subject code for the subject
		String course_code = dbi.getCourseCode(subject);
		
		System.out.println("[LOG] Course Code: "+course_code);
		
		if(course_code.equals("0")) { // If no such course code is found
			response.getWriter().println("Invalid Subject Selected.");
			return;
		}
		
		// Get result documents for year, sem
		ArrayList<Document> resultsList = dbi.getResults(year, semester);
		
		// Check if no results were found
		if(resultsList.size()==0) {
			response.getWriter().println("No results found.");
			return;
		}
		
		System.out.println("[LOG] ResultList size: "+resultsList.size());
		
		// Variable to store the frequency of grades
		HashMap<String, Integer> freq = new HashMap<String, Integer>();
		String grades[] = {"S", "A", "B", "C", "D", "E", "F"};
		
		// Setup the map
		for(String grade:grades) {
			freq.put(grade, 0);
		}
		
		// Extract subjectresult from the result list that corresponds to the course_code
		for(Document doc:resultsList) {
			List<Integer> subjectResult_ids = doc.getList("Subjectresult_id", Integer.class);
			
			// Loop through each subjectresult_id and check if related to course_code
			for(int sub_id:subjectResult_ids) {
				
				// Get the document if related to course_id
				Document sub_doc = subResultCollection.find(eq("_id", sub_id)).first();
				
				if(sub_doc.getString("Course_id").equals(course_code)) {
					String grade = sub_doc.getString("Grade");
					freq.replace(grade, freq.get(grade)+1);
				}
				
			}
		}
		
		// Return the frequency in the format of JSON
		System.out.println(freq);
		
		JSONObject freqJSON = new JSONObject(freq);
		
		response.getWriter().println(freqJSON.toString());
	}

}
