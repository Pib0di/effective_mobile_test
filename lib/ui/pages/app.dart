import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:effective_mobile_test/ui/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Авиабилеты',
      theme: theme,
      routerConfig: router,
      localizationsDelegates: const [
        DefaultCupertinoLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', ''),
      ],
      builder: (context, child) {
        return child!;
        // return MultiBlocProvider(
        //   providers: [],
        //   child: child!,
        // );
      },
    );
  }
}
