import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tmarrugo_flutter_cats/services/api_service.dart';
import 'package:tmarrugo_flutter_cats/providers/providers.dart';

@GenerateMocks([ApiService])
import 'provider_test.mocks.dart';

void main() {
  late ProviderContainer container;
  late ApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    container = ProviderContainer(
      overrides: [
        apiServiceProvider.overrideWithValue(mockApiService),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('test to get list of breeds with the provider', () async {
    final mockResponse = [
      {'id': 'abys', 'name': 'Abyssinian'},
      {'id': 'aege', 'name': 'Aegean'}
    ];

    when(mockApiService.fetchBreeds()).thenAnswer((_) async => mockResponse);

    final result = await container.read(breedsProvider.future);

    expect(result, isA<List<dynamic>>());
    expect(result.length, 2);
    expect(result[0]['name'], 'Abyssinian');
    verify(mockApiService.fetchBreeds()).called(1);
  });
}
