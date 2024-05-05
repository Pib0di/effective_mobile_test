import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:effective_mobile_test/ui/common/widgets/rounded_container.dart';
import 'package:effective_mobile_test/ui/common/widgets/text_widgets.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/bloc/plane_tickets_bloc.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/plane_tickets_page.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/widgets/list_city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future showModalDialog(
  BuildContext context,
  TextEditingController fromController,
  TextEditingController whereController,
  PlaneTicketsBloc bloc,
) {
  void showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Заглушка'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Понятно'),
            ),
          ],
        );
      },
    );
  }

  Widget createElement(
    void Function()? onTap,
    String assetName,
    String title,
  ) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(children: [
          SvgPicture.asset(assetName),
          const SizedBox(height: 8),
          Title4(title, textAlign: TextAlign.center, overflow: TextOverflow.clip),
        ],),
      ),
    );
  }

  return showGeneralDialog(
    context: context,
    transitionDuration: Duration.zero,
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      return Material(
        color: AppColors.black,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: RoundedContainer(
              color: AppColors.grey2,
              widget: BlocProvider.value(
                value: bloc,
                child: BlocBuilder<PlaneTicketsBloc, PlaneTicketsState>(
                  bloc: bloc,
                  builder: (context, state) {
                    //убрает ошибку обновления при анимации
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      whereController.text = state.stringWhere ?? '';
                    });

                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16),
                          const SizedBox(
                            height: 5,
                            width: 38,
                            child: RoundedContainer(
                              padding: EdgeInsets.zero,
                              widget: SizedBox(),
                              color: AppColors.grey5,
                            ),
                          ),
                          const SizedBox(height: 24),
                          RoundedContainer(
                            color: const Color(0xFF2F3035),
                            widget: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/plane_air.svg'),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: TextField(
                                        readOnly: true,
                                        controller: fromController,
                                        inputFormatters: listFormatters,
                                        decoration: const InputDecoration(
                                          hintText: 'Откуда - Москва',
                                        ),
                                        onChanged: (changedText) =>
                                            bloc.add(ChangedFromEvent(changedText)),
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset('assets/icons/magnifier.svg'),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: TextField(
                                        controller: whereController,
                                        inputFormatters: listFormatters,
                                        decoration: const InputDecoration(
                                          hintText: 'Куда - Турция',
                                        ),
                                        onChanged: (changedText) =>
                                            bloc.add(ChangedWhereEvent(changedText)),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    InkWell(
                                      onTap: () => bloc.add(const ChangedWhereEvent('')),
                                      child: const Icon(Icons.close),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 8),
                              createElement(
                                  showAlertDialog, 'assets/icons/route.svg', 'Сложный маршрут',),
                              const SizedBox(width: 16),
                              createElement(() {
                                bloc.add(const ChangedWhereEvent('Куда угодно'));
                              }, 'assets/icons/map.svg', 'Куда угодно',),
                              const SizedBox(width: 16),
                              createElement(
                                  showAlertDialog, 'assets/icons/calendar_.svg', 'Выходные',),
                              const SizedBox(width: 16),
                              createElement(
                                  showAlertDialog, 'assets/icons/hot.svg', 'Горячие билеты',),
                              const SizedBox(width: 8),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const ListCity(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
