import 'package:flutter/material.dart';

class AdicionarEstoquePage extends StatefulWidget {
  const AdicionarEstoquePage({super.key});

  @override
  State<AdicionarEstoquePage> createState() => _AdicionarEstoquePageState();
}

class _AdicionarEstoquePageState extends State<AdicionarEstoquePage> {
  final List<Map<String, dynamic>> _products = [
    {'name': 'Produto X', 'isSelected': false, 'quantity': 1},
    {'name': 'Produto Y', 'isSelected': true, 'quantity': 1},
    {'name': 'Produto W', 'isSelected': false, 'quantity': 1},
    {'name': 'Produto A', 'isSelected': false, 'quantity': 1},
    {'name': 'Produto B', 'isSelected': false, 'quantity': 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black54),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'busca productos en stock...',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8.0),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: product['isSelected'],
                        onChanged: (bool? value) {
                          setState(() {
                            product['isSelected'] = value ?? false;
                          });
                        },
                        activeColor: Colors.red,
                      ),
                      Expanded(
                        child: Text(
                          product['name'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      if (product['isSelected'])
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (product['quantity'] > 1) {
                                    product['quantity']--;
                                  }
                                });
                              },
                              splashRadius: 20,
                            ),
                            Text(
                              '${product['quantity']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  product['quantity']++;
                                });
                              },
                              splashRadius: 20,
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print('Botão Adicionar pressionado');
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
                child: const Text('Adicionar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
