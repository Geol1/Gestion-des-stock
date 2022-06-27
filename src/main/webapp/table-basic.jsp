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
    <link rel="canonical" href="https://www.wrappixel.com/templates/Flexy-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
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
    
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
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
							class="dark-logo" width="105px"/> <img
							src="assets/images/logo-light-text.png" class="light-logo"
							alt="homepage" />
					</span>
					</a> <a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
				</div>
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin5">
					<ul class="navbar-nav float-start me-auto">
                        <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark"
                                href="javascript:void(0)"><i class="mdi mdi-magnify me-1"></i> <span class="font-16">Search</span></a>
                            <form class="app-search position-absolute">
                                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a
                                    class="srh-btn"><i class="mdi mdi-window-close"></i></a>
                            </form>
                        </li>
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
									style="display: none;"> <i class="mdi mdi-cart" style="font-size: 25px;"></i>
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
                              <li class="breadcrumb-item"><a href="index.html" class="link"><i class="mdi mdi-home-outline fs-4"></i></a></li>
                              <li class="breadcrumb-item active" aria-current="page">Articles</li>
                            </ol>
                          </nav>
                        <h1 class="mb-0 fw-bold">Consulter le stock</h1> 
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Default Table</h4>
                                <h6 class="card-subtitle">Using the most basic table markup, hereâ€™s how
                                    <code>.table</code>-based tables look in Bootstrap. All table styles are inherited
                                    in Bootstrap 4, meaning any nested tables will be styled in the same manner as the
                                    parent.</h6>
                                <h6 class="card-title m-t-40"><i
                                        class="m-r-5 font-18 mdi mdi-numeric-1-box-multiple-outline"></i> Liste des articles</h6>
                                <div class="table-responsive-sm">
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
												<td><input class="form-check-input" name="selectArticle" type="checkbox" value="${elt}"></td>
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
									<form method="post">
										<div class="d-flex col-12 ">
											<div class="d-flex col-6 ">
												<input type="checkbox" class="d-flex col-1 " onclick="toggleArticle(this)" />
												<h6 class="d-flex col-3">Tout selectioner</h6>
											</div>
											<input type="text" name="path" value="/destock"
												style="display: none;">
											<button onclick="sendData()" class="btn text-light bg-info d-flex col-6">
												<p class="d-flex col-4"></p>
												<span class="mdi mdi-cart text-light mdi-18px mdi-spin d-flex col-2"> Destocker</span>
											</button>
										</div>
									</form>


								</div>
									</br>
									</br>
									
						<c:if test="${sessionScope.account == 'patron'}">
                                <h6 class="card-title"><i
                                        class="m-r-5 font-18 mdi mdi-numeric-2-box-multiple-outline"></i>Liste des magasiniers</h6>
									<div class="table-responsive-sm">
									<table class="table">
										<thead>
											<tr class="bg-dark">
												<th class="fw-bold" scope="col">Profile</th>
												<th class="fw-bold" scope="col">Nom</th>
												<th class="fw-bold" scope="col">Prenom</th>
												<th class="fw-bold" scope="col">Telephone</th>
												<th class="fw-bold" scope="col">Address</th>
												<th class="fw-bold" scope="col">Password</th>
												<th class="fw-bold" scope="col">Actions</th>
												<th></th>
											</tr>
										</thead>
										<!-- Table body with the list of products -->
										<tbody id="productList">
											<c:forEach var="elt" items="${magasiniers}">
												<tr class="">
													<td class="w-20 align-middle" scope="row"><img
														src="<c:out value="${elt.image}" />"
														class="rounded-circle" width="70" height="70"
														style="cursor: pointer" onclick="onClick(this)"
														class="w3-hover-opacity"></td>
													<td class="w-10 align-middle fw-bold"><c:out
															value="${elt.nom}" /></td>
													<td class="w-35 align-middle"><c:out
															value="${elt.prenom}" /></td>
													<td class="w-20 align-middle fw-bold"><c:out
															value="${elt.telephone}" /></td>
													<td class="w-15 align-middle fw-bold"><c:out
															value="${elt.address}" /></td>
													<td class="w-15 align-middle fw-bold"><c:out
															value="${elt.password}" /></td>
													<td class="w-12 align-middle">
														<form method="post">
															<input type="text" name="id" value="<c:out value='${elt.id}' />"
																style="display: none;"> <input type="text"
																name="path" value="/editMagasinier" style="display: none;">
																<button type="submit" class="btn btn-default" aria-label="Flask">
																    <span class="mdi mdi-pencil text-light mdi-18px mdi-spin"></span>
																    
																</button>
														</form>
													</td>
													<td class="w-12 align-middle">
														<form method="post">
															<input type="text" name="id" value="<c:out value='${elt.id}' />"
																style="display: none;"> <input type="text"
																name="path" value="/deleteMagasinier" style="display: none;">
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
						</c:if>
                            </div>
                        </div>
                    </div>
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
</div>
		
		<script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="dist/js/app-style-switcher.js"></script>
    <!--Wave Effects -->
    <script src="dist/js/waves.js"></script>
	<script src="assets/js/code2.js"></script>
    <!--Menu sidebar -->
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.js"></script>
</body>

</html>