<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<!-- BOOTSTRAP -->
<link rel="stylesheet" href="mystyle.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Articles a destocker</title>
</head>

<body class="bg-light">

	<div class="container bg-white p-5 mt-5">
		<!-- Logo -->
		<!-- <div>
      <img src="img/etud.jpg" class="img-fluid">
    </div> -->
		<!-- Button to call the praducts -->
		<button class="btn btn-primary mt-2 mb-2"
			onclick='populateTableList()'>Terminer</button>
		<!-- Table  -->
		<table class="table">
										<thead>
											<tr class="bg-dark">
												<th class="fw-bold" scope="col">#</th>
												<th class="fw-bold" scope="col">Image</th>
												<th class="fw-bold" scope="col">Ref</th>
												<th class="fw-bold" scope="col">Description</th>
												<th class="fw-bold" scope="col">Nom</th>
												<th class="fw-bold" scope="col">Stock</th>
												<th class="fw-bold" scope="col">Prix</th>
												<th class="fw-bold" scope="col">Actions </th>
												<th></th>
											</tr>
										</thead>
										<!-- Table body with the list of products -->
										<tbody id="productList">
											<c:forEach var="elt" items="${produits}">
												<tr class="">
													<td class="w-20 align-middle" scope="row"><img
														src="<c:out value="${elt.image}" />"
														class="rounded-circle" width="70" height="70"
														style="cursor: pointer" onclick="onClick(this)"
														class="w3-hover-opacity"></td>
													<td class="w-10 align-middle fw-bold"><c:out
															value="${elt.reference}" /></td>
													<td class="w-35 align-middle"><c:out
															value="${elt.description}" /></td>
													<td class="w-20 align-middle fw-bold"><c:out
															value="${elt.nom}" /></td>
													<td class="w-15 align-middle fw-bold text-center <c:out
															value="${elt.stock >= 40 ? '' : elt.stock >= 20 ? 'bg-warning' : 'bg-danger'}" />"><c:out
															value="${elt.stock}" /></td>
													<td class="w-15 align-middle fw-bold"><c:out
															value="${elt.prix}" /></td>
													<td class="w-12 align-middle">
														<form method="post">
															<input type="text" name="id" value="<c:out value='${elt.id}' />"
																style="display: none;"> <input type="text"
																name="path" value="/edit" style="display: none;">
																<button type="submit" class="btn btn-default" aria-label="Flask">
																    <span class="mdi mdi-pencil text-light mdi-18px mdi-spin"></span>
																    
																</button>
														</form>
													</td>
													<td class="w-12 align-middle">
														<form method="post">
															<input type="text" name="id" value="<c:out value='${elt.id}' />"
																style="display: none;"> <input type="text"
																name="path" value="/delete" style="display: none;">
																<button type="submit" class="btn btn-danger" aria-label="Flask">
																    <span class="mdi mdi-delete text-light mdi-18px mdi-spin"></span>
																    
																</button>
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

	</div>
	<!-- Footer -->
	<footer class="container fixed-bottom  bg-dark text-light">
		<div class=" text-center py-3">
			© 2022 Copyright: <a href=""> Geol</a>
		</div>
	</footer>
	<!-- Code javaScript -->
	<!-- <script type="text/javascript" src="./code.js"></script>  -->
</body>

</html>