void main(){
    // vamos a declarar variables de distintos tipos
    String nombre = "Ruben";
    int edad = 20;
    double altura = 1.65;
    bool esMayor = true;

    dynamic variableDinamica = "Hola"; // tipo dinamico, se puede cambiar de tipo

    print("variabledinamica es de tipo ${variableDinamica.runtimeType} y su valor es $variableDinamica");
    print("Mi nombre es $nombre, tengo $edad años,  mido $altura metros y es $esMayor que soy mayor de edad.");
    variableDinamica = 42; // cambiamos el valor a un entero
    print("variableDinamica es de tipo ${variableDinamica.runtimeType} y su valor es $variableDinamica");
}