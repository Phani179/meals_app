import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  const FilterItem({ required this.title, required this.subTitile, required this.filterSet, required this.setFilter, super.key});

  final String title;
  final String subTitile;
  final bool filterSet;
  final void Function(bool) setFilter;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterSet,
      onChanged: setFilter,
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        subTitile,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 30, right: 30),
    );
  }
}
