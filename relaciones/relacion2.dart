// Relación de ejercicios de Dart (II) - Ejercicios con funciones
// Programación multimedia y de dispositivos móviles - IES Playamar
//
// Cada ejercicio está en su propia función ejercicioN() y el main()
// las llama todas en orden. El ejercicio 20 está en ejercicio20.dart
// (usa la librería temperaturas.dart).

void main() {
  ejercicio1();
  ejercicio2();
  ejercicio3();
  ejercicio4();
  ejercicio5();
  ejercicio6();
  ejercicio7();
  ejercicio8();
  ejercicio9();
  ejercicio10();
  ejercicio11();
  ejercicio12();
  ejercicio13();
  ejercicio14();
  ejercicio15();
  ejercicio16();
  ejercicio17();
  ejercicio18();
  ejercicio19();
}

// ---------------------------------------------------------------
// EJERCICIO 1: función sin parámetros ni valor devuelto
// ---------------------------------------------------------------
void mostrarFechaHora() {
  print('Fecha y hora actuales: ${DateTime.now()}');
}

void ejercicio1() {
  print('--- Ejercicio 1 ---');
  mostrarFechaHora();
}

// ---------------------------------------------------------------
// EJERCICIO 2: función con un parámetro (horas hacia delante o atrás)
// ---------------------------------------------------------------
void mostrarFechaHoraDesplazada(int horas) {
  // add suma una Duration a la fecha. Si horas es negativo, resta.
  DateTime resultado = DateTime.now().add(Duration(hours: horas));
  print('Dentro de $horas horas: $resultado');
}

void ejercicio2() {
  print('--- Ejercicio 2 ---');
  mostrarFechaHoraDesplazada(5); // 5 horas hacia delante
  mostrarFechaHoraDesplazada(-3); // 3 horas hacia atrás

  // Para experimentar: otros métodos de DateTime
  DateTime ahora = DateTime.now();
  print('Hace 3 horas (subtract): ${ahora.subtract(Duration(hours: 3))}');
  print('Año: ${ahora.year}, mes: ${ahora.month}, día: ${ahora.day}');
  print('Día de la semana (1 = lunes): ${ahora.weekday}');
}

// ---------------------------------------------------------------
// EJERCICIO 3: parámetros opcionales (con nombre) y valores por defecto
// ---------------------------------------------------------------
void mostrarEmpleado({String nombre = 'desconocido', int id = 999}) {
  print('Empleado: $nombre, id: $id');
}

void ejercicio3() {
  print('--- Ejercicio 3 ---');
  mostrarEmpleado(nombre: 'Ana', id: 12); // se saben los dos
  mostrarEmpleado(nombre: 'Luis'); // no se sabe el id
  mostrarEmpleado(id: 45); // no se sabe el nombre
  mostrarEmpleado(); // no se sabe nada
}

// ---------------------------------------------------------------
// EJERCICIO 4: parámetro posicional opcional y nullable
// ---------------------------------------------------------------
void mostrarNombreCompleto(String nombre, [String? apellidos]) {
  if (apellidos == null) {
    print('Empleado: $nombre (sin apellidos)');
  } else {
    print('Empleado: $nombre $apellidos');
  }
}

void ejercicio4() {
  print('--- Ejercicio 4 ---');
  mostrarNombreCompleto('Ana', 'García López');
  mostrarNombreCompleto('Luis');
}

// ---------------------------------------------------------------
// EJERCICIO 5: la función devuelve la fecha y hora
// ---------------------------------------------------------------
DateTime calcularFechaHora(int horas) {
  return DateTime.now().add(Duration(hours: horas));
}

void ejercicio5() {
  print('--- Ejercicio 5 ---');
  DateTime fecha = calcularFechaHora(8);
  print('Dentro de 8 horas será: $fecha');
}

// ---------------------------------------------------------------
// EJERCICIO 6: suma de los n primeros números naturales
// ---------------------------------------------------------------
int sumaNaturales(int n) {
  int suma = 0;
  for (int i = 1; i <= n; i++) {
    suma += i;
  }
  return suma;
}

