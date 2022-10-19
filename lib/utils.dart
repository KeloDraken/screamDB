import 'dart:io' show Platform;

String getUserHomeDir() {
  dynamic home;
  Map<String, String> envVars = Platform.environment;
  home = envVars['UserProfile'];
  return home;
}
