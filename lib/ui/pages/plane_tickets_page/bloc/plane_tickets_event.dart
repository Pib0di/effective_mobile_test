part of 'plane_tickets_bloc.dart';

sealed class PlaneTicketsEvent {
  const PlaneTicketsEvent();
}

class InitEvent extends PlaneTicketsEvent {}

class ChangedFromEvent extends PlaneTicketsEvent {
  final String changedText;

  const ChangedFromEvent(this.changedText);
}

class ChangedWhereEvent extends PlaneTicketsEvent {
  final String changedText;

  const ChangedWhereEvent(this.changedText);
}

class ToggleModalEvent extends PlaneTicketsEvent {
  final bool isOpen;

  const ToggleModalEvent(this.isOpen);
}

class SetDepartureDateEvent extends PlaneTicketsEvent {
  final DateTime dateTime;

  const SetDepartureDateEvent(this.dateTime);
}

class SetScreenEvent extends PlaneTicketsEvent {
  final bool isTicketScreen;

  const SetScreenEvent(this.isTicketScreen);
}
