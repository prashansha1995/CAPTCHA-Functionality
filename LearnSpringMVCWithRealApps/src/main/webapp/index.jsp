<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>

<table>
<tr>

				<td>Captcha</td>
				<td>
				   <img src="${pageContext.request.contextPath}/captcha/generateCaptcha">
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
