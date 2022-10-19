import 'dart:io';

import 'package:scream_db/messages.dart';

String getUserHomeDir() {
  Map<String, String> envVars = Platform.environment;
  dynamic home = envVars['UserProfile'];
  return home;
}

void logo() {
  printErrorMessage("""
  ██████  ▄████▄   ██▀███  ▓█████ ▄▄▄       ███▄ ▄███▓
▒██    ▒ ▒██▀ ▀█  ▓██ ▒ ██▒▓█   ▀▒████▄    ▓██▒▀█▀ ██▒
░ ▓██▄   ▒▓█    ▄ ▓██ ░▄█ ▒▒███  ▒██  ▀█▄  ▓██    ▓██░
  ▒   ██▒▒▓▓▄ ▄██▒▒██▀▀█▄  ▒▓█  ▄░██▄▄▄▄██ ▒██    ▒██ 
▒██████▒▒▒ ▓███▀ ░░██▓ ▒██▒░▒████▒▓█   ▓██▒▒██▒   ░██▒
▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░░ ▒▓ ░▒▓░░░ ▒░ ░▒▒   ▓▒█░░ ▒░   ░  ░
░ ░▒  ░ ░  ░  ▒     ░▒ ░ ▒░ ░ ░  ░ ▒   ▒▒ ░░  ░      ░
░  ░  ░  ░          ░░   ░    ░    ░   ▒   ░      ░   
      ░  ░ ░         ░        ░  ░     ░  ░       ░   
         ░                                            
""");
}

void createScreamDirectory() async {
  String userHomeDir = getUserHomeDir();
  final bool pathExists = await Directory(userHomeDir).exists();
  if (pathExists) return;
  await Directory("$userHomeDir/.screamDB").create(recursive: true);
}
