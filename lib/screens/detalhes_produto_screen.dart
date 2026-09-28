import 'package:flutter/material.dart';
import '../models/produto.dart';

class DetalhesProdutoScreen extends StatelessWidget {
  final Produto produto;

  const DetalhesProdutoScreen({
    super.key,
    required this.produto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F2),

      appBar: AppBar(
        title: const Text(
          'Detalhes',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,

                    decoration: BoxDecoration(
                      color: const Color(0xFFE9EDE4),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Center(
                      child: Text(
                        produto.icone,
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    produto.nome,
                    textAlign: TextAlign.center,

                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF252525),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    produto.categoria,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF858585),
                    ),
                  ),

                  const SizedBox(height: 22),

                  Text(
                    'R\$ ${produto.preco.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B7658),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

