import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/filter_item.dart';
import 'package:meals_app/widgets/main_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({required this.currentFilters, super.key});
  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilterSet = false;
  bool _lactoseFreeFilterSet  = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  void glutenFreeFilterSet(bool isChecked) {
    setState(() {
      _glutenFreeFilterSet = isChecked;
    });
  }

  void lactoseFreeFilterSet(bool isChecked) {
    setState(() {
      _lactoseFreeFilterSet = isChecked;
    });
  }

  void vegetarianFilterSet(bool isChecked) {
    setState(() {
      _vegetarianFilterSet = isChecked;
    });
  }

  void veganFilterSet(bool isChecked) {
    setState(() {
      _veganFilterSet = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (String identifier) {
      //     Navigator.pop(context);
      //     if (identifier == 'meals') {
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(
            context,
            {
              Filter.glutenFree : _glutenFreeFilterSet,
              Filter.lactoseFree : _lactoseFreeFilterSet,
              Filter.vegetarian : _vegetarianFilterSet,
              Filter.vegan : _veganFilterSet
            },
          );
          return false;
        },
        child: Column(
          children: [
            FilterItem(
              title: 'Gluten-Free',
              subTitile: 'Only include gluten-free meals',
              filterSet: _glutenFreeFilterSet,
              setFilter: glutenFreeFilterSet,
            ),
            FilterItem(
              title: 'Lactose-Free',
              subTitile: 'Only include lactose-free meals',
              filterSet: _lactoseFreeFilterSet,
              setFilter: lactoseFreeFilterSet,
            ),
            FilterItem(
              title: 'Vegetarian',
              subTitile: 'Only include vegetarian meals',
              filterSet: _vegetarianFilterSet,
              setFilter: vegetarianFilterSet,
            ),
            FilterItem(
              title: 'Vegan',
              subTitile: 'Only include vegan meals',
              filterSet: _veganFilterSet,
              setFilter: veganFilterSet,
            ),
          ],
        ),
      ),
    );
  }
}
