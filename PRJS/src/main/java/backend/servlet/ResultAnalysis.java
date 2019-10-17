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
import com.mongodb.Block;

import com.mongodb.client.MongoCursor;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.result.DeleteResult;
import static com.mongodb.client.model.Updates.*;
import com.mongodb.client.result.UpdateResult;
import com.mongodb.session.ClientSession;

import java.util.ArrayList;
import java.util.List;
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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
