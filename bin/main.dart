import 'package:scream_db/management.dart';
import 'package:scream_db/utils.dart';

void main(List<String> arguments) {
  createScreamDirectory();
  executeCommandFromArgs(arguments);
}
