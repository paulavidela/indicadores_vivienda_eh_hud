#' Estimacion de hogares segun estado habitacional
#'
#' Se estima la cantidad de hogares sin deficit, con deficit cuantitativo y con deficit cualitativo.
#' La estimacion se hace a partir del factor de expansion presente en las encuestas de hogares
#'
#' @param data dataset de encuesta de hogares armonizada
#' @param escala nivel de analisis: "pais" o "region" . La region esta determinada por la Encuesta de Hogar del pais de analisis
#'
#' @return dataset con la cantidad de hogares
#'
#' @import magrittr dplyr
#' @importFrom stats var
#'
estimar_representacion_deficit <- function(data, escala = "pais") {

  encuesta <- data %>%
    preprocesar_eh_bid()

  muestra <- as.numeric(nrow(encuesta))

  if (escala == "pais") {
    nuevo_dataset <- encuesta %>%
      dplyr::mutate(hud_deficit_cualitativo = ifelse(deficit == "Cualitativo", 1, 0),
                    hud_deficit_cuantitativo = ifelse(deficit == "Cuantitativo", 1, 0),
                    hud_sin_deficit = ifelse(deficit == "Sin déficit", 1, 0)) %>%
      dplyr::select(pais_c, anio_c, factor_ch, hud_deficit_cualitativo, hud_deficit_cuantitativo, hud_sin_deficit) %>%
      tidyr::gather(key = "indicator", value = "variable_binaria", 4:6) %>%
      dplyr::group_by(pais_c, anio_c, indicator) %>%
      dplyr::summarise(value = sum(variable_binaria*factor_ch)*100/sum(factor_ch),
                       se = sqrt(stats::var(variable_binaria)),
                       cv = se *100 /(sum(variable_binaria*factor_ch)*100/sum(factor_ch)),
                       sample = muestra) %>%
      ungroup() %>%
      dplyr::left_join(data_s3, by = c("pais_c" = "pais", "anio_c" =  "anio")) %>%
      dplyr::mutate(year = anio_c,
                    isoalpha3 = pais_c,
                    idegeo = "country",
                    source = paste0(isoalpha3,"-", nombre),
                    area = "Total",
                    quintile = "Total",
                    sex =NA,
                    education =NA,
                    age=NA,
                    ethnicity =NA) %>%
      dplyr::select(iddate, year, idgeo, isoalpha3, source, indicator, area, quintile, sex, education, age, ethnicity, value, se,cv, sample)

  }

  else if (escala == "region"){
    nuevo_dataset <- encuesta %>%
      dplyr::mutate(hud_deficit_cualitativo = ifelse(deficit == "Cualitativo", 1, 0),
                    hud_deficit_cuantitativo = ifelse(deficit == "Cuantitativo", 1, 0),
                    hud_sin_deficit = ifelse(deficit == "Sin déficit", 1, 0)) %>%
      dplyr::select(pais_c, anio_c, region_c, factor_ch, hud_deficit_cualitativo, hud_deficit_cuantitativo, hud_sin_deficit) %>%
      tidyr::gather(key = "indicator", value = "variable_binaria", 5:7) %>%
      dplyr::group_by(pais_c, anio_c, region_c, indicator) %>%
      dplyr::summarise(value = sum(variable_binaria*factor_ch)*100/sum(factor_ch),
                       se = sqrt(stats::var(variable_binaria)),
                       cv = se *100 /(sum(variable_binaria*factor_ch)*100/sum(factor_ch)),
                       sample = muestra) %>%
      ungroup() %>%
      dplyr::left_join(data_s3, by = c("pais_c" = "pais", "anio_c" =  "anio")) %>%
      dplyr::mutate(year = anio_c,
                    isoalpha3 = pais_c,
                    idegeo = "country",
                    source = paste0(isoalpha3,"-", nombre),
                    area = region_c,
                    quintile = "Total",
                    sex =NA,
                    education =NA,
                    age=NA,
                    ethnicity =NA) %>%
      dplyr::select(iddate, year, idgeo, isoalpha3, source, indicator, area, quintile, sex, education, age, ethnicity, value, se,cv, sample)
  }

  else {
    stop('Faltan argumentos')
  }


  return(nuevo_dataset)

}
