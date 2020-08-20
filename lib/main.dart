import 'package:Venda_Online_Ui/app/routes/app_pages.dart';
import 'package:Venda_Online_Ui/app/theme/my_theme.dart';
import 'package:Venda_Online_Ui/app/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'app/app_binding.dart';

void main() => runApp(GetMaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: Routes.HOME, //Rota inicial
      theme: appThemeData, //Tema personalizado app
      defaultTransition: Transition.fade, // Transição de telas padrão
      getPages: AppPages
          .pages, // Seu array de navegação contendo as rotas e suas pages
      locale: Locale('pt', 'BR'), // Língua padrão
      translationsKeys:
          AppTranslation.translations, // Suas chaves contendo as traduções<map>
    ));
