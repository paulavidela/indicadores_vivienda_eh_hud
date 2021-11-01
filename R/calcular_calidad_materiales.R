#' Calidad de los materiales
#'
#' A partir de esta función se genera la variable 'cm':
#' identifica la calidad de los materiales de la vivienda donde reside el hogar
#' Si los materiales son suficiente, entonces 'cm' toma valor 2.
#' Si los materiales son recuperables, entonces 'cm' toma valor 1.
#' Si los materiales son irrecuparables, entonces 'cm' toma valor 0.
#'
#' En caso de que no haya datos suficientes, 'cm' no toma ningún valor, es decir es NA.
#'
#' @param x dataset de encuesta de hogares armonizada
#'
#' @return dataset con el indicador 'cm' generado
#' @export
#' @import magrittr
#'
calcular_calidad_materiales <- function(x) {
  nuevo_dataset <- x %>%
    dplyr::mutate(cm = dplyr::case_when(
      is.na(piso_ch) & is.na(pared_ch)  ~ NA_real_,
      is.na(piso_ch) & is.na(techo_ch)  ~ NA_real_,
      is.na(techo_ch) & is.na(pared_ch) ~ NA_real_,

      piso_ch == 1 & pared_ch == 1 & techo_ch == 1 ~ 2,
      piso_ch == 1 & pared_ch == 1 & is.na(techo_ch) ~ 2,
      piso_ch == 1 & is.na(pared_ch) & techo_ch == 1 ~ 2,
      is.na(piso_ch) & pared_ch == 1 & techo_ch == 1 ~ 2,

      pared_ch %in% c(0,2) ~ 0,
      is.na(pared_ch) & piso_ch %in% c(0, 2) & techo_ch %in% c(0, 2) ~ 0,

      TRUE ~ 1

    ))
  return(nuevo_dataset)

}
