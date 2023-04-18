import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/bloc/theme/theme_bloc.dart';
import 'package:test_drive/bloc/theme/theme_state.dart';
import 'package:test_drive/screens/theme_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState estado) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: estado.isDark == false
                ? ThemeData(
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.blueGrey,
                    ),
                    floatingActionButtonTheme:
                        const FloatingActionButtonThemeData(
                      backgroundColor: Colors.blueGrey,
                    ),
                    
                  ) :
                  ThemeData(
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Color.fromARGB(255, 12, 48, 78),
                    ),
                    floatingActionButtonTheme:
                        const FloatingActionButtonThemeData(
                      backgroundColor: Color.fromARGB(255, 12, 48, 78),
                    ),
                    scaffoldBackgroundColor: Colors.black
                  ),
            home: const ThemeScreen(),
          );
      }
      )
    );
  }
}
