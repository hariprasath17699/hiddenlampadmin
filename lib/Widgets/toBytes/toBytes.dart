// import 'dart:html' as html;
// import 'dart:typed_data';
// class UploadCourseImageToFirebase {
//   static Future<Uint8List?> readFileAsBytes(html.File? file) async {
//     if (file == null) {
//       return null; // or throw an exception, depending on your use case
//     }
//
//     final html.FileReader reader = html.FileReader();
//
//     // Read the file as an ArrayBuffer
//     reader.readAsArrayBuffer(file);
//
//     // Wait for the reading process to complete
//     await reader.onLoad.first;
//
//     // Access the result as Uint8List from dart:typed_data
//     final Uint8List bytes = Uint8List.fromList(List<int>.from(reader.result));
//
//     return bytes;
//   }
// }