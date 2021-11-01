#' Preprocesamiento de Encuestas de Hogares
#'
#'La funcion toma como input una encuesta armonizada de SCLDATA y devuelve como output un dataset simplificado.
#'Además calcula el indicador de deficit para cada hogar de la encuesta.
#'
#' @param data dataset de encuesta de hogares armonizada
#'
#' @return dataset el indicador de deficit generado, incluye subindicadores
#' @export
#' @import magrittr
#'
preprocesar_eh_bid <- function(data){

  nuevo_dataset <- data %>%
    seleccionar_variables() %>%
    dplyr::mutate(region_c = corregir_encoding(as.character(haven::as_factor(region_c)))) %>%
    calcular_calidad_materiales() %>%
    calcular_disponibilidad_de_agua() %>%
    calcular_electricidad()%>%
    calcular_saneamiento() %>%
    calcular_hacinamiento() %>%
    calcular_tipo_vivienda() %>%
    calcular_disponibilidad_de_bano() %>%
    calcular_deficit_vivienda()


  return(nuevo_dataset)

}
