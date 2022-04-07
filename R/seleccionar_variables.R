#' Preprocesamiento de las encuestas de hogares
#'
#' Verifica si el parametro x es una encuesta de hogares armonizada por SCLDATA, y devuelve las variables de vivienda
#'
#' @param x dataframe de encuesta de hogares armonizada
#'
#' @return dataframe con variables seleccionadas
#' @export
#'
seleccionar_variables <- function(x) {

  # se determinan las variables disponibles en el dataset

  tipo <- determinar_variables_disponibles(x)

  # se determina la lista de variables a seleccionar según el tipo
  # las variables que se quitan son variables que se utilizan para las métricas de calidad

  nombre_variables_list <- variables_a_seleccionar$nombre

  if(tipo == 3) {
    nombre_variables_list <- variables_a_seleccionar$nombre

  } else if(tipo == 2) {
    nombre_variables_list <- nombre_variables_list[!(nombre_variables_list == "estrato_ci")]

  } else {
    nombre_variables_list <- nombre_variables_list[!(nombre_variables_list %in% c("estrato_ci", "upm_ci"))]
  }

  # se seleccionan todas las variables que se encuentran en el dataset 'variables_a_seleccionar'


    dataframe <- x[ , nombre_variables_list, drop=FALSE]
    dataframe <- unique(dataframe) # mantener hogares con ID unico para no computar más de 1 vez el hogar
    dataframe <- dplyr::filter(dataframe, !is.na(factor_ch))


  return(dataframe)
}

