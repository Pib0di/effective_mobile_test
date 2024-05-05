import 'package:dio/dio.dart';
import 'package:effective_mobile_test/core/models/offers_list.dart';
import 'package:effective_mobile_test/core/models/tickets.dart';
import 'package:effective_mobile_test/core/models/tickets_offers.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET('00727197-24ae-48a0-bcb3-63eb35d7a9de')
  Future<OffersList> getOffersList();

  @GET('3424132d-a51a-4613-b6c9-42b2d214f35f')
  Future<TicketsOffers> getTicketsOffersList();

  @GET('2dbc0999-86bf-4c08-8671-bac4b7a5f7eb')
  Future<Tickets> getTicketsList();
}
