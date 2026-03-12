import 'package:flutter/material.dart';
import '../../services/mock_data_service.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_button.dart';
import '../../theme/app_theme.dart';


class CellsScreen extends StatelessWidget {
  const CellsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Células Próximas'),
              Tab(text: 'Células Online'),
            ],
            labelColor: AppTheme.primaryWine,
            indicatorColor: AppTheme.primaryWine,
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildPhysicalCellsList(context),
                _buildOnlineCellsList(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhysicalCellsList(BuildContext context) {
    final physicalCells = MockDataService.celulas.where((c) => !c.isOnline).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: physicalCells.length,
      itemBuilder: (context, index) {
        final cell = physicalCells[index];
        return CustomCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(cell.nome, style: Theme.of(context).textTheme.titleLarge),
                  Text('${cell.distancia} km', style: const TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 4),
              Text(cell.igreja, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: AppTheme.primaryWine),
                  const SizedBox(width: 8),
                  Text('${cell.diaSemana} às ${cell.horario}'),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Endereço liberado após aprovação do líder',
                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: 'Solicitar participação',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Solicitação enviada ao líder!')),
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

  Widget _buildOnlineCellsList(BuildContext context) {
    final onlineCells = MockDataService.celulas.where((c) => c.isOnline).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: onlineCells.length,
      itemBuilder: (context, index) {
        final cell = onlineCells[index];
        return CustomCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(cell.nome, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(cell.igreja, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.videocam, size: 20, color: AppTheme.primaryWine),
                  const SizedBox(width: 8),
                  Text('${cell.diaSemana} às ${cell.horario}'),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: 'Entrar na reunião',
                  color: Colors.green.shade700,
                  icon: Icons.launch,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Abrindo link: ${cell.linkReuniao}')),
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
