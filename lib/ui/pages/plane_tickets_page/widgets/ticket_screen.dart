import 'package:effective_mobile_test/ui/common/date_time_format.dart';
import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:effective_mobile_test/ui/common/widgets/text_widgets.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/bloc/plane_tickets_bloc.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/widgets/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketScreen extends StatelessWidget {
  static String routePath = '/ticket-screen';
  final PlaneTicketsBloc bloc;
  const TicketScreen({
    required this.bloc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaneTicketsBloc, PlaneTicketsState>(
      bloc: bloc,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            ColoredBox(
              color: AppColors.grey2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        bloc.add(const SetScreenEvent(false));
                      },
                      icon: const Icon(Icons.arrow_back_rounded),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Title1('${bloc.state.stringFrom!}-${bloc.state.stringWhere!}'),
                        Title3(
                          '${bloc.state.departureDate.day} ${bloc.state.departureDate.LLLL}, 1 пассажир',
                          color: AppColors.grey6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 34),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (BuildContext context, int index) {
                  final ticket = state.tickets!.tickets[index];
                  return TicketCard(ticket: ticket);
                },
                separatorBuilder: (context, _) => const SizedBox(
                  height: 24,
                ),
                itemCount: state.tickets!.tickets.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
