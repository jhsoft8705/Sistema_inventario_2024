 
document.addEventListener("DOMContentLoaded", function() {
    // Event listener para el formulario
    $("#loginForm").on("submit", function(event) {
        // Limpiar div errors y quitar clases is-invalid
        $("#txt_user_error, #txt_pass_error").text("");
        $("#txt_user, #txt_pass").removeClass("is-invalid");

        // Validar cada campo
        var isValid = true;

        if ($("#txt_user").val().trim() === "") {
            $("#txt_user_error").text("Por favor, ingrese su usuario");
            $("#txt_user").addClass("is-invalid");
            isValid = false;
        }

        if ($("#txt_pass").val().trim() === "") {
            $("#txt_pass_error").text("Por favor, ingrese su contraseña");
            $("#txt_pass").addClass("is-invalid");
            isValid = false;
        }

        // Si no es válido, prevenir el envío del formulario
        if (!isValid) {
            event.preventDefault();
        }
    });
}); 
document.getElementById('view_pass').addEventListener('click', function () {
  var passwordInput = document.getElementById('txt_pass');
  var passType = passwordInput.getAttribute('type');
  
  if (passType === 'password') {
      passwordInput.setAttribute('type', 'text');
  } else {
      passwordInput.setAttribute('type', 'password');
  }
});