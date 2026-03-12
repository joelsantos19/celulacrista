import 'package:flutter/material.dart';
import '../../services/mock_data_service.dart';
import '../../widgets/custom_card.dart';
import '../../theme/app_theme.dart';
import '../../models/daily_word.dart';

class DailyWordScreen extends StatefulWidget {
  const DailyWordScreen({super.key});

  @override
  State<DailyWordScreen> createState() => _DailyWordScreenState();
}

class _DailyWordScreenState extends State<DailyWordScreen> {
  String selectedCategory = 'Todos';
  late List<DailyWord> filteredWords;
  int currentIndex = 0;

  final List<String> categories = [
    'Todos',
    'Ansiedade',
    'Fé',
    'Família',
    'Esperança',
    'Perdão',
  ];

  @override
  void initState() {
    super.initState();
    _filterWords();
  }

  void _filterWords() {
    setState(() {
      if (selectedCategory == 'Todos') {
        filteredWords = MockDataService.dailyWords;
      } else {
        filteredWords = MockDataService.dailyWords
            .where((w) => w.categoria == selectedCategory)
            .toList();
      }
      currentIndex = 0;
    });
  }

  void _nextWord() {
    setState(() {
      if (filteredWords.isNotEmpty) {
        currentIndex = (currentIndex + 1) % filteredWords.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Categories Filter
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            children: categories.map((cat) {
              final isSelected = selectedCategory == cat;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  label: Text(cat),
                  selected: isSelected,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        selectedCategory = cat;
                        _filterWords();
                      });
                    }
                  },
                  selectedColor: AppTheme.primaryWine,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: filteredWords.isEmpty
                ? const Center(child: Text('Nenhuma palavra encontrada nesta categoria.'))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCard(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          children: [
                            const Icon(Icons.format_quote, size: 48, color: AppTheme.accentGold),
                            const SizedBox(height: 16),
                            Text(
                              filteredWords[currentIndex].versiculo,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontStyle: FontStyle.italic,
                                    color: AppTheme.primaryWine,
                                  ),
                            ),
                            const SizedBox(height: 24),
                            const Divider(),
                            const SizedBox(height: 16),
                            Text(
                              filteredWords[currentIndex].explicacao,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 16),
                            Chip(
                              label: Text(filteredWords[currentIndex].categoria),
                              backgroundColor: AppTheme.accentGold.withOpacity(0.2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton.icon(
                        onPressed: _nextWord,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Próxima Palavra'),
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
