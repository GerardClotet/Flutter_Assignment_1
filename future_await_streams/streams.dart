import 'dart:io';

Future<int> retardado(int i) async {
  await Future.delayed(Duration(seconds: 1));
  return i;
}

Stream<int> countdown(int from, int to) async* {
  yield from;
  for (int i = from-1; i >= to; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // devuelve un valor en el strem y sigue ejecutando estya funcion
  }
}

main() {
 print('inici');

  countdown(10, 0).listen((value) { 
    // el listen entra cada vez que devuelve algo, el then cuando acaba la funcion
    print(value);
  });
  
}
