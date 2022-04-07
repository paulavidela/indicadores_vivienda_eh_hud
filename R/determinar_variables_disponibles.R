#' Preprocesamiento de las encuestas de hogares
#'
#' Verifica las variables disponibles para el cálculo de métricas de calidad en la encuesta harmonizada
#'
#' @param x dataframe de encuesta de hogares armonizada
#'
#' @return un número entre 1 y 3 que determina las variables a utilizar para las métricas de calidad
#' @export
#'

determinar_variables_disponibles <- function(x) {

  if(all(c("upm_ci", "factor_ch", "estrato_ci") %in% names(x)) == TRUE &
     all(!is.na( x$upm_ci)) == TRUE &
     all(!is.na( x$factor_ch)) == TRUE &
     all(!is.na( x$estrato_ci)) == TRUE
  ) {

    tipo <- 3

  } else if(all(c("upm_ci", "factor_ch") %in% names(x)) == TRUE &
            all(!is.na( x$upm_ci)) == TRUE &
            all(!is.na( x$factor_ch)) == TRUE ) {

    tipo <- 2

  } else (

    tipo <- 1
  )

  return(tipo)

}
