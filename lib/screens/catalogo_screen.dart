import 'package:flutter/material.dart';

import '../models/produto.dart';
import '../widgets/produto_card.dart';
import 'detalhes_produto_screen.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Produto> _produtos = [
    const Produto(
      id: '1',
      nome: 'Smartphone',
      preco: 4500.00,
      categoria: 'Eletrônicos',
      icone: '📱',
    ),
    const Produto(
      id: '2',
      nome: 'Notebook',
      preco: 8900.00,
      categoria: 'Informática',
      icone: '💻',
    ),
    const Produto(
      id: '3',
      nome: 'Fone Bluetooth',
      preco: 1200.00,
      categoria: 'Áudio',
      icone: '🎧',
    ),
    const Produto(
      id: '4',
      nome: 'Smartwatch',
      preco: 2300.00,
      categoria: 'Wearables',
      icone: '⌚',
    ),
    const Produto(
      id: '5',
      nome: 'Teclado',
      preco: 450.00,
      categoria: 'Periféricos',
      icone: '⌨️',
    ),
  ];

  void adicionarProduto() {
    setState(() {
      _produtos.add(
        Produto(
          id: DateTime.now().toString(),
          nome: 'Novo Produto',
          preco: 99.90,
          categoria: 'Novidades',
          icone: '🛍️',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F2),

      appBar: AppBar(
        title: const Text(
          'Catálogo',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),

            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 7,
            ),

            decoration: BoxDecoration(
              color: const Color(0xFFE9EDE4),
              borderRadius: BorderRadius.circular(20),
            ),

            child: Text(
              '${_produtos.length} itens',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF59634B),
              ),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 100,
        ),

        itemCount: _produtos.length,

        itemBuilder: (context, index) {
          final produto = _produtos[index];

          return Dismissible(
            key: Key(produto.id),

            direction: DismissDirection.endToStart,

            background: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),

              decoration: BoxDecoration(
                color: const Color(0xFFB85C5C),
                borderRadius: BorderRadius.circular(16),
              ),

              alignment: Alignment.centerRight,

              padding: const EdgeInsets.only(
                right: 25,
              ),

              child: const Icon(
                Icons.delete_outline,
                color: Colors.white,
              ),
            ),

            onDismissed: (direction) {
              setState(() {
                _produtos.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Produto removido'),
                  duration: Duration(seconds: 1),
                ),
              );
            },

            child: ProdutoCard(
              produto: produto,

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetalhesProdutoScreen(
                        produto: produto,
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: adicionarProduto,

        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

