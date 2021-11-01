#' Estimacion de hogares segun estado habitacional
#'
#' Se estima la cantidad de hogares sin deficit, con deficit cuantitativo y con deficit cualitativo.
#' La estimacion se hace a partir del factor de expansion presente en las encuestas de hogares
#'
#' @param data dataset de encuesta de hogares armonizada
#' @param escala nivel de analisis: "pais" o "region" .
#' La region esta determinada por la Encuesta de Hogar del pais de analisis
#'
#'
#' @return dataset con la cantidad de hogares
#' @export
#' @import magrittr
#'
estimar_representacion_deficit <- function(data, escala = "pais") {

  if (escala == "pais") {
    nuevo_dataset <- data %>%
      preprocesar_eh_bid() %>%
      dplyr::group_by(pais_c, deficit, anio_c) %>%
      dplyr::summarise(cantidad = sum(factor_ch)) %>%
      dplyr::ungroup()

  }

  else if (escala == "region"){
    nuevo_dataset <- data %>%
      preprocesar_eh_bid() %>%
      dplyr::group_by(pais_c, region_c, deficit, anio_c) %>%
      dplyr::summarise(cantidad = sum(factor_ch)) %>%
      dplyr::ungroup()

  }

  else {
    stop('Faltan argumentos')
  }


  return(nuevo_dataset)

}
