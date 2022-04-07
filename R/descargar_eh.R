#' Descarga de dataset desde un AWS bucket
#'
#' El dataset en AWS debe ser un archivo dta
#'
#' @param path ruta a la encuesta de hogares armonizada
#'
#' @return dataset raw descargado desde aws como tabla
#' @export
#'
#' @import dplyr aws.s3 haven
descargar_eh <- function(path) {

  dataset <- aws.s3::s3read_using(FUN = haven::read_dta,
                                  object = path) %>%
    dplyr::as_tibble()


}
