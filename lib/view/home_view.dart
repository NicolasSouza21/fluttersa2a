import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sa2/utils/database_helper.dart';
import 'package:sa2/view/register_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> _deleteUser(BuildContext context) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username'); // Obtém o nome de usuário das preferências
    if (username == null) {
      throw Exception('Nome de usuário não encontrado nas preferências');
    }

    final databaseHelper = DatabaseHelper();
    await databaseHelper.deleteUser(username);

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/authentication.db');
    if (await file.exists()) {
      await file.delete();
    }

    await prefs.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Usuário excluído com sucesso'),
        duration: Duration(seconds: 2),
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
      _logout(context);
    });
  } catch (e) {
    print('Erro ao excluir usuário: $e');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro ao excluir usuário. Tente novamente.'),
      ),
    );
  }
}


  void _logout(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => RegisterView()), // Substitua "LoginScreen()" pelo nome da tela de login
    (route) => false,
  );
}


