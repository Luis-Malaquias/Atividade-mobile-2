import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_drive/bloc/theme/theme_state.dart';
import 'package:test_drive/bloc/theme/theme_bloc.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mudança de Tema'),
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (BuildContext context, ThemeState state){
                return Image.asset(state.isDark == false ? "images/day.jpg" : "images/night.jpg",);  
              }
            ),
            ElevatedButton(
              onPressed: () {
                ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
                  themeBloc.add(LightTheme());
              },
              child: const Icon(Icons.sunny),
            ),
            ElevatedButton(
              onPressed: () {
                ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
                  themeBloc.add(DarkTheme());
              },
              child: const Icon(Icons.mode_night),
            )
          ],
        ),
  
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
                  themeBloc.add(ChangeTheme());
        },
        tooltip: 'Mudar tema',
        child: const Icon(Icons.change_circle),
      )
    );
  }
}