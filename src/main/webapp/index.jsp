<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="public/bootstrap.min.css">
<link rel="stylesheet" href="public/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:import url="header.html" />
	<div class="container">
		<div class="row">
			<div class="col-6">
			   <p>ESPACE STUDENTS</p>
				<form action="student.do" method="post">
				   <div class="form-group">
						<label for="firstname">Firstname:</label> <input type="text"  id="firstname" name="firstname">
					</div>
					<div class="form-group">
						<label for="lastname">Lastname:</label> <input type="text"  id="lastname" name="lastname">
					</div>
					<div class="form-group">
						<label for="birthdate">Birthdate:</label> <input type="date"  id="birthdate" name="birthdate">
					</div>
					<div class="form-group">
						<label for="phone">Phone:</label> <input type="text"  id="phone" name="phone">
					</div>
					<div></div>
					<div class="form-group">
						<button type="submit"  name="action" value="Enregistrer">Enregistrer</button>
					</div>
				</form>
			</div>
			<div class="col-6">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title" style="color: black;" >Liste des étudiants</h3>
					</div>
					<div class="panel-body">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th>#</th>
									<th>Fistname</th>
									<th>Lastname</th>
									<th>Phone</th>
									<th colspan="1">Action</th>
								</tr>
							</thead>
							<tbody>
							 <c:forEach items="${studentList}" var="s">
							  <tr class="text-center"> 
							     <td> <c:out value="${s.id}" /></td>
							     <td> <c:out value="${s.firstname}" /></td>
							    <td> <c:out value="${s.lastname}" /></td>
							    <td> <c:out value="${s.phone}" /></td>
							    <td><button type="button"  style="color: black;" >Modifier</button></td>
							   <td> <button type="button" ">Supprimer</button></td>
							  </tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url="footer.html" />
</body>
</html>