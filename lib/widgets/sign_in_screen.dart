import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'sign_up_screen.dart';
import 'reset_password_screen.dart';

Future<void> sendData(String url, Map<String, dynamic> data) async {
  try {
    final dio = Dio();
    final response = await dio.post(url, data: data);
    print('Response: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
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
                if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text('Error'),
                      content: Text('Need to implement'),
                    ),
                  );
                } else {
                  Map<String, dynamic> data = {
                    'username': _usernameController.text,
                    'password': _passwordController.text,
                  };
                  sendData('https://lab12.requestcatcher.com', data);
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResetPasswordScreen(),
                ),
              ),
              child: const Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              ),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
