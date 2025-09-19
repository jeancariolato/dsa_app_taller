import 'package:flutter/material.dart';

class RevisaoFinalPage extends StatelessWidget {
  const RevisaoFinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Revisión final',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black54),
            onPressed: () {
              print('Botão fechar pressionado');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Onix XL',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Matricula: AYU345',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const Divider(height: 40, thickness: 1),

            const Text(
              'Servicios ejecutados:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildListItem(title: 'Lavaje - Básico', price: '\$7500'),
            const SizedBox(height: 12),
            _buildListItem(title: 'Polimento', price: '\$9000'),
            const SizedBox(height: 12),
            _buildListItem(title: 'Troca de pneu', price: '\$1500'),
            const SizedBox(height: 24),

            const Text(
              'Itens usados del stock:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildListItem(title: 'Oleo', price: '\$9600'),
            const SizedBox(height: 12),
            _buildListItem(title: 'Farol', price: '\$1275'),

            const Divider(height: 40, thickness: 1),

            const Text(
              'Total a ser pago',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '\$39500',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('Botão Concluir servicio pressionado');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Concluir servicio'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem({required String title, required String price}) {
    return Row(
      children: [
        const Icon(Icons.check, color: Colors.black87, size: 20),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
        const Spacer(),
        Text(
          price,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
