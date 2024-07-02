var user_id = $("#usuario_id_session").val();


$(document).ready(function () { 

  /*TODO:listar asignaciones*/
  $.post(
    "../../controllers/UserController.php?enpoint=list_user_id",
    { usuario_id: user_id },
    function (data) {
      console.log(data);
      data = JSON.parse(data);

      $("#name_ape").html(data.nombre +' '+data.apellido);
      $("#nombre_rol").html(data.nombre_rol);
      $("#descripcion_rol").html(data.descripcion_rol);
      $("#correo").html(data.correo );
      $("#estado").html(data.estado);
      $("#nombre").html(data.nombre);
      $("#apellido").html( data.apellido);
      $("#numero_documento").html( data.numero_documento);
      $("#telefono").html( data.telefono);
      $("#correo").html( data.correo);
      $("#direccion").html( data.direccion);     
    }
  ); 
});


