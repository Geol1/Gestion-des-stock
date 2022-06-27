function onClick(element) {
	document.getElementById("img01").src = element.src;
	document.getElementById("modal01").style.display = "block";
}
	  console.log("test test test");

function toggleArticle(source) {
	ele = document.getElementsByName('selectArticle');
	  console.log("select");
	  for(var i=0; i<ele.length; i++){  
            if(ele[i].type=='checkbox')  
                ele[i].checked=source.checked;  
	}
}

function sendData() {
  var XHR = new XMLHttpRequest();
  var FD  = new FormData();
  var articles = [];

  // Mettez les données dans l'objet FormData
	for(var i=0; i<ele.length; i++){
        if(ele[i].checked)
            articles.push(ele[i].value);
    }
    
  Session["articles"] = "'+ articles +'";

    
   FD.append("articles", articles);
   FD.append("path", "/destock");

  // Définissez ce qui se passe si la soumission s'est opérée avec succès
  XHR.addEventListener('load', function(event) {
    alert('Ouais ! Données envoyées et réponse chargée.');
  });

  // Definissez ce qui se passe en cas d'erreur
  XHR.addEventListener('error', function(event) {
    alert('Oups! Quelque chose s\'est mal passé.');
  });

  // Configurez la requête
  XHR.open('POST', 'http://localhost:8080/TestTemplate/Servlet', FD);

  // Expédiez l'objet FormData ; les en-têtes HTTP sont automatiquement définies
  XHR.send();
}