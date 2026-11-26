// RELACIÓN DE EJERCICIOS DE DART (III) - Funciones, 2ª parte
// Los ejercicios 16 (DateTime) y 17-19 (tests) están en sus propios proyectos (todavia sin hacer):

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'validaciones.dart'; // Ejercicio 12

enum Estacion { primavera, verano, otono, invierno }

// ---------------------------------------------------------------
// Funciones auxiliares para leer datos de forma segura (ejercicio 1)
// ---------------------------------------------------------------

int? leerEntero(String mensaje) {
  stdout.write(mensaje);
  try {
    String? texto = stdin.readLineSync();
    return int.parse(texto!); // falla con letras, vacío (intro) o null
  } catch (e) {
    print('Eso no es un número entero válido.');
    return null;
  }
}

double? leerDouble(String mensaje) {
  stdout.write(mensaje);
  try {
    String? texto = stdin.readLineSync();
    return double.parse(texto!.replaceAll(',', '.')); // admite coma decimal
  } catch (e) {
    print('Eso no es un número válido.');
    return null;
  }
}

String leerTexto(String mensaje) {
  stdout.write(mensaje);
  return stdin.readLineSync() ?? '';
}

// ---------------------------------------------------------------
// EJERCICIO 1: entrada por consola + try-catch
// ---------------------------------------------------------------

int sumaPrimeros(int n) {
  int suma = 0;
  for (int i = 1; i <= n; i++) {
    suma += i;
  }
  return suma;
}

int factorial(int n) {
  int resultado = 1;
  for (int i = 2; i <= n; i++) {
    resultado *= i;
  }
  return resultado;
}

void ejercicio1() {
  // a) Suma de los n primeros números naturales
  int? n = leerEntero('Introduce un número: ');
  if (n != null) {
    if (n < 1) {
      print('Tiene que ser un número positivo.');
    } else {
      print('La suma de los $n primeros números es ${sumaPrimeros(n)}');
    }
  }

  // b) Factorial (hasta 20 porque a partir de 21 un int de Dart se desborda)
  int? m = leerEntero('Introduce un número para el factorial (0-20): ');
  if (m != null) {
    if (m < 0 || m > 20) {
      print('El número tiene que estar entre 0 y 20.');
    } else {
      print('$m! = ${factorial(m)}');
    }
  }

  // c) Ecuación de 2º grado: a·x² + b·x + c = 0
  double? a = leerDouble('Coeficiente a: ');
  double? b = leerDouble('Coeficiente b: ');
  double? c = leerDouble('Coeficiente c: ');
  if (a == null || b == null || c == null) {
    return;
  }
  if (a == 0) {
    print('Si a es 0 no es una ecuación de 2º grado.');
    return;
  }
  double discriminante = b * b - 4 * a * c;
  if (discriminante < 0) {
    print('No tiene raíces reales.');
  } else if (discriminante == 0) {
    print('Raíz doble: x = ${-b / (2 * a)}');
  } else {
    double x1 = (-b + sqrt(discriminante)) / (2 * a);
    double x2 = (-b - sqrt(discriminante)) / (2 * a);
    print('Raíces: x1 = $x1 y x2 = $x2');
  }
}

// ---------------------------------------------------------------
// EJERCICIO 2: adivina un número entre 1 y 100
// ---------------------------------------------------------------

// Estrategia automática: búsqueda binaria (siempre prueba el número del medio)
int adivinaBinario(int secreto) {
  int bajo = 1;
  int alto = 100;
  int intentos = 0;
  while (true) {
    int medio = (bajo + alto) ~/ 2;
    intentos++;
    if (medio == secreto) {
      return intentos;
    } else if (medio < secreto) {
      bajo = medio + 1;
    } else {
      alto = medio - 1;
    }
  }
}

