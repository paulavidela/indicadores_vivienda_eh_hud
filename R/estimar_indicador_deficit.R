#' Calculo de Indicador de Deficit habitacional
#'
#' Esta función descarga los datos de Encuestas de hogares armonizadas y
#'
#' @param x ruta a la encuesta de hogares armonizada
#'
#' @return dataset con el indicador para esa encuesta de hogares
#' @export
#'
#' @import dplyr
estimar_indicador_deficit <- function(x) {
  dataset_base <- descargar_eh(x)

  dataset <- estimar_representacion_deficit(dataset_base)

  return(dataset)


}
