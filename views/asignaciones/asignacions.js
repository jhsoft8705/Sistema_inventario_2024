$(document).ready(function () {
  $("#periodo_id").select2();

  /*TODO:listar asignaciones*/
  $.post( "../../controllers/AsignacionController.php?endpoint=listar_asignacion",
    { research:null,periodo: null },
    function (data) {
      //console.log("Datos recibidos para cate:", data);
      $("#contenido_asignados").html(data);
    }
  );

  /*TODO:listar periodos*/
  $.post(
    "../../controllers/PeriodoController.php?endpoint=get_periodo_combobox",
    { true: true },
    function (data) {
      //console.log("Datos recibidos para cate:", data);
      $("#periodo_id").html(data); 
    }
  );
});


/*TODO:Click agregar equipo*/
$(document).on("click", "#btn_filtrarr", function () {
   var periodo_id = $("#periodo_id").val();
  var periodo_nombre = $("#periodo_id option:selected").text(); // Obtener el nombre del periodo seleccionado

      // Verificar que se haya seleccionado un periodo
      if (!periodo_id) {
        alert("Por favor, seleccione un periodo.");
        return;
    }

    console.log("Periodo ID:", periodo_id);
    console.log("Periodo Nombre:", periodo_nombre);

    /*TODO:listar asignaciones*/
   $.post( "../../controllers/AsignacionController.php?endpoint=listar_asignacion",
    { research:null,periodo: periodo_nombre },
    function (data) {
      //console.log("Datos recibidos para cate:", data);
      $("#contenido_asignados").html(data);
    }
  );
});



$(document).on("input", "#buscador", function () {
  var buscador = $("#buscador").val();
  
  // Realizar la solicitud POST con el término de búsqueda
  $.post(
      "../../controllers/AsignacionController.php?endpoint=listar_asignacion",
      { research: buscador, periodo:null },
      function (data) {
          // Actualizar el contenido del div con los resultados
          $("#contenido_asignados").html(data);
      }
  );
});
