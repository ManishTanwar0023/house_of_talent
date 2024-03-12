import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<Map<String, dynamic>> _items = [
    {'name': 'John', 'image': 'assets/images/LOGO 1.jpg'},
    {'name': 'Alice', 'image': 'assets/images/LOGO 1.jpg'},
    {'name': 'Bob', 'image': 'assets/images/LOGO 1.jpg'},
    {'name': 'Emma', 'image': 'assets/images/LOGO 1.jpg'},
    {'name': 'David', 'image': 'assets/images/LOGO 1.jpg'},
  ];

  List<Map<String, dynamic>> _filteredItems = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems.addAll(_items);
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = _items
          .where((item) => item['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  child: Icon(Icons.search),
                  onTap: () {},
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    _filterItems(value);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _filteredItems[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(item['image']),
            ),
            title: Text(item['name']),
            onTap: () {
              // Handle onTap event here
              print('Tapped on ${item['name']}');
            },
          );
        },
      ),
    );
  }
}
