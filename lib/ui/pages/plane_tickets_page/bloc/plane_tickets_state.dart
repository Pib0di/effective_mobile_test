part of 'plane_tickets_bloc.dart';

class PlaneTicketsState extends Equatable {
  final String? stringFrom;
  final String? stringWhere;
  final OffersList? offersList;
  final bool modalIsOpen;
  final DateTime departureDate;
  final Tickets? tickets;
  final TicketsOffers? ticketsOffers;
  final bool isTicketScreen;

  const PlaneTicketsState({
    required this.departureDate,
    this.stringFrom,
    this.stringWhere,
    this.offersList,
    this.modalIsOpen = false,
    this.tickets,
    this.ticketsOffers,
    this.isTicketScreen = false,
  });

  @override
  List<Object?> get props => [
        stringFrom,
        stringWhere,
        offersList,
        modalIsOpen,
        departureDate,
        tickets,
        ticketsOffers,
        isTicketScreen,
      ];

  PlaneTicketsState copyWith({
    String? stringFrom,
    String? stringWhere,
    OffersList? offersList,
    bool? modalIsOpen,
    DateTime? departureDate,
    Tickets? tickets,
    TicketsOffers? ticketsOffers,
    bool? isTicketScreen,
  }) {
    return PlaneTicketsState(
      stringFrom: stringFrom ?? this.stringFrom,
      stringWhere: stringWhere ?? this.stringWhere,
      offersList: offersList ?? this.offersList,
      modalIsOpen: modalIsOpen ?? this.modalIsOpen,
      departureDate: departureDate ?? this.departureDate,
      tickets: tickets ?? this.tickets,
      ticketsOffers: ticketsOffers ?? this.ticketsOffers,
      isTicketScreen: isTicketScreen ?? this.isTicketScreen,
    );
  }
}

final class PlaneTicketsInitial extends PlaneTicketsState {
  const PlaneTicketsInitial({required super.departureDate});

  @override
  List<Object> get props => [];
}
