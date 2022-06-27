part of routers;

abstract class RoutePages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];
  //所有路由路径
  static final List<GetPage> pages = [
    GetPage(
      name: RouteNames.splashRoute,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.mainRoute,
      page: () => const MainPage(),
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
  ];
}
