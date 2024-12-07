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

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
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
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_emailController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                      title: Text('Error'),
                      content: Text('Need to implement'),
                    ),
                  );
                } else {
                  Map<String, dynamic> data = {
                    'email': _emailController.text,
                  };
                  sendData('https://lab12.requestcatcher.com', data);
                }
              },
              child: const Text('Reset Password'),
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
