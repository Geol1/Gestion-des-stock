const clickable = document.querySelector('#clickable');
const input =  document.querySelector('#fichier');

var file = null;

clickable.onclick = function(){
	input.click();
}

function readFile(myFile){
    file = myFile.files[0];
	console.log(file);
    if(file){
      var reader = new FileReader();
	  var img = document.getElementById("profile0");
      reader.onload = function(){
          img.src = reader.result;
      }

      reader.readAsDataURL(file);
    }
   event.preventDefault();
}

/*(function() {
    'use strict';
    window.addEventListener('load', function() {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
})();*/

        