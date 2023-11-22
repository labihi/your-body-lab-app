import 'package:flutter/material.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(label: 'Home', icon: Icon(Icons.home)),
          //NavigationDestination(label: 'Cerca', icon: Icon(Icons.search)),
          NavigationDestination(label: 'Aree', icon: Icon(Icons.inventory)),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
