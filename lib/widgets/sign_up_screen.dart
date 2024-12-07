import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'sign_in_screen.dart';


Future<void> sendData(String url, Map<String, dynamic> data) async {
  try {
    final dio = Dio();
    final response = await dio.post(url, data: data);
    print('Response: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/flutter.png',
              height: 100,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isEmpty ||
                    _usernameController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text('Error'),
                      content: Text('Need to implement'),
                    ),
                  );
                } else {
                  // Створюємо дані для реєстрації
                  Map<String, dynamic> data = {
                    'name': _nameController.text,
                    'username': _usernameController.text,
                    'password': _passwordController.text,
                  };
                  sendData('https://lab12.requestcatcher.com', data);
                }
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
