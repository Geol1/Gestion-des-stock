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
<link rel="canonical"
	href="https://www.wrappixel.com/templates/Flexy-admin-lite/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/images/favicon.png">
<!-- Custom CSS -->
<link href="dist/css/style.min.css" rel="stylesheet">
<link rel="stylesheet" href="style/w3.css">
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
					<ul class="navbar-nav float-start me-auto"></ul>
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
								<li class="breadcrumb-item active" aria-current="page">Profile</li>
							</ol>
						</nav>
						<h1 class="mb-0 fw-bold">Profile</h1>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<form action="Servlet" method="post" class="needs-validation"
					novalidate enctype="multipart/form-data">
					<div class="row">
						<!-- Column -->
						<div class="col-lg-4 col-xlg-3 col-md-5">
							<div class="card">
								<div class="card-body">
									<center class="m-t-30">
										<img src="<c:out value='${sessionScope.user.image}' />"
											class="rounded-circle avatar-pic w3-hover-opacity"
											width="150" height="150" style="cursor: pointer"
											id="profile0" onclick="onClick(this)" />

										<div class="d-flex justify-content-center">
											<div class="mb-2" id='clickable'>
												<i class="mdi mdi-camera text-dark mdi-29px"></i>
											</div>
											<input type="file" name="fichier" onchange="readFile(this);"
												id="fichier" tabindex="8" hidden required />
										</div>

										<h4 class="card-title m-t-10">
											<c:out value='${sessionScope.user.nom}' />
										</h4>
										<h6 class="card-subtitle">
											<c:out value='${sessionScope.user.prenom}' />
										</h6>
									</center>
								</div>
								<div>
									<hr>
								</div>
								<div class="card-body">
									<c:if test="${sessionScope.account == 'patron'}">
										<small class="text-muted">Email address </small>
										<c:out value='${sessionScope.user.email}' />
									</c:if>
									<c:if test="${sessionScope.account == 'magasinier'}">
										<small class="text-muted p-t-30 db">Phone</small>
										<h6>
											<c:out value='${sessionScope.user.telephone}' />
										</h6>
									</c:if>
									<small class="text-muted p-t-30 db">Address</small>
									<h6>
										<c:out value='${sessionScope.user.address}' />
									</h6>
									<div class="map-box"></div>
									<small class="text-muted p-t-30 db">Social Profile</small> <br />
									<button class="btn btn-circle btn-secondary">
										<i class="fab fa-facebook-f"></i>
									</button>
									<button class="btn btn-circle btn-secondary">
										<i class="fab fa-twitter"></i>
									</button>
									<button class="btn btn-circle btn-secondary">
										<i class="fab fa-youtube"></i>
									</button>
								</div>
							</div>
						</div>
						<div class="col-lg-8 col-xlg-9 col-md-7">
							<div class="card">
								<div class="card-body">
									<div class="form-horizontal form-material mx-2">
										<div class="form-group">
											<label class="col-md-12 text-dark">Nom</label>
											<div class="col-md-12">
												<input type="text"
													value="<c:out value='${sessionScope.user.nom}' />"
													class="form-control form-control-line" name="nom"
													required="required">
											</div>
										</div>

										<div class="form-group">
											<label class="col-md-12 text-dark">Prenom</label>
											<div class="col-md-12">
												<input type="text"
													value="<c:out value='${sessionScope.user.prenom}' />"
													class="form-control form-control-line" name="prenom"
													required>
											</div>
										</div>

										<div class="form-group">
											<c:if test="${!empty sessionScope.user}">
												<c:if test="${sessionScope.account == 'patron'}">
													<label class="col-md-12 text-dark">Email</label>
													<div class="col-md-12">
														<input type="text"
															value="<c:out value='${sessionScope.user.email}' />"
															class="form-control form-control-line" name="email"
															required="required">
													</div>
												</c:if>
												<c:if test="${sessionScope.account == 'magasinier'}">
													<label class="col-md-12 text-dark">Telephone</label>
													<div class="col-md-12">
														<input type="text"
															value="<c:out value='${sessionScope.user.telephone}' />"
															class="form-control form-control-line" name="telephone"
															required="required">
													</div>
												</c:if>
											</c:if>
										</div>
										<div class="form-group">
											<label class="col-md-12 text-dark">Password</label>
											<div class="col-md-12">
												<input type="password" name="password"
													value="<c:out value='${sessionScope.user.password}' />"
													class="form-control form-control-line">
											</div>
										</div>

										<div class="form-group">
											<label class="col-md-12 text-dark">Address</label>
											<div class="col-md-12">
												<input type="text"
													value="<c:out value='${sessionScope.user.address}' />"
													class="form-control form-control-line" name="address"
													required>
											</div>
										</div>

										<div class="form-group">
											<label class="col-md-12 text-dark">Message</label>
											<div class="col-md-12">
												<textarea rows="5" class="form-control form-control-line"></textarea>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-12">
												<button class="btn btn-info text-white">Update
													Profile</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- Column -->
					</div>

					<c:if test="${sessionScope.account == 'magasinier'}">
						<input type="text" name="id_patron"
							value="<c:out value='${sessionScope.user.getPatronId()}' />"
							style="display: none;">
					</c:if>
					<input type="text" name="id"
						value="<c:out value='${sessionScope.user.id}' />"
						style="display: none;"> <input type="text" name="path"
						value="/updateProfile" style="display: none;">
				</form>
			</div>
			<footer class="footer text-center">
				© 2022 Copyright:<a href="#">Geol</a>.
			</footer>
		</div>
	</div>
	<div id="modal01" class="w3-modal" onclick="this.style.display='none'">
		<div class="w3-modal-content w3-animate-zoom" style="width: 500px;">
			<img id="img01" style="width: 100%;">
		</div>
	</div>
	<script>
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
		}
	</script>
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