var user_id = $("#variable_session_user_id_navbar").val();
function init() {
  $("#form_mantenimiento").on("submit", function (e) {
    //hacemos referencia al formulario por ID
    save_rol_and_update(e);
  });
}

function save_rol_and_update(e) {
  e.preventDefault();
  var id = $("#id_rol").val();
  var txtnombre = $("#nombre").val();
  var descripcion = $("#descripcion").val();

  if (!Validaciones(txtnombre, descripcion)) {
    return;
  }

  var formData = new FormData($("#form_mantenimiento")[0]);
  $.ajax({
    url: "../../controllers/RolController.php?enpoint=save_and_update_roles",
    type: "POST",
    data: formData,
    contentType: false,
    processData: false,
    success: function (data) {
      $("#tabla_roles").DataTable().ajax.reload();
      $("#modal_mantenimiento").modal("hide");
      console.log(data);
      swal.fire({
        title: "Registro Exitoso",
        text: "La operación se realizó correctamente",
        icon: "success",
      });
    },
  });
}

$(document).ready(function () {
  /* TODO: Listar informacion en el datatable js */
  $("#tabla_roles").DataTable({
    aProcessing: true,
    aServerSide: true,
    dom: "Bfrtip",
    buttons: ["copyHtml5", "excelHtml5"],
    ajax: {
      url: "../../controllers/RolController.php?enpoint=list_roles",
      type: "post",
      data: { true: true },
    },
    bDestroy: true,
    responsive: true,
    bInfo: true,
    iDisplayLength: 5,
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
    },
  });
});

function show_roles(x) {
  console.log("ROL_ID"+x)
  $.post(
    "../../controllers/RolController.php?enpoint=create_automatico_list_permiso_x_rol",
    { rol_id: x },
    function (data) {
      console.log(data);
     // $("#tabla_permisos").DataTable().ajax.reload();
    }
  );
  $("#tabla_permisos").DataTable({
    aProcessing: true,
    aServerSide: true,
    paging: false, // Desactivar paginación

    dom: "Bfrtip",
    buttons: ["copyHtml5"],
    ajax: {
      url: "../../controllers/RolController.php?enpoint=listar_permisos_x_rol_id",
      type: "post",
      data: { id_role: x },
    },
    bDestroy: true,
    responsive: true,
    bInfo: false,
    iDisplayLength: 20,
    ordering: false,
  }); 

  $("#modal_setting_roles").modal("show"); 
  $("#lbltitulo_config").html("Asignación de permisos ");
  $("#lblbtn_config").html("Salir");
}


function Desabilitar_permiso(id_menu_detalle) {
  $.post(
    "../../controllers/RolController.php?enpoint=Desabilitar_permiso",
    { detalle_menu_id: id_menu_detalle },
    function (data) {
      console.log(data);
      $("#tabla_permisos").DataTable().ajax.reload();
    }
  );
}

function Habilitar_permiso(id_menu_detalle) {
  $.post(
    "../../controllers/RolController.php?enpoint=Habilitar_permiso",
    { detalle_menu_id: id_menu_detalle },
    function (data) {
      console.log(data);
      $("#tabla_permisos").DataTable().ajax.reload();
    }
  );
}

function editar(Id) {
  $.post(  "../../controllers/RolController.php?enpoint=list_rol_id",
    { id_rol: Id },
    function (data) {
      console.log(data);
      data = JSON.parse(data); //Convertir a data a formato JSON
      $("#id_rol").val(data.id);
      $("#nombre").val(data.nombre);
      $("#descripcion").val(data.descripcion);
    }
  );
  $("#lbltitulo").html("Actualizar Rol");

  $("#lblbtn").html("Actualizar");
  $("#modal_mantenimiento").modal("show");
}

function eliminar(Id) {
  //Mostrar un mensaje de confirmación al usuario utilizando SweetAlert
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
          "../../controllers/RolController.php?enpoint=delete",
          { id_rol: Id },
          function (data) {
            console.log(data); //Mostrar posibles errores en la consola
          }
        );
        //Recargar la tabla después de eliminar el registro
        $("#tabla_roles").DataTable().ajax.reload();
        //Mostrar un mensaje de éxito al usuario utilizando SweetAlert
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
  /* TODO: Limpiar informacion */
  $("#id_rol").val("");
  $("#nombre").val("");
  $("#descripcion").val("");
  $("#lbltitulo").html("Registrar Nuevo Rol");
  $("#lblbtn").html("Registrar");
  $("#form_mantenimiento")[0].reset();
  /* TODO: Mostrar Modal */
  $("#modal_mantenimiento").modal("show");
});

function Validaciones(txtnombre, txtdescripcion) {
  /*TODO: Validaciones*/
  $("#nombre-error, #descripcion-error").text(""); // Limpiar mensajes de error
  $("#nombre, #descripcion").removeClass("is-invalid"); // Quitar clases de error

  if (txtnombre == "") {
    $("#nombre-error").text("Por favor, ingrese un nombre");
    $("#nombre").addClass("is-invalid");
    return false;
  }
  if (txtdescripcion == "") {
    $("#descripcion-error").text("Por favor, ingrese una descripción");
    $("#descripcion").addClass("is-invalid");
    return false;
  }

  return true; // Retorna true si las validaciones son exitosas
}

init();
