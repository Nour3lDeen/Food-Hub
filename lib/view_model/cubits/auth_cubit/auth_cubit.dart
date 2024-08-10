import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:restaurant/model/user_model.dart';
import 'package:restaurant/view_model/data/firebase/firebase_keys.dart';
import 'package:restaurant/view_model/data/local/shared_keys.dart';
import 'package:restaurant/view_model/data/local/shared_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  FirebaseFirestore db = FirebaseFirestore.instance;
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController forgetPasswordEmailController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool showPassword = false;

  void changePasswordVisibility() {
    showPassword = !showPassword;
    emit(ChangePasswordVisibilityState());
  }
  void loginClearData() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }
  void signUpClearData() {
    nameController.clear();
    signUpEmailController.clear();
    signUpPasswordController.clear();
  }

  Future<void> createUser(UserModel user) async {
    await db.collection(FirebaseKeys.users).doc(user.uid).set(user.toJson());
  }

  Future<void> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((value) async {
      UserModel user = UserModel(
        name: googleUser.displayName,
        email: googleUser.email,
        uid: value.user?.uid,
      );
      await createUser(user);
      emit(LoginSuccessState());
    });
  }

  Future<void> registerFirebase() async {
    emit(RegisterLoadingState());
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: signUpEmailController.text,
            password: signUpPasswordController.text)
        .then((value) async {
      UserModel user = UserModel(
        name: nameController.text,
        email: signUpEmailController.text,
        uid: value.user?.uid,
      );
      await createUser(user);
      emit(RegisterSuccessState());
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(RegisterErrorState(error.message.toString()));
      }
    });
  }

  Future<void> loginFirebase() async {
    emit(LoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: loginEmailController.text,
            password: loginPasswordController.text)
        .then((value) async {
      SharedHelper.saveData(SharedKeys.uid, value.user?.uid);
      SharedHelper.saveData(SharedKeys.email, value.user?.email);
      await SharedHelper.saveData(
        SharedKeys.userName,
        db
            .collection(FirebaseKeys.users)
            .where(FirebaseKeys.email, isEqualTo: loginEmailController.text)
            .get()
            .then((value) => value.docs[0].data()[FirebaseKeys.name])
            .toString(),
      );
      emit(LoginSuccessState());
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(LoginErrorState(error.message.toString()));
      }
    });
  }

  Future<void> forgetPasswordFirebase() async {
    emit(ForgetPasswordLoadingState());
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: forgetPasswordEmailController.text)
        .then((value) async {
      if (await db
          .collection(FirebaseKeys.users)
          .where(FirebaseKeys.email,
              isEqualTo: forgetPasswordEmailController.text)
          .get()
          .then((value) => value.docs.isNotEmpty)) {
        emit(ForgetPasswordSuccessState());
      } else if (await db
          .collection(FirebaseKeys.users)
          .where(FirebaseKeys.email,
              isEqualTo: forgetPasswordEmailController.text)
          .get()
          .then((value) => value.docs.isEmpty)) {
        emit(ForgetPasswordErrorState('No user found for that email.'));
      }
      return;
    }).catchError((error) async {
      if (await db
          .collection(FirebaseKeys.users)
          .where(FirebaseKeys.email,
              isEqualTo: forgetPasswordEmailController.text)
          .get()
          .then((value) => value.docs.isNotEmpty)) {
        emit(ForgetPasswordSuccessState());
      }
    });
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    SharedHelper.clearData();
  }
}
