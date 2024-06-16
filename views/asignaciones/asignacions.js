$(document).ready(function () {   
      /*TODO:listar asignaciones*/
      $.post( "../../controllers/AsignacionController.php?endpoint=listar_asignacion",
        { true: true },
        function (data) {
          //console.log("Datos recibidos para cate:", data);
          $("#contenido_asignados").html(data); 
   
        }
      ); 
  });