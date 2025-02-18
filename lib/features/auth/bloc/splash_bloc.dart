import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(DisplaySplash()) {
    on<SplashEvent>((event, emit) {});
  }

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: invalid_use_of_visible_for_testing_member
    emit(UnRegistered());
  }
}
