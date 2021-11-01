#' Disponibilidad de agua
#'
#' A partir de esta funcion se genera la variable 'ag':
#' identifica la disponibilidad de agua de la vivienda donde reside el hogar
#'
#' Si la provisión de agua es optima, entonces 'ag' toma valor 1.
#' Si la provisión de agua es deficiente, entonces 'ag' toma valor 0.
#'
#' En caso de que no haya datos suficientes, 'ag' no toma ningún valor, es decir es NA.
#'
#' Esta variable discrimina si la vivienda se ubica en zona rural o urbana.
#'
#' @param x dataset de encuesta de hogares armonizada
#'
#' @return dataset con el indicador 'ag' generado
#' @export
#' @import magrittr
#'
calcular_disponibilidad_de_agua <- function(x) {
  nuevo_dataset <- x %>%
    dplyr::mutate(ag = dplyr::case_when(
      is.na(aguamejorada_ch) ~ NA_real_,

      #es urbano
      zona_c == 1 & aguamejorada_ch == 1 & aguared_ch == 1 & aguadist_ch == 1 ~ 1,
      zona_c == 1 & aguamejorada_ch == 1 & is.na(aguared_ch) & aguadist_ch == 1 ~ 1,
      zona_c == 1 & aguamejorada_ch == 1 & aguared_ch == 1 & is.na(aguadist_ch) ~ 1,
      zona_c == 1 & aguamejorada_ch == 1 & is.na(aguared_ch) & is.na(aguadist_ch) ~ 1,

      # es rural
      zona_c == 0 & aguamejorada_ch == 1 ~ 1,

      is.na(zona_c) & aguamejorada_ch == 1 ~ 1,


      TRUE ~ 0

    ))
  return(nuevo_dataset)

}
