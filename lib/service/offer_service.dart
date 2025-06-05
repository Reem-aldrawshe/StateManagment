import 'package:dio/dio.dart';
import '../model/offer_model.dart';

class OfferService {
  final Dio _dio = Dio();

  Future<List<OfferModel>> fetchOffers() async {
    final response = await _dio.get(
      'https://zamzaam.onrender.com/offers/',
      queryParameters: {
        'skip': 0,
        'limit': 100,
      },
    );

    final List data = response.data;
    return data.map((e) => OfferModel.fromJson(e)).toList();
  }
}
