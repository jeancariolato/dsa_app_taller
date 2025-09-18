import 'package:flutter/material.dart';

class BuscarVeiculoPage extends StatelessWidget {
  const BuscarVeiculoPage({super.key});

  // Dados mocados para popular a lista, como na imagem.
  final List<Map<String, String>> veiculos = const [
    {
      'carpeta': 'Carpeta C17203',
      'modelo': 'Hilux | Chevrolet',
      'matricula': 'Matricula: A328UL',
    },
    {
      'carpeta': 'Carpeta C17203',
      'modelo': 'Hilux | Chevrolet',
      'matricula': 'Matricula: A328UL',
    },
    {
      'carpeta': 'Carpeta C17203',
      'modelo': 'Hilux | Chevrolet',
      'matricula': 'Matricula: A328UL',
    },
    {
      'carpeta': 'Carpeta C17203',
      'modelo': 'Hilux | Chevrolet',
      'matricula': 'Matricula: A328UL',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black54),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // --- Barra de Busca ---
            TextField(
              decoration: InputDecoration(
                hintText: 'Busca un veiculo...',
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                filled: true,
                fillColor: const Color(0xFFF7F8FA), // Fundo cinza claro
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none, // Sem borda
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Lista de Veículos ---
            Expanded(
              child: ListView.builder(
                itemCount: veiculos.length,
                itemBuilder: (context, index) {
                  final veiculo = veiculos[index];
                  return _buildVehicleCard(
                    carpeta: veiculo['carpeta']!,
                    modelo: veiculo['modelo']!,
                    matricula: veiculo['matricula']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget auxiliar para construir cada card de veículo.
  Widget _buildVehicleCard({
    required String carpeta,
    required String modelo,
    required String matricula,
  }) {
    return GestureDetector(
      onTap: () {
        // Ação ao clicar no card
        print('Card de veículo clicado: $modelo');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F8FA), // Fundo cinza claro do card
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            // Ícone circular
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              // child: Icon(Icons.directions_car, color: Colors.white), // Opcional
            ),
            const SizedBox(width: 16),
            // Textos
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carpeta,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  modelo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  matricula,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
