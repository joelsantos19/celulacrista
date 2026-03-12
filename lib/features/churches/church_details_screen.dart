import 'package:flutter/material.dart';
import '../../models/igreja.dart';
import '../../widgets/section_header.dart';
import '../../widgets/custom_card.dart';
import '../../theme/app_theme.dart';

class ChurchDetailsScreen extends StatelessWidget {
  final Igreja church;

  const ChurchDetailsScreen({super.key, required this.church});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(church.nome),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner/Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.primaryWine,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Icon(Icons.church, color: AppTheme.accentGold, size: 64),
                  const SizedBox(height: 16),
                  Text(
                    church.nome,
                    style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    church.cidade,
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Avisos da Semana
            const SectionHeader(title: 'Avisos da Semana'),
            ...church.avisos.map((aviso) => ListTile(
                  leading: const Icon(Icons.info_outline, color: AppTheme.primaryWine),
                  title: Text(aviso),
                )),

            const SizedBox(height: 24),

            // Palavra Pós-Culto
            const SectionHeader(title: 'Palavra Pós-Culto'),
            CustomCard(
              color: AppTheme.accentGold.withOpacity(0.1),
              child: Text(
                church.palavraPosCulto,
                style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 24),

            // Pedidos de Ajuda
            const SectionHeader(title: 'Pedidos de Ajuda'),
            ...church.pedidosAjuda.map((pedido) => CustomCard(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.volunteer_activism, color: Colors.redAccent),
                      const SizedBox(width: 12),
                      Expanded(child: Text(pedido, style: const TextStyle(fontWeight: FontWeight.bold))),
                      TextButton(onPressed: () {}, child: const Text('Ajudar')),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
