import 'package:flutter/material.dart';

import '../widget/drawercontent.dart';

class FilterScreen extends StatefulWidget {

  final Function setFilter;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var _isGlutenfree = false;
  var _isVegetarian = false;
  var _isVegan = false;

    @override
  void initState() {
    _isGlutenfree  = widget.currentFilters['gluten'];
    _isVegetarian  = widget.currentFilters['vegetarian'];
    _isVegan  = widget.currentFilters['vegan'];
    super.initState();
  }


  Widget _buildSwtichTile(
      {String title, String description, bool val, Function updataData}) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      subtitle: Text(description),
      value: val,
      onChanged: updataData,
    );
  }

        

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenfree,
                'vegetarian': _isVegetarian,
                'vegan': _isVegan,
              };
              print('=====> $selectedFilters');
              widget.setFilter(selectedFilters);
            },
          ),
        ],
      ),
      drawer: DrawerContent(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('Meal Selection'),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwtichTile(
                title: 'Glutten Free',
                description: 'only Glutten free meals',
                val: _isGlutenfree,
                updataData: (updateVal) {
                  setState(() {
                    _isGlutenfree = updateVal;
                  });
                },
              ),
              _buildSwtichTile(
                title: 'Vegetarian',
                description: 'only vegetarian meals',
                val: _isVegetarian,
                updataData: (updateVal) {
                  setState(() {
                    _isVegetarian = updateVal;
                  });
                },
              ),
              _buildSwtichTile(
                title: 'Vegan',
                description: 'only Vegan meals',
                val: _isVegan,
                updataData: (updateVal) {
                  setState(() {
                    _isVegan = updateVal;
                  });
                  
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
