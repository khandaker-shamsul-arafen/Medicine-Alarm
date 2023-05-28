// static Future<void> deleteItem(int id) async {
// final db = await SqlHelper.databaseCreate();
// try {
// await db.delete("tbl_students", where: "id = ?", whereArgs: [id]);
// } catch (err) {
// debugPrint("Something went wrong when deleting an item: $err");
// }
// }

// static Image imageFromBase64String(String base64String) {
// return Image.memory(
// base64Decode(base64String),
// fit: BoxFit.fill,
// );
// }
