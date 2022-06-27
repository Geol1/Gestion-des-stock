<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Flexy lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Flexy admin lite design, Flexy admin lite dashboard bootstrap 5 dashboard template">
<meta name="description"
	content="Flexy Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
<meta name="robots" content="noindex,nofollow">
<title>MyStock</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="canonical"
	href="https://www.wrappixel.com/templates/Flexy-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<!-- Custom CSS -->
<link href="dist/css/style.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="css/ionicons.min.css">
</head>

<body>
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>

	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5"
		data-sidebartype="full" data-sidebar-position="absolute"
		data-header-position="absolute" data-boxed-layout="full">
		<header class="topbar bg-light" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md navbar-light">
				<div class="navbar-header" data-logobg="skin6"
					style="background-color: #0c042c;">
					<a class="navbar-brand" href="index.html"> <!-- Logo icon --> <b
						class="logo-icon"> <img src="assets/images/logo-icon.png"
							alt="homepage" class="dark-logo" /> <!-- Light Logo icon --> <img
							src="assets/images/logo-light-icon.png" alt="homepage"
							class="light-logo" />
					</b> <span class="logo-text"> <img
							src="assets/images/logo-text.png" alt="homepage"
							class="dark-logo" width="105px" /> <img
							src="assets/images/logo-light-text.png" class="light-logo"
							alt="homepage" />
					</span>
					</a> <a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
				</div>
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin5">
					<ul class="navbar-nav float-start me-auto">
						<li class="nav-item search-box"><a
							class="nav-link waves-effect waves-dark"
							href="javascript:void(0)"><i class="mdi mdi-magnify me-1"></i>
								<span class="font-16">Search</span></a>
							<form class="app-search position-absolute">
								<input type="text" class="form-control"
									placeholder="Search &amp; enter"> <a class="srh-btn"><i
									class="mdi mdi-window-close"></i></a>
							</form></li>
					</ul>
					<ul class="navbar-nav float-end">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic"
							href="#" id="navbarDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> <img
								src="<c:out value='${sessionScope.user.image}' />" alt="user"
								class="rounded-circle" width="41" height="41">
						</a>
							<ul class="dropdown-menu dropdown-menu-end user-dd animated"
								aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="javascript:void(0)">
									<form method="post">
										<input type="text" name="path" value="/profile"
											style="display: none;"> <i
											class="ti-user m-r-5 m-l-5"></i>
										<button type="submit" class="btn">My Profile</button>
									</form>
								</a>
								<a class="dropdown-item " href="javascript:void(0)">
									<form method="post">
										<input type="text" name="path" value="/home"
											style="display: none;"> <i
											class="ti-wallet m-r-5 m-l-5"></i>
										<button type="submit" class="btn">Log Out</button>
									</form>
								</a>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>
		<aside class="left-sidebar" data-sidebarbg="skin6">
			<div class="scroll-sidebar" style="background-color: #0c042c;">
				<nav class="sidebar-nav" style="background-color: #0c042c;">
					<ul id="sidebarnav bg-dark" style="background-color: #0c042c;">
						<li class="sidebar-item">
							<form method="post">
								<input type="text" name="path" value="/dashboard"
									style="display: none;"> <i style="font-size: 25px;"
									class="mdi mdi-view-dashboard"></i>
								<button type="submit" class="btn mb-2 text-light fs-5">Dashboard</button>
							</form>
						</li>
						<li class="sidebar-item">
							<form method="post">
								<input type="text" name="path" value="/profile"
									style="display: none;"> <i style="font-size: 25px;"
									class="mdi mdi-account-network"></i>
								<button type="submit" class="btn mb-2 text-light fs-4">Profile</button>
							</form>
						</li>
						<li class="sidebar-item">
							<form method="post">
								<input type="text" name="path" value="/liste"
									style="display: none;"> <i class="mdi mdi-cart"
									style="font-size: 25px;"></i>
								<button type="submit" class="btn mb-2 text-light fs-4">Liste</button>
							</form>
						</li>
						<li class="sidebar-item">
							<form method="post">
								<input type="text" name="path" value="/new"
									style="display: none;"> <i class="ion-ios-add-circle"
									style="font-size: 25px;"></i>
								<button type="submit" class="btn mb-2 text-light fs-4">Ajouter</button>
							</form>
						</li>
						<c:if test="${sessionScope.account == 'patron'}">
							<li>
								<form method="post">
									<input type="text" name="path" value="/blank"
										style="display: none;"> <i class="ion-ios-person"
										style="font-size: 25px;"></i>
									<button type="submit" class="btn mb-2 text-light fs-4">Magasiniers</button>
								</form>
							</li>
						</c:if>

					</ul>
				</nav>
			</div>
		</aside>


		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<div class="row align-items-center">
					<div class="col-6">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 d-flex align-items-center">
								<li class="breadcrumb-item"><a href="index.html"
									class="link"><i class="mdi mdi-home-outline fs-4"></i></a></li>
								<li class="breadcrumb-item active" aria-current="page">Articles</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">
									<caption>
										<c:if test="${produit != null}">
            			Editer le produit
            		</c:if>
										<c:if test="${produit == null}">
            			Ajouter un nouveau produit
            		</c:if>
									</caption>
								</h4>
								<div class="card-body">
									<c:if test="${ !empty fichier }">
										<p>
											<c:out value="Le fichier ${ fichier } a été uploadé !" />
										</p>
									</c:if>

									<c:if test="${produit != null}">
										<form action="Servlet" method="post" class="needs-validation"
											novalidate enctype="multipart/form-data">
									</c:if>
									<c:if test="${produit == null}">
										<form action="Servlet" method="post" class="needs-validation"
											novalidate enctype="multipart/form-data">
									</c:if>

									<div class="d-flex justify-content-center">
										<div class="mb-2" id='clickable'>
											<img
												src=" <c:out
															value="${produit == null ? 'assets/upload/images/18.jpg' : produit.image}" />"
												id="profile0" style="cursor: pointer" width="150"
												height="150"
												class="rounded-circle z-depth-1-half avatar-pic w3-hover-opacity mb-2"
												alt="image du produit">
										</div>
										<input type="file" name="fichier" onchange="readFile(this);"
											id="fichier" tabindex="8" hidden required />
									</div>

									<c:if test="${produit != null}">
										<input type="hidden" name="id"
											value="<c:out value='${produit.id}' />" />
									</c:if>

									<div class="row col-12">
										<fieldset class="form-group col-6">
											<i class="glyphicon glyphicon-user"></i> <label
												class="text-dark id="validationTooltip01"">Reference</label>
											<input type="text"
												value="<c:out value='${produit.reference}' />"
												class="form-control" id="validationTooltip01"
												name="reference" required>

											<div class="invalid-feedback">Le champ Reference est
												requis.</div>
										</fieldset>
										<fieldset class="form-group col-6">
											<label class="text-dark">Nom du produit</label> <input
												type="text" value="<c:out value='${produit.nom}' />"
												class="form-control" name="nom" required>
											<div class="invalid-feedback">Definissez un nom s'il
												vous plait.</div>
										</fieldset>
									</div>

									<div class="row  col-12">
										<fieldset class="form-group col-6">
											<label class="text-dark">Quantite en stock</label> <input
												type="text" value="<c:out value='${produit.stock}' />"
												class="input0 form-control" name="stock" required>
											<div class="invalid-feedback">Une quantite est
												necessaire pour creer un produit.</div>
										</fieldset>

										<fieldset class="form-group col-6">
											<label class="text-dark">Prix du produit</label> <input
												type="text" value="<c:out value='${produit.prix}' />"
												class="form-control" name="prix" required>
											<div class="invalid-feedback">Le prix du produit est
												requis.</div>
										</fieldset>
									</div>

									<fieldset class="form-group p-1">
										<label class="text-dark">Decrivez votre produit</label>
										<textarea class="form-control" name="description"><c:out
												value='${produit.description}' /></textarea>
										<div class="invalid-feedback">Le champ description est
											requis.</div>
									</fieldset>

									<c:if test="${produit != null}">
										<input type="text" name="path" value="/update"
											style="display: none;">
									</c:if>
									<c:if test="${produit == null}">
										<input type="text" name="path" value="/insert"
											style="display: none;">
									</c:if>


									<div class="d-flex justify-content-center">
										<button type="submit"
											class="d-flex justify-content-center btn btn-info">Enregistrer</button>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<footer class="footer text-center">
					© 2022 Copyright:<a href="#">Geol</a>.
				</footer>
			</div>


		</div>

	</div>
	<script src="assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="dist/js/app-style-switcher.js"></script>
	<!--Wave Effects -->
	<script src="dist/js/waves.js"></script>
	<script src="assets/js/code.js"></script>
	<!--Menu sidebar -->
	<script src="dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="dist/js/custom.js"></script>
</body>

</html>