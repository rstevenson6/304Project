import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.junit.Test;

/**
 * Tests order web site.  Note that these tests are not exhaustive.  The TA will still inspect your code.
 */
@SuppressWarnings("nls")
public class TestSite
{				
	public static String baseUrl = "http://cosc304.ok.ubc.ca/rlawrenc/tomcat/Lab7/";
	
	/**
     * Tests list orders.
     */
    @Test
    public void testListOrders() throws Exception
    {   
    	// Initialize the data
    	LoadData.loadData();
    	
    	String result = retrievePage(baseUrl+"listorder.jsp");
                
        // Verify contents as expected
        // Remove start of string
        result = result.substring(result.indexOf("List</h1>")+9);                
        System.out.println(result);
        
        // Verify all orders are there
        assert(result.contains("<td>1</td><td>1</td><td>A. Anderson</td>"));
        assert(result.contains("<td>2</td><td>2</td><td>B. Brown</td>"));
        assert(result.contains("<td>3</td><td>3</td><td>C. Cole</td>"));
        assert(result.contains("<td>4</td><td>4</td><td>D. Doe</td>"));
        assert(result.contains("<td>5</td><td>5</td><td>E. Elliott</td>"));
        assert(result.contains("<td>6</td><td>1</td><td>A. Anderson</td>"));
        
        // Verify first and last list of products are there
        assert(result.contains("<tr><td>10</td><td>1</td><td>$31.00</td></tr>"));
        assert(result.contains("<tr><td>20</td><td>1</td><td>$81.00</td></tr>"));
        assert(result.contains("<tr><td>30</td><td>1</td><td>$25.89</td></tr>"));
        assert(result.contains("<tr><td>50</td><td>1</td><td>$16.25</td></tr>"));
        assert(result.contains("<tr><td>51</td><td>2</td><td>$53.00</td></tr>"));
        assert(result.contains("<tr><td>52</td><td>3</td><td>$7.00</td></tr>"));
        assert(result.contains("<tr><td>53</td><td>4</td><td>$32.80</td></tr>"));   
        
        // TODO: Add another test after insert an order
    }
    
    /**
     * Tests list products.
     */
    @Test
    public void testListProducts() throws Exception
    {   
    	// TODO: 
    }
    
    /**
     * Tests place order.
     */
    @Test
    public void testPlaceOrder() throws Exception
    {   
    	// TODO: 
    }
    
    /**
     * Retrieves a web page as a string.
     * 
     * @param url
     * 		URL
     * @return
     * 		web page contents
     * @throws Exception
     * 		if an error occurs
     */
    public static String retrievePage(String url) throws Exception
    {
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuilder response = new StringBuilder(80);

		while ((inputLine = in.readLine()) != null) 
		{
			response.append(inputLine);
		}
		in.close();

		return response.toString();
    }       
}
