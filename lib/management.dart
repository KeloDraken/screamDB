import 'dart:io';

import 'package:scream_db/messages.dart';
import 'package:scream_db/utils.dart';

void _createDatabase() async {
  final String userHomeDir = getUserHomeDir();
  final bool pathExists = await Directory(userHomeDir).exists();
  if (pathExists) {
    printWarningMessage("Database already exists");
    return;
  }

  printMessage("Creating database...");
}

void executeCommandFromArgs(List<String> arguments) {
  if (arguments.isEmpty) {
    printMessage("No arguments specified");
    return;
  }

  Map<String, Function> mapToCommand = {
    "newdb": _createDatabase,
  };

  String command = arguments[0];
  if (!mapToCommand.containsKey(command)) {
    printErrorMessage("No such command: $command");
    return;
  }

  Function? execute = mapToCommand[command];

  if (execute == null) {
    printErrorMessage("Couldn't execute command: $command");
    return;
  }

  execute();
}
