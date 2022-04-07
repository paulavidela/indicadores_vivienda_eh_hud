
<h1 align="center"> Librería para la generación de indicadores de vivienda</h1>
<p align="center"> Una herramienta para el preprocesamiento de encuestas armonizadas de hogares y para la generación de indicadores de vivienda</p>


## Tabla de contenidos:
---


- [Descripción y contexto](#descripción-y-contexto)
- [Guía de usuario](#guía-de-usuario)
- [Guía de instalación](#guía-de-instalación)
- [Cómo contribuir](#cómo-contribuir)
- [Autor/es](#autores)



[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=EL-BID_guia-de-publicacion&metric=alert_status)](https://sonarcloud.io/dashboard?id=EL-BID_guia-de-publicacion)


## Descripción y contexto
---
Este repositorio permite el preprocesamiento y la generación de indicadores de vivienda a partir de las encuestas de hogares disponibles en SCLDATA. Las variables que utiliza esta librería están basadas en las variables armonizadas en dichas encuestas. 
El objetivo de este repositorio es simplificar el preprocesamiento de las encuestas para la generación de los indicadores de vivienda (déficit cuantitativo, déficit cualitativo y sin déficit). 


## Guía de usuario
---
Esta herramienta consiste en una librería de R. Para utilizar esta herramienta, es necesario instalar la librería IndicadoresHUD. Siguiendo el proceso de generación de esta herramienta, es posible determinar nuevos indicadores dentro de la librería. El preprocesamiento también implica una reducción del dataset original para aliviar su peso.
 	

## Guía de instalación
---
Para utilizar la herramienta es necesario instalar el lenguaje de programación R. Los paquetes (o librerías) que se utilizan en esta herramienta se instalan directamente al instalar la librería. 
Esta herramienta no tiene requisitos de sistema operativo: puede utilizarse en Linux, Windows y Mac. No requiere versiones específicas de las librerías, pero se sugiere tenerlas actualizadas. 



### Dependencias
Este repositorio utiliza las siguientes librerías: 'dplyr', 'magrittr', 'haven', 'methods', 'stringr', 'aws.s3', 'Rcpp', 'tidyr', 'srvyr'. Además, es necesario contar con credenciales de acceso para acceder al datalake de SCLDATA en caso de querer utilizar la librería sobre las encuestas de hogares armonizadas. 



## Cómo contribuir
---
Para contribuir con este repositorio se puede enviar una solicitud de adhesión de nuevo código (“pull requests”). Para declarar fallos en la herramienta pueden incorporarse issues a este repositorio. Se sugiere comentar las líneas de código para mayor comprensión de los pasos. Es importante asegurarse que los cambios, el código, y todas las ideas/implementaciones no presentan conflictos de propiedad intelectual.  



## Autor/es
---
Los autores originales de este repositorio son Paula Videla, Antonio Vázquez Brust y Roberto Sanchez Avalos



## Limitación de responsabilidades
Disclaimer: Esta sección es solo para herramientas financiadas por el BID.

El BID no será responsable, bajo circunstancia alguna, de daño ni indemnización, moral o patrimonial; directo o indirecto; accesorio o especial; o por vía de consecuencia, previsto o imprevisto, que pudiese surgir:

i. Bajo cualquier teoría de responsabilidad, ya sea por contrato, infracción de derechos de propiedad intelectual, negligencia o bajo cualquier otra teoría; y/o

ii. A raíz del uso de la Herramienta Digital, incluyendo, pero sin limitación de potenciales defectos en la Herramienta Digital, o la pérdida o inexactitud de los datos de cualquier tipo. Lo anterior incluye los gastos o daños asociados a fallas de comunicación y/o fallas de funcionamiento de computadoras, vinculados con la utilización de la Herramienta Digital.
