import 'package:water_delivery/model/offer_model.dart';
import 'package:water_delivery/service/offer_service.dart';

class OfferRepository {
  final OfferService service;

  OfferRepository(this.service);

  Future<List<OfferModel>> getOffers() async {
    return await service.fetchOffers();
  }
}
