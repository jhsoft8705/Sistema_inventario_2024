 var x = $("#usuario_id_session").val();
console.log(x);
function init() {
  $("#form_mantenimiento").on("submit", function (e) {
    //hacemos referencia al formulario por ID
    save_user_and_update(e);
  });
}

/*TODO:Guardar y editar User*/
function save_user_and_update(e) {
  e.preventDefault();

  // var id = $("#Equipo_id").val();

 /* if (!form_validations()) {
    return;
  }*/
  var formData = new FormData($("#form_mantenimiento")[0]);
  //formData.append("notificacion", notificacion);

  $.ajax({
    url: "../../controllers/EquipoController.php?endpoint=save_and_update_equipos",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (data) {
      $("#modal_mantenimiento").modal("hide");

      $("#table_equipos").DataTable().ajax.reload(); 
      swal.fire({
        title: "Registro Exitoso",
        text: "La operación se realizó correctamente",
        icon: "success",
      });
    },
  });
} 
$(document).ready(function () {  
  /*TODO:listar Equipos */
  $("#table_equipos").DataTable({
    aProcessing: true,
    aServerSide: true,
    dom: "Bfrtip",
    //buttons: ["copy", "csv", "excel", "print", "pdf"],
    buttons: [
      {
        text: "Copiar",
        extend: "copyHtml5",
        messageTop: "Tabla copiada al portapapeles", 
        exportOptions: {
          columns: [0, 1, 2] // Exclude the actions column
        }
      },
      {
        text: "Exportar Excel",
        extend: "excelHtml5",
        exportOptions: {
          columns: [0, 1, 2] // Exclude the actions column
        }
        
      },
      {
        text: "Imprimir",
        extend: "print",
        exportOptions: {
          columns: [0, 1, 2] // Exclude the actions column
        }
      },
      
    ],
    ajax: {
      url: "../../controllers/EquipoController.php?endpoint=list_equipos",
      type: "post",
      data: { true: true },
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
    /*TODO:listar categoria*/
    $.post( "../../controllers/CategoryController.php?endpoint=get_category_jcombox",
      { true: true },
      function (data) {
        //console.log("Datos recibidos para cate:", data);
        $("#categoria_id").html(data);
        $("#categoria_id").select2({
          dropdownParent: $('#modal_mantenimiento')
        });
      }
    );
    /*TODO:listar proveedores*/
    $.post(  "../../controllers/ProveedorController.php?endpoint=get_provider_jcombox",
      { true: true },
      function (data) {
        //console.log("Datos recibidos para pro:", data);
        $("#proveedor_id").html(data);
        $("#proveedor_id").select2({
          dropdownParent: $('#modal_mantenimiento')
        });
      }
    );
    /*TODO:listar und*/
    $.post(
      "../../controllers/UnidadController.php?endpoint=get_unidad_jcombox",
      { true: true },
      function (data) {
        //console.log("Datos recibidos para pro:", data);
        $("#unidad_medida_id").html(data);
        $("#unidad_medida_id").select2({
          dropdownParent: $('#modal_mantenimiento')
        });
      }
    );
});

function editar(Id) {
  $.post(
    "../../controllers/EquipoController.php?endpoint=list_equipo_id",
    { equipo_id: Id },
    function (data) {
      console.log(data);
      data = JSON.parse(data); //Convertir a data a formato JSON
      $("#equipo_id").val(data.id);
      $("#codigo").val(data.co_modular);
      $("#nombre").val(data.nombre);
      $("#descripcion").val(data.descripcion);
      $("#categoria_id").val(data.categoria_id);
      $("#proveedor_id").val(data.proveedor_id);
      $("#marca").val(data.marca);
      $("#modelo").val(data.modelo);
      $("#serie").val(data.serie);
      $("#color").val(data.color);
      $("#unidad_medida_id").val(data.unidadmedida_id);
      $("#medida").val(data.medida);
      $("#cantidad").val(data.cantidad);
      $("#precio_unitario").val(data.precio_unitario);
      $("#fecha_adquisicion").val(data.fecha_adquisicion);
      $("#estado_equipo").val(data.estado_equipo);
      $("#nota").val(data.nota); 
    }
  );
  $("#label_title").html("Actualizar Equipo");
  $("#labelbtn").html("Actualizar");
  $("#modal_mantenimiento").modal("show");
}

function eliminar(Id) {
  //Mostrar un mensaje de confirmación al Equipo utilizando SweetAlert
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
          "../../controllers/EquipoController.php?endpoint=delete",
          { equipo_id: Id },
          function (data) {
            console.log(data); //Mostrar posibles errores en la consola
          }
        );
        //Recargar la tabla después de eliminar el registro
        $("#table_equipos").DataTable().ajax.reload();
        //Mostrar un mensaje de éxito al Equipo utilizando SweetAlert
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

/*TODO:Funcion para abrir modalbtn_nuevo_registro y registrar*/
$(document).on("click", "#btn_nuevo_registro", function () {
  // Limpiar div errors y quitar clases is-invalid
  $("#form_mantenimiento :input").val("");
  $("#form_mantenimiento")[0].reset();
  //$("#Equipo_id").val("");

  $("#label_title").html("Registrar Nuevo Equipo");
  $("#labelbtn").html("Registrar");
  $("#modal_mantenimiento").modal("show");

  //var notifiaciones = $("#notificacion").prop("checked");
  //console.log("NOTIFI SWCCI:" + notifiaciones);
});

 

function form_validations() {
  // Limpiar div errors y quitar clases is-invalid
  $(
    "#nombres_error, #apellidos_error, #documento_error, #correo_error, #pass_error, #rol_id_error, #estado_error"
  ).text("");
  $(
    "#nombres, #apellidos, #documento, #correo, #pass, #rol_id, #estado"
  ).removeClass("is-invalid");

  // Validar cada campo
  var isValid = true;

  if ($("#nombres").val().trim() === "") {
    $("#nombres_error").text("Por favor, ingrese un nombre");
    $("#nombres").addClass("is-invalid");
    isValid = false;
  }

  if ($("#apellidos").val().trim() === "") {
    $("#apellidos_error").text("Por favor, ingrese un apellido");
    $("#apellidos").addClass("is-invalid");
    isValid = false;
  }

  if ($("#documento").val().trim() === "") {
    $("#documento_error").text("Por favor, ingrese un documento");
    $("#documento").addClass("is-invalid");
    isValid = false;
  }

  if ($("#correo").val().trim() === "") {
    $("#correo_error").text("Por favor, ingrese un correo electrónico");
    $("#correo").addClass("is-invalid");
    isValid = false;
  } else if (!/^\S+@\S+\.\S+$/.test($("#correo").val())) {
    $("#correo_error").text("Por favor, ingrese un correo electrónico válido");
    $("#correo").addClass("is-invalid");
    isValid = false;
  }

  if ($("#pass").val().trim() === "") {
    $("#pass_error").text("Por favor, ingrese una contraseña");
    $("#pass").addClass("is-invalid");
    isValid = false;
  } else if ($("#pass").val().length < 3) {
    $("#pass_error").text("La contraseña debe tener al menos 3 caracteres");
    $("#pass").addClass("is-invalid");
    isValid = false;
  }

  if ($("#rol_id").val() === "") {
    $("#rol_id_error").text("Por favor, seleccione un rol");
    $("#rol_id").addClass("is-invalid");
    isValid = false;
  }

  if ($("#estado").val() === "") {
    $("#estado_error").text("Por favor, seleccione un estado");
    $("#estado").addClass("is-invalid");
    isValid = false;
  }

  return isValid;
}

init();
