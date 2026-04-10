# =============================================================================
# FUNCIONES AUXILIARES PARA ANÁLISIS BAYESIANO
# =============================================================================

#' Calcular OR mínimo detectable para regresión logística
#' 
#' @param n_eventos Número de casos (eventos)
#' @param p_expuestos Proporción de expuestos (default = 0.5)
#' @param alpha Nivel de significancia (default = 0.05)
#' @param power Poder deseado (default = 0.80)
#' @return OR mínimo detectable

calcular_OR_minimo <- function(n_eventos, p_expuestos = 0.5, 
                               alpha = 0.05, power = 0.80) {
  z_alpha <- qnorm(1 - alpha/2)
  z_beta <- qnorm(power)
  delta <- (z_alpha + z_beta) / sqrt(n_eventos * p_expuestos * (1 - p_expuestos))
  return(exp(delta))
}

#' Verificar convergencia del modelo
#' 
#' @param modelo Objeto brms
#' @return Lista con diagnósticos

verificar_convergencia <- function(modelo) {
  rhat_vals <- rhat(modelo)
  ess_vals <- ess_bulk(modelo)
  
  return(list(
    convergido = all(rhat_vals < 1.01),
    rhat_max = max(rhat_vals),
    ess_min = min(ess_vals),
    rhat_tabla = rhat_vals,
    ess_tabla = ess_vals
  ))
}

#' Extraer odds ratios del modelo
#' 
#' @param modelo Objeto brms
#' @return Data frame con OR e intervalos de credibilidad

extraer_odds_ratios <- function(modelo) {
  coef_summary <- summary(modelo)$fixed
  or_df <- data.frame(
    Variable = rownames(coef_summary)[-1],
    OR = exp(coef_summary[-1, "Estimate"]),
    IC_95_Inf = exp(coef_summary[-1, "l-95% CI"]),
    IC_95_Sup = exp(coef_summary[-1, "u-95% CI"])
  )
  return(or_df)
}