package backend.servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.io.PrintWriter;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.ServerAddress;

import com.mongodb.client.MongoDatabase;
import com.mongodb.client.MongoCollection;

import org.bson.Document;
import java.util.Arrays;
import com.mongodb.Block;

import com.mongodb.client.MongoCursor;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.result.DeleteResult;
import static com.mongodb.client.model.Updates.*;
import com.mongodb.client.result.UpdateResult;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/**
 * Servlet implementation class pullUSNResult
 */
public class pullUSNResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MongoClient mongoClient;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pullUSNResult() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// RETURNS: JSON DATA
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		
		// get the USN POST parameter
		
		// get result documents
		
		// convert documents list to list of JSON strings
		
		// send back JSON strings
		
		String USN= request.getParameter("USN");
		mongoClient = new MongoClient("localhost", 27017);
		MongoDatabase database = mongoClient.getDatabase("test");
		MongoCollection<Document> collection4 = database.getCollection("student");
		MongoCollection<Document> collection3 = database.getCollection("result");
		MongoCollection<Document> collection2 = database.getCollection("subjectresult");
		MongoCollection<Document> collection1 = database.getCollection("course");
		Document selected_doc = collection4.find(eq("USN", USN)).first();
		ArrayList list= (ArrayList)selected_doc.get("Result_id");
		
		JSONObject semresult=  new JSONObject();
		JSONArray record= new JSONArray(); 
		
		for(Object i:list){
			System.out.println("MAIN: "+Integer.parseInt(i.toString()));
			Document result_reco= collection3.find(eq("_id",Integer.parseInt(i.toString()))).first();
			
			try {
				semresult.put("SEMESTER",result_reco.get("Sem").toString());
				semresult.put("YEAR", result_reco.get("Year").toString());
			} catch(Exception e) {
				System.out.println("Exception #1: "+e);
			}
			
			
			ArrayList list2= (ArrayList)result_reco.get("Subjectresult_id");
			ArrayList<String> list3= new ArrayList<String>();
			for(Object i2:list2){
				Document subjectresult_reco= collection2.find(eq("_id",Integer.parseInt(i2.toString()))).first();
				Object temp2= subjectresult_reco.get("Course_id");
				Document course_reco= collection1.find(eq("_id",temp2.toString())).first();
				list3.add(course_reco.get("Course_name").toString());
				
			}
			try {
				semresult.put("COURSESTAKEN",String.join(",",list3));
				semresult.put("SGPA",(result_reco.get("Sgpa")).toString());
				semresult.put("CGPA",result_reco.get("Cgpa").toString());
			} catch(Exception e) {
				System.out.println("Exception #2: "+e);
			}
			record.put(semresult);
			semresult= new JSONObject();
			
	    }
		
		
		// DELETE Later if found of no use
		response.getWriter().println(record);
		
		
		
	}

}
