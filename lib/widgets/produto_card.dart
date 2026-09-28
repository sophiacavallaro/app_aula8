import 'package:flutter/material.dart';
import '../models/produto.dart';

class ProdutoCard extends StatelessWidget {
  final Produto produto;
  final VoidCallback? onTap;

  const ProdutoCard({
    super.key,
    required this.produto,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,

                decoration: BoxDecoration(
                  color: const Color(0xFFE9EDE4),
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Center(
                  child: Text(
                    produto.icone,
                    style: const TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      produto.nome,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF252525),
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      produto.categoria,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF858585),
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                'R\$ ${produto.preco.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B7658),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

