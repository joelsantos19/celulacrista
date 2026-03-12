import 'package:flutter/material.dart';
import '../../services/mock_data_service.dart';
import '../../widgets/custom_card.dart';
import '../../theme/app_theme.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Anúncios'),
              Tab(text: 'Mural Anônimo'),
            ],
            labelColor: AppTheme.primaryWine,
            indicatorColor: AppTheme.primaryWine,
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildAdsMural(),
                _buildAnonymousMural(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdsMural() {
    final ads = MockDataService.posts.where((p) => !p.isAnonymous).toList();
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: ads.length,
      itemBuilder: (context, index) {
        final ad = ads[index];
        return CustomCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ad.titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 8),
              Text(ad.conteudo),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.person, size: 14, color: AppTheme.primaryWine),
                  const SizedBox(width: 4),
                  Text(ad.autor ?? 'Desconhecido', style: const TextStyle(color: AppTheme.primaryWine, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnonymousMural() {
    final anonymous = MockDataService.posts.where((p) => p.isAnonymous).toList();
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: anonymous.length,
      itemBuilder: (context, index) {
        final post = anonymous[index];
        return CustomCard(
          color: AppTheme.accentGold.withOpacity(0.1),
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Icon(Icons.favorite, color: Colors.red, size: 16),
              const SizedBox(height: 8),
              Expanded(
                child: Center(
                  child: Text(
                    post.conteudo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
                  ),
                ),
              ),
              const Text('— Anônimo', style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        );
      },
    );
  }
}
