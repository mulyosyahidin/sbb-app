import 'package:app/core/utils/logger_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_login_service.g.dart';

class GoogleLoginService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInWithGoogle() async {
    try {
      // 1. Authenticate
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      // 2. Cek authorization yang sudah ada dulu
      const scopes = ['email', 'profile'];
      GoogleSignInClientAuthorization? authorization = await googleUser
          .authorizationClient
          .authorizationForScopes(scopes);

      // 3. Kalau belum ada, minta ke user
      authorization ??= await googleUser.authorizationClient.authorizeScopes(
        scopes,
      );

      // 4. Buat Firebase credential
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authorization.accessToken,
        idToken: googleAuth.idToken,
      );

      // 5. Sign in ke Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? user = userCredential.user;

      if (user != null) {
        return await user.getIdToken();
      }

      return null;
    } on GoogleSignInException catch (e, stackTrace) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        LoggerUtil.info('Google Sign-In cancelled by user');
        return null;
      }
      LoggerUtil.error('Google Sign-In exception: ${e.code} - ${e.description}');
      FirebaseCrashlytics.instance.recordError(
        e,
        stackTrace,
        reason: 'GoogleAuthService.signInWithGoogle - GoogleSignInException',
      );
      rethrow;
    } catch (e, stackTrace) {
      LoggerUtil.error('Error during Google Sign-In: $e');
      FirebaseCrashlytics.instance.recordError(
        e,
        stackTrace,
        reason: 'GoogleAuthService.signInWithGoogle',
      );
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}

@riverpod
GoogleLoginService googleLoginService(Ref ref) {
  return GoogleLoginService();
}
