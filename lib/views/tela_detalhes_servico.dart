import 'package:flutter/material.dart';
import 'tela_historico_carro.dart';
import 'tela_inserir_atendimento.dart';

class DetalhesServicoPage extends StatefulWidget {
  final Map<String, dynamic> servico;

  const DetalhesServicoPage({super.key, required this.servico});

  @override
  State<DetalhesServicoPage> createState() => _DetalhesServicoPageState();
}

class _DetalhesServicoPageState extends State<DetalhesServicoPage> {
  bool _mostrarServicos = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Back'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Edit'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Onyx XL',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Chevrolet',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoColumn('Matrícula', 'A345G5'),
                  _buildInfoColumn('Quilometragem', '25756'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoColumn('Data de ingresso', '24/08/2026'),
                  _buildInfoColumn('Data rev. final', '-- / -- / 2026'),
                ],
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoricoPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.history),
                label: const Text('Histórico'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              _buildTabBar(),
              const SizedBox(height: 20),
              if (_mostrarServicos) ...[
                const Text(
                  'Lista de Servicios pendentes',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildServiceItem(
                  'Lavagem',
                  'Lavar com quilboa e detergente',
                  'Última modificación por: Rafael Alonso - 31/09/2025',
                  true,
                ),
                const Divider(),
                _buildServiceItem(
                  'Polimento',
                  'Lavar com quilboa e detergente',
                  '',
                  false,
                ),
              ] else ...[
                const Text(
                  'Itens adicionados',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                _buildItemAdicionado(
                  'Óleo de motor',
                  'R\$ 250,00',
                  '2 unidades',
                ),
                const Divider(),
                _buildItemAdicionado(
                  'Filtro de ar',
                  'R\$ 120,00',
                  '1 unidade',
                ),
                const Divider(),
                _buildItemAdicionado(
                  'Pastilha de freio',
                  'R\$ 350,00',
                  '1 conjunto',
                ),
              ],
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Total a ser pago (\$)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '12570.00',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE53E3E),
            foregroundColor: Colors.white,
          ),
          child: const Text('Ir para revision'),
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _mostrarServicos = true;
              });
            },
            child: Container(
              height: 40,
              color: _mostrarServicos ? const Color(0xFF6B7280) : Colors.white,
              alignment: Alignment.center,
              child: Text(
                'Servicios',
                style: TextStyle(
                  color: _mostrarServicos ? Colors.white : Colors.black,
                  fontWeight: _mostrarServicos ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _mostrarServicos = false;
              });
            },
            child: Container(
              height: 40,
              color: !_mostrarServicos ? const Color(0xFF6B7280) : Colors.white,
              alignment: Alignment.center,
              child: Text(
                'Itens adicionados',
                style: TextStyle(
                  color: !_mostrarServicos ? Colors.white : Colors.black,
                  fontWeight: !_mostrarServicos ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceItem(
      String title, String description, String modificationInfo, bool isChecked) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (value) {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        if (modificationInfo.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              modificationInfo,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
      ],
    );
  }
  
  Widget _buildItemAdicionado(String nome, String preco, String quantidade) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              nome,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              preco,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFE53E3E),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          quantidade,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}