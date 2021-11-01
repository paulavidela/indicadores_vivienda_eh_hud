#' Tipo de vivienda
#'
#' A partir de esta funcion se genera la variable 'tv':
#' identifica el tipo vivienda donde reside el hogar
#'
#' Si el tipo de vivienda es adecuado, entonces 'tv' toma valor 1.
#' Si el tipo de vivienda es inadecuado, entonces 'tv' toma valor 0.
#'
#' En caso de que no haya datos suficientes, 'tv' no toma ningún valor, es decir es NA.
#'
#' @param x dataset de encuesta de hogares armonizada
#'
#' @return dataset con el indicador 'tv' generadoç
#' @export
#' @import magrittr
#'
calcular_tipo_vivienda <- function(x) {
  nuevo_dataset <- x %>%
    dplyr::mutate(tv = dplyr::case_when(
      is.na(vivi2_ch) ~ NA_real_,
      vivi2_ch == 1 ~ 1,
      vivi2_ch == 0 ~ 0
    )

    )

  return(nuevo_dataset)

}
