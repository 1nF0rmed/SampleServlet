package backend.servlet;

import org.jfree.chart.*;
import org.jfree.data.category.*;

public class ChartGenerator {
	private CategoryDataset createDataset( ) {
	      final String fiat = "FIAT";        
	      final String audi = "AUDI";        
	      final String ford = "FORD";        
	      final String speed = "Speed";        
	      final String millage = "Millage";        
	      final String userrating = "User Rating";        
	      final String safety = "safety";        
	      final DefaultCategoryDataset dataset = 
	      new DefaultCategoryDataset( );  

	      dataset.addValue( 1.0 , fiat , speed );        
	      dataset.addValue( 3.0 , fiat , userrating );        
	      dataset.addValue( 5.0 , fiat , millage ); 
	      dataset.addValue( 5.0 , fiat , safety );           

	      dataset.addValue( 5.0 , audi , speed );        
	      dataset.addValue( 6.0 , audi , userrating );       
	      dataset.addValue( 10.0 , audi , millage );        
	      dataset.addValue( 4.0 , audi , safety );

	      dataset.addValue( 4.0 , ford , speed );        
	      dataset.addValue( 2.0 , ford , userrating );        
	      dataset.addValue( 3.0 , ford , millage );        
	      dataset.addValue( 6.0 , ford , safety );               

	      return dataset; 
	   }
}
