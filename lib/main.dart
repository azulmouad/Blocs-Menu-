import 'package:demo/logic/blocs/menu/menu_bloc.dart';
import 'package:demo/repository/api/api.dart';
import 'package:demo/screens/splash.dart';
import 'package:demo/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp(
    menuApi: MenuApi(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.menuApi});
  final MenuApi menuApi;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuBloc>(
          create: (BuildContext context) => MenuBloc(menuApi),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
