function show_content_modal(title, action) {
    if (action == 'create') {
        title = "Registrar " + title;
        $("#btn_modal_guardar").show();
        $("#btn_modal_actualizar").hide();
        $("#btn_modal_cerrar").hide();
        $("#btn_modal_cancelar").show();
        $("#btn_modal_eliminar").hide();
        $("#modal_title_catalogos" ).html(title);
    } else if (action == 'edit') {
        title = "Editar " + title;
        $("#btn_modal_guardar").hide();
        $("#btn_modal_cerrar").hide();
        $("#btn_modal_actualizar").show();
        $("#btn_modal_cancelar").show();
        $("#btn_modal_eliminar").hide();
        $("#modal_title_catalogos" ).html(title);
    } else if (action == 'delete') {
        title = "Eliminar " + title;
        $("#btn_modal_guardar").hide();
        $("#btn_modal_cerrar").hide();
        $("#btn_modal_actualizar").hide();
        $("#btn_modal_cancelar").show();
        $("#btn_reimprimir_ticket").hide();
        $("#modal_title_catalogos" ).html(title);
    } else {
        title = "Mostrar " + title;
        $("#btn_modal_guardar").hide();
        $("#btn_modal_eliminar").hide();
        $("#btn_modal_cerrar").show();
        $("#btn_modal_actualizar").hide();
        $("#btn_modal_cancelar").hide();
        $("#modal_title_catalogos" ).html(title);
    }
}

$(document).ready(function(){
    $("#btn_modal_guardar").click(function () {
        $('#btn-origen-guardar').trigger( "click" );
    });

    $("#btn_modal_actualizar").click(function () {
        $('#btn-origen-guardar').trigger( "click" );
    });
});
