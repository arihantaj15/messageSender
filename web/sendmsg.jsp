<%@page import="java.io.BufferedReader"%>
<%@page import ="java.io.IOException" %>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import=" java.net.URLEncoder"%>
<%@page import=" javax.net.ssl.HttpsURLConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send message</title>
</head>
<body>
<%
    
String textmessage="Welcome to Dr.Kapil Kochhar's Clinic";
String phone=request.getParameter("contact");
String authkey = "0jUvfFB2QYCiOK93gh1Dcxrn8SpV6eqsduAMbRWmtoZlHT5kLNRjb03itq75A8aSHONLrwoPcmpgDC6G";
//Multiple mobiles numbers separated by comma
String mobiles = phone;
//Sender ID,While using route4 sender id should be 6 characters long.
String senderId = "TXTIND";
String language="english";
//Your message to send, Add URL encoding here.
String message = textmessage;
//define route
String route="p";
//HttpResponse response = Unirest.get("https://www.fast2sms.com/dev/bulkV2?authorization=YOUR_API_KEY&sender_id=TXTIND&message=This is a test message&route=v3&numbers=9999999999,8888888888,7777777777")
//  .header("cache-control", "no-cache")
//  .asString();
//Prepare Url
URLConnection myURLConnection=null;
URL myURL=null;
//BufferedReader reader=null;
//encoding message
String encoded_message=URLEncoder.encode(message,"UTF-8");
//String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+authkey+"&sender_id="+senderId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+mobiles;
String myUrl = "https://www.fast2sms.com/dev/bulkV2";
//Prepare parameter string
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
//	BufferedReader reader = new BufferedReader(new InputStreamReader(((HttpsURLConnection) (new URL(myUrl)).openConnection()).getInputStream()));	
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
		
		
		

%>
</body>
</html>