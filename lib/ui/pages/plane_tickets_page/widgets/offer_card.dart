import 'package:effective_mobile_test/ui/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfferCard extends StatelessWidget {
  final String imgPath;
  final String title;
  final String town;
  final int price;

  const OfferCard({
    required this.imgPath,
    required this.title,
    required this.town,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Image.asset(
              imgPath,
              fit: BoxFit.cover,
              width: 133,
              height: 133,
            ),),
        const SizedBox(height: 8),
        Title3(title),
        const SizedBox(height: 8),
        Title4(town),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/plane_air.svg'),
            Title4('от $price ₽'),
          ],
        ),
      ],
    );
  }
}