void ejercicio6() {
  print('--- Ejercicio 6 ---');
  int n = 10;
  print('La suma de los $n primeros números es ${sumaNaturales(n)}');
}

// ---------------------------------------------------------------
// EJERCICIO 7: factorial de n
// ---------------------------------------------------------------
int factorial(int n) {
  int resultado = 1;
  for (int i = 2; i <= n; i++) {
    resultado *= i;
  }
  return resultado;
}

void ejercicio7() {
  print('--- Ejercicio 7 ---');
  int n = 5;
  print('El factorial de $n es ${factorial(n)}');
}

// ---------------------------------------------------------------
// EJERCICIO 8: MCD con el algoritmo de Euclides
// ---------------------------------------------------------------
// Se divide a entre b y nos quedamos con el resto. Después, b pasa a
// ser a y el resto pasa a ser b. Se repite hasta que el resto es 0:
// el último valor de a es el MCD.
int mcd(int a, int b) {
  while (b != 0) {
    int resto = a % b;
    a = b;
    b = resto;
  }
  return a;
}

void ejercicio8() {
  print('--- Ejercicio 8 ---');
  int a = 48;
  int b = 18;
  print('El MCD de $a y $b es ${mcd(a, b)}');
}

// ---------------------------------------------------------------
// EJERCICIO 9: cociente y resto por restas sucesivas
// ---------------------------------------------------------------
// Dividir es restar el divisor al dividendo tantas veces como se pueda.
// Las veces que se ha restado es el cociente y lo que sobra es el resto.
int cociente(int dividendo, int divisor) {
  int veces = 0;
  while (dividendo >= divisor) {
    dividendo -= divisor;
    veces++;
  }
  return veces;
}

int resto(int dividendo, int divisor) {
  while (dividendo >= divisor) {
    dividendo -= divisor;
  }
  return dividendo;
}

void ejercicio9() {
  print('--- Ejercicio 9 ---');
  int a = 47;
  int b = 5;
  print('$a / $b -> cociente ${cociente(a, b)}, resto ${resto(a, b)}');

  // Pregunta 1: ¿qué estructura permitiría devolver dos valores a la vez?
  // Respuesta: una List (ej. [cociente, resto]), un Map
  // (ej. {'cociente': 9, 'resto': 2}) o, en Dart 3, un record
  // (ej. (int, int)).
  //
  // Pregunta 2: ¿por qué no es recomendable?
  // Respuesta: porque se rompe el principio SRP (Single Responsibility
  // Principle, o principio de responsabilidad única): cada función debe
  // hacer una sola cosa. Una función que calcula cociente y resto hace
  // dos cosas, es más difícil de entender, de probar y de reutilizar.
}

// ---------------------------------------------------------------
// EJERCICIO 10: conversión a binario (y a otras bases)
// ---------------------------------------------------------------
// base vale 2 por defecto. Se divide el número entre la base y se van
// guardando los restos; los restos leídos al revés son el resultado.
String convertirBase(int numero, [int base = 2]) {
  if (numero == 0) {
    return '0';
  }
  // Dígitos posibles. Al incluir las letras A-F, la función ya
  // serviría también para la base 16.
  String digitos = '0123456789ABCDEF';
  String resultado = '';
  while (numero > 0) {
    int resto = numero % base;
    resultado = digitos[resto] + resultado; // se añade por la izquierda
    numero = numero ~/ base;
  }
  return resultado;
}

void ejercicio10() {
  print('--- Ejercicio 10 ---');
  int numero = 37;
  print('$numero en binario: ${convertirBase(numero)}');
  print('$numero en base 8: ${convertirBase(numero, 8)}');
  print('$numero en base 5: ${convertirBase(numero, 5)}');
  print('$numero en base 16: ${convertirBase(numero, 16)}');

  // Pregunta: ¿qué habría que añadir para convertir a base 16?
  // Respuesta: a partir de base 11 los restos pueden ser 10, 11... 15 y
  // no se pueden escribir con un solo dígito. Hay que representarlos con
  // letras (10 = A, 11 = B, ... 15 = F). Por eso usamos el String
  // 'digitos', donde la posición del resto nos da el carácter correcto.
}

