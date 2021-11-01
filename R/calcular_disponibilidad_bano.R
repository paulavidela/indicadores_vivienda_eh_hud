#' Disponibilidad de baño
#'
#' A partir de esta funcion se genera la variable 'db':
#' identifica si el hogar cuenta con un baño exclusivo
#'
#' Si el hogar dispone de un baño exclusivo, entonces 'db' toma valor 1.
#' Si el hogar no dispone de un baño exclusivo, entonces 'db' toma valor 0.
#'
#' En caso de que no haya datos suficientes, 'db' no toma ningún valor, es decir es NA.
#'
#' @param x dataset de encuesta de hogares armonizada
#'
#' @return dataset con el indicador 'db' generado
#' @export
#' @import magrittr
#'
calcular_disponibilidad_de_bano <- function(x) {
  nuevo_dataset <- x %>%
    dplyr::mutate( db = dplyr::case_when(
      is.na(banoex_ch) ~ NA_real_,
      banoex_ch == 1 ~ 1,
      banoex_ch == 0 ~ 0
    )

    )

  return(nuevo_dataset)

}
