// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:mk_academy/core/notification_services/notification.dart';
import 'package:sports/core/utils/app_localizations.dart';
import 'package:sports/core/locale/locale_cubit.dart';
import 'package:sports/core/utils/cache_helper.dart';
import 'package:sports/core/utils/colors.dart';
import 'package:sports/core/utils/routs.dart';
import 'package:sports/core/utils/services_locater.dart';
import 'package:sports/core/utils/styles.dart';
import 'package:sports/features/auth/data/repos/login_repo/login_repo.dart';
import 'package:sports/features/auth/presentation/view-model/login_cubit/login_cubit.dart';
import 'package:sports/features/home/data/repos/home_repo.dart';
import 'package:sports/features/home/presentation/views-model/get_dropDown_items/get_drop_down_items_cubit.dart';
import 'package:sports/features/home/presentation/views-model/get_form/get_form_cubit.dart';

import 'features/auth/presentation/views/login/login_page.dart';
import 'features/home/presentation/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocatorServices();
  // await Firebase.initializeApp();
  await CacheHelper.init();
  // await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocaleCubit()..getSaveLanguage()),
        BlocProvider(
            create: (context) => GetFormCubit(
                  getit.get<HomeRepo>(),
                )..fetchForm("255")),
        BlocProvider(
            create: (context) => GetDropDownItemsCubit(getit.get<HomeRepo>())),
        BlocProvider(create: (context) => LoginCubit(getit.get<LoginRepo>()))
      ],
      child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
            supportedLocales: const [
              Locale("en"),
              Locale("ar"),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocal, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocal != null &&
                    deviceLocal.languageCode == locale.languageCode) {
                  return deviceLocal;
                }
              }
              return supportedLocales.first;
            },
            title: 'MK Academy',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: AppColors.backgroundColor,
                  scrolledUnderElevation: 0,
                  centerTitle: true,
                  elevation: 0,
                  titleTextStyle: Styles.textStyle18
                      .copyWith(color: AppColors.backgroundColor)),
              fontFamily: "cocon-next-arabic",
              scaffoldBackgroundColor: AppColors.backgroundColor,
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.primaryColors),
              useMaterial3: true,
            ),
            initialRoute: CacheHelper.getData(key: 'token') == null
                ? LoginPage.routeName
                : HomePage.routeName,
            routes: Routes.routes,
          );
        },
      ),
    );
  }
}
