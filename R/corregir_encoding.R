#' Correccion manual de encoding
#'
#' Permite corregir manualmente los caracteres especiales en las encuestas de hogares 'Harmonized Surveys'
#'
#'
#' @param x vector
#'
#' @return vector con los caracteres especiales del castellano corregidos
#' @export
#'
#' @examples
#' corregir_encoding(c("AsunciÃ³n", "SaÃ£ Paulo", "TucumÃ¡n"))
#'
corregir_encoding <- function( x ) {
  correccion <- c("Ã³" = "ó", "Ã­" = "í", "Ã¡" = "á", "Ã£" = "õ", "Ã´" = "ô", "Ã±" = "ñ", "Ã©" = "é", "â€™" = "'", "Ãº" = "ú")
  x <- stringr::str_replace_all(x, correccion)

  return(x)
}
