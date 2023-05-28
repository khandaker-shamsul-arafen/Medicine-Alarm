import 'dart:convert';
import 'dart:typed_data';

class Utility {
  static Uint8List dataFromBase64String(String base64String) {
    return Base64Decoder().convert(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
