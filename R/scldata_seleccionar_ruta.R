#' Generador de rutas dentro de SCLDATA
#'
#' La funcion genera una lista con las rutas de scldata para descargar las encuestas armonizadas de hogares.
#' Se puede configurar para un anio, un lapso de anios o un pais en particular
#'
#' @param inicio define el anio inicial, por defecto el valor es NA
#' @param final define el anio final, por defecto es el mismo valor que inicio
#' @param pais define el pais, por defecto es 'GRAL' es decir todos los paises
#'
#' @return lista con las rutas para descargar los dataset
#' @export
#'
#' @import dplyr magrittr
#'

scldata_seleccionar_ruta <- function(x, inicio = NA, final = inicio, isoalpha3 = "GRAL") {

  if(is.na(inicio) & is.na(final) & isoalpha3 == "GRAL") {
    lista_descarga <- x$ruta
  }

  else if(!is.na(inicio) & final == inicio & isoalpha3 == "GRAL") {
    rutas_filtradas <- x %>%
      dplyr::filter(anio == inicio)
    lista_descarga <- rutas_filtradas$ruta

  }

  else if(!is.na(inicio) & is.na(final) & isoalpha3 == "GRAL") {
    rutas_filtradas <- x %>%
      dplyr::filter(anio == inicio)
    lista_descarga <- rutas_filtradas$ruta

  }


  else if(is.na(inicio) & !is.na(final) & isoalpha3 == "GRAL") {
    rutas_filtradas <- x %>%
      dplyr::filter(anio == final)
    lista_descarga <- rutas_filtradas$ruta

  }

  else if(!is.na(inicio) & final != inicio & isoalpha3 == "GRAL"){
    rutas_filtradas <- x %>%
      dplyr::filter(anio >= inicio & anio <= final)
    lista_descarga <- rutas_filtradas$ruta
  }


  else if(is.na(inicio) & is.na(final) & isoalpha3 != "GRAL") {
    rutas_filtradas <- x %>%
      dplyr::filter(pais == isoalpha3)
    lista_descarga <- rutas_filtradas$ruta

  }


  else if(!is.na(inicio) & final == inicio & isoalpha3 != "GRAL") {
    rutas_filtradas <- x %>%
      dplyr::filter(anio == inicio & pais == isoalpha3)
    lista_descarga <- rutas_filtradas$ruta

  }

  else if(!is.na(inicio) & is.na(final) & isoalpha3!= "GRAL") {
    rutas_filtradas <- x %>%
      dplyr::filter(anio == inicio & pais == isoalpha3)
    lista_descarga <- rutas_filtradas$ruta

  }


  else if(is.na(inicio) & !is.na(final) & isoalpha3 != "GRAL") {
    rutas_filtradas <- x %>%
      dplyr::filter(anio == final & pais == isoalpha3)
    lista_descarga <- rutas_filtradas$ruta

  }

  else if(!is.na(inicio) & final != inicio & isoalpha3 != "GRAL"){
    rutas_filtradas <- x %>%
      dplyr::filter(anio >= inicio & anio <= final & pais == isoalpha3)
    lista_descarga <- rutas_filtradas$ruta
  }



  else {
    stop('Faltan argumentos')
  }

  return(lista_descarga)
}
