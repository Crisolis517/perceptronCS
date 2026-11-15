# perceptronCS

Paquete de R con una implementación **desde cero del perceptrón simple** y utilidades para entrenar, predecir, graficar la frontera de decisión y evaluar el modelo. Desarrollado para la asignatura *Redes Neuronales y Deep Learning* — Maestría en Estadística, mención Ciencia de Datos e IA (ESPOCH).

Autor: **Cristian Solís**

## Instalación

```r
install.packages("remotes")
remotes::install_github("Crisolis517/perceptronCS")
```

## Funciones

| Función | Descripción |
|---|---|
| `perceptron_simple()` | Entrena el perceptrón (regla de Rosenblatt) |
| `predict()` | Predice la clase 0/1 de nuevos datos |
| `plot()` | Gráfico de errores por época |
| `frontera_decision()` | Gráfico de la frontera de decisión (2 variables) |
| `normalizar_minmax()` | Normalización al rango [0, 1] |
| `matriz_confusion()`, `exactitud()` | Evaluación del modelo |

## Ejemplo

```r
library(perceptronCS)
X <- matrix(c(0,0,1,1, 0,1,0,1), ncol = 2, dimnames = list(NULL, c("x1","x2")))
modelo <- perceptron_simple(X, c(0,0,0,1), eta = 0.1, semilla = 1, verbose = TRUE)
predict(modelo, X)   # 0 0 0 1
```

Licencia MIT.
