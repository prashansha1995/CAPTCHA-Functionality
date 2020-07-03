<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
	var s=$('#generatedCaptchaValueS').val();
	alert("saveS"+s);
	
	
});
function save()
{
	
	var a=$('#captcha').val();
	alert("save"+a);
	}

</script>
</head>

<body>
<s:form method="post" modelAttribute="user"
		action="${pageContext.request.contextPath }/captcha/save">
		<h1>${generatedCaptchaValue}</h1>
		    <input type="hidden" id="generatedCaptchaValueS" value="${sessionScope.generatedCaptchaValue}">            
<table>
<tr>

				<td>Captcha</td>
				<td>
				   <img src="${pageContext.request.contextPath}/captcha/generateCaptcha">
				               		    <input type="hidden" id="generatedCaptchaValue1" value="${generatedCaptchaValue}">
				   
					<br>
					<input type="text" name="captcha"  id="captcha" required="required" style="margin-top: 5px;">
					<br>
				${error }
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
				<!-- onClick="save() -->
					<input type="submit" value="Save">
				</td>
			</tr>
</table>
</s:form>
</body>


</html>