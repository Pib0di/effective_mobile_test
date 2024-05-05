import 'package:json_annotation/json_annotation.dart';

part 'tickets.g.dart';

@JsonSerializable(createToJson: false)
class Tickets {
  final List<Ticket> tickets;

  Tickets({
    required this.tickets,
  });

  factory Tickets.fromJson(Map<String, dynamic> json) => _$TicketsFromJson(json);
}

@JsonSerializable(createToJson: false)
class Ticket {
  final int id;
  final String? badge;
  final Price price;
  @JsonKey(name: 'provider_name')
  final String providerName;
  final String company;
  final Departure departure;
  final Arrival arrival;
  @JsonKey(name: 'has_transfer')
  final bool hasTransfer;
  @JsonKey(name: 'has_visa_transfer')
  final bool hasVisaTransfer;
  final Luggage luggage;
  @JsonKey(name: 'hand_luggage')
  final HandLuggage handLuggage;
  @JsonKey(name: 'is_returnable')
  final bool isReturnable;
  @JsonKey(name: 'is_exchangable')
  final bool isExchangable;

  Ticket({
    required this.id,
    required this.badge,
    required this.price,
    required this.providerName,
    required this.company,
    required this.departure,
    required this.arrival,
    required this.hasTransfer,
    required this.hasVisaTransfer,
    required this.luggage,
    required this.handLuggage,
    required this.isReturnable,
    required this.isExchangable,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
}

@JsonSerializable(createToJson: false)
class Price {
  final int value;

  Price({
    required this.value,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
}

@JsonSerializable(createToJson: false)
class Departure {
  final String town;
  final DateTime date;
  final String airport;

  Departure({
    required this.town,
    required this.date,
    required this.airport,
  });

  factory Departure.fromJson(Map<String, dynamic> json) => _$DepartureFromJson(json);
}

@JsonSerializable(createToJson: false)
class Arrival {
  final String town;
  final DateTime date;
  final String airport;

  Arrival({
    required this.town,
    required this.date,
    required this.airport,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => _$ArrivalFromJson(json);
}

@JsonSerializable(createToJson: false)
class Luggage {
  @JsonKey(name: 'has_luggage')
  final bool hasLuggage;
  final Price? price;

  Luggage({
    required this.hasLuggage,
    required this.price,
  });

  factory Luggage.fromJson(Map<String, dynamic> json) => _$LuggageFromJson(json);
}

@JsonSerializable(createToJson: false)
class HandLuggage {
  @JsonKey(name: 'has_hand_luggage')
  final bool hasHandLuggage;
  final String? size;

  HandLuggage({
    required this.hasHandLuggage,
    required this.size,
  });

  factory HandLuggage.fromJson(Map<String, dynamic> json) => _$HandLuggageFromJson(json);
}
