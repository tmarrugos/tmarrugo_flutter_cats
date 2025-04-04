import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:tmarrugo_flutter_cats/services/api_service.dart';


@GenerateMocks([Dio])
import 'api_service_test.mocks.dart';

void main() {
  late MockDio mockDio;
  late ApiService apiService;

  setUp(() {
    mockDio = MockDio();
    apiService = ApiService();
  });

  test('fetchBreeds  items to test', () async {
    final mockResponse = [
      {'id': 'abys', 'name': 'Abyssinian'},
      {'id': 'aege', 'name': 'Aegean'}
    ];

    when(mockDio.get(any)).thenAnswer((_) async => Response(
      data: mockResponse,
      statusCode: 200,
      requestOptions: RequestOptions(path: '/breeds'),
    ));

    final result = await apiService.fetchBreeds();

    expect(result, isA<List<dynamic>>());
    expect(result.length, 67);
    expect(result[0]['name'], 'Abyssinian');
    verifyNever(mockDio.get('/breeds')).called(0);
  });
}
