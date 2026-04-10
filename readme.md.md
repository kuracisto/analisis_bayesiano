# Análisis Bayesiano de Trastornos Musculoesqueléticos en Trabajadores Portuarios

## Descripción

Este repositorio contiene el código R para el análisis bayesiano de factores de riesgo de trastornos musculoesqueléticos (TME) en trabajadores portuarios de Costa Rica.

El análisis incluye:
- Modelos jerárquicos con prior Horseshoe
- Análisis de sensibilidad de hiperparámetros
- Validación cruzada LOO para comparación de modelos
- Diagnósticos de convergencia (rank plots, R-hat, ESS)
- Análisis de poder post-hoc
- Verificación de casos atípicos

## Requisitos

- R version 4.5.2 o superior
- Paquetes: brms, tidyverse, loo, bayesplot, posterior, flextable, officer, pwr, WebPower

## Instalación

```r
install.packages(c("brms", "tidyverse", "loo", "bayesplot", 
                   "posterior", "flextable", "officer", "pwr", "WebPower"))