void ejercicio2() {
  int secreto = Random().nextInt(100) + 1;
  int intentos = 0;
  bool acertado = false;

  while (!acertado) {
    int? intento = leerEntero('Adivina el número (1-100): ');
    if (intento == null) {
      continue; // si no es un número no cuenta como intento
    }
    intentos++;
    if (intento > secreto) {
      print('Te pasaste');
    } else if (intento < secreto) {
      print('Te quedaste corto');
    } else {
      acertado = true;
      print('¡Enhorabuena! Lo has acertado en $intentos intentos.');
    }
  }

  // Comprobamos cuántos intentos necesita la búsqueda binaria de media
  int total = 0;
  for (int i = 1; i <= 100; i++) {
    total += adivinaBinario(i);
  }
  print('Con búsqueda binaria se necesitan de media ${total / 100} intentos.');
}

// ---------------------------------------------------------------
// EJERCICIO 3: mayúsculas / minúsculas y strings multilínea
// ---------------------------------------------------------------

void ejercicio3() {
  List<String> frases = ['HOLA MUNDO', 'hola mundo', 'Hola Mundo', '1234'];
  for (String frase in frases) {
    if (frase == frase.toUpperCase() && frase == frase.toLowerCase()) {
      print('"$frase" → no tiene letras');
    } else if (frase == frase.toUpperCase()) {
      print('"$frase" → está todo en mayúsculas');
    } else if (frase == frase.toLowerCase()) {
      print('"$frase" → está todo en minúsculas');
    } else {
      print('"$frase" → ni todo mayúsculas ni todo minúsculas');
    }
  }

  // String multilínea: triple comilla
  String multilinea = '''Primera línea
Segunda línea
Tercera línea''';
  print(multilinea);

  // Otra forma: con el carácter especial \n
  print('Una línea\nOtra línea');
}

// ---------------------------------------------------------------
// EJERCICIO 4: concatenar un String con otros tipos
// ---------------------------------------------------------------

void ejercicio4() {
  String texto = 'Valor: ';
  int entero = 42;
  double decimal = 3.14;
  bool booleano = true;
  List<int> lista = [1, 2, 3];
  Map<String, int> mapa = {'a': 1, 'b': 2};
  Set<String> conjunto = {'x', 'y'};
  Estacion estacion = Estacion.verano;

  // Con + hay que convertir antes a String: texto + entero daría error
  print(texto + entero.toString());
  print(texto + decimal.toString());
  print(texto + booleano.toString());
  print(texto + lista.toString());
  print(texto + mapa.toString());
  print(texto + conjunto.toString());
  print(texto + estacion.toString()); // Estacion.verano
  print(texto + estacion.name); // verano (solo el nombre)
}

// ---------------------------------------------------------------
// EJERCICIO 5: de String a otros tipos (parse)
// ---------------------------------------------------------------

void ejercicio5() {
  int entero = int.parse('42');
  double decimal = double.parse('3.14');
  bool booleano = bool.parse('true');
  print('$entero, $decimal, $booleano');

  // tryParse no lanza error: devuelve null si no se puede convertir
  print(int.tryParse('abc')); // null

  // List, Map y Set no tienen parse. Una opción es usar JSON (dart:convert)
  List<dynamic> lista = jsonDecode('[1, 2, 3]');
  Map<String, dynamic> mapa = jsonDecode('{"a": 1, "b": 2}');
  Set<dynamic> conjunto = lista.toSet(); // un Set se crea a partir de una lista
  print('$lista, $mapa, $conjunto');

  // Enum: se busca por su nombre
  Estacion estacion = Estacion.values.byName('verano');
  print(estacion);

  // Y al revés (a String) en formato JSON
  print(jsonEncode(lista));
  print(jsonEncode(mapa));

  // Formato de un double a String
  double pi = 3.14159265;
  print(pi.toStringAsFixed(2)); // 3.14 (decimales fijos)
  print(pi.toStringAsPrecision(3)); // 3.14 (cifras significativas)
  print(pi.toStringAsExponential(2)); // 3.14e+0 (notación científica)
}

// ---------------------------------------------------------------
// EJERCICIO 6: frase al revés y palíndromo
// ---------------------------------------------------------------

String invertirPalabras(String frase) {
  return frase.split(' ').reversed.join(' ');
}

String invertirCaracteres(String frase) {
  return frase.split('').reversed.join();
}

