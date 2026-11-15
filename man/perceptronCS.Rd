\name{perceptronCS}
\alias{perceptronCS}
\alias{perceptron_simple}
\alias{predict.perceptron}
\alias{print.perceptron}
\alias{plot.perceptron}
\alias{normalizar_minmax}
\alias{matriz_confusion}
\alias{exactitud}
\alias{frontera_decision}
\title{Perceptron simple y utilidades}
\description{
Entrena un perceptron simple de Rosenblatt (\code{perceptron_simple}), predice
(\code{predict}), grafica los errores por epoca (\code{plot}) y la frontera de
decision (\code{frontera_decision}), y evalua el modelo (\code{matriz_confusion},
\code{exactitud}). Incluye normalizacion min-max (\code{normalizar_minmax}).
}
\usage{
perceptron_simple(X, y, eta = 0.1, epocas = 100, semilla = NULL, verbose = FALSE)
\method{predict}{perceptron}(object, newdata, ...)
\method{print}{perceptron}(x, ...)
\method{plot}{perceptron}(x, ...)
normalizar_minmax(x)
matriz_confusion(real, predicho)
exactitud(real, predicho)
frontera_decision(modelo, X, y, ...)
}
\arguments{
\item{X}{matriz o data.frame de predictores numericos.}
\item{y}{vector binario 0/1.}
\item{eta}{tasa de aprendizaje.}
\item{epocas}{numero maximo de epocas.}
\item{semilla}{semilla aleatoria.}
\item{verbose}{si TRUE imprime los errores por epoca.}
\item{object, x, modelo}{objeto de clase perceptron.}
\item{newdata}{nuevos datos.}
\item{real, predicho}{vectores de clases reales y predichas.}
\item{...}{argumentos adicionales.}
}
\value{\code{perceptron_simple} devuelve una lista de clase \code{perceptron} con pesos, sesgo e historial.}
\author{Cristian Solis}
\examples{
X <- matrix(c(0,0,1,1, 0,1,0,1), ncol = 2, dimnames = list(NULL, c("x1","x2")))
m <- perceptron_simple(X, c(0,0,0,1), semilla = 1)
predict(m, X)
}
