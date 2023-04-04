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
		<div class="row mb-4">
			<div class="col-6 mt-4">
				<div class="alert alert-dismissible alert-info">
					<strong>INSCRIPTION</strong> 
				</div>
				<form action="Inscriptions" method="post">
					<div class="form-group">
						<label for="details">details:</label> <input type="text" class="form-control" id="details" name="details">
					</div>
					<div class="form-group">
						<label for="student">select student:</label> 
						<select class="form-control" name="student">
								<c:forEach var="item" items="${studentList}">
									<option><c:out value="${item.id}"/>${item.lastname}</option>
								</c:forEach>
						 </select>
					    </div>
					    <div class="form-group">
						<label for="cours">select courses:</label> 
						<select class="form-control" name="cours">
								<c:forEach var="item" items="${couresList}">
									<option><c:out value="${item.id}"/>: ${item.name}</option>
								</c:forEach>
						 </select>
					    </div>
					    <div class="form-group">
						<label for="years">select years:</label> 
						<select class="form-control" name="years">
								<c:forEach var="item" items="${yearList}">
									<option><c:out value="${item.id}"/>${item.name}</option>
								</c:forEach>
						 </select>
					    </div>
					<div></div>
					<div class="form-group mt-2">
						<button type="submit" name="action" svalue="Inscrire">Inscrire</button>
					</div>
				</form>
			</div>
			
					<div class="panel-body">
						<table class="table table-striped table-hover ">
							<thead>
								<tr>
									<th>#</th>
									<th>Name</th>
									<th>Courses</th>
									<th>Details</th>
									<th colspan="1">Action</th>
								</tr>
							</thead>
							<tbody>
							 <c:forEach items="${couresList}" var="s">
							  <tr class="text-center"> 
							     <td> <c:out value="${s.id}" /></td>
							     <td> <c:out value="${s.name}" /></td>
							    <td> <c:out value="${s.programme}" /></td>
							    <td><button type="button" >Modifier</button></td>
							   <td> <button type="button">Supprimer</button></td>
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