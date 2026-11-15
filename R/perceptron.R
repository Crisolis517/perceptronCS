#' Entrena un perceptron simple
#'
#' @param X matriz o data.frame de predictores numericos.
#' @param y vector binario (0/1).
#' @param eta tasa de aprendizaje.
#' @param epocas numero maximo de epocas.
#' @param semilla semilla aleatoria para los pesos iniciales.
#' @param verbose si TRUE imprime los errores por epoca.
#' @return objeto de clase "perceptron".
perceptron_simple <- function(X, y, eta = 0.1, epocas = 100, semilla = NULL, verbose = FALSE) {
  X <- as.matrix(X); y <- as.numeric(y)
  if (!all(y %in% c(0, 1))) stop("y debe ser binaria (0/1)")
  if (!is.null(semilla)) set.seed(semilla)
  w <- runif(ncol(X), -0.5, 0.5); b <- runif(1, -0.5, 0.5)
  historial <- data.frame(epoca = integer(), errores = integer())
  for (ep in seq_len(epocas)) {
    errores <- 0
    for (i in seq_len(nrow(X))) {
      e <- y[i] - as.numeric(sum(w * X[i, ]) + b >= 0)
      w <- w + eta * e * X[i, ]
      b <- b + eta * e
      errores <- errores + (e != 0)
    }
    historial <- rbind(historial, data.frame(epoca = ep, errores = errores))
    if (verbose) cat(sprintf("Epoca %3d | errores = %d\n", ep, errores))
    if (errores == 0) break
  }
  names(w) <- colnames(X)
  structure(list(pesos = w, sesgo = b, historial = historial, eta = eta,
                 convergio = historial$errores[nrow(historial)] == 0, variables = colnames(X)),
            class = "perceptron")
}

#' Prediccion con un perceptron
#' @param object modelo de clase perceptron.
#' @param newdata nuevos datos.
#' @param ... no usado.
predict.perceptron <- function(object, newdata, ...) {
  X <- as.matrix(newdata)
  as.numeric(X %*% object$pesos + object$sesgo >= 0)
}


print.perceptron <- function(x, ...) {
  cat("Perceptron simple (paquete perceptronCS)\n")
  cat("Pesos:", paste(names(x$pesos), round(x$pesos, 4), sep = " = ", collapse = "; "), "\n")
  cat("Sesgo:", round(x$sesgo, 4), "\n")
  cat("Epocas:", nrow(x$historial), "| Convergio:", x$convergio, "\n")
  invisible(x)
}

#' Grafica de errores por epoca
#' @param x modelo de clase perceptron.
#' @param ... argumentos graficos.
plot.perceptron <- function(x, ...) {
  plot(x$historial$epoca, x$historial$errores, type = "b", pch = 19, col = "#1F3A5F",
       xlab = "Epoca", ylab = "Errores", main = "Errores por epoca", ...)
}
