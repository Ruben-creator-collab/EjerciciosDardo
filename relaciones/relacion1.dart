// Ejercicios de Dart (I) - Soluciones sencillas
// Ejecutar con:  dart run ejercicios_dart.dart
// En main() quita el // del ejercicio que quieras probar.

import 'dart:io';
import 'dart:math';

void main() {
  ejercicio1();
  ejercicio2();
  ejercicio3();
  ejercicio4();
  ejercicio5();
  // ejercicio6(); // pide datos por consola
  ejercicio7();
  // ejercicio8(); // pide datos por consola
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
  ejercicio20();
}

// ---------------------------------------------------------------
void ejercicio1() {
  print('--- Ejercicio 1 ---');
  print('Hola mundo');

  int numero = 1;
  String nombre = 'Ana'; // pon tu nombre

  print(numero + 5); // operación con el int
  print(nombre + ' García'); // operación con el String
  print('Hola $nombre, tu número es $numero'); // interpolación

  // Esto es un comentario de una línea
  /* Esto es un
     comentario de varias líneas */
  /// Esto es un comentario de documentación
}

// ---------------------------------------------------------------
void ejercicio2() {
  print('--- Ejercicio 2 ---');
  int entero = 10;
  double decimal = 3.14;
  String texto = 'Hola';
  bool verdadero = true;
  dynamic cualquiera = 5; // dynamic puede cambiar de tipo
  cualquiera = 'ahora soy texto';

  List<int> lista = [1, 2, 3];
  Map<String, int> mapa = {'Ana': 20, 'Luis': 25};
  Set<int> conjunto = {1, 2, 2, 3}; // no admite repetidos
  (String, int) registro = ('Pepe', 30); // record

  print(entero);
  print(decimal);
  print(texto);
  print(verdadero);
  print(cualquiera);
  print(lista);
  print(mapa);
  print(conjunto); // {1, 2, 3}
  print(registro);
  print(registro.$1); // primer campo del record

  // Operadores
  print(entero + 2); // int: + - * / ~/ %
  print(texto + ' mundo'); // String: + y *
  print(texto * 3);
  print(verdadero && false); // bool: && || !

  // Parseo (convertir texto a número)
  int a = int.parse('42');
  double b = double.parse('2.5');
  int? c = int.tryParse('hola'); // devuelve null si falla
  print('$a $b $c');
}

// ---------------------------------------------------------------
void ejercicio3() {
  print('--- Ejercicio 3 ---');
  const double pi = 3.1416;
  print(pi);

  bool esBisiesto = true;
  final int diasDelAnyo = esBisiesto ? 366 : 365;
  print(diasDelAnyo);

  // Con const daría ERROR, porque const necesita un valor conocido
  // al COMPILAR, y esBisiesto es una variable normal (se sabe al ejecutar):
  // const int dias = esBisiesto ? 366 : 365;  // ERROR
  // Solo funcionaría si esBisiesto también fuese const.
}

// ---------------------------------------------------------------
void ejercicio4() {
  print('--- Ejercicio 4 ---');
  String? nombre; // el ? permite que valga null
  print(nombre); // null

  print(nombre?.length); // ?. solo si no es null -> null
  print(nombre ?? 'sin nombre'); // ?? valor por defecto

  nombre = 'Carlos';
  print(nombre.length); // Dart sabe que ya no es null
  print(nombre!.length); // ! = te asegura que no es null

  nombre ??= 'Otro'; // asigna solo si es null (aquí no hace nada)
  print(nombre);
}

// ---------------------------------------------------------------
void ejercicio5() {
  print('--- Ejercicio 5 ---');
  double a = 3.0, b = 3.0, c = 5.0;

  if (a == b && b == c) {
    print('Equilátero');
  } else if (a == b || b == c || a == c) {
    print('Isósceles');
  } else {
    print('Escaleno');
  }
}

