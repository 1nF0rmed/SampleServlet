package backend.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/**
 * Servlet implementation class DataUpload
 */
public class DataUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MongoClient mongoClient;
	MongoDatabase database;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataUpload() {
        super();
        // TODO Auto-generated constructor stub
        mongoClient = new MongoClient("localhost", 27017);
        database = mongoClient.getDatabase("test");
    }
    
    public void setup() {
    	Document doc;
    	ArrayList<String> subjects = new ArrayList<String>();
    	try
        {
    		System.out.println(System.getProperty("user.dir"));
            FileInputStream file = new FileInputStream(new File("data_tmp.xlsx"));
 
            //Create Workbook instance holding reference to .xlsx file
            XSSFWorkbook workbook = new XSSFWorkbook(file);
 
            //Get first/desired sheet from the workbook
            XSSFSheet sheet = workbook.getSheetAt(0);
 
            //Iterate through each rows one by one
            Iterator<Row> rowIterator = sheet.iterator();
            
            // Get the subjects
            Row row = sheet.getRow(0);
            for(int i = row.getFirstCellNum()+1;i<row.getLastCellNum();i++) {
            	// Get the subject code cell
            	Cell cell = row.getCell(i);
            	if(cell.getStringCellValue().equals(""))
            		continue;
            	subjects.add(cell.getStringCellValue());
            	
            }
            System.out.println(subjects);
            /*
            while (rowIterator.hasNext()) 
            {
                Row row = rowIterator.next();
                //For each row, iterate through all the columns
                Iterator<Cell> cellIterator = row.cellIterator();
                 
                while (cellIterator.hasNext()) 
                {
                    Cell cell = cellIterator.next();
                    //Check the cell type and format accordingly
                    switch (cell.getCellType()) 
                    {
                        case NUMERIC:
                            System.out.print(cell.getNumericCellValue() + "\t");
                            break;
                        case STRING:
                            System.out.print(cell.getStringCellValue() + "\t");
                            break;
                    }
                }
                System.out.println("");
            }*/
            
            // Upload to database [only testing, do not use in production]
            MongoCollection<Document> collection2= database.getCollection("subjectresult");
            doc = new Document("Course_id","abc1")
					.append("_id",101)
					.append("Cie",35)
					.append("See",45)
					.append("Grade","C");
            collection2.insertOne(doc);
            doc = new Document("Course_id","abc2")
					.append("_id",102)
					.append("Cie",36)
					.append("See",70)
					.append("Grade","B");
            collection2.insertOne(doc);
            doc = new Document("Course_id","abc3")
					.append("_id",103)
					.append("Cie",37)
					.append("See",89)
					.append("Grade","A");
            collection2.insertOne(doc);
            doc = new Document("Course_id","abc4")
					.append("_id",104)
					.append("Cie",38)
					.append("See",65)
					.append("Grade","B");
            collection2.insertOne(doc);
            doc = new Document("Course_id","abc5")
					.append("_id",105)
					.append("Cie",39)
					.append("See",55)
					.append("Grade","C");
            collection2.insertOne(doc);
            
            MongoCollection<Document> collection3= database.getCollection("result");
            
            doc=new Document("_id",111)
					.append("Sem",4)
					.append("Year",2018)
					.append("Sec", "B")								// UPDATE
					.append("Subjectresult_id",Arrays.asList(101, 102, 103, 104, 105))
					.append("Sgpa",7.9)
					.append("Cgpa",7.9);
            collection3.insertOne(doc);
            
            
            file.close();
        } 
        catch (Exception e) 
        {
            e.printStackTrace();
        }
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		setup();
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
