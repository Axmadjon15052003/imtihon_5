import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/route/routes.dart';
import 'features/authentication/presentation/login/login_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>AuthenticationBloc()),


    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productive',
      // theme: AppTheme.darkTheme(),
      // theme: AppBarTheme.,
      navigatorKey: _navigatorKey,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    ),
  );
}
