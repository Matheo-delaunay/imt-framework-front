import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/widgets/appbar/appBar.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      body: Column(
        children: [
          TopAppBar(arrowVisible: true, heartVisible: false, title: 'Filter'),
          Expanded(child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Text("Alergens",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
              ),
              Wrap(
                  spacing: 10,
                  children:
                  appState.chipFilterState.entries.map<FilterChip>((entry) =>
                      FilterChip(
                        label: Text(entry.key),
                        onSelected: (bool) {
                          appState.changeChipState(bool, entry.key);
                          },
                        selectedColor: Colors.amber,
                        selected: entry.value,
                      )).toList()
              )
            ],
          ))
        ],
      ),
    );
  }
}
