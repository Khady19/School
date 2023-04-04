<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="public/bootstrap.css">
<link rel="stylesheet" href="public/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../../header.html" />
	<div class="container">
		<div class="row">
			<div class="col-6">
			   <p>Les cours disponible</p>
				<form action="cours.php" method="post">
				   <div class="form-group">
						<label for="firstname">name:</label> <input type="text" class="form-control" id="name" name="name">
					</div>
					<div class="form-group">
						<label for="lastname">Programme:</label> <input type="text" class="form-control" id="programme" name="programme">
					</div>
					<div></div>
					<div class="form-group mt-2">
						<button type="submit" class="btn btn-info" name="action" value="Enregistrer">Enregistrer</button>
					</div>
				</form>
			</div>
			<div class="col-6">
				<div class="panel panel-info">
					<div class="panel-heading">
					
					<div class="panel-body">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Progamme</th>
									<th colspan="1">Action</th>
								</tr>
							</thead>
							<tbody>
							 <c:forEach items="${couresList}" var="c">
							  <tr class="text-center"> 
							     <td> <c:out value="${c.id}" /></td>
							     <td> <c:out value="${c.name}" /></td>
							    <td> <c:out value="${c.programme}" /></td>
							    <td><button type="button" >Edit</button></td>
							   <td> <button type="button" >Delete</button></td>
							  </tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../../footer.html" />
</body>
</html>