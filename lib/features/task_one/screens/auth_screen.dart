import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rbf_task/features/task_one/widgets/obsecuring_text_input_formatter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Task One"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email),
                prefixIconColor: _emailFocusNode.hasFocus
                    ? Theme.of(context).colorScheme.primary
                    : null,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: _passwordFocusNode.hasFocus
                    ? Theme.of(context).colorScheme.primary
                    : null,
                border: const OutlineInputBorder(),
              ),
              onFieldSubmitted: (_) {
                Navigator.of(context).pop();
              },
              inputFormatters: [
                ObscuringTextInputFormatter(),
              ],
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                // Add authentication logic here
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
