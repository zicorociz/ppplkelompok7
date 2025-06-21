// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:stay_place/helpers/localizations/app_localization_delegate.dart';
import 'package:stay_place/helpers/localizations/language.dart';
import 'package:stay_place/helpers/services/auth_services.dart'; // <-- IMPORT BARU
import 'package:stay_place/helpers/services/navigation_service.dart';
import 'package:stay_place/helpers/storage/local_storage.dart';
import 'package:stay_place/helpers/theme/app_notifire.dart';
import 'package:stay_place/helpers/theme/app_style.dart';
import 'package:stay_place/helpers/theme/theme_customizer.dart';
import 'package:stay_place/routes.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  // Pastikan semua binding Flutter siap
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  // Inisialisasi LocalStorage dan tunggu sampai selesai.
  // Ini akan memanggil `AuthService.loadUserFromStorage()` di dalamnya.
  await LocalStorage.init();

  // Inisialisasi service lain
  AppStyle.init();
  await ThemeCustomizer.init();

  runApp(ChangeNotifierProvider<AppNotifier>(
    create: (context) => AppNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (_, notifier, ___) {
        // ========== LOGIKA PENENTUAN RUTE AWAL ==========
        String initialRoute;
        if (AuthService.isLoggedIn) {
          // Jika sudah login, cek perannya
          if (AuthService.loggedInUser.value!.isAdmin()) {
            initialRoute = '/admin/dashboard'; // Arahkan admin ke dashboardnya
          } else {
            initialRoute = '/home'; // Arahkan client ke home
          }
        } else {
          // Jika belum login, arahkan ke halaman login
          initialRoute = '/auth/login';
        }
        // ================================================

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeCustomizer.instance.theme,
          navigatorKey: NavigationService.navigatorKey,
          initialRoute: initialRoute, // <-- GUNAKAN RUTE YANG SUDAH DITENTUKAN
          getPages: getPageRoute(),
          builder: (context, child) {
            NavigationService.registerContext(context);
            return Directionality(
                textDirection: AppTheme.textDirection,
                child: child ?? Container());
          },
          localizationsDelegates: [
            AppLocalizationsDelegate(context),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: Language.getLocales(),
        );
      },
    );
  }
}
