import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:effective_mobile_test/ui/common/widgets/rounded_container.dart';
import 'package:effective_mobile_test/ui/common/widgets/text_widgets.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/bloc/plane_tickets_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCity extends StatelessWidget {
  const ListCity({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: const Color(0xFF2F3035),
      widget: Column(
        children: [
          ListTile(
            title: const Title3('Стамбул'),
            onTap: () {
              context.read<PlaneTicketsBloc>().add(const ChangedWhereEvent('Стамбул'));
            },
            subtitle: const Title4(
              'Популярное направление',
              color: AppColors.grey5,
            ),
            leading: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  'assets/image/beach.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Title3('Сочи'),
            onTap: () {
              context.read<PlaneTicketsBloc>().add(const ChangedWhereEvent('Сочи'));
            },
            subtitle: const Title4(
              'Популярное направление',
              color: AppColors.grey5,
            ),
            leading: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  'assets/image/stambul.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Title3('Пхукет'),
            onTap: () {
              context.read<PlaneTicketsBloc>().add(const ChangedWhereEvent('Пхукет'));
            },
            subtitle: const Title4(
              'Популярное направление',
              color: AppColors.grey5,
            ),
            leading: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  'assets/image/sochi.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
