import 'package:flutter/material.dart';
import '../../services/mock_data_service.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/section_header.dart';
import '../../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dailyWord = MockDataService.dailyWords.first;
    final nextCells = MockDataService.celulas.take(2).toList();
    final highlights = MockDataService.contents.take(2).toList();
    final churchAds = MockDataService.igrejas.first.avisos;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Palavra do Dia Card
          SectionHeader(title: 'Palavra do Dia', onActionPressed: () {}),
          CustomCard(
            color: AppTheme.primaryWine,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dailyWord.versiculo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '- ${dailyWord.categoria}',
                  style: const TextStyle(color: AppTheme.accentGold, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Banner Destaque: Encontro com Cristo
          SectionHeader(title: 'Evento Especial'),
          CustomCard(
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/encontro.png',
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Encontro com Cristo',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Uma experiência transformadora',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 14),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppTheme.accentGold,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '13 - 12',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Próximas Células
          SectionHeader(title: 'Próximas Células', onActionPressed: () {}),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nextCells.length,
              itemBuilder: (context, index) {
                final cell = nextCells[index];
                return Container(
                  width: 250,
                  margin: const EdgeInsets.only(right: 12),
                  child: CustomCard(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cell.nome, style: Theme.of(context).textTheme.titleMedium),
                        Text(cell.igreja, style: Theme.of(context).textTheme.bodySmall),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 14, color: AppTheme.primaryWine),
                            const SizedBox(width: 4),
                            Text('${cell.diaSemana} - ${cell.horario}', style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          // Conteúdo em Destaque
          SectionHeader(title: 'Destaques', onActionPressed: () {}),
          Column(
            children: highlights.map((content) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: CustomCard(
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: Image.network(
                          content.imagemUrl,
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(content.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(content.descricao, maxLines: 1, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          // Avisos das Igrejas
          SectionHeader(title: 'Avisos de Igrejas'),
          ...churchAds.map((ad) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  leading: const Icon(Icons.campaign, color: AppTheme.accentGold),
                  title: Text(ad),
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              )),
        ],
      ),
    );
  }
}
