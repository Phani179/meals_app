import 'package:flutter/material.dart';
import 'package:meals_app/providers/dummy_data.dart';
import 'package:meals_app/screens/category.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

import '../modals/meal.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _pageIndex = 0;
  List<Meal> favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectedIndex(index) {
    setState(() {
      _pageIndex = index;
    });
  }

  void _showFeedback(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(message),
      ),
    );
  }

  void _toggleFavoriteMealsStatus(Meal meal) {
    final isExists = favoriteMeals.contains(meal);

    if (isExists) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      _showFeedback('Meal is no longer a Favourite.');
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
      _showFeedback('Marked as Favourite!');
    }
  }

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters,),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String screenTitle = 'Categories';
    final availableMeals = dummyMeals.where((meal){
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree)
        {
          return false;
        }
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree)
        {
          return false;
        }
      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian)
        {
          return false;
        }
      if(_selectedFilters[Filter.vegan]! && !meal.isVegan)
        {
          return false;
        }
      return true;
    }).toList();
    Widget activeScreen = CategoryScreen(
      availableMeals: availableMeals,
      toggleFfavoriteMealsStatus: _toggleFavoriteMealsStatus,
    );

    if (_pageIndex == 1) {
      activeScreen = MealsScreen(
        meals: favoriteMeals,
        toggleFfavoriteMealsStatus: _toggleFavoriteMealsStatus,
      );
      screenTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
