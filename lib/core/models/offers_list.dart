import 'package:json_annotation/json_annotation.dart';

part 'offers_list.g.dart';

@JsonSerializable(createToJson: false)
class OffersList {
  final List<Offer> offers;

  OffersList({
    required this.offers,
  });

  factory OffersList.fromJson(Map<String, dynamic> json) => _$OffersListFromJson(json);
}

@JsonSerializable(createToJson: false)
class Offer {
  final int id;
  final String title;
  final String town;
  final Price price;

  const Offer(
    this.id,
    this.title,
    this.town,
    this.price,
  );

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}

@JsonSerializable(createToJson: false)
class Price {
  final int value;

  const Price(
    this.value,
  );

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}
