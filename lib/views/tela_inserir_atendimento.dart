import 'package:flutter/material.dart';

class InserirAtendimentoPage extends StatefulWidget {
  const InserirAtendimentoPage({super.key});

  @override
  State<InserirAtendimentoPage> createState() => _InserirAtendimentoPageState();
}

class _InserirAtendimentoPageState extends State<InserirAtendimentoPage> {
  bool _isNuevo = true;
  final Map<String, Map<String, bool>> _checklistItems = {
    'Lavagem': {'ok': true, 'pendente': false, 'naoOk': false},
    'Troca de pneu': {'ok': false, 'pendente': true, 'naoOk': false},
    'Polimento': {'ok': false, 'pendente': false, 'naoOk': false},
  };
  
  final TextEditingController _comentarioController = TextEditingController();

  @override
  void dispose() {
    _comentarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Inserir Servicio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTabBar(),
              const SizedBox(height: 20),
              _buildTextField('Marca'),
              _buildTextField('Modelo'),
              _buildTextField('Carpeta'),
              _buildTextField('Kilometraje'),
              const SizedBox(height: 10),
              _buildDateFields(),
              const SizedBox(height: 20),
              const Text(
                'CHECKLIST',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ..._checklistItems.entries.map((entry) => _buildChecklistItem(entry.key, entry.value)),
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
            backgroundColor: const Color(0xFF4A5568),
            foregroundColor: Colors.white,
          ),
          child: const Text('Adicionar servico'),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isNuevo = true;
              });
            },
            child: Container(
              height: 40,
              color: _isNuevo ? const Color(0xFF6B7280) : Colors.white,
              alignment: Alignment.center,
              child: Text(
                'Nuevo',
                style: TextStyle(
                  color: _isNuevo ? Colors.white : Colors.black,
                  fontWeight: _isNuevo ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isNuevo = false;
              });
            },
            child: Container(
              height: 40,
              color: !_isNuevo ? const Color(0xFF6B7280) : Colors.white,
              alignment: Alignment.center,
              child: Text(
                'Ja existe',
                style: TextStyle(
                  color: !_isNuevo ? Colors.white : Colors.black,
                  fontWeight: !_isNuevo ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            isDense: true,
            border: UnderlineInputBorder(),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildDateFields() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fecha de Ingreso',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: const Text(
                  '24/05/2026',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fecha Rev. Final',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: const Text(
                  '-- / -- / --',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChecklistItem(String title, Map<String, bool> status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      status['ok'] = true;
                      status['pendente'] = false;
                      status['naoOk'] = false;
                    });
                  },
                  child: Container(
                    height: 30,
                    color: status['ok']! ? const Color(0xFF6B7280) : Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: status['ok']! ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      status['ok'] = false;
                      status['pendente'] = true;
                      status['naoOk'] = false;
                    });
                  },
                  child: Container(
                    height: 30,
                    color: status['pendente']! ? const Color(0xFF6B7280) : Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      'Pendente',
                      style: TextStyle(
                        color: status['pendente']! ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      status['ok'] = false;
                      status['pendente'] = false;
                      status['naoOk'] = true;
                    });
                  },
                  child: Container(
                    height: 30,
                    color: status['naoOk']! ? const Color(0xFF6B7280) : Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      'Não OK',
                      style: TextStyle(
                        color: status['naoOk']! ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (title == 'Troca de pneu') ...[
            const SizedBox(height: 10),
            TextField(
              controller: _comentarioController,
              decoration: const InputDecoration(
                hintText: 'Escreva um comentário',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ],
        ],
      ),
    );
  }
}