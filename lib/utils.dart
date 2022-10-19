import 'dart:io';

String getUserHomeDir() {
  Map<String, String> envVars = Platform.environment;
  dynamic home = envVars['UserProfile'];
  return home;
}

void createScreamDirectory() async {
  String userHomeDir = getUserHomeDir();
  final bool pathExists = await Directory(userHomeDir).exists();
  if(pathExists) return;
  await Directory("$userHomeDir/.screamDB").create(recursive: true);
}
