import 'package:scream_db/db.dart';

void main(List<String> args) {
  ScreamDB db = ScreamDB("test");

  // Table structure
  Map<String, dynamic> table = {
    "scream_name": "this_is_the_table_name",
    "id": int,
    "name": String,
  };

  // Save the table to database
  db.createTable(table);

  // Get all records from the table
  List<Map<String, dynamic>> data =
      db.getAllFromTable("this_is_the_table_name");

  // Delete all records from the table
  Future<bool> success = db.deleteAllFromTable("this_is_the_table_name");

  // Drop table
  db.dropTable("this_is_the_table_name");
}
