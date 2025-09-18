import 'package:dsa_taller/views/tela_SignUp.dart';
import 'package:dsa_taller/views/tela_adicionar_estoque.dart';
import 'package:dsa_taller/views/tela_buscar_veiculo.dart';
import 'package:dsa_taller/views/tela_estoque.dart';
import 'package:dsa_taller/views/tela_historico_carro.dart';
import 'package:dsa_taller/views/tela_revisao_final.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BuscarVeiculoPage(),
    );
  }
}
