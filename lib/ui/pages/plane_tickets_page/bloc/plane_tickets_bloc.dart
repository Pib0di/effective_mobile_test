import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:effective_mobile_test/core/api/rest_client.dart';
import 'package:effective_mobile_test/core/models/offers_list.dart';
import 'package:effective_mobile_test/core/models/tickets.dart';
import 'package:effective_mobile_test/core/models/tickets_offers.dart';
import 'package:effective_mobile_test/core/services/storage_service.dart';
import 'package:equatable/equatable.dart';

part 'plane_tickets_event.dart';
part 'plane_tickets_state.dart';

class PlaneTicketsBloc extends Bloc<PlaneTicketsEvent, PlaneTicketsState> {
  final StorageService _storageService;
  final RestClient _rest;

  PlaneTicketsBloc(this._storageService, this._rest)
      : super(PlaneTicketsInitial(departureDate: DateTime.now())) {
    on<InitEvent>(_onInitEvent);

    on<SetScreenEvent>(_onSetScreenEvent);
    on<SetDepartureDateEvent>(_onSetDepartureDateEvent);
    on<ChangedFromEvent>(_onChangedFromEvent);
    on<ChangedWhereEvent>(_onChangedWhereEvent);
    on<ToggleModalEvent>(_onToggleModalEvent);
  }
  void _onSetScreenEvent(
    SetScreenEvent event,
    Emitter<PlaneTicketsState> emit,
  ) {
    emit(state.copyWith(
      isTicketScreen: event.isTicketScreen,
    ),);
  }

  void _onSetDepartureDateEvent(
    SetDepartureDateEvent event,
    Emitter<PlaneTicketsState> emit,
  ) {
    emit(state.copyWith(
      departureDate: event.dateTime,
    ),);
  }

  Future<void> _onInitEvent(InitEvent event, Emitter<PlaneTicketsState> emit) async {
    final stringFromWhere = _storageService.stringFromWhere;
    final offersList = await _rest.getOffersList();
    final tickets = await _rest.getTicketsList();
    final ticketsOffers = await _rest.getTicketsOffersList();

    emit(state.copyWith(
      stringFrom: stringFromWhere,
      offersList: offersList,
      tickets: tickets,
      ticketsOffers: ticketsOffers,
    ),);
  }

  void _onChangedFromEvent(ChangedFromEvent event, Emitter<PlaneTicketsState> emit) {
    _storageService.setStringWhere(event.changedText);
    emit(
      state.copyWith(
        stringFrom: event.changedText,
      ),
    );
  }

  void _onChangedWhereEvent(ChangedWhereEvent event, Emitter<PlaneTicketsState> emit) {
    emit(state.copyWith(
      stringWhere: event.changedText,
    ),);
  }

  void _onToggleModalEvent(ToggleModalEvent event, Emitter<PlaneTicketsState> emit) {
    emit(state.copyWith(
      modalIsOpen: true,
    ),);
  }
}
