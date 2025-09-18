import 'package:flutter/material.dart';

class HistoricoPage extends StatelessWidget {
  const HistoricoPage({super.key});

  // Lista de dados mocados para preencher a interface.
  // Em um app real, isso viria de uma API ou banco de dados.
  final List<Map<String, String>> historicoData = const [
    {
      'date': '28 / 09 / 2025',
      'price': '\$ 25573',
      'services': 'Lavaje, polimento, troca de pneu',
    },
    {
      'date': '12 / 10 / 2025',
      'price': '\$ 17800',
      'services': 'Lavaje, polimento, troca de pneu',
    },
    {
      'date': '14 / 11 / 2025',
      'price': '\$ 18650',
      'services': 'Lavaje, polimento, troca de pneu',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cor de fundo geral da tela
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F8FA),
        elevation: 0,
        leading: const BackButton(color: Colors.black54),
        centerTitle: true,
        title: const Text(
          'Historico',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          // --- Barra de Busca ---
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Busca por fecha, matricula ....',
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none, // Sem borda
                ),
              ),
            ),
          ),

          // --- Lista de Histórico ---
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: historicoData.length,
              itemBuilder: (context, index) {
                final item = historicoData[index];
                return _buildHistoryCard(
                  date: item['date']!,
                  price: item['price']!,
                  services: item['services']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Widget auxiliar para construir cada card do histórico.
  Widget _buildHistoryCard({
    required String date,
    required String price,
    required String services,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2.0,
      shadowColor: Colors.black.withOpacity(0.1),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Data
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                // Ícone e Preço
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Detalhes dos Serviços
            const Text(
              'Servicios:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              services,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
