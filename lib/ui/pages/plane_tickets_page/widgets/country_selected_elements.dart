import 'package:effective_mobile_test/ui/common/date_time_format.dart';
import 'package:effective_mobile_test/ui/common/general_dialog.dart';
import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:effective_mobile_test/ui/common/widgets/rounded_container.dart';
import 'package:effective_mobile_test/ui/common/widgets/text_widgets.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/bloc/plane_tickets_bloc.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/plane_tickets_page.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/widgets/ticket_recommendations.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/widgets/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountrySelectedElements extends StatefulWidget {
  final TextEditingController fromController;
  final TextEditingController whereController;

  const CountrySelectedElements({
    required this.fromController,
    required this.whereController,
    super.key,
  });

  @override
  State<CountrySelectedElements> createState() => _CountrySelectedElementsState();
}

class _CountrySelectedElementsState extends State<CountrySelectedElements> {
  late final PlaneTicketsBloc bloc;

  @override
  void initState() {
    bloc = context.read<PlaneTicketsBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaneTicketsBloc, PlaneTicketsState>(
      builder: (context, state) {
        if (state.isTicketScreen) {
          return TicketScreen(bloc: bloc);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 47),
            RoundedContainer(
              padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
              addBoxShadow: true,
              color: const Color(0xFF2F3035),
              widget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: widget.fromController,
                                inputFormatters: listFormatters,
                                decoration: const InputDecoration(
                                  hintText: 'Откуда - Москва',
                                ),
                                onChanged: _onChangedFrom,
                              ),
                            ),
                            InkWell(
                              onTap: _onSwapTap,
                              child: const Icon(Icons.swap_vert),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: widget.whereController,
                                readOnly: true,
                                inputFormatters: listFormatters,
                                decoration: const InputDecoration(
                                  hintText: 'Куда - Турция',
                                ),
                                onChanged: _onChangedWhere,
                                onTap: () => _onTapWhere.call(context: context),
                              ),
                            ),
                            InkWell(onTap: () {}, child: const Icon(Icons.close)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 13),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final now = DateTime.now();
                      await showDatePicker(
                        locale: const Locale('ru'),
                        context: context,
                        initialDate: bloc.state.departureDate,
                        firstDate: now,
                        lastDate: DateTime(2025),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.add),
                        Title3(
                          'обратно',
                          fontStyle: FontStyle.italic,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () async {
                      final now = DateTime.now();
                      final newDate = await showDatePicker(
                        locale: const Locale('ru'),
                        context: context,
                        initialDate: bloc.state.departureDate,
                        firstDate: now,
                        lastDate: DateTime(2025),
                      );
                      if (newDate != null) {
                        bloc.add(SetDepartureDateEvent(newDate));
                      }
                    },
                    child: Row(
                      children: [
                        Title3(
                          '${bloc.state.departureDate.d} ${bloc.state.departureDate.MMM}',
                          fontStyle: FontStyle.italic,
                        ),
                        Title3(
                          ', ${bloc.state.departureDate.E}',
                          fontStyle: FontStyle.italic,
                          color: AppColors.grey6,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.person),
                        Title3(
                          '1, экноном',
                          fontStyle: FontStyle.italic,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(Icons.add),
                        Title3(
                          'фильтры',
                          fontStyle: FontStyle.italic,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const TicketRecommendations(),
            const SizedBox(height: 23),
            ElevatedButton(
              onPressed: () {
                bloc.add(const SetScreenEvent(true));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2261BC),
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Title3(
                'Посмотреть все билеты',
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        );
      },
    );
  }

  void _onSwapTap() {
    final temp = bloc.state.stringFrom;

    bloc
      ..add(ChangedFromEvent(bloc.state.stringWhere!))
      ..add(ChangedWhereEvent(temp!));

    widget.fromController.text = bloc.state.stringWhere!;
    widget.whereController.text = temp;
  }

  void _onChangedFrom(String changedText) {
    // _bloc.add(ChangedFromEvent(changedText));
  }

  void _onChangedWhere(String changedText) {
    // _bloc.add(ChangedWhereEvent(changedText));
  }

  void _onTapWhere({
    required BuildContext context,
  }) {
    bloc.add(const ToggleModalEvent(true));

    showModalDialog(
      context,
      widget.fromController,
      widget.whereController,
      bloc,
    );
  }
}
