import 'package:flutter/material.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_button.dart';
import '../../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Avatar
          const CircleAvatar(
            radius: 60,
            backgroundColor: AppTheme.accentGold,
            child: Icon(Icons.person, size: 80, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            'João da Silva',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Text('Membro Ativo', style: TextStyle(color: Colors.grey)),

          const SizedBox(height: 32),

          // User Info
          _buildInfoRow(context, Icons.location_city, 'Cidade', 'São Paulo - SP'),
          _buildInfoRow(context, Icons.church, 'Igreja', 'Igreja Paz das Nações'),
          _buildInfoRow(context, Icons.groups, 'Células que participa', 'Célula Shalom, Célula Esperança'),

          const SizedBox(height: 32),

          // Action Buttons
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              label: 'Editar Perfil',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Funcionalidade de edição (Simulação)')),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                foregroundColor: Colors.red,
              ),
              child: const Text('Sair da Conta'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: CustomCard(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.primaryWine),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
