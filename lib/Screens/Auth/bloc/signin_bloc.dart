import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:testapp/Data/Repository/repository.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) async {
      try {
        if (event is UserSignInEvent) {
          emit(Loading());
          int? value =
              await Repository.signIn(event.userEmail, event.userPassword);
          if (value == 201) {
            emit(SigninSuccess());
          } else if (value == 401) {
            emit(SignInUnauthorized());
          }
        } else if (event is GoolgeSignInEvent) {
          GoogleSignInAccount? userData = await Repository.googleSignIn();
          if (userData != null) {
            emit(GoogleSignInSuccess(userData));
          }
        }
      } catch (e) {
        emit(Error(e.toString()));
      }
    });
  }
}
