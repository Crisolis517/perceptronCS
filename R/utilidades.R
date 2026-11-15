#' Normalizacion min-max
#' @param x vector, matriz o data.frame numerico.
normalizar_minmax <- function(x) {
  f <- function(v) (v - min(v)) / (max(v) - min(v))
  if (is.null(dim(x))) f(x) else as.data.frame(lapply(as.data.frame(x), f))
}

#' Matriz de confusion
#' @param real valores reales.
#' @param predicho valores predichos.
matriz_confusion <- function(real, predicho) table(Real = real, Predicho = predicho)

#' Exactitud
#' @param real valores reales.
#' @param predicho valores predichos.
exactitud <- function(real, predicho) mean(real == predicho)

#' Grafica la frontera de decision de un perceptron con dos variables
#' @param modelo objeto perceptron entrenado con 2 variables.
#' @param X datos (2 columnas).
#' @param y clase (0/1).
#' @param ... argumentos graficos.
frontera_decision <- function(modelo, X, y, ...) {
  X <- as.matrix(X)
  if (ncol(X) != 2) stop("La frontera solo se grafica con 2 variables")
  plot(X[, 1], X[, 2], col = ifelse(y == 1, "#2E7D32", "#C62828"), pch = 19,
       xlab = colnames(X)[1], ylab = colnames(X)[2], main = "Frontera de decision", ...)
  w <- modelo$pesos
  abline(a = -modelo$sesgo / w[2], b = -w[1] / w[2], lty = 2, lwd = 2)
  legend("topright", legend = c("Clase 1", "Clase 0", "Frontera"), col = c("#2E7D32", "#C62828", "black"),
         pch = c(19, 19, NA), lty = c(NA, NA, 2), bty = "n")
}
