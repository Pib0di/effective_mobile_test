import 'package:collection/collection.dart';
import 'package:effective_mobile_test/core/extensions.dart';
import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:effective_mobile_test/ui/common/widgets/rounded_container.dart';
import 'package:effective_mobile_test/ui/common/widgets/text_widgets.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/bloc/plane_tickets_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketRecommendations extends StatelessWidget {
  const TicketRecommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: AppColors.grey5,
      widget: BlocBuilder<PlaneTicketsBloc, PlaneTicketsState>(
        builder: (context, state) {
          return Column(
            children: [
              const Title2('Прямые рельсы'),
              const SizedBox(height: 8),
              state.ticketsOffers == null
                  ? const CircularProgressIndicator()
                  : Column(
                      children: state.ticketsOffers!.ticketsOffers
                          .mapIndexed(
                            (index, e) => Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RoundedContainer(
                                      radius: 100,
                                      padding: const EdgeInsets.all(12),
                                      widget: const SizedBox(),
                                      color: index == 0
                                          ? AppColors.red
                                          : index == 1
                                              ? AppColors.blue
                                              : index == 2
                                                  ? AppColors.white
                                                  : Colors.orangeAccent,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Title3(
                                                e.title,
                                                fontStyle: FontStyle.italic,
                                              ),
                                              const Spacer(),
                                              Title3(
                                                '${e.price.value.withSpaces()} ₽ ',
                                                color: AppColors.blue,
                                                fontStyle: FontStyle.italic,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 16,
                                                color: AppColors.blue,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Title3(
                                            e.timeRange.join('  '),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                              ],
                            ),
                          )
                          .toList(),
                    ),
            ],
          );
        },
      ),
    );
  }
}
