% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calcular_tipo_vivienda.R
\name{calcular_tipo_vivienda}
\alias{calcular_tipo_vivienda}
\title{Tipo de vivienda}
\usage{
calcular_tipo_vivienda(x)
}
\arguments{
\item{x}{dataset de encuesta de hogares armonizada}
}
\value{
dataset con el indicador 'tv' generadoç
}
\description{
A partir de esta funcion se genera la variable 'tv':
identifica el tipo vivienda donde reside el hogar
}
\details{
Si el tipo de vivienda es adecuado, entonces 'tv' toma valor 1.
Si el tipo de vivienda es inadecuado, entonces 'tv' toma valor 0.

En caso de que no haya datos suficientes, 'tv' no toma ningún valor, es decir es NA.
}
