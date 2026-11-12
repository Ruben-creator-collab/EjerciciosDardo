import "dart:io";
void main(){

  stdout.write("Introduce el primer número entero: ");
  String? entrada1 = stdin.readLineSync();
  int num1 = int.tryParse(entrada1 ?? "") ?? 0;

  stdout.write("Introduce el segundo número entero: ");
  String? entrada2 = stdin.readLineSync();
  int num2 = int.tryParse(entrada2 ?? "") ?? 0;

  stdout.write("Introduce el operador (+, -, *, ~/, %): ");
  String? operador = stdin.readLineSync();

  print("\nResultado:");
  
  switch (operador) {
    case "+":
      print("$num1 + $num2 = ${num1 + num2}");
      break;

    case "-":
      print("$num1 - $num2 = ${num1 * num2}");
      break;

    case "~/":
      if (num2 == 0){
        print("Error: No se puede dividir por cero.");
      } else {
        print("$num1 ~/ $num2 = ${num1 ~/ num2} (Cociente entero)");
      }
      break;

    case "%":
      if(num2 == 0){
        print("Error: No se puede calcular el resto con divisor cero.");
      } else {
        print ("$num1 % $num2 = ${num1 % num2} (Resto de la división)");
      }
      break;

      default: 
        print("ErrorL Operador no reconocido. Usa +, -, *, ~/ o %.");
  }

}