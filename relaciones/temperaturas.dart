// Librería de funciones de temperaturas (Ejercicio 20)
// Son las funciones del ejercicio 11 puestas en un archivo aparte
// para poder reutilizarlas desde cualquier programa con import.

double temperaturaMaxima(List<double> temperaturas) {
  double maxima = temperaturas[0];
  for (double t in temperaturas) {
    if (t > maxima) {
      maxima = t;
    }
  }
  return maxima;
}

double temperaturaMinima(List<double> temperaturas) {
  double minima = temperaturas[0];
  for (double t in temperaturas) {
    if (t < minima) {
      minima = t;
    }
  }
  return minima;
}

double temperaturaMedia(List<double> temperaturas) {
  double suma = 0;
  for (double t in temperaturas) {
    suma += t;
  }
  return suma / temperaturas.length;
}