import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/screens/filters.dart';

import 'meals_provider.dart';

class FiltersProvider extends StateNotifier<Map<Filter, bool>> {
  FiltersProvider()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  void setFilter(Filter filter, bool isChecked) {
    // state[filter] = isChecked;      // Not allowed.
    state = {
      ...state,
    filter : isChecked,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProvider, Map<Filter, bool>>(
  (ref) => FiltersProvider(),
);

final filteredMealsProvider = Provider((ref) {
  final selectedFilters = ref.watch(filtersProvider);
  final meals = ref.watch(mealsProvider);

  final availableMeals = meals.where((meal){
    if(selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree)
    {
      return false;
    }
    if(selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree)
    {
      return false;
    }
    if(selectedFilters[Filter.vegetarian]! && !meal.isVegetarian)
    {
      return false;
    }
    if(selectedFilters[Filter.vegan]! && !meal.isVegan)
    {
      return false;
    }
    return true;
  }).toList();

  return availableMeals;
});