bool esPalindromo(String frase) {
  // Pasamos a minúsculas, quitamos tildes y dejamos solo letras y números
  String limpia = frase
      .toLowerCase()
      .replaceAll('á', 'a')
      .replaceAll('é', 'e')
      .replaceAll('í', 'i')
      .replaceAll('ó', 'o')
      .replaceAll('ú', 'u')
      .replaceAll(RegExp(r'[^a-z0-9ñ]'), '');
  return limpia == invertirCaracteres(limpia);
}

void ejercicio6() {
  String frase = leerTexto('Introduce una frase: ');
  print('Palabras al revés: ${invertirPalabras(frase)}');
  print('Caracteres al revés: ${invertirCaracteres(frase)}');
  if (esPalindromo(frase)) {
    print('Es un palíndromo');
  } else {
    print('No es un palíndromo');
  }
}

// ---------------------------------------------------------------
// EJERCICIO 7: buscar una subcadena
// ---------------------------------------------------------------

void ejercicio7() {
  String frase = leerTexto('Introduce una frase: ');
  String sub = leerTexto('Introduce la subcadena: ');

  if (!frase.contains(sub)) {
    print('La subcadena no está en la frase.');
  } else {
    // Las posiciones empiezan en 0
    print('Primera posición: ${frase.indexOf(sub)}');
    print('Última posición: ${frase.lastIndexOf(sub)}');
  }
}

// ---------------------------------------------------------------
// EJERCICIOS 8, 9, 10 y 11: validaciones (funciones en validaciones.dart)
// ---------------------------------------------------------------

void ejercicio8() {
  List<String> colores = ['#4F6', '#982A3B', 'red', '987s', '882244'];
  for (String color in colores) {
    print('$color → ${esColorRGB(color)}');
  }
}

void ejercicio9() {
  List<String> urls = [
    'https://www.google.com',
    'http://ejemplo.es/pagina?x=1',
    'google.com',
    'http://',
  ];
  for (String url in urls) {
    print('$url → ${esUrl(url)}');
  }
}

void ejercicio10() {
  List<String> correos = ['ruben@gmail.com', 'nombre.apellido@dominio.es', 'ruben@', 'ruben@gmail'];
  for (String correo in correos) {
    print('$correo → ${esEmail(correo)}');
  }
}

void ejercicio11() {
  List<String> dnis = ['12345678Z', '12345678A', '1234567Z', '87654321X'];
  for (String dni in dnis) {
    print('$dni → ${esDni(dni)}');
  }
}

// ---------------------------------------------------------------
// EJERCICIO 13: menú con una List
// ---------------------------------------------------------------

void ejercicio13() {
  List<String> colores = ['rojo', 'verde', 'azul'];

  // Funciones de List: isEmpty, length, addAll, sort, clear...
  List<String> prueba = ['b', 'c'];
  prueba.addAll(['a', 'd']);
  prueba.sort();
  print('Prueba ordenada: $prueba (longitud ${prueba.length}, vacía: ${prueba.isEmpty})');
  prueba.clear();
  print('Tras clear está vacía: ${prueba.isEmpty}');

  int opcion = 0;
  while (opcion != 5) {
    print('\n1. incluir color');
    print('2. eliminar color');
    print('3. buscar color');
    print('4. mostrar lista de colores');
    print('5. salir');
    int? lectura = leerEntero('Elige una opción: ');
    if (lectura == null) {
      continue;
    }
    opcion = lectura;

    switch (opcion) {
      case 1:
        String nuevo = leerTexto('Color a incluir: ').trim().toLowerCase();
        if (nuevo.isEmpty) {
          print('No has escrito ningún color.');
        } else if (colores.contains(nuevo)) {
          // Un color repetido no tiene sentido: lo evitamos comprobando antes
          print('Ese color ya está en la lista.');
        } else {
          colores.add(nuevo);
          print('Color añadido.');
        }
        break;
      case 2:
        String borrar = leerTexto('Color a eliminar: ').trim().toLowerCase();
        int posicion = colores.indexOf(borrar);
        if (posicion == -1) {
          print('Ese color no está en la lista.');
        } else {
          colores.removeAt(posicion);
          print('Color eliminado.');
        }
        break;
      case 3:
        String buscar = leerTexto('Color a buscar: ').trim().toLowerCase();
        int encontrado = colores.indexOf(buscar);
        if (encontrado == -1) {
          print('Ese color no está en la lista.');
        } else {
          print('Está en la posición $encontrado.');
        }
        break;
      case 4:
        if (colores.isEmpty) {
          print('La lista está vacía.');
        } else {
          print('Colores (${colores.length}): $colores');
        }
        break;
      case 5:
        print('Saliendo del menú...');
        break;
      default:
        print('Opción no válida.');
    }
  }

  // ¿Qué pasa si incluimos dos veces el mismo color? Una List admite repetidos, así que saldría dos veces. 
  // Casi siempre es un comportamiento no deseado.
  // Soluciones: comprobar con contains() antes de añadir (como arriba)
  // o usar un Set, que no admite elementos repetidos.
}

