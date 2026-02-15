import 'package:dio/dio.dart';
import 'package:dog_pic/data/models/dogs_model.dart';
import 'package:dog_pic/data/repository/fetch_dogs_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFetchDog extends Mock implements FetchDogsService {}

class MockDio extends Mock implements Dio {}

void main() {
  late FetchDogsService service;
  late MockDio mockDio;
  setUp(() {
    mockDio = MockDio();
    service = FetchDogsService(dio: mockDio);
  });
  test('Dogs images should be fetched', () async {
    final mockData = {
      'message':
          'https://images.dog.ceo/breeds/hound-afghan/n02088094_1003.jpg',
      'status': 'success',
    };
    final mockResponse = Response(
      data: mockData,
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
    );

    when(() => mockDio.get(any())).thenAnswer((_) async => mockResponse);

    // Act
    final result = await service.fetchRandomDogImages();

    // Assert
    expect(result, isA<DogsModel>());
    expect(result.message, equals(mockData['message']));
    expect(result.status, equals(mockData['status']));
    verify(
      () => mockDio.get('https://dog.ceo/api/breeds/image/random'),
    ).called(1);
  });
}
