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
		
		/*MongoCollection<Document> collection = database.getCollection("students");
		Document doc = new Document("USN", "1BM17IS086")
				.append("Name", "Vaishu")
				.append("Sem", "5")
				.append("Courses", Arrays.asList("Java", "DBMS", "AI"));
		Document doc2 = new Document("USN", "1BM18IS413")
				.append("Name", "Rahul")
				.append("Sem", "5")
				.append("Courses", Arrays.asList("Python", "DBMS", "AI"));
		
		collection.insertOne(doc);
		collection.insertOne(doc2);*/
		
		/*course collection1 - contains 9 courses- 3 for 3rd sem, 3 for 4th sem, 3 for 5th sem*/
		MongoCollection<Document> collection1= database.getCollection("course");
		Document doc = new Document("_id","abc1")
							.append("Course_name","Java")
							.append("Sem",5)
							.append("Start_year",2014);
		collection1.insertOne(doc);

		doc=new Document("_id","abc2")
							.append("Course_name","DBMS")
							.append("Sem",5)
							.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc3")
							.append("Course_name","AI")
							.append("Sem",5)
							.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc4")
							.append("Course_name","DS")
							.append("Sem",3)
							.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc5")
							.append("Course_name","MATHS")
							.append("Sem",3)
							.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc6")
							.append("Course_name","TFCS")
							.append("Sem",3)
							.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc7")
							.append("Course_name","USP")
							.append("Sem",4)
							.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc8")
							.append("Course_name","ADA")
							.append("Sem",4)
							.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc9")
							.append("Course_name","OS")
							.append("Sem",4)
							.append("Start_year",2014);
		collection1.insertOne(doc);
	/*
		doc=new Document("_id","abc10")
					.append("Course_name","COES")
					.append("Sem",5)
					.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc11")
					.append("Course_name","C++")
					.append("Sem",5)
					.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc12")
					.append("Course_name","LINEAR ALGEBRA")
					.append("Sem",3)
					.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc13")
					.append("Course_name","PSQ")
					.append("Sem",3)
					.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc14")
					.append("Course_name","DCN")
					.append("Sem",3)
					.append("Start_year",2014);
		collection1.insertOne(doc);
		doc=new Document("_id","abc15")
					.append("Course_name","WP")
					.append("Sem",4)
					.append("Start_year",2014);
		collection1.insertOne(doc);   */

		/*subjectresult collection2- contains 54 entries - 3 for each result entry in result collection*/
		MongoCollection<Document> collection2= database.getCollection("subjectresult");
		doc = new Document("Course_id","abc1")
							.append("_id",1)
							.append("Cie",45)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc2")
							.append("_id",2)
							.append("Cie",34)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc3")
							.append("_id",3)
							.append("Cie",48)
							.append("See",98)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc1")
							.append("_id",4)
							.append("Cie",48)
							.append("See",91)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc2")
							.append("_id",5)
							.append("Cie",30)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc3")
							.append("_id",6)
							.append("Cie",41)
							.append("See",90)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc1")
							.append("_id",7)
							.append("Cie",46)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc2")
							.append("_id",8)
							.append("Cie",34)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc3")
							.append("_id",9)
							.append("Cie",35)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc4")
							.append("_id",10)
							.append("Cie",45)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc5")
							.append("_id",11)
							.append("Cie",34)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc6")
							.append("_id",12)
							.append("Cie",48)
							.append("See",98)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc4")
							.append("_id",13)
							.append("Cie",48)
							.append("See",91)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc5")
							.append("_id",14)
							.append("Cie",30)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc6")
							.append("_id",15)
							.append("Cie",41)
							.append("See",90)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc4")
							.append("_id",16)
							.append("Cie",46)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc5")
							.append("_id",17)
							.append("Cie",34)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc6")
							.append("_id",18)
							.append("Cie",35)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);
		
		doc = new Document("Course_id","abc7")
							.append("_id",19)
							.append("Cie",45)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc8")
							.append("_id",20)
							.append("Cie",34)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc9")
							.append("_id",21)
							.append("Cie",48)
							.append("See",98)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc7")
							.append("_id",22)
							.append("Cie",48)
							.append("See",91)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc8")
							.append("_id",23)
							.append("Cie",30)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc9")
							.append("_id",24)
							.append("Cie",41)
							.append("See",90)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc7")
							.append("_id",25)
							.append("Cie",46)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc8")
							.append("_id",26)
							.append("Cie",34)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc9")
							.append("_id",27)
							.append("Cie",35)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);
		
		//new data
		doc = new Document("Course_id","abc1")
							.append("_id",28)
							.append("Cie",45)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc2")
							.append("_id",29)
							.append("Cie",34)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc3")
							.append("_id",30)
							.append("Cie",48)
							.append("See",98)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc1")
							.append("_id",31)
							.append("Cie",48)
							.append("See",91)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc2")
							.append("_id",32)
							.append("Cie",30)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc3")
							.append("_id",33)
							.append("Cie",41)
							.append("See",90)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc1")
							.append("_id",34)
							.append("Cie",46)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc2")
							.append("_id",35)
							.append("Cie",34)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc3")
							.append("_id",36)
							.append("Cie",35)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc4")
							.append("_id",37)
							.append("Cie",45)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc5")
							.append("_id",38)
							.append("Cie",34)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc6")
							.append("_id",39)
							.append("Cie",48)
							.append("See",98)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc4")
							.append("_id",40)
							.append("Cie",48)
							.append("See",91)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc5")
							.append("_id",41)
							.append("Cie",30)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc6")
							.append("_id",42)
							.append("Cie",41)
							.append("See",90)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc4")
							.append("_id",43)
							.append("Cie",46)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc5")
							.append("_id",44)
							.append("Cie",34)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc6")
							.append("_id",45)
							.append("Cie",35)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);

		doc = new Document("Course_id","abc7")
							.append("_id",46)
							.append("Cie",45)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc8")
							.append("_id",47)
							.append("Cie",34)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc9")
							.append("_id",48)
							.append("Cie",48)
							.append("See",98)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc7")
							.append("_id",49)
							.append("Cie",48)
							.append("See",91)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc8")
							.append("_id",50)
							.append("Cie",30)
							.append("See",78)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc9")
							.append("_id",51)
							.append("Cie",41)
							.append("See",90)
							.append("Grade","A");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc7")
							.append("_id",52)
							.append("Cie",46)
							.append("See",94)
							.append("Grade","S");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc8")
							.append("_id",53)
							.append("Cie",34)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);
		doc = new Document("Course_id","abc9")
							.append("_id",54)
							.append("Cie",35)
							.append("See",65)
							.append("Grade","B");
		collection2.insertOne(doc);


		/*result collection3- contains 18 entries- 3 for each student*/
		MongoCollection<Document> collection3= database.getCollection("result");
		doc = new Document("_id",1)
							.append("Sem",5)
							.append("Year",2019)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(1,2,3))
							.append("Sgpa",9.6)
							.append("Cgpa",9.4);
		collection3.insertOne(doc);

		doc=new Document("_id",2)
							.append("Sem",5)
							.append("Year",2019)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(4,5,6))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		doc=new Document("_id",3)
							.append("Sem",5)
							.append("Year",2019)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(7,8,9))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		doc = new Document("_id",4)
							.append("Sem",3)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(10,11,12))
							.append("Sgpa",9.6)
							.append("Cgpa",9.4);
		collection3.insertOne(doc);

		doc=new Document("_id",5)
							.append("Sem",3)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(13,14,15))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		doc=new Document("_id",6)
							.append("Sem",3)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(16,17,18))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		doc = new Document("_id",7)
							.append("Sem",4)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(19,20,21))
							.append("Sgpa",9.6)
							.append("Cgpa",9.4);
		collection3.insertOne(doc);

		doc=new Document("_id",8)
							.append("Sem",4)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(22,23,24))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		doc=new Document("_id",9)
							.append("Sem",4)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(25,26,27))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		//new 
		doc = new Document("_id",10)
							.append("Sem",5)
							.append("Year",2019)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(28,29,30))
							.append("Sgpa",9.6)
							.append("Cgpa",9.4);
		collection3.insertOne(doc);

		doc=new Document("_id",11)
							.append("Sem",5)
							.append("Year",2019)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(31,32,33))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		doc=new Document("_id",12)
							.append("Sem",5)
							.append("Year",2019)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(34,35,36))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		doc = new Document("_id",13)
							.append("Sem",3)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(37,38,39))
							.append("Sgpa",9.6)
							.append("Cgpa",9.4);
		collection3.insertOne(doc);

		doc=new Document("_id",14)
							.append("Sem",3)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(40,41,42))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		doc=new Document("_id",15)
							.append("Sem",3)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(43,44,45))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		doc = new Document("_id",16)
							.append("Sem",4)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(46,47,48))
							.append("Sgpa",9.6)
							.append("Cgpa",9.4);
		collection3.insertOne(doc);

		doc=new Document("_id",17)
							.append("Sem",4)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(49,50,51))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);
		doc=new Document("_id",18)
							.append("Sem",4)
							.append("Year",2018)
							.append("Sec", "B")								// UPDATE
							.append("Subjectresult_id",Arrays.asList(52,53,54))
							.append("Sgpa",9.3)
							.append("Cgpa",9.1);
		collection3.insertOne(doc);


		/*student collection4 - contains info for 3 students- each has 3,4,5 sem result included references*/
		MongoCollection<Document> collection4= database.getCollection("student");
		doc = new Document("USN","1BM17IS086")
							.append("Name","Vaishnavi")
							.append("Sem",5)
							.append("Sec","B")
							.append("Course_id",Arrays.asList("abc1","abc2","abc3"))
							.append("Result_id",Arrays.asList(1,4,7))
							.append("Cgpa",9.4);
		collection4.insertOne(doc);

		doc = new Document("USN","1BM17IS087")
							.append("Name","Rahul")
							.append("Sem",5)
							.append("Sec","B")
							.append("Course_id",Arrays.asList("abc1","abc2","abc3"))
							.append("Result_id",Arrays.asList(2,5,8))
							.append("Cgpa",9.4);
		collection4.insertOne(doc);

		doc = new Document("USN","1BM17IS088")
							.append("Name","Aditi")
							.append("Sem",5)
							.append("Sec","B")
							.append("Course_id",Arrays.asList("abc1","abc2","abc3"))
							.append("Result_id",Arrays.asList(3,6,9))
							.append("Cgpa",9.4);
		collection4.insertOne(doc);
		
		doc = new Document("USN","1BM17IS089")
							.append("Name","Rohan Dave")
							.append("Sem",5)
							.append("Sec","B")
							.append("Course_id",Arrays.asList("abc1","abc2","abc3"))
							.append("Result_id",Arrays.asList(10,13,16))
							.append("Cgpa",9.4);
		collection4.insertOne(doc);

		doc = new Document("USN","1BM17IS090")
							.append("Name","Roopa Maruti Shet")
							.append("Sem",5)
							.append("Sec","B")
							.append("Course_id",Arrays.asList("abc1","abc2","abc3"))
							.append("Result_id",Arrays.asList(11,14,17))
							.append("Cgpa",9.4);
		collection4.insertOne(doc);

		doc = new Document("USN","1BM17IS091")
							.append("Name","Vipin Bharadwaj")
							.append("Sem",5)
							.append("Sec","B")
							.append("Course_id",Arrays.asList("abc1","abc2","abc3"))
							.append("Result_id",Arrays.asList(12,15,18))
							.append("Cgpa",9.4);
		collection4.insertOne(doc);
		
		doc = new Document("USN","1BM17IS099")
				.append("Name","Viki Sahota")
				.append("Sem",5)
				.append("Sec","B")
				.append("Course_id",Arrays.asList("abc1","abc2","abc3", "abc4", "abc5"))
				.append("Result_id",Arrays.asList(111))
				.append("Cgpa",7.9);
		collection4.insertOne(doc);
		
		doc = new Document("USN","1BM17IS109")
				.append("Name","Jimmy Samba")
				.append("Sem",5)
				.append("Sec","B")
				.append("Course_id",Arrays.asList("abc1","abc2","abc3", "abc4", "abc5"))
				.append("Result_id",Arrays.asList(111))
				.append("Cgpa",7.9);
		collection4.insertOne(doc);
		
		doc = new Document("USN","1BM17IS121")
				.append("Name","Jenga Mano")
				.append("Sem",5)
				.append("Sec","B")
				.append("Course_id",Arrays.asList("abc1","abc2","abc3", "abc4", "abc5"))
				.append("Result_id",Arrays.asList(111))
				.append("Cgpa",8.2);
		collection4.insertOne(doc);
		
		doc = new Document("USN","1BM17IS122")
				.append("Name","Force Man")
				.append("Sem",5)
				.append("Sec","B")
				.append("Course_id",Arrays.asList("abc1","abc2","abc3", "abc4", "abc5"))
				.append("Result_id",Arrays.asList(111))
				.append("Cgpa",8.0);
		collection4.insertOne(doc);
		
		doc = new Document("USN","1BM17IS123")
				.append("Name","Samy Dakota")
				.append("Sem",5)
				.append("Sec","B")
				.append("Course_id",Arrays.asList("abc1","abc2","abc3"))
				.append("Result_id",Arrays.asList(11,14,17))
				.append("Cgpa",9.4);
		collection4.insertOne(doc);
		
		/**/
		MongoCollection<Document> facultyCollection= database.getCollection("faculty");
		doc = new Document("_id","faculty_IS_01")
							.append("Name","Dr. Professor 1")
							.append("Password", "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08");
		facultyCollection.insertOne(doc);
		
		doc = new Document("_id","faculty_IS_02")
							.append("Name","Dr. Professor 2")
							.append("Password", "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08");
		facultyCollection.insertOne(doc);
		
		doc = new Document("_id","faculty_IS_03")
							.append("Name","Dr. Professor 3")
							.append("Password", "9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08");
		facultyCollection.insertOne(doc);
        
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
