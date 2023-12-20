import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({ required this.onSelectScreen, super.key});

  final void Function(String) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 45,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Cooking up!',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 25,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: (){
              onSelectScreen('meals');
            },
          ),

          ListTile(
            leading: Icon(
              Icons.settings,
              size: 25,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 20,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onTap: (){
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
