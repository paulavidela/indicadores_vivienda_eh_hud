#' Acceso a saneamiento
#'
#' A partir de esta funcion se genera la variable 'cl':
#' identifica el acceso a saneamiento  - alcantarillado / cloaca - de la vivienda donde reside el hogar
#'
#' Si el saneamiento es optimo, entonces 'cl' toma valor 1.
#' Si el sanemmiento es deficiente, entonces 'cl' toma valor 0.
#'
#' En caso de que no haya datos suficientes, 'cl' no toma ningún valor, es decir es NA.
#'
#' Esta variable discrimina si la vivienda se ubica en zona rural o urbana.
#'
#' @param x dataset de encuesta de hogares armonizada
#'
#' @return dataset con el indicador 'cl' generado
#' @export
#' @import magrittr
#'
calcular_saneamiento <- function(x) {
  nuevo_dataset <- x %>%
    dplyr::mutate(cl = dplyr::case_when(
      #es urbano
      zona_c == 1 & is.na(des1_ch) ~ NA_real_,
      zona_c == 1 & des1_ch == 1 ~ 1,

      # es rural
      zona_c == 0 & des2_ch == 1 ~ 1,
      zona_c == 0 & is.na(des2_ch) & des1_ch %in% c(1,2) ~ 1, # es rural pero no hay datos de des2_ch

      #area desconocida
      is.na(zona_c) & (des1_ch == 1  | des2_ch == 2) ~ 1,

      is.na(des1_ch) ~ NA_real_,
      is.na(des2_ch) ~ NA_real_,

      TRUE ~ 0

    ))
  return(nuevo_dataset)

}
