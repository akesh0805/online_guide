import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:local_auth/local_auth.dart';

class HomePage extends StatefulWidget {
  static final id = "Test Page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LocalAuthentication _auth = LocalAuthentication();

  Future<void> _registerAndSaveBiometrics() async {
    try {
      // Регистрация пользователя
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Аутентификация с помощью биометрии
      bool authenticated = await _auth.authenticate(
        localizedReason: 'Пожалуйста, подтвердите свою личность',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (authenticated) {
        // Сохранение данных пользователя в Firestore
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
          'email': _emailController.text,
          'biometricAuth': true, // Признак того, что пользователь использует биометрию
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Регистрация и биометрия успешно завершены')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Аутентификация с биометрией не удалась')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: ${e.toString()}')),
      );
    }
  }

  Future<void> _signInWithBiometrics() async {
    try {
      // Аутентификация с помощью биометрии
      bool authenticated = await _auth.authenticate(
        localizedReason: 'Пожалуйста, подтвердите свою личность для входа',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );

      if (authenticated) {
        // Выполнение входа в Firebase после успешной биометрической аутентификации
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Успешный вход')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Аутентификация с биометрией не удалась')),
        );
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase + Biometric Auth')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerAndSaveBiometrics,
              child: Text('Register & Save Biometrics'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signInWithBiometrics,
              child: Text('Sign In with Biometrics'),
            ),
          ],
        ),
      ),
    );
  }
}
