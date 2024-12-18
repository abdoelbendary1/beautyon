import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class ImageCompressor {
  /// Compresses an image from the assets folder and returns the path of the compressed image.
  static Future<File?> compressAssetImage({
    required String assetPath,
    int quality = 70, // Default compression quality
    String? outputFileName, // Optional custom output file name
  }) async {
    try {
      // Step 1: Load the asset image into memory
      ByteData byteData = await rootBundle.load(assetPath);
      Uint8List imageData = byteData.buffer.asUint8List();

      // Step 2: Save the asset image as a temporary file
      Directory tempDir = await getTemporaryDirectory();
      String tempFilePath = '${tempDir.path}/original_image.jpg';
      File tempFile = await File(tempFilePath).writeAsBytes(imageData);

      // Step 3: Compress the file
      String compressedFileName = outputFileName ?? 'compressed_image.jpg';
      String compressedFilePath = '${tempDir.path}/$compressedFileName';
      File? compressedFile = (await FlutterImageCompress.compressAndGetFile(
        tempFile.absolute.path, // Input file path
        compressedFilePath, // Output file path
        quality: quality,
      )) as File?;

      return compressedFile;
    } catch (e) {
      print("Error compressing asset image: $e");
      return null;
    }
  }
}
