import 'dart:io';

String getUserHomeDir() {
  dynamic home;
  Map<String, String> envVars = Platform.environment;
  home = envVars['UserProfile'];
  return home;
}

void createScreamDirectory() async {
  await Directory("${getUserHomeDir()}/.screamDB").create(recursive: true);
}
