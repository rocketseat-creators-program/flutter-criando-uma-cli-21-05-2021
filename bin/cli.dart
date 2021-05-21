import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:cli/cli.dart' as cli;
import 'package:cli/src/commands/generate_command.dart';

void main(List<String> arguments) {
  final runner = configureCommand(arguments);

  var hasCommand = runner.commands.keys.any((x) => arguments.contains(x));

  if (hasCommand) {
    executeCommand(runner, arguments);
  } else {
    var parser = ArgParser();
    parser = runner.argParser;
    var results = parser.parse(arguments);
    executeOptions(results, arguments, runner);
  }
}

void executeOptions(
    ArgResults results, List<String> arguments, CommandRunner runner) {
  if (results.wasParsed('help') || arguments.isEmpty) {
    print(runner.usage);
  }

  if (results.wasParsed('version')) {
    print('0.0.0');
  }
}

void executeCommand(CommandRunner runner, List<String> arguments) {
  runner.run(arguments).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
  });
}

CommandRunner configureCommand(List<String> arguments) {
  var runner = CommandRunner('cli', 'CLI for Flutter')
    ..addCommand(GenerateCommand());

  runner.argParser.addFlag('version', abbr: 'v', negatable: false);
  return runner;
}
