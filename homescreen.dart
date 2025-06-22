import 'package:flutter/material.dart';
import 'details.dart';
class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> allCategories = [
    {'icon': Icons.health_and_safety,'label':'CPR'},
    {'icon': Icons.local_hospital, 'label': 'Bleeding'},
    {'icon': Icons.local_fire_department, 'label': 'Burns'},
    {'icon': Icons.coronavirus, 'label': 'Allergies'},
    {'icon': Icons.warning, 'label': 'Poisoning'},
    {'icon': Icons.pets, 'label': 'Bites'},
    {'icon': Icons.healing, 'label': 'Injuries'},
    {'icon': Icons.air, 'label': 'Respiratory'},
    {'icon': Icons.favorite, 'label': 'Heart'},
    {'icon':Icons.broken_image, 'label':'Fracture'}
    
  ];

  List<Map<String, dynamic>> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    filteredCategories = List.from(allCategories);

    _searchController.addListener(() {
      String query = _searchController.text.toLowerCase();
      setState(() {
        filteredCategories = allCategories
            .where((cat) =>
                cat['label'].toString().toLowerCase().contains(query))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.health_and_safety,
                          color: Colors.purple),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Stay Safe\nAct Fast!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: "Search categories...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (filteredCategories.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text("No results found."),
                    ),
                  )
                else
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredCategories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 3 / 2.5,
                    ),
                    itemBuilder: (context, index) {

                      return InkWell(
                        onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailsPage(
                                  title: filteredCategories[index]['label'],
                                  imagePath: 'assets/logo.jpg',
                                ),
                              ),
                            );
                          },
                        borderRadius: BorderRadius.circular(12),
                        splashColor: Colors.grey,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(filteredCategories[index]['icon'],
                                  size: 40, color: Colors.purple),
                              SizedBox(height: 8),
                              Text(
                                filteredCategories[index]['label'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: ''),
        ],
      ),
    );
  }
}
