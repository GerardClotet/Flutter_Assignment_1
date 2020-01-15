
import 'dart:io';
Future<String> saludaAsync() async {
  return "hola";
}



main() {
  print("inicio");
  saludaAsync().then((result){
    print(result);
  });

  File file = File('futures.dart');
  file.readAsString().then((content){
    print(content);
  });

  print("fin");


}
