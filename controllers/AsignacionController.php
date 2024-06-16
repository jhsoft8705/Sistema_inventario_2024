<?php 
require_once("../config/conexion.php");
require_once("../models/Asignacion.php");

$asignacion=new Asignacion();

switch($_GET['endpoint']){

    /*Tempory Asignacion*/
    case 'create_asignacion_tempory':
    $datos=$asignacion->create_asignacion_temportal($_POST["usuario_id"]);  
    if(is_array($datos)==true and count($datos)>0){  
        foreach($datos as $row){
        $output["asignacion_id"]=$row["Id"];  
        }
        echo json_encode($output); 
    }else {
        echo json_encode(["error" => "No se encontraron datos o ocurrió un error"]);
    }  
    break;
    /*Create Asignacion*/
    case 'create_asignacion':
    $asignacion->create_asignacion($_POST["asignacion_id"],$_POST["taller_id"],$_POST["periodo_id"],$_POST["usuario_id"],$_POST["descripcion"]);  
    break;
    
    /*TODO:=============EQUIPOS=================================================*/
    /*TODO:Listar asignaciones */
    case 'list_detalle_equipo_x_asignacion':
    $datos=$asignacion->list_detalle_equipo_x_asignacion($_POST['asignacion_id']);
    $data=Array();
    foreach($datos as $filas){
        $sub_array=array();
        $sub_array[]=$filas["Codigo"];  
        $sub_array[]=$filas["Nombre"]; 
        $sub_array[]=$filas["Descripcion"];  
        $sub_array[]=$filas["Cantidad"];    
        $sub_array[] = '<span class="badge bg-success">' . $filas["EstadoDetalle"] . '</span>';
        $sub_array[] = '
        <td> 
            <div class="d-flex gap-2"> 
                <div class="remove">
                    <button class="btn btn-sm btn-danger remove-item-btn" onClick="delete_det_equipo(' . $filas["Id"] . ')" id="' . $filas["Id"] . '">
                        <i class="ri-delete-bin-5-line"></i> 
                    </button>
                </div>
            </div>
        </td>';
        $data[] = $sub_array;
    }
    $results=array(
        "SEcho"=>1,
        "iTotalrecords"=>count($data),
        "iTotaldisplayRecords"=>count($data),
        "aaData"=>$data,);
        //Imprimimos JSON
        echo json_encode($results); 
    break; 
    
    
    case 'register_detalle_equipo':
    $asignacion->register_detalle_equipo( $_POST["equipo_id"], 
    $_POST["asignacion_id"],$_POST["cantidad"],$_POST["precio_unitario"]);  
    break; 
    case 'deletee': 
    $asignacion->eliminar_detalle_equipo($_POST["detalle_id"]);     
    break;
    
    /*TODO:=============HERRAMIENTAS=================================================*/
    case 'list_detalle_herramienta_x_asignacion':
    $datos = $asignacion->list_detalle_herramienta_x_asignacion($_POST['asignacion_id']);
    $data = Array();
    foreach($datos as $filas) {
        $sub_array = array();
        $sub_array[] = $filas["Codigo"];  
        $sub_array[] = $filas["Nombre"]; 
        $sub_array[] = $filas["Descripcion"];  
        $sub_array[] = $filas["Cantidad"];    
        $sub_array[] = '<span class="badge bg-success">' . $filas["EstadoDetalle"] . '</span>';
        $sub_array[] = '
        <td> 
            <div class="d-flex gap-2"> 
                <div class="remove">
                    <button class="btn btn-sm btn-danger remove-item-btn" onClick="delete_det_herramienta(' . $filas["Id"] . ')" id="' . $filas["Id"] . '">
                        <i class="ri-delete-bin-5-line"></i>  
                    </button>
                </div>
            </div>
        </td>';
        $data[] = $sub_array;
    }
    $results = array(
        "SEcho" => 1,
        "iTotalrecords" => count($data),
        "iTotaldisplayRecords" => count($data),
        "aaData" => $data
    );
    // Imprimimos JSON
    echo json_encode($results); 
    break;  
    // Registrar herramienta 
    case 'register_detalle_herramienta':
    $asignacion->register_detalle_herramienta($_POST["herramienta_id"], $_POST["asignacion_id"], $_POST["cantidad"],$_POST["precio_unitario"]);  
    break;  
    case 'deleteh': 
    $asignacion->eliminar_detalle_herramienta($_POST["herramienta_id"]);     
    break;

    /*TODO:=============INSUMOS=================================================*/
    case 'list_detalle_insumo_x_asignacion':
    $datos = $asignacion->list_detalle_insumo_x_asignacion($_POST['asignacion_id']);
    $data = Array();
    foreach($datos as $filas) {
        $sub_array = array();
        $sub_array[] = $filas["Codigo"];  
        $sub_array[] = $filas["Nombre"]; 
        $sub_array[] = $filas["Descripcion"];  
        $sub_array[] = $filas["Cantidad"];    
        $sub_array[] = '<span class="badge bg-success">' . $filas["EstadoDetalle"] . '</span>';
        $sub_array[] = '
        <td> 
            <div class="d-flex gap-2"> 
                <div class="remove">
                    <button class="btn btn-sm btn-danger remove-item-btn" onClick="delete_det_insumo(' . $filas["Id"] . ')" id="' . $filas["Id"] . '">
                        <i class="ri-delete-bin-5-line"></i>  
                    </button>
                </div>
            </div>
        </td>';
        $data[] = $sub_array;
    }
    $results = array(
        "SEcho" => 1,
        "iTotalrecords" => count($data),
        "iTotaldisplayRecords" => count($data),
        "aaData" => $data
    );
    // Imprimimos JSON
    echo json_encode($results); 
    break; 
    // Registrar insumo 
    case 'register_detalle_insumo':
    $asignacion->register_detalle_insumo($_POST["insumo_id"], $_POST["asignacion_id"], $_POST["cantidad"],$_POST["precio_unitario"]);  
    break;   
    // Eliminar insumo
    case 'deletei': 
    $asignacion->eliminar_detalle_insumo($_POST["insumo_id"]);     
    break;
 
   /*TODO:Listar asignaciones */
    case 'listar_asignacion':
    $datos=$asignacion->listar_asignacion(null); 
    foreach($datos as $filas){ 
    ?>
        <div class="col-xl-3 col-lg-6">
            <div class="card ribbon-box right overflow-hidden">
                <div class="card-body text-center p-4">
                    <div class="ribbon ribbon-info ribbon-shape trending-ribbon"><i
                            class="ri-flashlight-fill text-white align-bottom"></i> <span
                            class="trending-ribbon-text"><?php echo $filas["Periodo_Nombre"]?></span></div>
                    <img src="../../assets/images/companies/img-8.png" alt="" height="45">
                    <h5 class="mb-1 mt-4"><a href="../AsigDetalle/"
                            class="link-primary"><?php echo $filas["T_Nombre"]?></a></h5>
                    <p class="text-muted mb-4"><?php echo $filas["NombreRol"].' - '.$filas["NombresUsuario"].'  '.$filas["ApellidosUsuario"]?></p>
                    <div class="row mt-4">
                        <div class="col-lg-7 border-end-dashed border-end">
                            <span class="text-muted">Herramientas</span>
                            <h5><?php echo $filas["CantidadH"]?></h5>
                        </div>
                        <div class="col-lg-5 border-end-dashed border-end">
                            <span class="text-muted">Equipos</span>
                            <h5><?php echo $filas["CantidadE"]?></h5>
                        </div>
                        <div class="col-lg-6">
                            <span class="text-muted">Insumos</span>
                            <h5><?php echo $filas["CantidadI"]?></h5>
                        </div>
                        <div class="col-lg-6">
                            <span class="text-muted">Inversión</span>
                            <h5><?php echo $filas["TotalGeneral"]?> S/.</h5>
                        </div>
                    </div>
                    <div class="mt-4">
                        <a href="../AsigDetalle/" class="btn btn-light w-100">Ver</a>
                    </div> 
                    <!---<div class="mt-1">
                        <a href="apps-ecommerce-seller-details.html" class="btn btn-light w-100">Realizar inventaro</a>
                    </div> ---> 
                </div>
            </div>
        </div> 
    <?php }
    break; 

    case 'get_asignacione_jcombox':
    $datos=$asignacion->list_asignacion();
    if (is_array($datos) == true and count($datos) > 0) {
        $html = "<option value=''>Seleccionar</option>";
        foreach ($datos as $row) {
          $html .= "<option value='" . $row['Id'] . "'>" . $row['Nombreasignacion'] . "</option>";
        }
        echo $html;
    }
    break; 
    /*TODO:Listar asignacion x Id*/ 
    case 'list_asignacion_id':
    $datos=$asignacion->list_asignacion_id($_POST["asignacion_id"]);
         if(is_array($datos)==true and count($datos)>0){  
            foreach($datos as $row){
              $output["id"]=$row["Id"]; 
                $output["nombre"]=$row["Nombreasignacion"];  
                $output["descripcion"]=$row["Descripcion"]; 
            }
            echo json_encode($output); 
        }
    break; 
 
    case 'save_and_update_asignaciones':
    /* TODO: Guardar cuando el ID este vacio y actualizar cuando venga ID*/
    if(empty($_POST["asignacion_id"])){ //insertar
        $asignacion->insert_asignacion(
        $_POST["nombre"],
        $_POST["descripcion"]);  
      }else{
        $asignacion->update_asignacion(        
        $_POST["asignacion_id"],   
        $_POST["nombre"], 
        $_POST["descripcion"]);  
     }       
    break;
    


}

?>