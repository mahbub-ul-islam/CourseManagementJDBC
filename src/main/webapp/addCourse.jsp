<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<title>Add Course</title>
</head>
<body>
	<c:set var="errMsg" value="${null}"></c:set>
	<c:set var="displayForm" value="${true}"></c:set>
	
	<c:if test="${\"POST\".equalsIgnoreCase(pageContext.request.method) &&
					pageContext.request.getparameter(\"submit\") != null}">
		
		<jsp:useBean id="courseBean" class="packt.book.jee.eclipse.ch4.beans.Course">
			<c:catch var="beanStorageException">
				<jsp:setProperty property="*" name="courseBean"/>
			</c:catch>
		</jsp:useBean>
		
		<c:choose>
			
			<c:when test="${!courseBean.isValidCourse() || 
							beanStorageException != null }">
				<c:set var="errMsg" value="Invalid course details. Please try again">
				</c:set>
			</c:when>
			
			<c:otherwise>
				<c:catch var="addCourseException">
					${courseBean.addCourse()}
				</c:catch>
				<c:choose>
					<c:when test="${addCourseException != null}">
						<c:set var="errMsg" value="${addCourseException.message}">
						</c:set>
					</c:when>
					<c:otherwise>
						<c:redirect url="listCourse.jsp"></c:redirect>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		
	</c:if>
	
	<h2>Add Course:</h2>
	
	<form method="post">
		Name: <input type="text" name="name"><br>
		Credits : <input type="text" name="credits"> <br>
		<button type="button" name="submit">Add</button>
	</form>
	
</body>
</html>
























