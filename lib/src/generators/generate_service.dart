import 'dart:io';

import 'package:cli/src/utils/output.dart';
import 'package:cli/src/utils/utils.dart';

class GenerateService {
  static void generate(String name) {
    title('Generate Service $name');
    final pathControllers = '$mainDirectory/lib/services';
    if (!Directory(pathControllers).existsSync()) {
      Directory(pathControllers).createSync();
    }
    final path = '$pathControllers/${name}_service.dart';
    final file = File(path);
    if (file.existsSync()) {
      final list = file.readAsStringSync().split(';');
      list[0] = list[0].replaceAll('get', 'post');
      final newFile = list.join(';');
      print(newFile);
      file.writeAsStringSync(newFile);
      error('O ${name}_service.dart já existe');
    } else {
      file.createSync();
    }
    file.writeAsStringSync(''' 
      class ${formatName(name)}Service{
        void get(){}
      }
      ''');
  }
}
