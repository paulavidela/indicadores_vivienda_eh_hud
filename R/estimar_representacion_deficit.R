#' Estimacion de hogares segun estado habitacional
#'
#' Se estima la cantidad de hogares sin deficit, con deficit cuantitativo y con deficit cualitativo.
#' La estimacion se hace a partir del factor de expansion presente en las encuestas de hogares
#'
#' @param data dataset de encuesta de hogares armonizada
#'
#' @return dataset con la cantidad de hogares
#' @export
#'
#' @import magrittr dplyr srvyr
#' @importFrom stats var
#'
estimar_representacion_deficit <- function(data) {

  encuesta <- data %>%
    preprocesar_eh_bid()

  muestra <- as.numeric(nrow(encuesta))

   # se determinan las variables disponibles en el dataset para el cálculo de métricas de calidad

  tipo <- determinar_variables_disponibles(x)

  # se determina el diseño de la encuesta según las variables disponibles

  if(tipo == 3) {
    srs_design_srvyr <- encuesta %>%
      srvyr::as_survey_design(ids = upm_ci,
                              weight = factor_ch,
                              strata = estrato_ci,
                              nest = TRUE)

  } else if(tipo == 2) {
    srs_design_srvyr <- encuesta %>%
      srvyr::as_survey_design(ids = upm_ci,
                              weight = factor_ch,
                              nest = TRUE)

  } else {
    srs_design_srvyr <- encuesta %>%
      srvyr::as_survey_design(weight = factor_ch,
                              nest = TRUE)
  }


  out <- srs_design_srvyr %>%
    dplyr::group_by(deficit) %>%
    dplyr::summarise(total = srvyr::survey_prop(c("se", "cv"))) %>%
    dplyr::mutate(pais_c = unique(encuesta$pais_c),
                  anio_c = unique(encuesta$anio_c),
                  sample = muestra) %>%
    dplyr::rename(indicator = deficit,
                  value = total,
                  se = total_se,
                  cv = total_cv) %>%
    ungroup() %>%
    dplyr::left_join(data_s3, by = c("pais_c" = "pais", "anio_c" =  "anio")) %>%
    dplyr::mutate(year = anio_c,
                  isoalpha3 = pais_c,
                  idegeo = "country",
                  source = paste0(isoalpha3,"-", nombre),
                  area = "Total",
                  quintile = "Total") %>%
    dplyr::select(iddate, year, idgeo, isoalpha3, source, indicator, area, quintile,  value, se,cv, sample)


  return(out)

}
