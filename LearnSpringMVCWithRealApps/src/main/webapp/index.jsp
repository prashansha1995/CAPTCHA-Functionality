<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
      <script>
   
/* $(document).ready(function() 
		{
	alert("hello");
	$.ajax({
	    url:'${pageContext.request.contextPath}/captcha/def',
	    success: function(a) {
	    	alert("success");

	    }

	  });
    
  
  }); */
  
  

/* function captcha()
{
	alert("abc");
	$.ajax({

	    type: "GET",
        dataType: 'json',
       contentType:'application/json',
	    url:'${pageContext.request.contextPath}/captcha/abc',
	    success: function(a) {

	       if(a.error==null)

	{


	}

	    }

	  });
	} */
</script>

</head>

<body>

<table>
<tr>

				<td>Captcha</td>
				<td>
				   <img src="${pageContext.request.contextPath}/captcha/def">
					<br>
					<input type="text" name="captcha" required="required" style="margin-top: 5px;">
					<br>
				${error }
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<input type="submit" value="Save">
				</td>
			</tr>
</table>

</body>


</html>
