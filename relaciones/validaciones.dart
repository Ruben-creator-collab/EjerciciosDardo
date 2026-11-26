// Ejercicio 12: librería con todas las funciones de validación.
// Se importa desde otros archivos con: import 'validaciones.dart';

// Ejercicio 8: color RGB (#abc o #aabbcc)
bool esColorRGB(String texto) {
  RegExp regex = RegExp(r'^#([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');
  return regex.hasMatch(texto);
}

// Ejercicio 9: URL (http, https o ftp, con dominio que tenga al menos un punto)
bool esUrl(String texto) {
  RegExp regex = RegExp(
      r'^(https?|ftp)://[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+(:\d+)?([/?#][^\s]*)?$');
  return regex.hasMatch(texto);
}

// Ejercicio 10: correo electrónico
bool esEmail(String texto) {
  RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  return regex.hasMatch(texto);
}

// Ejercicio 11: DNI español (8 números + letra, y la letra debe ser correcta)
bool esDni(String texto) {
  RegExp regex = RegExp(r'^[0-9]{8}[a-zA-Z]$');
  if (!regex.hasMatch(texto)) {
    return false;
  }
  // La letra correcta es la que ocupa la posición (número % 23) en esta cadena
  String letras = 'TRWAGMYFPDXBNJZSQVHLCKE';
  int numero = int.parse(texto.substring(0, 8));
  String letraCorrecta = letras[numero % 23];
  return texto[8].toUpperCase() == letraCorrecta;
}