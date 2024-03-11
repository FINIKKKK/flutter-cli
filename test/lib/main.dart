import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:template/constants/colors.dart';
import 'package:template/pages/home.dart';
import 'package:template/pages/register.dart';
import 'package:flutter/services.dart';
import 'package:template/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() async {
  // Только в вертикальном положении
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Подключаем хранилище (redux)
  final store = Store<AppState>(
    appReducers,
    initialState: AppState.initialState(),
  );

  // Подключаем поддержку env
  await dotenv.load(fileName: ".env");

  // Запуcк приложения
  runApp(TemplateProject(store: store));
}

/*
  TemplateProject ----------------
 */
class TemplateProject extends StatelessWidget {
  final Store<AppState> store;

  TemplateProject({required this.store, super.key}) {
    // Стилизация statusBar и navigationBar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white));
  }

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    // Следим за изменениями lang
    return StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, Locale>(
            converter: (store) => store.state.accountState.lang,
            builder: (context, locale) {
              return MaterialApp(
                // Убрать debug banner
                debugShowCheckedModeBanner: false,

                // Тема
                theme: ThemeData(primaryColor: AppColors.blue),

                // Основной экран
                home: const RegisterScreen(),

                // Список маршрутов
                routes: {
                  '/register': (context) => const RegisterScreen(),
                  '/home': (context) => HomeScreen(),
                },

                // Локализация (языки)
                locale: store.state.accountState.lang,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                // Какие языки поддерживает приложение
                supportedLocales: const [
                  Locale('ru'),
                  Locale('en'),
                ],
              );
            }));
  }
}
