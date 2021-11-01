#' Generador de rutas dentro de SCLDATA
#'
#' La funcion genera una lista con las rutas de scldata para descargar las encuestas armonizadas de hogares.
#' Se puede configurar para un anio o un pais en particular
#'
#' @param anio define el anio, por defecto: todos los anios
#' @param pais define el pais, por defecto: todos los paises
#'
#' @return lista con las rutas para descargar los dataset
#' @export
#'
#' @import dplyr magrittr
#'
generar_ruta_eh_scldata <- function(anio = NA, pais = "GRAL") {

  scldatalake = 's3://scldata.iadb.org/'
  harmonized_surveys = "Household Socio-Economic Surveys/Harmonized Household Surveys/"

  rutas <- metadata_encuesta %>%
    mutate(path = paste0(scldatalake, harmonized_surveys,  isoalpha3, "/",name, "/data_arm/", archivo ))

  if(is.na(anio) & pais == "GRAL") {
    lista_descarga <- rutas$path
  }

  else if(!is.na(anio) & pais == "GRAL") {
    rutas_filtradas <- rutas %>%
      filter(year == anio)
    lista_descarga <- rutas_filtradas$path

  }

  else if(is.na(anio) & pais != "GRAL") {
    rutas_filtradas <- rutas %>%
      filter(isoalpha3 == pais)
    lista_descarga <- rutas_filtradas$path

  }

  else if(!is.na(anio) & pais != "GRAL"){
    rutas_filtradas <- rutas %>%
      filter(year == anio & isoalpha3 == pais)
    lista_descarga <- rutas_filtradas$path
  }

  else {
    stop('Faltan argumentos')
  }

  return(lista_descarga)
}
