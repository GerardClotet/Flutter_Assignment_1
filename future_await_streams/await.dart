import 'dart:io';

Future<String> nombreFichero() async {
  return "await.dart";
}

Future<void> muestraFichero() async { //funcion async, acabara cuando lo tenga que hacer
  String filename = await nombreFichero(); //await solo puede estar en funciones async

  String content = await File(filename).readAsStringSync();
  print(content);
}

main() {
  muestraFichero();
  print("fin");
}
