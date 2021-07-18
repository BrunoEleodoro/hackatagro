import 'package:flutter/material.dart';
import 'package:hackatagro/pages/cadastro/cadastro_page.dart';
import 'package:hackatagro/pages/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:hackatagro/pages/login/login_page.dart';

class AppRoute {
  factory AppRoute() => _instance;

  AppRoute._private();

  ///#region ROUTE NAMES
  /// -----------------
  static const String routeHome = '/home';
  static const String routeLogin = '/login';
  static const String routeRoot = '/login';
  static const String routeCadastro = '/cadastro';

  ///#endregion

  static final AppRoute _instance = AppRoute._private();

  static AppRoute get I => _instance;

  /// Create local provider
  // MaterialPageRoute<dynamic>(
  //             settings: settings,
  //             builder: (_) => AppRoute.createProvider(
  //                 (_) => HomeProvider(),
  //                 HomePage(
  //                   status: settings.arguments as bool,
  //                 )))
  static Widget createProvider<P extends ChangeNotifier>(
    P Function(BuildContext context) provider,
    Widget child,
  ) {
    return ChangeNotifierProvider<P>(
      create: provider,
      builder: (_, __) {
        return child;
      },
    );
  }

  /// Create multi local provider
  // MaterialPageRoute<dynamic>(
  //             settings: settings,
  //             builder: (_) => AppRoute.createProviders(
  //                 <SingleChildWidget>[
  //                     ChangeNotifierProvider<HomeProvider>(
  //                         create: (BuildContext context) => HomeProvider()),
  //                 ],
  //                 HomePage(
  //                   status: settings.arguments as bool,
  //                 )))
  static Widget createProviders(
    List<SingleChildWidget> providers,
    Widget child,
  ) {
    return MultiProvider(
      providers: providers,
      child: child,
    );
  }

  /// App route observer
  final RouteObserver<Route<dynamic>> routeObserver =
      RouteObserver<Route<dynamic>>();

  /// App global navigator key
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Get app context
  BuildContext? get appContext => navigatorKey.currentContext;

  /// Generate route for app here
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeLogin:
        return MaterialPageRoute<dynamic>(
            settings: settings, builder: (_) => LoginPage());
      case routeHome:
        return MaterialPageRoute<dynamic>(
            settings: settings, builder: (_) => HomePage());
      case routeCadastro:
        return MaterialPageRoute<dynamic>(
            settings: settings, builder: (_) => CadastroPage());
      default:
        return null;
    }
  }
}