// ---------------------------------------------------------------
// EJERCICIO 14: menú con un Map
// ---------------------------------------------------------------

void ejercicio14() {
  Map<String, String> grupoWhatsapp = {
    'Pepe': '111111111',
    'María': '222222222',
    'Ana': '3333333',
  };

  int opcion = 0;
  while (opcion != 5) {
    print('\n1. incluir persona');
    print('2. eliminar persona');
    print('3. buscar persona');
    print('4. mostrar componentes grupo');
    print('5. salir');
    int? lectura = leerEntero('Elige una opción: ');
    if (lectura == null) {
      continue;
    }
    opcion = lectura;

    switch (opcion) {
      case 1:
        String nombre = leerTexto('Nombre: ').trim();
        String telefono = leerTexto('Teléfono: ').trim();
        if (nombre.isEmpty || telefono.isEmpty) {
          print('Hay que escribir nombre y teléfono.');
        } else if (grupoWhatsapp.containsKey(nombre)) {
          print('Esa persona ya está en el grupo.');
        } else {
          grupoWhatsapp.putIfAbsent(nombre, () => telefono);
          print('Persona añadida.');
        }
        break;
      case 2:
        String borrar = leerTexto('Nombre a eliminar: ').trim();
        String? eliminado = grupoWhatsapp.remove(borrar); // devuelve el valor o null
        if (eliminado == null) {
          print('Esa persona no está en el grupo.');
        } else {
          print('Persona eliminada (su teléfono era $eliminado).');
        }
        break;
      case 3:
        String buscar = leerTexto('Nombre a buscar: ').trim();
        if (grupoWhatsapp.containsKey(buscar)) {
          print('$buscar → ${grupoWhatsapp[buscar]}');
        } else {
          print('Esa persona no está en el grupo.');
        }
        break;
      case 4:
        if (grupoWhatsapp.isEmpty) {
          print('El grupo está vacío.');
        } else {
          print('Componentes: ${grupoWhatsapp.length}');
          for (var entrada in grupoWhatsapp.entries) {
            print('${entrada.key}: ${entrada.value}');
          }
          print('Nombres: ${grupoWhatsapp.keys}');
          print('Teléfonos: ${grupoWhatsapp.values}');
        }
        break;
      case 5:
        print('Saliendo del menú...');
        break;
      default:
        print('Opción no válida.');
    }
  }
}

// ---------------------------------------------------------------
// EJERCICIO 15: la clase Uri
// ---------------------------------------------------------------

