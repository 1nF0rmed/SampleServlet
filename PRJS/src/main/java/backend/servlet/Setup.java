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
import java.util.Arrays;
import com.mongodb.Block;

import com.mongodb.client.MongoCursor;
import static com.mongodb.client.model.Filters.*;
import com.mongodb.client.result.DeleteResult;
import static com.mongodb.client.model.Updates.*;
import com.mongodb.client.result.UpdateResult;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class Setup
 */
public class Setup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MongoClient mongoClient;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Setup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Basically create a collection and a few documents in that.
		mongoClient = new MongoClient("localhost", 27017);
		
		MongoDatabase database = mongoClient.getDatabase("test");
		
		MongoCollection<Document> collection = database.getCollection("students");
		Document doc = new Document("USN", "1BM17IS086")
				.append("Name", "Vaishu")
				.append("Sem", "5")
				.append("Courses", Arrays.asList("Java", "DBMS", "AI"));
		Document doc2 = new Document("USN", "1BM18IS413")
				.append("Name", "Rahul")
				.append("Sem", "5")
				.append("Courses", Arrays.asList("Python", "DBMS", "AI"));
		
		collection.insertOne(doc);
		collection.insertOne(doc2);
		
		response.getWriter().println("Setup Complete.");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
