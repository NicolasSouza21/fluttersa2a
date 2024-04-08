import 'package:flutter/material.dart';
import 'package:sa2/Model/user.dart';
import 'package:sa2/Utils/database_helper.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper(); // Criação da instância do DatabaseHelper

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Register'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              final username = _usernameController.text.trim();
              final password = _passwordController.text.trim();
              final user = User(username: username, password: password);
              await _databaseHelper.insertUser(user); // Utiliza a instância existente do DatabaseHelper
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Cadastro realizado com sucesso!')),
              );
              Navigator.pop(context);
            },
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}