// ---------------------------------------------------------------
void ejercicio6() {
  print('--- Ejercicio 6 ---');
  stdout.write('Primer número: ');
  int n1 = int.parse(stdin.readLineSync()!);
  stdout.write('Segundo número: ');
  int n2 = int.parse(stdin.readLineSync()!);
  stdout.write('Operador (+ - * / %): ');
  String op = stdin.readLineSync()!;

  switch (op) {
    case '+':
      print(n1 + n2);
      break;
    case '-':
      print(n1 - n2);
      break;
    case '*':
      print(n1 * n2);
      break;
    case '/':
      if (n2 == 0) {
        print('No se puede dividir entre 0');
      } else {
        print(n1 ~/ n2); // división entera
      }
      break;
    case '%':
      if (n2 == 0) {
        print('No se puede dividir entre 0');
      } else {
        print(n1 % n2);
      }
      break;
    default:
      print('Operador no válido');
  }
}

// ---------------------------------------------------------------
void ejercicio7() {
  print('--- Ejercicio 7 ---');
  double a = 1, b = -3, c = 2;

  double discriminante = b * b - 4 * a * c;

  if (discriminante < 0) {
    print('Las raíces no son reales');
  } else {
    double x1 = (-b + sqrt(discriminante)) / (2 * a);
    double x2 = (-b - sqrt(discriminante)) / (2 * a);
    print('x1 = $x1, x2 = $x2');
  }
}

// ---------------------------------------------------------------
void ejercicio8() {
  print('--- Ejercicio 8 ---');
  stdout.write('Número entre 1 y 10: ');

  // readLineSync() devuelve String? (puede ser null) por el "sound null safety"
  String? entrada = stdin.readLineSync();

  if (entrada == null) {
    print('No has escrito nada');
    return;
  }

  int? numero = int.tryParse(entrada); // null si no es un número
  if (numero == null || numero < 1 || numero > 10) {
    print('Entrada no válida');
    return;
  }

  for (int i = 1; i <= 10; i++) {
    print('$numero x $i = ${numero * i}');
  }
}

// ---------------------------------------------------------------
void ejercicio9() {
  print('--- Ejercicio 9 ---');
  for (int t = 1; t <= 10; t++) {
    print('Tabla del $t');
    for (int i = 1; i <= 10; i++) {
      print('$t x $i = ${t * i}');
    }
    print('');
  }
}

// ---------------------------------------------------------------
void ejercicio10() {
  print('--- Ejercicio 10 ---');
  int n = 10;
  int suma = 0;
  for (int i = 1; i <= n; i++) {
    suma += i;
  }
  print('La suma de los $n primeros naturales es $suma');
}

// ---------------------------------------------------------------
void ejercicio11() {
  print('--- Ejercicio 11 ---');
  int n = 5;
  int factorial = 1;
  for (int i = 2; i <= n; i++) {
    factorial *= i;
  }
  print('$n! = $factorial');
}

// ---------------------------------------------------------------
void ejercicio12() {
  print('--- Ejercicio 12 ---');
  int a = 48, b = 18;
  int x = a, y = b;

  while (y != 0) {
    int resto = x % y;
    x = y;
    y = resto;
  }
  print('MCD($a, $b) = $x');
}

// ---------------------------------------------------------------
void ejercicio13() {
  print('--- Ejercicio 13 ---');
  int dividendo = 17, divisor = 5;
  int cociente = 0;
  int resto = dividendo;

  // Restamos el divisor hasta que no se pueda más
  while (resto >= divisor) {
    resto -= divisor;
    cociente++;
  }
  print('$dividendo / $divisor -> cociente $cociente, resto $resto');
}

// ---------------------------------------------------------------
void ejercicio14() {
  print('--- Ejercicio 14 ---');
  Random aleatorio = Random();
  int dado = aleatorio.nextInt(6) + 1; // nextInt(6) da de 0 a 5
  print('Ha salido un $dado');
}

