var user_id = $("#usuario_id_session").val();
var asigacion_id = $("#asigacion_id").val();
 
 
$(document).ready(function () {

  /*TODO:listar talleres*/
  $.post(
    "../../controllers/AsignacionController.php?endpoint=listar_asignacion_x_id",
    { asignacion_id: asigacion_id },
    function (data) {
      data = JSON.parse(data); //Convertir a data a formato JSON
      //console.log(data);
      $("#taller_nombre").val(data.taller_nombre);
      $("#usuario_nombre").val(data.nombres_usuario);
      $("#periodo").val(data.periodo_nombre);
      $("#fechai_periodo").val(data.fecha_inicio_periodo);
      $("#fechaf_periodo").val(data.fecha_fin_periodo);
      $("#descripcion").val(data.descripcion);
     }
  );

  /*TODO:=================EQUIPOS=====================*/
  $("#table_det_equipos").DataTable({
    aProcessing: true,
    aServerSide: true,
    dom: "Bfrtip",
    //buttons: ["copy", "csv", "excel", "print", "pdf"],
    buttons: [
      {
        text: "Copiar",
        extend: "copyHtml5",
        title: "Lista de Equipos y Maquinaria - "+asigacion_id, // Custom title for the Excel file
      },
      {
        text: "Exportar Excel",
        extend: "excelHtml5",
      },
    ],
    ajax: {
      url: "../../controllers/AsignacionController.php?endpoint=list_detalle_equipo_x_asignacion",
      type: "post",
      data: { asignacion_id: asigacion_id },
    },
    bDestroy: true,
    responsive: true,
    bInfo: true,
    iDisplayLength: 10,
    order: [[0, "desc"]],
    language: {
      sProcessing: "Procesando...",
      sLengthMenu: "Mostrar _MENU_ registros",
      sZeroRecords: "No se encontraron resultados",
      sEmptyTable: "Ningún dato disponible en esta tabla",
      sInfo:
        "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
      sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
      sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
      sInfoPostFix: "",
      sSearch: "Buscar:",
      sUrl: "",
      sInfoThousands: ",",
      sLoadingRecords: "Cargando...",
      oPaginate: {
        sFirst: "Primero",
        sLast: "Último",
        sNext: "Siguiente",
        sPrevious: "Anterior",
      },
      oAria: {
        sSortAscending:
          ": Activar para ordenar la columna de manera ascendente",
        sSortDescending:
          ": Activar para ordenar la columna de manera descendente",
      },
      buttons: {
        copyTitle: "Copiado al portapapeles",
        copySuccess: {
          _: "%d líneas copiadas",
          1: "1 línea copiada",
        },
      },
    },
  });

  /*TODO:=================HERRAMIENTAS=====================*/
  $("#table_det_herramienta").DataTable({
    aProcessing: true,
    aServerSide: true,
    dom: "Bfrtip",
    //buttons: ["copy", "csv", "excel", "print", "pdf"],
    buttons: [
      {
        text: "Copiar",
        extend: "copyHtml5",
        messageTop: "Tabla copiada al portapapeles", // Custom message on top
      },
      {
        text: "Exportar Excel",
        extend: "excelHtml5",
        title: "Lista de Herramientas  o Muebles - "+asigacion_id, // Custom title for the Excel file

      },
    ],
    ajax: {
      url: "../../controllers/AsignacionController.php?endpoint=list_detalle_herramienta_x_asignacion",
      type: "post",
      data: { asignacion_id: asigacion_id },
    },
    bDestroy: true,
    responsive: true,
    bInfo: true,
    iDisplayLength: 10,
    order: [[0, "desc"]],
    language: {
      sProcessing: "Procesando...",
      sLengthMenu: "Mostrar _MENU_ registros",
      sZeroRecords: "No se encontraron resultados",
      sEmptyTable: "Ningún dato disponible en esta tabla",
      sInfo:
        "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
      sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
      sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
      sInfoPostFix: "",
      sSearch: "Buscar:",
      sUrl: "",
      sInfoThousands: ",",
      sLoadingRecords: "Cargando...",
      oPaginate: {
        sFirst: "Primero",
        sLast: "Último",
        sNext: "Siguiente",
        sPrevious: "Anterior",
      },
      oAria: {
        sSortAscending:
          ": Activar para ordenar la columna de manera ascendente",
        sSortDescending:
          ": Activar para ordenar la columna de manera descendente",
      },
      buttons: {
        copyTitle: "Copiado al portapapeles",
        copySuccess: {
          _: "%d líneas copiadas",
          1: "1 línea copiada",
        },
      },
    },
  });

  /*TODO:=================INSUMOS=====================*/
  $("#table_det_insumo").DataTable({
    aProcessing: true,
    aServerSide: true,
    dom: "Bfrtip",
    //buttons: ["copy", "csv", "excel", "print", "pdf"],
    buttons: [
      {
        text: "Copiar",
        extend: "copyHtml5",
        messageTop: "Tabla copiada al portapapeles", // Custom message on top
      },
      {
        text: "Exportar Excel",
        extend: "excelHtml5",
        title: "Lista de insumos - "+asigacion_id, // Custom title for the Excel file

      },
    ],
    ajax: {
      url: "../../controllers/AsignacionController.php?endpoint=list_detalle_insumo_x_asignacion",
      type: "post",
      data: { asignacion_id: asigacion_id },
    },
    bDestroy: true,
    responsive: true,
    bInfo: true,
    iDisplayLength: 10,
    order: [[0, "desc"]],
    language: {
      sProcessing: "Procesando...",
      sLengthMenu: "Mostrar _MENU_ registros",
      sZeroRecords: "No se encontraron resultados",
      sEmptyTable: "Ningún dato disponible en esta tabla",
      sInfo:
        "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
      sInfoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
      sInfoFiltered: "(filtrado de un total de _MAX_ registros)",
      sInfoPostFix: "",
      sSearch: "Buscar:",
      sUrl: "",
      sInfoThousands: ",",
      sLoadingRecords: "Cargando...",
      oPaginate: {
        sFirst: "Primero",
        sLast: "Último",
        sNext: "Siguiente",
        sPrevious: "Anterior",
      },
      oAria: {
        sSortAscending:
          ": Activar para ordenar la columna de manera ascendente",
        sSortDescending:
          ": Activar para ordenar la columna de manera descendente",
      },
      buttons: {
        copyTitle: "Copiado al portapapeles",
        copySuccess: {
          _: "%d líneas copiadas",
          1: "1 línea copiada",
        },
      },
    },
  });
});
