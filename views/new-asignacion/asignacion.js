var user_id = $("#usuario_id_session").val();
var asignacion_id; //global
 
/*TODO:Asignación*/
function createAsignacionTempory() {
  return $.post(
    "../../controllers/AsignacionController.php?endpoint=create_asignacion_tempory",
    { usuario_id: user_id }
  );
}

/*TODO:Guardar y editar User*/
function save_user_and_update(e) {
  e.preventDefault();

  // var id = $("#Ubicación_id").val();

  /* if (!form_validations()) {
    return;
  }*/
  var formData = new FormData($("#form_mantenimiento")[0]);
  //formData.append("notificacion", notificacion);

  $.ajax({
    url: "../../controllers/LocationController.php?endpoint=save_and_update_categorias",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (data) {
      $("#modal_mantenimiento").modal("hide");

      $("#table_category").DataTable().ajax.reload();
      swal.fire({
        title: "Registro Exitoso",
        text: "La operación se realizó correctamente",
        icon: "success",
      });
    },
  });
}
/*TODO:Tabla Equipos*/
function tabla_equipos_init(asignacion_id) {
  $("#table_det_equipos").DataTable({
    aProcessing: true,
    aServerSide: true,
    dom: "Bfrtip",
    buttons: [
      {
        text: "Copiar",
        extend: "copyHtml5",
        messageTop: "Tabla copiada al portapapeles",
        exportOptions: {
          columns: [0, 1, 2], // Excluir la columna de acciones
        },
      }, 
    ],
    ajax: {
      url: "../../controllers/AsignacionController.php?endpoint=list_detalle_equipo_x_asignacion",
      type: "post",
      data: {
        asignacion_id: function () {
          return asignacion_id;
        },
      }, // Usar asignacion_id global
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
        "_TOTAL_ registros",
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
} 
/*TODO:Tabla Herramientas*/
function tabla_herramientas_init(asignacion_id) {
  $("#table_det_herramienta").DataTable({
    aProcessing: true,
    aServerSide: true,
    dom: "Bfrtip",
    buttons: [
      {
        text: "Copiar",
        extend: "copyHtml5",
        messageTop: "Tabla copiada al portapapeles",
        exportOptions: {
          columns: [0, 1, 2], // Excluir la columna de acciones
        },
      }, 
    ],
    ajax: {
      url: "../../controllers/AsignacionController.php?endpoint=list_detalle_herramienta_x_asignacion",
      type: "post",
      data: {
        asignacion_id: function () {
          return asignacion_id;
        },
      }, // Usar asignacion_id global
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
        "_TOTAL_ registros",
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
}
/*TODO:Tabla Insumos*/
function tabla_insumos_init(asignacion_id) {
  $("#table_det_insumo").DataTable({
    aProcessing: true,
    aServerSide: true,
    dom: "Bfrtip",
    buttons: [
      {
        text: "Copiar",
        extend: "copyHtml5",
        messageTop: "Tabla copiada al portapapeles",
        exportOptions: {
          columns: [0, 1, 2], // Excluir la columna de acciones
        },
      }, 
    ],
    ajax: {
      url: "../../controllers/AsignacionController.php?endpoint=list_detalle_insumo_x_asignacion",
      type: "post",
      data: {
        asignacion_id: function () {
          return asignacion_id;
        },
      }, // Usar asignacion_id global
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
        "_TOTAL_ registros",
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
}
$(document).ready(function () {
  $("#taller_id").select2();
  $("#usuario_id").select2(); 
  $("#periodo_id").select2(); 

  /*TODO=========================================================*/
  /*TODO:Create_AsigancionTempory and Init tabla*/
  createAsignacionTempory().done(function (data) {
    data = JSON.parse(data);
    $("#asigacion_id").val(data.asignacion_id);
    asignacion_id = data.asignacion_id; // Asignar el valor a la variable global
    // Inicializar la tabla solo después de obtener asignacion_id
    tabla_equipos_init(asignacion_id);
    tabla_herramientas_init(asignacion_id); 
    tabla_insumos_init(asignacion_id); 
  });
  /*TODO=========================================================*/

  /*TODO:listar talleres*/
  $.post( "../../controllers/TallerController.php?endpoint=get_taller_jcombox",
    { true: true },
    function (data) {
      //console.log("Datos recibidos para cate:", data);
      $("#taller_id").html(data);
    }
  );
  /*TODO:listar usuarios*/
  $.post( "../../controllers/UserController.php?enpoint=get_usuario_jcombox",
    { true: true },
    function (data) {
      //console.log("Datos recibidos para cate:", data);
      $("#usuario_id").html(data);
    }
  );  
  /*TODO====================PERIODOS=========================*/

  /*TODO:listar periodos*/
  $.post( "../../controllers/PeriodoController.php?endpoint=get_periodo_combobox",
    { true: true },
    function (data) {
      //console.log("Datos recibidos para cate:", data);
      $("#periodo_id").html(data);
    }
  );  
  /*TODO:Subcargar periodos*/
  $("#periodo_id").change(function () {
    $("#periodo_id").each(function () {
      cant_obtenidah=0; 
      xyz = $(this).val(); //Id del equipo recolectado
      $.post(
        "../../controllers/PeriodoController.php?endpoint=list_periodo_id",
        { periodo_id: xyz },
        function (data) {
          data = JSON.parse(data);
          $("#fechai_periodo").val(data.fecha_inicio);
          $("#fechaf_periodo").val(data.fecha_fin); 
        }
      );
    });
  });
  /*TODO====================END PERIODOS================================*/
  /*TODO:listar equipos*/
  $.post(
    "../../controllers/EquipoController.php?endpoint=get_equipo_jcombox",
    { true: true },
    function (data) {
      //console.log("Datos recibidos para cate:", data);
      $("#equipo_id").html(data);
      $("#equipo_id").select2();
    }
  ); 
  /*TODO:subcargar equipos*/
  $("#equipo_id").change(function () {
    $("#equipo_id").each(function () {
      cant_obtenida=0;
      precio_unitarioe=0;

      xyz = $(this).val(); //Id del equipo recolectado
      $.post(
        "../../controllers/EquipoController.php?endpoint=list_equipo_id",
        { equipo_id: xyz },
        function (data) {
          data = JSON.parse(data);
          $("#codigo_m_e").val(data.co_modular);
          $("#marcae").val(data.marca);
          $("#cantidad_d_e").val(data.cantidad);
          $("#precio_uni_e").val(data.precio_unitario);
          $("#total_e").val(data.total);
          cant_obtenida=data.cantidad;
          precio_unitarioe=data.precio_unitario;
        }
      ); 
    }); 
  });
  /*TODO:Click agregar equipo*/ 
  $(document).on("click", "#btn_nuevo_equipo", function () {
    var cantidad= $("#cantidad_e").val();
    var equipo= $("#equipo_id").val();
    console.log("equipo_id:"+equipo)

      // Validar que la cantidad sea mayor que 1
    if (cantidad <=0) {
      Swal.fire({
        title: "Cantidad inválida",
        text: "La cantidad debe ser mayor que 0",
        icon: "error",
      });
      return; // Detener la ejecución si la cantidad no es válida
    }
    // Validar que la cantidad sea mayor que 1
    if (cantidad > cant_obtenida) {
      Swal.fire({
        title: "Cantidad inválida",
        text: "El stok es insuficiente",
        icon: "error",
      });
      return; // Detener la ejecución si la cantidad no es válida
    } 
    $.ajax({
      type: "POST",
      url: "../../controllers/AsignacionController.php?endpoint=register_detalle_equipo",
      data: {
        equipo_id: equipo,asignacion_id:asignacion_id,cantidad: cantidad,precio_unitario:precio_unitarioe},
      success: function (data) { 
        Swal.fire({
          title: "Registro exitoso",
          text: "Se agregó un ítem al detalle",
          icon: "success",
        });
        $("#table_det_equipos").DataTable().ajax.reload();
        ClearInputsEquipm();
      },
      error: function () {
        Swal.fire({
          title: "Error en la consulta",
          text: "Ocurrió un error en la solicitud",
          icon: "error",
        });
      },
    }); 
  }); 
  /*TODO:Limpiar Equipo*/
  function ClearInputsEquipm() {
    $("#equipo_id").val("").trigger("change");
    $("#codigo_m_e").val("");
    $("#marcae").val("");
    $("#cantidad_d_e").val("");
    $("#precio_uni_e").val("");
    $("#total_e").val("");
    $("#cantidad_e").val("");
  }
  /*TODO:Click limpiar equipo*/
  $(document).on("click", "#clear_equipo", function () {
    ClearInputsEquipm();
  });
 
 /*TODO=====================Herramientas=============================*/
  /*TODO:listar herramientas*/
  $.post( "../../controllers/HerramientaController.php?endpoint=get_herramienta_jcombox",
    { true: true },
    function (data) {
      //console.log("Datos recibidos para cate:", data);
      $("#herramienta_id").html(data);
      $("#herramienta_id").select2();
    }
  );
  /*TODO:Subcargar herramientas*/
  $("#herramienta_id").change(function () {
    $("#herramienta_id").each(function () {
      precio_unitarioh=0;  
      cant_obtenidah=0; 
      xyz = $(this).val(); //Id del equipo recolectado
      $.post(
        "../../controllers/HerramientaController.php?endpoint=list_herramienta_id",
        { herramienta_id: xyz },
        function (data) {
          data = JSON.parse(data);
          $("#codigo_m_h").val(data.co_modular);
          $("#marcah").val(data.marca);
          $("#cantidad_d_h").val(data.cantidad);
          $("#precio_uni_h").val(data.precio_unitario);
          $("#total_h").val(data.total);
          cant_obtenidah=data.cantidad;
          precio_unitarioh=data.precio_unitario;

        }
      );
    });
  });
  /*TODO:Click agregar herramienta*/ 
  $(document).on("click", "#btn_nuevo_tools", function () { 
   var cantidad= $("#cantidad_h").val();
   var herramienta_id= $("#herramienta_id").val();
    //console.log("herramienta_id:"+herramienta_id+"."+cantidad) 
    //   Validar que la cantidad sea mayor que 1
    if (cantidad <=0) {
      Swal.fire({
        title: "Cantidad inválida",
        text: "La cantidad debe ser mayor que 0",
        icon: "error",
      });
      return; // Detener la ejecución si la cantidad no es válida
    }
    // Validar que la cantidad sea mayor que 1
    if (cantidad > cant_obtenidah) {
      Swal.fire({
        title: "Cantidad inválida",
        text: "El stok es insuficiente",
        icon: "error",
      });
      return; // Detener la ejecución si la cantidad no es válida
    } 
    $.ajax({
      type: "POST",
      url: "../../controllers/AsignacionController.php?endpoint=register_detalle_herramienta",
      data: {
        herramienta_id: herramienta_id,asignacion_id:asignacion_id,cantidad:cantidad,precio_unitario:precio_unitarioh},
      success: function (data) { 
        Swal.fire({
          title: "Registro exitoso",
          text: "Se agregó un ítem al detalle",
          icon: "success",
        });
        $("#table_det_herramienta").DataTable().ajax.reload();
        ClearInputsHerramientas();
      },
      error: function () {
        Swal.fire({
          title: "Error en la consulta",
          text: "Ocurrió un error en la solicitud",
          icon: "error",
        });
      },
    }); 
  }); 
  /*TODO:Limpiar Herramientas*/
  function ClearInputsHerramientas() {
    $("#herramienta_id").val("").trigger("change");
    $("#codigo_m_h").val("");
    $("#marcah").val("");
    $("#cantidad_d_h").val("");
    $("#precio_uni_h").val("");
    $("#total_h").val("");
    $("#cantidad_h").val("");
  }
  $(document).on("click", "#clear_herramienta", function () {
    ClearInputsHerramientas();
  }); 
 
  /*TODO=====================Insumos================================*/
  /*TODO:listar insumos*/
  $.post( "../../controllers/InsumoController.php?endpoint=get_insumo_jcombox",
    { true: true },
    function (data) {
      //console.log("Datos recibidos para cate:", data);
      $("#insumo_id").html(data);
      $("#insumo_id").select2();
    }
  );
  /*TODO:Subcargar insumos*/
  $("#insumo_id").change(function () {
    $("#insumo_id").each(function () {
      precio_unitarioi=0;
      cant_obtenidai =0; 
      xyz = $(this).val(); //Id recolectado
      $.post( "../../controllers/InsumoController.php?endpoint=list_insumo_id",
        { insumo_id: xyz },
        function (data) {
          data = JSON.parse(data);
          $("#codigo_m_i").val(data.co_modular);
          $("#marcai").val(data.marca);
          $("#cantidad_d_i").val(data.cantidad);
          $("#precio_uni_i").val(data.precio_unitario);
          $("#total_i").val(data.total);
          cant_obtenidai=data.cantidad;
          precio_unitarioi=data.precio_unitario;

        }
      );
    });
  });
  /*TODO:Click agregar herramienta*/ 
  $(document).on("click", "#btn_nuevo_insumo", function () { 
    var cantidad= $("#cantidad_i").val();
    var insumo_id= $("#insumo_id").val();
      //console.log("insumo_id:"+insumo_id+"."+cantidad) 
      //   Validar que la cantidad sea mayor que 1
      if (cantidad <=0) {
        Swal.fire({
          title: "Cantidad inválida",
          text: "La cantidad debe ser mayor que 0",
          icon: "error",
        });
        return; // Detener la ejecución si la cantidad no es válida
      }
      // Validar que la cantidad sea mayor que 1
      if (cantidad > cant_obtenidai) {
        Swal.fire({
          title: "Cantidad inválida",
          text: "El stok es insuficiente",
          icon: "error",
        });
        return; // Detener la ejecución si la cantidad no es válida
      } 
      $.ajax({
        type: "POST",
        url: "../../controllers/AsignacionController.php?endpoint=register_detalle_insumo",
        data: {
          insumo_id: insumo_id,asignacion_id:asignacion_id,cantidad: cantidad,precio_unitario:precio_unitarioi },
        success: function (data) { 
          Swal.fire({
            title: "Registro exitoso",
            text: "Se agregó un ítem al detalle",
            icon: "success",
          });
          $("#table_det_insumo").DataTable().ajax.reload();
          ClearInputsInsumos();
        },
        error: function () {
          Swal.fire({
            title: "Error en la consulta",
            text: "Ocurrió un error en la solicitud",
            icon: "error",
          });
        },
      }); 
  }); 
  /*TODO:Limpiar insumos*/
  function ClearInputsInsumos() {
    $("#insumo_id").val("").trigger("change");
    $("#codigo_m_i").val("");
    $("#marcai").val("");
    $("#cantidad_d_i").val("");
    $("#precio_uni_i").val("");
    $("#total_i").val("");
    $("#cantidad_i").val("");
  }
  $(document).on("click", "#clear_insumo", function () {
    ClearInputsInsumos();
  }); 
  /*TODO=========================================================*/ 
});
 
/*TODO:Click agregar asignacion general*/ 
$(document).on("click", "#btn_registrar_asignacion_g", function () {
  var descripcion= $("#descripcion").val();
  var usuario_id= $("#usuario_id").val();
  var taller_id= $("#taller_id").val();
  var periodo_id= $("#periodo_id").val();

  console.log("asignacion_id:"+asignacion_id) 
  console.log("descripcion:"+descripcion)
  console.log("user_id:"+usuario_id)
  console.log("taller_id:"+taller_id) 
  console.log("periodo_id:"+periodo_id) 


  // Validar que el taller_id sea válido
  if (!taller_id || taller_id == "0") {
    Swal.fire({
        title: "Taller inválido",
        text: "Debe seleccionar un taller",
        icon: "error",
    });
    return; // Detener la ejecución si el taller_id no es válido
  }
  // Validar que el usuario_id sea válido
  if (!usuario_id || usuario_id == "0") {
    Swal.fire({
        title: "Usuario inválido",
        text: "Debe seleccionar un usuario",
        icon: "error",
    });
    return; // Detener la ejecución si el usuario_id no es válido
  } 
  // Validar que el usuario_id sea válido
  if (!periodo_id || periodo_id == "0") {
    Swal.fire({
        title: "Periodo inválido",
        text: "Debe seleccionar un periodo",
        icon: "error",
    });
    return; // Detener la ejecución si el usuario_id no es válido
  } 
  // Validar que la descripción no esté vacía
  if (!descripcion) {
    Swal.fire({
        title: "Descripción inválida",
        text: "Debe ingresar una descripción",
        icon: "error",
    });
    return; // Detener la ejecución si la descripción no es válida
  }

  $.ajax({
    type: "POST",
    url: "../../controllers/AsignacionController.php?endpoint=create_asignacion",
    data: {
       asignacion_id:asignacion_id,taller_id:taller_id,periodo_id:periodo_id,usuario_id:usuario_id,descripcion: descripcion
    },
    success: function (data) { 
      Swal.fire({
        title: "Registro exitoso",
        text: "Se agregó un ítem al detalle",
        icon: "success",
      }).then((result) => {
        if (result.isConfirmed) {
          window.location.href = "../asignaciones/";
        }
      }); 
      $("#table_det_equipos").DataTable().ajax.reload();
      ClearInputsEquipm();
    },
    error: function () {
      Swal.fire({
        title: "Error en la consulta",
        text: "Ocurrió un error en la solicitud",
        icon: "error",
      });
    },
  });  
});  
/*TODO=====================EQUIPOS==========================*/ 
function delete_det_equipo(Id) {
  //Mostrar un mensaje de confirmación al Ubicación utilizando SweetAlert
  swal
    .fire({
      title: "Eliminar registro",
      text: "¿Está seguro que desea eliminar este registro?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Sí, eliminar",
      cancelButtonText: "Cancelar",
    })
    .then((result) => {
      if (result.value) {
        //Eliminar el registro utilizando una solicitud POST al controlador correspondiente
        $.post(
          "../../controllers/AsignacionController.php?endpoint=deletee",
          { detalle_id: Id },
          function (data) {
            console.log(data); //Mostrar posibles errores en la consola
          }
        );
        //Recargar la tabla después de eliminar el registro
        $("#table_det_equipos").DataTable().ajax.reload();
        //Mostrar un mensaje de éxito al Ubicación utilizando SweetAlert
        swal.fire({
          title: "Registro eliminado",
          text: "El registro ha sido eliminado satisfactoriamente.",
          icon: "success",
          confirmButtonColor: "#3085d6",
          confirmButtonText: "Aceptar",
        });
      }
    });
}
/*TODO=====================HERRAMIENTAS==========================*/ 
function delete_det_herramienta(Id) {
  //Mostrar un mensaje de confirmación al Ubicación utilizando SweetAlert
  swal
    .fire({
      title: "Eliminar registro",
      text: "¿Está seguro que desea eliminar este registro?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Sí, eliminar",
      cancelButtonText: "Cancelar",
    })
    .then((result) => {
      if (result.value) {
        //Eliminar el registro utilizando una solicitud POST al controlador correspondiente
        $.post(
          "../../controllers/AsignacionController.php?endpoint=deleteh",
          { herramienta_id: Id },
          function (data) {
            console.log(data); //Mostrar posibles errores en la consola
          }
        );
        //Recargar la tabla después de eliminar el registro
        $("#table_det_herramienta").DataTable().ajax.reload();
        //Mostrar un mensaje de éxito al Ubicación utilizando SweetAlert
        swal.fire({
          title: "Registro eliminado",
          text: "El registro ha sido eliminado satisfactoriamente.",
          icon: "success",
          confirmButtonColor: "#3085d6",
          confirmButtonText: "Aceptar",
        });
      }
    });
}
/*TODO=====================INSUMOS==========================*/ 
function delete_det_insumo(Id) {
  //Mostrar un mensaje de confirmación al Ubicación utilizando SweetAlert
  swal
    .fire({
      title: "Eliminar registro",
      text: "¿Está seguro que desea eliminar este registro?",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Sí, eliminar",
      cancelButtonText: "Cancelar",
    })
    .then((result) => {
      if (result.value) {
        //Eliminar el registro utilizando una solicitud POST al controlador correspondiente
        $.post(
          "../../controllers/AsignacionController.php?endpoint=deletei",
          { insumo_id: Id },
          function (data) {
            console.log(data); //Mostrar posibles errores en la consola
          }
        );
        //Recargar la tabla después de eliminar el registro
        $("#table_det_insumo").DataTable().ajax.reload();
        //Mostrar un mensaje de éxito al Ubicación utilizando SweetAlert
        swal.fire({
          title: "Registro eliminado",
          text: "El registro ha sido eliminado satisfactoriamente.",
          icon: "success",
          confirmButtonColor: "#3085d6",
          confirmButtonText: "Aceptar",
        });
      }
    });
}
 
  