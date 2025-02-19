import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/features/auth/models/user_model.dart';
import 'package:shopping_app/features/utils/app_texts.dart';

class AuthMethods {
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
    } catch (e) {}
  }
}