// ---------------------------------------------------------------
// EJERCICIO 11: máxima, mínima y media de una lista de temperaturas
// ---------------------------------------------------------------
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

void ejercicio11() {
  print('--- Ejercicio 11 ---');
  List<double> temperaturas = [21.5, 24.0, 19.8, 26.3, 23.1, 22.4, 18.9];
  print('Máxima: ${temperaturaMaxima(temperaturas)}');
  print('Mínima: ${temperaturaMinima(temperaturas)}');
  print('Media: ${temperaturaMedia(temperaturas).toStringAsFixed(2)}');

  // Pregunta: los valores de máxima y mínima pierden el día en que
  // ocurrieron. ¿Cómo se soluciona?
  // Opciones:
  //  1) Devolver la posición (índice) en la lista en vez del valor; el
  //     índice indica el día y con él se saca la temperatura.
  //  2) Devolver un Map con el día y la temperatura.
  //  3) Devolver una List o un record con las dos cosas (día, valor).
  //  4) Crear una clase pequeña (por ejemplo Registro) con día y valor.
}

// ---------------------------------------------------------------
// EJERCICIO 12: lo mismo con un Map (día -> temperatura)
// ---------------------------------------------------------------
// Aquí las funciones no devuelven nada: muestran el resultado ellas.
void mostrarMaximaMap(Map<String, double> temperaturas) {
  String diaMaxima = '';
  double maxima = -1000;
  temperaturas.forEach((dia, temperatura) {
    if (temperatura > maxima) {
      maxima = temperatura;
      diaMaxima = dia;
    }
  });
  print('Máxima: $maxima el $diaMaxima');
}

void mostrarMinimaMap(Map<String, double> temperaturas) {
  String diaMinima = '';
  double minima = 1000;
  temperaturas.forEach((dia, temperatura) {
    if (temperatura < minima) {
      minima = temperatura;
      diaMinima = dia;
    }
  });
  print('Mínima: $minima el $diaMinima');
}

void mostrarMediaMap(Map<String, double> temperaturas) {
  double suma = 0;
  temperaturas.forEach((dia, temperatura) {
    suma += temperatura;
  });
  double media = suma / temperaturas.length;
  print('Media: ${media.toStringAsFixed(2)}');
}

void ejercicio12() {
  print('--- Ejercicio 12 ---');
  Map<String, double> temperaturas = {
    'Lunes': 21.5,
    'Martes': 24.0,
    'Miércoles': 19.8,
    'Jueves': 26.3,
    'Viernes': 23.1,
    'Sábado': 22.4,
    'Domingo': 18.9,
  };
  mostrarMaximaMap(temperaturas);
  mostrarMinimaMap(temperaturas);
  mostrarMediaMap(temperaturas);
}

// ---------------------------------------------------------------
// EJERCICIO 13: número primo
// ---------------------------------------------------------------
// Un número es primo si solo es divisible por 1 y por sí mismo.
// Basta buscar divisores desde 2 hasta la raíz cuadrada (i * i <= n).
bool esPrimo(int n) {
  if (n < 2) {
    return false;
  }
  for (int i = 2; i * i <= n; i++) {
    if (n % i == 0) {
      return false; // ha encontrado un divisor
    }
  }
  return true;
}

void ejercicio13() {
  print('--- Ejercicio 13 ---');
  int n = 29;
  if (esPrimo(n)) {
    print('$n es primo');
  } else {
    print('$n no es primo');
  }
  n = 30;
  print('$n es primo: ${esPrimo(n)}');
}

