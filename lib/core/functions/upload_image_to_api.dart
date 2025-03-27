import 'package:dio/dio.dart';
// import 'package:image_picker/image_picker.dart';

Future uploadImageToAPI(String imagePath) async {
  if (imagePath == '') {
    return '';
  } else {
    return MultipartFile.fromFile(
      imagePath,
      filename: imagePath.split('/').last,
      // filename: image.path.split('/').last
    );
  }
}
