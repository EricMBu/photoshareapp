import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';
import 'package:photoshare/application/bindings/app_bindings.dart';
import 'package:photoshare/presentation/themes/app_theme.dart';
import 'package:photoshare/presentation/views/home/home_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Photoshare',
      home: const HomeView(),
      initialBinding: const AppBindings(),
      theme: AppTheme().theme,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
