import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';



@injectable
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void save({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  void getSave(String test, String test1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    test1 = prefs.getString(test) ?? "";
  }

}
