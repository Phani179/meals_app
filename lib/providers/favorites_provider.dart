import 'package:riverpod/riverpod.dart';

import 'package:meals_app/models/meal.dart';

class FavoritesProvider extends StateNotifier<List<Meal>>
{
  FavoritesProvider() : super([]);

  String toggleMealFavoriteStatus(Meal meal)
  {
    final isFavorite = state.contains(meal);

    if(isFavorite)
      {
        state = state.where((mealItem) => mealItem.id != meal.id).toList();
        return 'Meal removed as a Favorite';
      }
    else
      {
        state = [...state, meal];
        return 'Meal added as a Favorite.';
      }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoritesProvider, List<Meal>>((ref) => FavoritesProvider());