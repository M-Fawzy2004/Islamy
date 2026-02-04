import 'package:flutter/material.dart';
import '../widget/custom_search_bar.dart';
import '../widget/recent_surah_card.dart';
import '../widget/surah_list_tile.dart';
import '../widget/home_bottom_nav_bar.dart'; // Import the new widget

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _searchQuery = "";

  final List<Map<String, dynamic>> _allSuras = [
    {
      "nameEn": "Al-Fatiha",
      "nameAr": "الفاتحة",
      "verses": 7,
    },
    {
      "nameEn": "Al-Baqarah",
      "nameAr": "البقرة",
      "verses": 286,
    },
    {
      "nameEn": "Aal-E-Imran",
      "nameAr": "آل عمران",
      "verses": 200,
    },
    {
      "nameEn": "An-Nisa",
      "nameAr": "النساء",
      "verses": 176,
    },
    {
      "nameEn": "Al-Ma'idah",
      "nameAr": "المائدة",
      "verses": 120,
    },
    {
      "nameEn": "Al-An'am",
      "nameAr": "الأنعام",
      "verses": 165,
    },
    {
      "nameEn": "Al-A'raf",
      "nameAr": "الأعراف",
      "verses": 206,
    },
    {
      "nameEn": "Al-Anfal",
      "nameAr": "الأنفال",
      "verses": 75,
    },
    {
      "nameEn": "At-Tawbah",
      "nameAr": "التوبة",
      "verses": 129,
    },
    {
      "nameEn": "Yunus",
      "nameAr": "يونس",
      "verses": 109,
    },
  ];

  // Helper getters to compute indices for display
  // We will store the original index in the map for display purposes if needed,
  // or simply dynamically calculate it. For the list, index+1 is sufficient if unfiltered.
  // But if filtered, the number should probably be the original Surah number.
  // So I'll adding "number" to the map data.

  late List<Map<String, dynamic>> _surasWithIndex;

  @override
  void initState() {
    super.initState();
    _surasWithIndex = List.generate(
      _allSuras.length,
      (index) => {
        ..._allSuras[index],
        "number": index + 1,
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  List<Map<String, dynamic>> get _filteredSuras {
    if (_searchQuery.isEmpty) {
      return _surasWithIndex;
    }
    return _surasWithIndex.where((sura) {
      final nameEn = (sura['nameEn'] as String).toLowerCase();
      final nameAr = (sura['nameAr'] as String);
      final query = _searchQuery.toLowerCase();
      return nameEn.contains(query) || nameAr.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _filteredSuras;
    final isSearching = _searchQuery.isNotEmpty;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black, // Fallback background
      bottomNavigationBar: HomeBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background_home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  // Logo Placeholder (Text or Image)
                  Center(
                    child: Image.asset(
                      "assets/images/logo_home.png",
                      height: 141,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Search Bar
                  CustomSearchBar(
                    onChanged: _onSearchChanged,
                  ),
                  const SizedBox(height: 20),

                  // Most Recently Section - Hide if searching
                  if (!isSearching) ...[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Most Recently",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Horizontal List of Recent Suras
                    SizedBox(
                      height: 150, // Height for the cards
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: const [
                          RecentSurahCard(
                            suraNameEn: "Al-Anbiya",
                            suraNameAr: "الأنبياء",
                            verses: "112",
                          ),
                          RecentSurahCard(
                            suraNameEn: "Al-Fatiha",
                            suraNameAr: "الفاتحة",
                            verses: "7",
                          ),
                          RecentSurahCard(
                            suraNameEn: "Al-Baqarah",
                            suraNameAr: "البقرة",
                            verses: "286",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],

                  // Suras List Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Suras List",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Vertical List of Suras
                  ListView.separated(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Scroll handled by SingleChildScrollView
                    itemCount: filteredList.length,
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(color: Colors.white30),
                    ),
                    itemBuilder: (context, index) {
                      final sura = filteredList[index];
                      return SuraListTile(
                        number: sura['number'] as int,
                        nameEn: sura['nameEn'] as String,
                        nameAr: sura['nameAr'] as String,
                        verses: sura['verses'] as int,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
