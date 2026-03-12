import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'features/home/home_screen.dart';
import 'features/daily_word/daily_word_screen.dart';
import 'features/cells/cells_screen.dart';
import 'features/culture/culture_screen.dart';
import 'features/community/community_screen.dart';
import 'features/churches/churches_screen.dart';
import 'features/profile/profile_screen.dart';

import 'features/auth/login_screen.dart';

void main() {
  runApp(const CelulasApp());
}

class CelulasApp extends StatelessWidget {
  const CelulasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Células',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/main': (context) => const MainNavigationShell(),
        '/daily_word': (context) => const DailyWordScreen(),
        '/cells': (context) => const CellsScreen(),
        '/culture': (context) => const CultureScreen(),
        '/community': (context) => const CommunityScreen(),
        '/churches': (context) => const ChurchesScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _selectedIndex = 0;
  PageController? _pageController;

  final List<Widget> _screens = [
    const HomeScreen(),
    const DailyWordScreen(),
    const CellsScreen(),
    const CultureScreen(),
    const CommunityScreen(),
    const ChurchesScreen(),
    const ProfileScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Palavra do Dia',
    'Células',
    'Cultura Cristã',
    'Comunidade',
    'Igrejas',
    'Perfil',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController?.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Garantir inicialização do controller (útil em Hot Reload)
    _pageController ??= PageController(initialPage: _selectedIndex);

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Palavra'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Células'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Cultura'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Comunidade'),
          BottomNavigationBarItem(icon: Icon(Icons.church), label: 'Igrejas'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
