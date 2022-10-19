import 'dart:io';

import 'package:scream_db/messages.dart';
import 'package:scream_db/utils.dart';

Future<List> _getDbName() async {
  printMessage("Database name: ");

  final String userHomeDir = getUserHomeDir();
  String? dbName = stdin.readLineSync();
  final String dbDir = "$userHomeDir/$dbName";

  bool pathExists = false;
  await Directory(dbDir).exists().then((value) => pathExists = value);

  return Future<List>.value([pathExists, dbDir]);
}

void _createDatabase() {
  bool dbExists = false;
  String dbDir = "";

  _getDbName().then((value) => {dbExists = value[0], dbDir = value[1]});

  if (dbExists) {
    printWarningMessage("Database already exists");
    return;
  }

  printMessage("Creating database... in $dbDir");
}

void executeCommandFromArgs(List<String> arguments) {
  if (arguments.isEmpty) {
    printMessage("No arguments specified");
    return;
  }

  Map<String, Function> mapToCommand = {
    "about": logo,
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
