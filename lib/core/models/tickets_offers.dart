import 'package:json_annotation/json_annotation.dart';

part 'tickets_offers.g.dart';

@JsonSerializable(createToJson: false)
class TicketsOffers {
  @JsonKey(name: 'tickets_offers')
  final List<Offer> ticketsOffers;

  TicketsOffers({
    required this.ticketsOffers,
  });

  factory TicketsOffers.fromJson(Map<String, dynamic> json) => _$TicketsOffersFromJson(json);
}

@JsonSerializable(createToJson: false)
class Offer {
  final int id;
  final String title;
  @JsonKey(name: 'time_range')
  final List<String> timeRange;
  final Price price;

  Offer({
    required this.id,
    required this.title,
    required this.timeRange,
    required this.price,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}

@JsonSerializable(createToJson: false)
class Price {
  final int value;

  Price({
    required this.value,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}
