import 'package:flutter/material.dart';
import '../../services/mock_data_service.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_button.dart';
import 'church_details_screen.dart';

class ChurchesScreen extends StatelessWidget {
  const ChurchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final churches = MockDataService.igrejas;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: churches.length,
      itemBuilder: (context, index) {
        final church = churches[index];
        return CustomCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(church.nome, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on, size: 14, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(church.cidade, style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 12),
              Text(church.descricao, maxLines: 2, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  label: 'Ver detalhes',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChurchDetailsScreen(church: church),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
