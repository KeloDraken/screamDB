import 'dart:io';

String _getUserHomeDir() {
  Map<String, String> envVars = Platform.environment;
  dynamic home = envVars['UserProfile'];
  return home;
}

void createScreamDirectory() async {
  String userHomeDir = _getUserHomeDir();
  final bool pathExists = await Directory(userHomeDir).exists();
  if (pathExists) return;
  await Directory("$userHomeDir/.screamDB").create(recursive: true);
}
