import 'package:effective_mobile_test/ui/common/general_dialog.dart';
import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:effective_mobile_test/ui/common/widgets/rounded_container.dart';
import 'package:effective_mobile_test/ui/common/widgets/text_widgets.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/bloc/plane_tickets_bloc.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/widgets/country_selected_elements.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/widgets/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

final List<TextInputFormatter> listFormatters = [
  FilteringTextInputFormatter.allow(
    RegExp(r'[а-яА-Я1-9 ]'),
  ),
];

class PlaneTicketsPage extends StatefulWidget {
  static String routePath = '/plane-tickets';

  const PlaneTicketsPage({super.key});

  @override
  State<PlaneTicketsPage> createState() => _PlaneTicketsPageState();
}

class _PlaneTicketsPageState extends State<PlaneTicketsPage> {
  late final PlaneTicketsBloc _bloc;

  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _whereController = TextEditingController();

  @override
  void initState() {
    _bloc = PlaneTicketsBloc(
      context.read(),
      context.read(),
    )..add(InitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
            child: BlocBuilder<PlaneTicketsBloc, PlaneTicketsState>(
              builder: (context, state) {
                _fromController.text = _bloc.state.stringFrom ?? '';

                return state.stringWhere != null && state.stringWhere != ''
                    ? CountrySelectedElements(
                        fromController: _fromController,
                        whereController: _whereController,
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Title1(
                              'Поиск дешевых\nавиабилетов',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 34),
                            RoundedContainer(
                              widget: RoundedContainer(
                                padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                                addBoxShadow: true,
                                color: AppColors.grey4,
                                widget: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset('assets/icons/magnifier.svg'),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: _fromController,
                                            inputFormatters: listFormatters,
                                            decoration: const InputDecoration(
                                              hintText: 'Откуда - Москва',
                                            ),
                                            onChanged: _onChangedFrom,
                                          ),
                                          const Divider(),
                                          TextField(
                                            controller: _whereController,
                                            readOnly: true,
                                            inputFormatters: listFormatters,
                                            decoration: const InputDecoration(
                                              hintText: 'Куда - Турция',
                                            ),
                                            onChanged: _onChangedWhere,
                                            onTap: () => _onTapWhere.call(context: context),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 34),
                            const Title1('Музыкально отлететь'),
                            const SizedBox(height: 12),
                            if (state.offersList != null) ...{
                              SizedBox(
                                height: 250,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final offer = state.offersList!.offers[index];
                                    return OfferCard(
                                      imgPath: setImgPath(index),
                                      title: offer.title,
                                      price: offer.price.value,
                                      town: offer.town,
                                    );
                                  },
                                  separatorBuilder: (_, __) => const SizedBox(width: 67),
                                  itemCount: state.offersList!.offers.length,
                                ),
                              ),
                            },
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  String setImgPath(int index) {
    return switch (index) {
      0 => 'assets/image/beach.png',
      1 => 'assets/image/socrat_lera.png',
      2 => 'assets/image/album.png',
      int() => '',
    };
  }

  void _onChangedFrom(String changedText) {
    _bloc.add(ChangedFromEvent(changedText));
  }

  void _onTapWhere({
    required BuildContext context,
  }) {
    _bloc.add(const ToggleModalEvent(true));

    showModalDialog(
      context,
      _fromController,
      _whereController,
      _bloc,
    );
  }

  void _onChangedWhere(String changedText) {
    // _bloc.add(ChangedWhereEvent(changedText));
  }
}
