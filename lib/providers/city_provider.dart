import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityProvider = StateProvider<String>((ref) {
  print('>>> In cityProvider');
  return '';
});
