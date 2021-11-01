#' Preprocesamiento de encuestas de hogares
#'
#' Verifica si el parametro x es una encuesta de hogares armonizada por SCLDATA, y devuelve las variables de vivienda
#'
#' @param x dataframe de encuesta de hogares armonizada
#'
#' @return dataframe con variables seleccionadas
#' @export
#'
seleccionar_variables <- function(x) {

  # se seleccionan todas las variables que se encuentran en el dataset 'variables_a_seleccionar'
  nombre_variables_list <- variables_a_seleccionar$nombre

  loadError <- FALSE

  # se verifica si los nombres de las variables se encuentran en el dataset
  z <- try({ x[ , nombre_variables_list, drop=FALSE] })

  loadError <- (methods::is(z, 'try-error')|is(z,'error'))

  # si el dataset es una encuesta armonizada, entonces se filtran solo las variables seleccionadas
  if(loadError == FALSE){

    dataframe <- x[ , nombre_variables_list, drop=FALSE]
    dataframe <- unique(dataframe) # mantener hogares con ID unico para no computar más de 1 vez el hogar
    dataframe <- dplyr::filter(dataframe, !is.na(factor_ch))

  }

  # su el dataset no es una encuesta armonizada (las variables no se encontraron), entonces devuelve un error
  else {
    stop('El dataset no corresponde a una encuesta armonizada (Harmonized Survey SCLDATA)') }

  return(dataframe)
}

