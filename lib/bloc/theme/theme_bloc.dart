import 'package:bloc/bloc.dart';
import 'package:test_drive/bloc/theme/theme_state.dart';

abstract class ThemeEvent {}

class LightTheme extends ThemeEvent {}

class DarkTheme extends ThemeEvent {}

class ChangeTheme extends ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
  ThemeBloc() : super(ThemeState(isDark: false)) {
    on<LightTheme>((event, emit) {
      emit(ThemeState(isDark: false));
    });
    on<DarkTheme>((event, emit) {
      emit(ThemeState(isDark: true));
    });
    on<ChangeTheme>(((event, emit) {
      bool newIsDark = state.isDark == false ? true : false;
      emit(ThemeState(isDark: newIsDark));
    }));
  }
}