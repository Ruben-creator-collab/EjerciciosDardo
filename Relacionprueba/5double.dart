void main() {
  double ladoA = 5.0;
  double ladoB = 5.0;
  double ladoC = 8.0;

  // 2. Validación: ¿Es un triángulo válido?
  if ((ladoA + ladoB > ladoC) &&
      (ladoA + ladoC > ladoB) &&
      (ladoB + ladoC > ladoA)) {
    // 3. Clasificación según sus lados
    if (ladoA == ladoB && ladoB == ladoC) {
      print('El triángulo es: Equilátero (todos los lados son iguales).');
    } else if (ladoA == ladoB || ladoA == ladoC || ladoB == ladoC) {
      print('El triángulo es: Isósceles (dos lados son iguales).');
    } else {
      print('El triángulo es: Escaleno (todos los lados son diferentes).');
    }
  } else {
    print('Error: Las medidas proporcionadas no forman un triángulo válido.');
  }
}
