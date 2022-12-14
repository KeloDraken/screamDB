import 'package:chalkdart/chalk.dart';

void printErrorMessage(String message) {
  print(chalk.brightRed(message));
}

void printWarningMessage(String message) {
  print(chalk.brightYellow(message));
}

void printMessage(String message) {
  print(chalk.blackBright(message));
}

void printSuccessMessage(String message) {
  print(chalk.brightGreen(message));
}

void printInfoMessage(String message) {
  print(chalk.bold(message));
}
