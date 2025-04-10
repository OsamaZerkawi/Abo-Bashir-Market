import 'package:abo_bashir_market/core/errors/error_model.dart';
import 'package:easy_localization/easy_localization.dart';

String parseErrorMessages(ErrorModel errorResponse) {
  final data = errorResponse.data;
  if (data == null) return 'unexpected_error'.tr();

  final List<String> errors = [];

  data.forEach((key, value) {
    // مثال: لو السيرفر يرجع {"email": ["The email has already been taken."]}
    if (value is List) {
      for (var msg in value) {
        errors.add(msg.toString().tr());
      }
    } else if (value is String) {
      errors.add(value.tr());
    }
  });

  return errors.join('\n');
}
