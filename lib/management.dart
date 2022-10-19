import 'dart:io';

import 'package:scream_db/utils.dart';

void _createDatabase() async {
  final String userHomeDir = getUserHomeDir();
  final bool pathExists = await Directory(userHomeDir).exists();
  if (pathExists) {
    print("Database already exists");
    return;
  }

  print("Creating database...");
}

void executeCommandFromArgs(List<String> arguments) {
  if (arguments.isEmpty) {
    print("No arguments specified");
    return;
  }

  Map<String, Function> mapToCommand = {
    "newdb": _createDatabase,
  };

  String command = arguments[0];
  if (!mapToCommand.containsKey(command)) {
    print("No such command: $command");
    return;
  }

  Function? execute = mapToCommand[command];

  if (execute == null) {
    print("Couldn't execute command: $command");
    return;
  }

  execute();
}
