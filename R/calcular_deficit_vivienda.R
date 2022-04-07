#' Indicador de deficit de la vivienda
#'
#' Esta funcion calcula para cada hogar si habita en una vivienda con:
#' deficit cuantitativo
#' deficit cualitativo
#' sin deficit
#'
#'El hogar reside en una vivienda con deficit cuantitativo si:
#'La calidad de los materiales es irrecuperable
#'El hacinamiento es critico
#'El tipo de vivienda es inadecuado
#'No cuenta con baño exclusivo para el hogar
#'
#'Es suficiente cumplir con por lo menos un criterio
#'
#'
#'El hogar reside en una vivienda con déficit cuantitativo si:
#'La calidad de los materiales es recuperable
#'El hacinamiento es mitigable
#'No cuenta con abastecimiento de agua
#'No cuenta con saneamiento - alcantarillado / cloaca
#'No cuenta con electricidad
#'
#'Es suficiente cumplir con por lo menos un criterio
#'
#'
#'La funcion genera la variable 'deficit':
#' Si el hogar cuenta con déficit cuantitativo, entonces 'deficit' toma valor 2.
#' Si el hogar cuenta con déficit cualitativo, entonces 'deficit' toma valor 1.
#' Si el hogar no tiene deficit, entonces 'deficit' toma valor 0.
#'
#' En caso de que no haya datos suficientes, 'deficit' no toma ningún valor, es decir es NA.
#'
#' @param x dataset de encuesta de hogares armonizada
#'
#' @return dataset con el indicador 'deficit' generado
#' @import magrittr
#'
calcular_deficit_vivienda <- function(x) {
  nuevo_dataset <- x %>%
    dplyr::mutate(deficit = dplyr::case_when(
      cm == 0  ~ "hud_deficit_cuantitativo",
      ha == 2  ~ "hud_deficit_cuantitativo",
      tv == 0 ~ "hud_deficit_cuantitativo",
      db == 0 ~ "hud_deficit_cuantitativo",

      cm == 1  ~ "hud_deficit_cualitativo",
      ag == 0 ~ "hud_deficit_cualitativo",
      el == 0 ~ "hud_deficit_cualitativo",
      cl == 0 ~ "hud_deficit_cualitativo",
      ha == 1~ "hud_deficit_cualitativo",

      is.na(cm) & is.na(ha) & is.na(tv) & is.na(db) & is.na(ag) & is.na(el) & is.na(cl) ~ "Sin datos",

      TRUE ~ "hud_sin_deficit"
    )

    )

  return(nuevo_dataset)

}
