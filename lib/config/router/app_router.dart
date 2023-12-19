import 'package:go_router/go_router.dart';
import 'package:custom_form/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/register', routes: [
  GoRoute(
    path: '/register',
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    path: '/theme-changer',
    name: ThemeChangerScreen.name,
    builder: (context, state) => const ThemeChangerScreen(),
  ),
]);
