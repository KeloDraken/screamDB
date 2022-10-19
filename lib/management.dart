import 'dart:io';

import 'package:scream_db/constants.dart';
import 'package:scream_db/messages.dart';
import 'package:scream_db/utils.dart';

Future<List> _getDbName() async {
  printMessage("Database name: ");

  final String userHomeDir = getUserHomeDir();
  String? dbName = stdin.readLineSync();
  String sep = Platform.pathSeparator;

  final String dbDir = "$userHomeDir$sep$screamDb$sep$dbName";

  bool pathExists = false;
  await Directory(dbDir).exists().then((value) => pathExists = value);

  return Future<List>.value([pathExists, dbDir]);
}

void _createDatabase() async {
  bool dbExists = false;
  String dbDir = "";

  await _getDbName().then((value) => {dbExists = value[0], dbDir = value[1]});

  if (dbExists) {
    printWarningMessage("Database already exists");
    return;
  }
  await Directory(dbDir).create(recursive: true);
  printSuccessMessage("Successfully created database.");
}

void _deleteDatabase() async {
  bool dbExists = false;
  String dbDir = "";

  await _getDbName().then((value) => {dbExists = value[0], dbDir = value[1]});

  if (!dbExists) {
    printWarningMessage("No such database exists.");
    return;
  }

  printMessage("Are you sure you want to delete the database? ");
}

void executeCommandFromArgs(List<String> arguments) {
  if (arguments.isEmpty) {
    printMessage("No arguments specified");
    return;
  }

  Map<String, Function> mapToCommand = {
    "about": logo,
    "newdb": _createDatabase,
    "dropdb": _deleteDatabase,
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
