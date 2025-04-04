import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider((ref) => ApiService());

final breedsProvider = FutureProvider((ref) async {
  return ref.read(apiServiceProvider).fetchBreeds();
});
