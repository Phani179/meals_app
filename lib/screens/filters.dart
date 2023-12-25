import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/filter_item.dart';

import '../widgets/main_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan, }

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
      ),
      drawer: MainDrawer(
        onSelectScreen: (String identifier) {
          Navigator.pop(context);
          if (identifier == 'meals') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (ctx) => const TabsScreen(),
              ),
            );
          }
        },
      ),
      body: const Column(
        children: [
          FilterItem(
            title: 'Gluten-Free',
            subTitle: 'Only include gluten-free meals',
            filter: Filter.glutenFree,
          ),
          FilterItem(
            title: 'Lactose-Free',
            subTitle: 'Only include lactose-free meals',
            filter: Filter.lactoseFree,
          ),
          FilterItem(
            title: 'Vegetarian',
            subTitle: 'Only include vegetarian meals',
            filter: Filter.vegetarian,
          ),
          FilterItem(
            title: 'Vegan',
            subTitle: 'Only include vegan meals',
            filter: Filter.vegan,
          ),
        ],
      ),
    );
  }
}
