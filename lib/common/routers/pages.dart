part of routers;

abstract class RoutePages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];
  //所有路由路径
  static final List<GetPage> pages = [
    GetPage(
      name: RouteNames.systemSplashRoute,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.systemWelcomeRoute,
      page: () => const WelcomePage(),
    ),
    GetPage(
      name: RouteNames.mainRoute,
      page: () => const MainPage(),
      customTransition: RouteTransition(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RouteNames.homeRoute,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteNames.patternRoute,
      page: () => const PatternPage(),
    ),
    GetPage(
      name: RouteNames.messageRoute,
      page: () => const MessagePage(),
    ),
    GetPage(
      name: RouteNames.myRoute,
      page: () => const MyPage(),
    ),
    GetPage(
      name: RouteNames.mySystemRoute,
      page: () => const SystemPage(),
    ),

    // 样式 =============================
    GetPage(
      name: RouteNames.stylesIndexRoute,
      page: () => const StylesIndexPage(),
    ),
    GetPage(
      name: RouteNames.stylesTextRoute,
      page: () => const TextPage(),
    ),
    GetPage(
      name: RouteNames.stylesIconRoute,
      page: () => const IconPage(),
    ),
    GetPage(
      name: RouteNames.stylesImageRoute,
      page: () => const ImagePage(),
    ),
    GetPage(
      name: RouteNames.stylesButtonsRoute,
      page: () => const ButtonsPage(),
    ),
    GetPage(
      name: RouteNames.stylesInputsRoute,
      page: () => const InputsPage(),
    ),
    GetPage(
      name: RouteNames.stylesTextFormRoute,
      page: () => const TextFormPage(),
    ),
    GetPage(
      name: RouteNames.stylesToastLoadingRoute,
      page: () => const ToastLoadingPage(),
    ),
    GetPage(
      name: RouteNames.stylesPinRoute,
      page: () => const PinPage(),
    ),
    GetPage(
      name: RouteNames.systemLoginRoute,
      page: () => const LoginPage(),
    ),
  ];
}
