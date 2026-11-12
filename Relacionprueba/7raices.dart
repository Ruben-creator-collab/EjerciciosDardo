//7- Haz el programa que resuelva las raíces de una ecuación de segundo grado (ax2 + bx + c = 0) a partir de los valores de los coeficientes a, b y c (double). Si las raíces no fueranreales, debe mostrar un mensaje que así lo indique.


void main() {
  double a = 1.0; // Coeficiente a
  double b = -3.0; // Coeficiente b
  double c = 2.0; // Coeficiente c

  double discriminante = b * b - 4 * a * c;

  if (discriminante > 0) {
    double raiz1 = (-b + discriminante.sqrt()) / (2 * a);
    double raiz2 = (-b - discriminante.sqrt()) / (2 * a);
    print("Las raíces son reales y diferentes:");
    print("Raíz 1: $raiz1");
    print("Raíz 2: $raiz2");
  } else if (discriminante == 0) {
    double raiz = -b / (2 * a);
    print("Las raíces son reales e iguales:");
    print("Raíz: $raiz");
  } else {
    print("Las raíces no son reales.");
  }
}