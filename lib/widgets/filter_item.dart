import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

import '../screens/filters.dart';

class FilterItem extends ConsumerWidget {
  const FilterItem({ required this.title, required this.subTitle, required this.filter, super.key,});

  final String title;
  final String subTitle;
  // final bool filterSet;
  // final void Function(bool) setFilter;
  final Filter filter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifierRef = ref.watch(filtersProvider.notifier);
    final filters = ref.watch(filtersProvider);
    return SwitchListTile(
      value: filters[filter]!,
      onChanged: (isChecked){
        notifierRef.setFilter(filter, isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 30, right: 30),
    );
  }
}
