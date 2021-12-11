import 'dart:io';
import 'package:centro_actividades/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  //mio
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email);
  }

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      setLoading(true);
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      setLoading(false);
      return _userFromFirebase(credential.user);
    } on SocketException {
      setLoading(false);
      setMessage('Ups! Parece que te has quedado sin internet');
    } catch (e) {
      setMessage(e.toString());
      print(e);
      setLoading(false);
    }
    notifyListeners();
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }
  //// Creacion de usuario aun no necesaria :/

  // Future<User?> createUserWithEmailAndPassword(
  //   String email,
  //   String password,
  // ) async {
  //   final credential = await _firebaseAuth.createUserWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );

  //   return _userFromFirebase(credential.user);
  // }
}
