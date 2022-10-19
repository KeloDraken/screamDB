import 'dart:io';

String getUserHomeDir() {
  Map<String, String> envVars = Platform.environment;
  dynamic home = envVars['UserProfile'];
  return home;
}

void createScreamDirectory() async {
  await Directory("${getUserHomeDir()}/.screamDB").create(recursive: true);
}
