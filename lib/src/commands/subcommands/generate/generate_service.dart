import 'package:cli/src/commands/command_base.dart';
import 'package:cli/src/generators/generate_controller.dart';
import 'package:cli/src/generators/generate_service.dart';

class GenerateServiceSubCommand extends CommandBase {
  @override
  String get name => 'service';

  @override
  String get description => 'Utilizado para gerar um service';

  @override
  void run() {
    final nameController = argResults!.rest.first;
    GenerateService.generate(nameController);
  }
}
