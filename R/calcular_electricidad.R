#' Acceso a electricidad
#'
#' A partir de esta funcion se genera la variable 'el':
#' identifica el acceso a electricidad de la vivienda donde reside el hogar
#'
#' Si el acceso a la electricidad es optimo, entonces 'el' toma valor 1.
#' Si el acceso a la electricidad es deficiente, entonces 'el' toma valor 0.
#'
#' En caso de que no haya datos suficientes, 'el' no toma ningún valor, es decir es NA.
#'
#' @param x dataset de encuesta de hogares armonizada
#'
#' @return dataset con el indicador 'el' generado
#' @export
#' @import magrittr
#'
calcular_electricidad <- function(x) {
  nuevo_dataset <- x %>%
    dplyr::mutate(el = dplyr::case_when(
      is.na(luz_ch) ~ NA_real_,

      luz_ch == 1 ~ 1,

      TRUE ~ 0

    ))
  return(nuevo_dataset)

}
