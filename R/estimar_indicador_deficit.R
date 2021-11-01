#' Calculo de Indicador de Deficit habitacional
#'
#' @param path ruta a la encuesta de hogares armonizada
#'
#' @return dataset con el indicador para esa encuesta de hogares
#' @export
#'
#' @import dplyr aws.s3 haven
estimar_indicador_deficit <- function(path) {

  dataset <- aws.s3::s3read_using(FUN = haven::read_dta,
                          object = path) %>%
    dplyr::as_tibble() %>%
    estimar_representacion_deficit()


}
