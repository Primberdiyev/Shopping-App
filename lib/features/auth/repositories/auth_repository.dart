import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/features/auth/models/user_model.dart';
import 'package:shopping_app/features/utils/app_texts.dart';

class AuthRepository {
  Future<void> signUp(UserModel userModel) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email ?? "",
        password: userModel.password ?? "",
      );
      final User? user = data.user;

      await FirebaseFirestore.instance
          .collection(AppTexts.users)
          .doc(user?.uid)
          .set(
            userModel.toJson(),
            SetOptions(merge: true),
          );
    } catch (e) {
      log('error on sign up $e');
      throw Exception(AppTexts.errorMessageSignUp);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      final data = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = data.user;
      if (user == null) {
        throw Exception(AppTexts.errorUser);
      }
    } catch (e) {
      log('error on sign up $e');
      throw Exception(AppTexts.errorMessageSignUp);
    }
  }

  bool isValidEmailProvider(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!emailRegex.hasMatch(email)) {
      return false;
    }

    List<String> allowedProviders = [
      'gmail.com',
      'yahoo.com',
      'outlook.com',
      'icloud.com',
    ];

    String domain = email.split('@').last;

    return allowedProviders.contains(domain);
  }
}
