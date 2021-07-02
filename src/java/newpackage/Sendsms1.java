package newpackage;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;


import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Sendsms1 extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
             String number = (String)session.getAttribute("contact");
//             String token = (String)session.getAttribute("token");
//             String date = (String)session.getAttribute("dob");
//             System.out.println(number);
//             System.out.println(token);
//             System.out.println(date);
       
    

	
	
//		System.out.println(message);
//		System.out.println(number);
	
		
//		 HttpSession session = request.getSession();
		String apiKey="0jUvfFB2QYCiOK93gh1Dcxrn8SpV6eqsduAMbRWmtoZlHT5kLNRjb03itq75A8aSHONLrwoPcmpgDC6G";
		String sendId="FSTSMS";
                String message="Thanks for visiting Dr.Kapil Kochhar's Clinic.";
		
		message=URLEncoder.encode(message, "UTF-8");
		String language="english";
		
		String route="p";
		
		
		String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id="+sendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+number;
		
		
		URL url=new URL(myUrl);
		
		HttpsURLConnection con=(HttpsURLConnection)url.openConnection();
		
		
		con.setRequestMethod("GET");
		
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setRequestProperty("cache-control", "no-cache");
		System.out.println("Wait..............");
		
		int code=con.getResponseCode();
		
		System.out.println("Response code : "+code);
		
		StringBuffer response1=new StringBuffer();
		
		BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
		
		while(true)
		{
			String line=br.readLine();
			if(line==null)
			{
				break;
			}
			response1.append(line);
		}
		
		System.out.println(response);
		response.sendRedirect("patientinfo.jsp");
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}