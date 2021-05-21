import 'dart:io';

import 'package:cli/src/utils/output.dart';
import 'package:cli/src/utils/utils.dart';

class GenerateController {
  static void generate(String name) {
    title('Generate controller $name');
    final pathControllers = '$mainDirectory/lib/controllers';
    if (!Directory(pathControllers).existsSync()) {
      Directory(pathControllers).createSync();
    }
    final path = '$pathControllers/${name}_controller.dart';
    final file = File(path);
    if (file.existsSync()) {
      error('O ${name}_controller.dart já existe');
    } else {
      file.createSync();
    }
    file.writeAsStringSync(''' 
      class ${formatName(name)}Controller{
        void update(){}
      }
      ''');
  }
}