// ---------------------------------------------------------------
void ejercicio15() {
  print('--- Ejercicio 15 ---');
  Random aleatorio = Random();
  int n = 6000;

  // Dado normal
  List<int> frecuencias = [0, 0, 0, 0, 0, 0];
  for (int i = 0; i < n; i++) {
    int dado = aleatorio.nextInt(6); // 0..5
    frecuencias[dado]++;
  }
  for (int i = 0; i < 6; i++) {
    print('Cara ${i + 1}: ${frecuencias[i]} veces');
  }

  // Dado trucado: el 6 sale 3 veces más que los demás.
  // Hacemos 8 "huecos": 5 caras normales (1 hueco cada una) + el 6 (3 huecos)
  List<int> trucado = [0, 0, 0, 0, 0, 0];
  for (int i = 0; i < n; i++) {
    int hueco = aleatorio.nextInt(8); // 0..7
    int cara = hueco < 5 ? hueco : 5; // huecos 5, 6 y 7 -> cara 6
    trucado[cara]++;
  }
  print('Dado trucado:');
  for (int i = 0; i < 6; i++) {
    print('Cara ${i + 1}: ${trucado[i]} veces');
  }
}

// ---------------------------------------------------------------
void ejercicio16() {
  print('--- Ejercicio 16 ---');
  List<String> dias = ['lunes', 'martes', 'miércoles', 'jueves', 'viernes'];
  print(dias);

  dias.add('sábado');
  dias.add('domingo');
  dias.forEach((dia) => print(dia));

  Map<String, int> edades = {'Ana': 20, 'Luis': 25, 'Marta': 31};
  edades.forEach((nombre, edad) => print('$nombre tiene $edad años'));
}

// ---------------------------------------------------------------
enum Arcoiris { rojo, naranja, amarillo, verde, azul, anil, violeta }

void ejercicio17() {
  print('--- Ejercicio 17 ---');
  print(Arcoiris.values); // todos
  print(Arcoiris.values[2]); // por índice (amarillo)
  print(Arcoiris.values.byName('verde')); // por nombre

  // Esto lanza una excepción (ArgumentError) y el programa se detiene:
  // print(Arcoiris.values.byName('marron'));
}

// ---------------------------------------------------------------
void ejercicio18() {
  print('--- Ejercicio 18 ---');
  try {
    print(Arcoiris.values.byName('marron'));
  } catch (e) {
    print('Error: ese color no existe');
  } finally {
    print('Esto se ejecuta siempre');
  }
}

// ---------------------------------------------------------------
void ejercicio19() {
  print('--- Ejercicio 19 ---');
  // Usamos int? para permitir edades sin inicializar (null)
  Map<String, int?> edades = {'Ana': 20, 'Luis': null, 'Marta': 31};

  edades.forEach((clave, valor) {
    print('$clave -> ${valor ?? "sin edad"}');
  });

  print('Solo claves:');
  for (String clave in edades.keys) {
    print(clave);
  }

  print('Solo valores:');
  for (int? valor in edades.values) {
    print(valor ?? 'sin edad');
  }
}

// ---------------------------------------------------------------
void ejercicio20() {
  print('--- Ejercicio 20 ---');
  Map<String, double> temperaturas = {
    'lunes': 22.5,
    'martes': 24.0,
    'miércoles': 19.5,
    'jueves': 27.0,
    'viernes': 25.5,
    'sábado': 21.0,
    'domingo': 23.0,
  };

  String diaMax = temperaturas.keys.first;
  String diaMin = temperaturas.keys.first;
  double suma = 0;

  temperaturas.forEach((dia, temp) {
    if (temp > temperaturas[diaMax]!) diaMax = dia;
    if (temp < temperaturas[diaMin]!) diaMin = dia;
    suma += temp;
  });

  print('Mayor máxima: ${temperaturas[diaMax]} el $diaMax');
  print('Menor máxima: ${temperaturas[diaMin]} el $diaMin');
  print('Media: ${(suma / temperaturas.length).toStringAsFixed(2)}');
}