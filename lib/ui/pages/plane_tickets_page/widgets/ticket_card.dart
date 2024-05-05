import 'package:effective_mobile_test/core/extensions.dart';
import 'package:effective_mobile_test/core/models/tickets.dart';
import 'package:effective_mobile_test/ui/common/date_time_format.dart';
import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:effective_mobile_test/ui/common/widgets/rounded_container.dart';
import 'package:effective_mobile_test/ui/common/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  const TicketCard({required this.ticket, super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime1 = ticket.departure.date;
    final dateTime2 = ticket.arrival.date;

    final difference = dateTime2.difference(dateTime1);
    final hoursDifference = (difference.inMinutes / 60).toStringAsFixed(1);

    return RoundedContainer(
      widget: Stack(
        clipBehavior: Clip.none,
        children: [
          if (ticket.badge != null) ...{
            Positioned(
              top: -26,
              left: -16,
              child: RoundedContainer(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                color: AppColors.blue,
                widget: Text(ticket.badge!),
              ),
            ),
          },
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Title1('${ticket.price.value.withSpaces()} ₽'),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const RoundedContainer(
                    radius: 100,
                    padding: EdgeInsets.all(12),
                    widget: SizedBox(),
                    color: Color(0xFFFF5E5E),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Title3(ticket.departure.date.Hm),
                                Title3(ticket.departure.airport),
                              ],
                            ),
                            const Column(
                              children: [
                                Title3(' – '),
                              ],
                            ),
                            Column(
                              children: [
                                Title3(ticket.arrival.date.Hm),
                                Title3(ticket.arrival.airport),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Title3(
                            '$hoursDifferenceч в пути${ticket.hasTransfer ? '/Без пересадок' : ''}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
