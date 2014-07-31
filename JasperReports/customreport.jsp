<%--
 *
 * IBM Confidential
 *
 * OCO Source Materials
 *
 * 5724-M19
 *
 * (C) COPYRIGHT IBM CORP. 2006
 *
 * The source code for this program is not published or otherwise
 * divested of its trade secrets, irrespective of what has been
 * deposited with the U.S. Copyright Office.
 *
--%>
<%@ page language="java" %>
<%@ page contentType="text/html; charset=utf-8" %>

<%--
The CipherPlusBase64 class is required for decrypting passwords.  It is included in encrypt.jar, 
which should be taken from <maximo>\applications\bocrystal\WEB-INF\lib and made available to the 
web application running this JSP file (for example by placing it in the WEB-INF\lib directory).
--%>
<%@ page import="psdi.util.CipherPlusBase64" %>
<%@ page import = "java.util.*" %>


<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>


<%
	String reportFile = (String)request.getParameter("reportFile");
	String reportDesc = (String)request.getParameter("reportDesc");	
	String reportFolder = (String)request.getParameter("reportFolder");
	String reportType = (String)request.getParameter("reportType");
	String userName = (String)request.getParameter("userName");
	String password = (String)request.getParameter("maxPass");
	String ParmUserName = (String)request.getParameter("ParmUserName");
	String ParmPassword = (String)request.getParameter("ParmPassword");
	String mroDBType = (String)request.getParameter("mroDBType");
	String schema = (String)request.getParameter("schema");
	String where = (String)request.getParameter("where");
	String mroOrg = (String)request.getParameter("mroOrg");
	String mroSite = (String)request.getParameter("mroSite");
	String baseTable = (String)request.getParameter("baseTable");
	String appname = (String)request.getParameter("appname");
	String mroLangCode = (String)request.getParameter("mroLangCode");
	String locale = (String)request.getParameter("locale");
	String localTZ = (String)request.getParameter("localTZ");
	String customserverURL = (String)request.getParameter("customserverURL");
	String customrptServerLogonPass = (String)request.getParameter("customrptServerLogonPass");
	String birturl = (String)request.getParameter("custombirt");
	String podr = (String)request.getParameter("podr");
	String status = (String)request.getParameter("status");
	String month = (String)request.getParameter("month");
	String year = (String)request.getParameter("year");


	
	String actionURL="";

	if (year.equalsIgnoreCase("") && month.equalsIgnoreCase(""))
	{actionURL = birturl + "flow.html?_flowId=viewReportFlow&reportUnit=%2Freports%2FP%2FPU74_0&standAlone=true&ParentFolderUri=/reports/P&mroSite="+ mroSite + "&podr=" + podr + "&j_username=joeuser&j_password=joeuser&output=xls";}
	
	if (year.equalsIgnoreCase("") && !month.equalsIgnoreCase(""))
	{actionURL = birturl + "flow.html?_flowId=viewReportFlow&reportUnit=%2Freports%2FP%2FPU74_0&standAlone=true&ParentFolderUri=/reports/P&mroSite="+ mroSite + "&podr=" + podr + "&month="+ month + "&j_username=joeuser&j_password=joeuser&output=xls";}
	
	if (!year.equalsIgnoreCase("") && month.equalsIgnoreCase(""))
	{actionURL = birturl + "flow.html?_flowId=viewReportFlow&reportUnit=%2Freports%2FP%2FPU74_0&standAlone=true&ParentFolderUri=/reports/P&mroSite="+ mroSite + "&podr=" + podr + "&year=" + year + "&j_username=joeuser&j_password=joeuser&output=xls";}
	
	if (!year.equalsIgnoreCase("") && !month.equalsIgnoreCase(""))
	{actionURL = birturl + "flow.html?_flowId=viewReportFlow&reportUnit=%2Freports%2FP%2FPU74_0&standAlone=true&ParentFolderUri=/reports/P&mroSite="+ mroSite + "&podr=" + podr + "&year=" +year + "&month="+ month + "&j_username=joeuser&j_password=joeuser&output=xls";}
		out.print(actionURL);    

	
	
	response.sendRedirect(actionURL);
%>

<html>
<head>
<title>MXES Custom Report Integration</title>
</head>
<body>	
<p>
<h4>The table below displays the standard values passed as request parameters from Maximo.  
Additional values may be passed in the following ways:</p><p>

Maximo System Properties</h4>
All customer-defined properties having names beginning with <i>mxe.report.custom</i> will
be passed as parameters to this page.  The request parameter name will be the word custom 
prepended to the last segment of the property name.  For example, a property named:<br>
&#160;&#160;&#160;mxe.report.custom.databasename<br>
would be accessed as follows:<br>
&#160;&#160;&#160;String dbName = (String)request.getParameter("customdatabasename");</p><p>

<h4>Report parameters</h4>
All report parameters will be passed.  The value in the Parameter Name field in the report definition will 
be used as the request parameter name. For example, the location parameter from Summary of Asset Failures
would be accessed as follows:<br>
&#160;&#160;&#160;String loc = (String)request.getParameter("location");<br>
If the parameter is bound, it will also be included in the where clause so the individual value may not be 
needed, but it is always available.</p>

<h4>Standard Maximo values</h4>
<table rules="all" cellpadding="3">
<tr><td>Report File Name</td><td><%=reportFile%></td></tr>
<tr><td>Report Description</td><td><%=reportDesc%></td></tr>
<tr><td>Report Folder</td><td><%=reportFolder%></td></tr>
<tr><td>Report Type</td><td><%=reportType%></td></tr>
<tr><td>Maximo User Name</td><td><%=userName%></td></tr>
<tr><td>Maximo Password</td><td><i>See file source for details</i></td></tr>
<tr><td>Database User Name</td><td><%=ParmUserName%></td></tr>
<tr><td>Database Password</td><td><i>See file source for details</i></td></tr>
<tr><td>Schema</td><td><%=schema%></td></tr>
<tr><td>Maximo Where Clause</td><td><%=where%></td></tr>
<tr><td>User Org</td><td><%=mroOrg%></td></tr>
<tr><td>User Site</td><td><%=mroSite%></td></tr>
<tr><td>App Main Table</td><td><%=baseTable%></td></tr>
<tr><td>App Name</td><td><%=appname%></td></tr>
<tr><td>Language Code</td><td><%=mroLangCode%></td></tr>
<tr><td>Locale</td><td><%=locale%></td></tr>
<tr><td>User's Local Timezone</td><td><%=localTZ%></td></tr>
<tr><td>Report Server URL</td><td><%=customserverURL%></td></tr>
<tr><td>Report Server Password</td><td><i>See file source for details</i></td></tr>
<tr><td>Birt URL</td><td><%=birturl%></td></tr>

</body>
</html>