// ---------------------------------------------------------------
// EJERCICIO 14: suma de los n primeros números (recursiva)
// ---------------------------------------------------------------
// Caso base: la suma de los 0 primeros es 0.
// Caso recursivo: suma(n) = n + suma(n - 1)
int sumaRecursiva(int n) {
  if (n == 0) {
    return 0;
  }
  return n + sumaRecursiva(n - 1);
}

void ejercicio14() {
  print('--- Ejercicio 14 ---');
  int n = 10;
  print('La suma de los $n primeros números es ${sumaRecursiva(n)}');
}

// ---------------------------------------------------------------
// EJERCICIO 15: factorial (recursivo)
// ---------------------------------------------------------------
// Caso base: factorial(0) = 1 (y factorial(1) = 1)
// Caso recursivo: factorial(n) = n * factorial(n - 1)
int factorialRecursivo(int n) {
  if (n <= 1) {
    return 1;
  }
  return n * factorialRecursivo(n - 1);
}

void ejercicio15() {
  print('--- Ejercicio 15 ---');
  int n = 5;
  print('El factorial de $n es ${factorialRecursivo(n)}');
}

// ---------------------------------------------------------------
// EJERCICIO 16: MCD (recursivo)
// ---------------------------------------------------------------
// Caso base: si b es 0, el MCD es a.
// Caso recursivo: mcd(a, b) = mcd(b, a % b)
int mcdRecursivo(int a, int b) {
  if (b == 0) {
    return a;
  }
  return mcdRecursivo(b, a % b);
}

void ejercicio16() {
  print('--- Ejercicio 16 ---');
  int a = 48;
  int b = 18;
  print('El MCD de $a y $b es ${mcdRecursivo(a, b)}');
}

// ---------------------------------------------------------------
// EJERCICIO 17: cociente y resto (recursivos)
// ---------------------------------------------------------------
// Caso base: si el dividendo es menor que el divisor, ya no se puede
// restar más: cociente 0 y el resto es el propio dividendo.
// Caso recursivo: se resta una vez el divisor y se cuenta 1 más.
int cocienteRecursivo(int dividendo, int divisor) {
  if (dividendo < divisor) {
    return 0;
  }
  return 1 + cocienteRecursivo(dividendo - divisor, divisor);
}

int restoRecursivo(int dividendo, int divisor) {
  if (dividendo < divisor) {
    return dividendo;
  }
  return restoRecursivo(dividendo - divisor, divisor);
}

void ejercicio17() {
  print('--- Ejercicio 17 ---');
  int a = 47;
  int b = 5;
  print('$a / $b -> cociente ${cocienteRecursivo(a, b)}, '
      'resto ${restoRecursivo(a, b)}');
}

// ---------------------------------------------------------------
// EJERCICIO 18: serie de Fibonacci hasta el término n
// ---------------------------------------------------------------
// La serie empieza 0, 1 y cada término es la suma de los dos anteriores.
List<int> fibonacci(int n) {
  List<int> serie = [];
  for (int i = 0; i < n; i++) {
    if (i == 0) {
      serie.add(0);
    } else if (i == 1) {
      serie.add(1);
    } else {
      serie.add(serie[i - 1] + serie[i - 2]);
    }
  }
  return serie;
}

void ejercicio18() {
  print('--- Ejercicio 18 ---');
  int n = 10;
  List<int> serie = fibonacci(n);
  print('Los $n primeros términos de Fibonacci: $serie');
}

// ---------------------------------------------------------------
// EJERCICIO 19: números primos entre 1 y n (reutiliza esPrimo)
// ---------------------------------------------------------------
List<int> primosHasta(int n) {
  List<int> primos = [];
  for (int i = 1; i <= n; i++) {
    if (esPrimo(i)) {
      primos.add(i);
    }
  }
  return primos;
}

void ejercicio19() {
  print('--- Ejercicio 19 ---');
  int n = 50;
  List<int> primos = primosHasta(n);
  print('Primos entre 1 y $n: $primos');
}
