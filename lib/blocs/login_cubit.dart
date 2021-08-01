import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/endPoints.dart';
import 'package:shop_app/data/models/login_model.dart';
import 'package:shop_app/data/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  String errorMessage = "";
  LoginModel ?loginModel;
  void userLogin({required String email, required String password}) {

    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {"email": email, "password": password})
        .then((value) {
      print(value.data);
       loginModel=LoginModel.fromjson(value.data);

      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));

    });
  }

  bool isPassword=true;
  void changePasswordVisibilty(){
    isPassword=!isPassword;
    emit(LoginChangePassVisibiltyState());
  }
}
