#' Hacinamiento
#'
#' A partir de esta función se genera la variable 'ha':
#' identifica el hacinamiento del hogar a partir de la cantidad de personas por dormitorio
#'
#' Si el hacinamiento es crítico, entonces 'ha' toma valor 2.
#' Si el hacinamiento es recuperable, entonces 'ha' toma valor 1.
#' Si el hogar no vive en hacinamiento, entonces 'ha' toma valor 0.
#'
#' En caso de que no haya datos suficientes, 'ha' no toma ningún valor, es decir es NA.
#'
#' @param x dataset de encuesta de hogares armonizada
#'
#' @return dataset con el indicador 'ha' generado
#' @export
#' @import magrittr
#'
calcular_hacinamiento <- function(x) {
  nuevo_dataset <- x %>%
    dplyr::mutate(ratio_pers_dorm = ifelse(is.na(nmiembros_ch) | is.na(dorm_ch),
                                           NA,
                                           nmiembros_ch/dorm_ch
                                           ),

                  ha = dplyr::case_when(
                    ratio_pers_dorm >= 4  ~ 2,
                    ratio_pers_dorm > 2 ~ 1,
                    ratio_pers_dorm <= 2 ~ 0,
                    is.na(ratio_pers_dorm) ~ NA_real_
                    )

                  )

  return(nuevo_dataset)

}