void ejercicio15() {
  List<String> uris = [
    'https://usuario@www.ejemplo.com:8080/ruta/pagina.html?nombre=ruben&edad=20#seccion',
    'mailto:alguien@ejemplo.com?subject=Hola',
    'file:///home/ruben/documento.txt',
    'https://www.ejemplo.com/b%C3%BAsqueda?q=caf%C3%A9',
  ];

  for (String texto in uris) {
    print('\n--- $texto ---');
    print('Decodificada: ${Uri.decodeFull(texto)}');
    Uri uri = Uri.parse(texto);
    print('scheme: ${uri.scheme}');
    print('host: ${uri.host}');
    print('port: ${uri.port}');
    print('path: ${uri.path}');
    print('fragment: ${uri.fragment}');
    print('queryParameters: ${uri.queryParameters}');
    try {
      print('origin: ${uri.origin}');
    } catch (e) {
      // origin solo existe para http y https
      print('origin: no disponible para este tipo de URI');
    }
  }

  // Construir una Uri definiendo cada parte
  Uri construida = Uri(
    scheme: 'https',
    host: 'www.ejemplo.com',
    port: 8080,
    path: '/ruta/pagina.html',
    queryParameters: {'nombre': 'Rubén', 'edad': '20'},
    fragment: 'seccion',
  );
  print('\nUri construida: $construida');

  // Constructor más corto para https
  Uri https = Uri.https('www.ejemplo.com', '/buscar', {'q': 'dart'});
  print('Uri.https: $https');

  // Codificar un texto para usarlo dentro de una URI
  print(Uri.encodeComponent('café con leche')); // caf%C3%A9%20con%20leche
}

// ---------------------------------------------------------------
// EJERCICIO 20: funciones sin nombre
// ---------------------------------------------------------------

// Función que recibe otra función como argumento (tipo 4)
int operar(int a, int b, int Function(int, int) operacion) {
  return operacion(a, b);
}

void ejercicio20() {
  // 1. Función sin nombre asignada a una variable
  var saludar = (String nombre) {
    return 'Hola $nombre';
  };
  print(saludar('Rubén'));

  // 2. Función sin nombre dentro de una función de orden superior (forEach)
  List<int> numeros = [1, 2, 3, 4];
  numeros.forEach((numero) {
    print('El doble de $numero es ${numero * 2}');
  });

  // 3. Sintaxis de flecha (=>) para funciones de una sola línea
  var cuadrado = (int x) => x * x;
  print('El cuadrado de 5 es ${cuadrado(5)}');

  // 4. Función como argumento de otra función
  print('Suma: ${operar(3, 4, (x, y) => x + y)}');
  print('Multiplicación: ${operar(3, 4, (x, y) => x * y)}');

  // 5. Funciones dentro de un Map
  Map<String, double Function(double, double)> operaciones = {
    'sumar': (a, b) => a + b,
    'restar': (a, b) => a - b,
    'multiplicar': (a, b) => a * b,
    'dividir': (a, b) => a / b,
  };
  print('10 y 4 → sumar: ${operaciones['sumar']!(10, 4)}');
  operaciones.forEach((nombre, funcion) {
    print('$nombre(10, 4) = ${funcion(10, 4)}');
  });
}

// ---------------------------------------------------------------
// MENÚ PRINCIPAL
// ---------------------------------------------------------------

void main() {
  int opcion = -1;
  while (opcion != 0) {
    print('\n=== RELACIÓN 3 - FUNCIONES (2ª PARTE) ===');
    int? lectura = leerEntero('Elige un ejercicio del 1 al 20 (0 para salir): ');
    if (lectura == null) {
      continue;
    }
    opcion = lectura;
    print('');

    switch (opcion) {
      case 0:
        print('Adiós');
        break;
      case 1:
        ejercicio1();
        break;
      case 2:
        ejercicio2();
        break;
      case 3:
        ejercicio3();
        break;
      case 4:
        ejercicio4();
        break;
      case 5:
        ejercicio5();
        break;
      case 6:
        ejercicio6();
        break;
      case 7:
        ejercicio7();
        break;
      case 8:
        ejercicio8();
        break;
      case 9:
        ejercicio9();
        break;
      case 10:
        ejercicio10();
        break;
      case 11:
        ejercicio11();
        break;
      case 12:
        print('Ejercicio 12: la librería es el archivo validaciones.dart (importada arriba).');
        break;
      case 13:
        ejercicio13();
        break;
      case 14:
        ejercicio14();
        break;
      case 15:
        ejercicio15();
        break;
      case 16:
        print('Ejercicio 16: está en el proyecto proyecto_datetime.');
        break;
      case 17:
      case 18:
      case 19:
        print('Ejercicios 17, 18 y 19: están en el proyecto proyecto_testing (dart test).');
        break;
      case 20:
        ejercicio20();
        break;
      default:
        print('Ejercicio no válido.');
    }
  }
}