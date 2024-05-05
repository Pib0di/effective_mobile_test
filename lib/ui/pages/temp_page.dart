import 'package:effective_mobile_test/ui/common/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class TempPage extends StatelessWidget {
  static const routePath = '/temp';
  final String? text;

  const TempPage({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temp Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Title1(
          'Экран: \n$text',
        ),
      ),
    );
  }
}
