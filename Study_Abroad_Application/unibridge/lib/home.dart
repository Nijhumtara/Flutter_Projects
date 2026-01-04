import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibridge/MyDrawer.dart';
import 'package:unibridge/hoverEffect.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unibridge/universities.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State {
  bool isHover = false;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _countriesKey = GlobalKey();
  final user = Supabase.instance.client.auth.currentUser;
  final supabase = Supabase.instance.client;

  String? userNameFromAuth;
  String? userEmailFromAuth;

  //Fetching User Info for showing in profile
  Future<void> loadUserInfo() async {
    final user = supabase.auth.currentUser!;
    userEmailFromAuth = user.email;

    final profile = await supabase
        .from('profiles')
        .select('name')
        .eq('id', user.id)
        .single();

    setState(() {
      userNameFromAuth = profile['name'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  //Scrolling Functionality
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0, // 0 aligns top of the section just below AppBar
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //Appbar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95),
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.zero,
          child: AppBar(
            titleSpacing: 2,
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF1D3557),
            title: Text(
              "UniBridge",
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                  color: const Color(0xFF1D3557),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            actions: [
              HoverText(
                text: "Home",
                onTap: () {
                  scrollToSection(_homeKey);
                },
              ),
              SizedBox(width: 4),
              HoverText(
                text: "Countries",
                onTap: () {
                  scrollToSection(_countriesKey);
                },
              ),
              SizedBox(width: 4),
              IconButton(
                icon: const Icon(Icons.logout),
                color: Color(0xFF1D3557),
                onPressed: () async {
                  await Supabase.instance.client.auth.signOut();
                },
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
      //Body
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        //Body Background Image
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF003049),
            // image: DecorationImage(
            //   image: AssetImage("Asset/Images/home_background.jpg"),
            //   fit: BoxFit.cover,
            // ),
          ),
          //Home Section Container
          child: Column(
            children: [
              Container(
                key: _homeKey,
                margin: EdgeInsets.fromLTRB(20, 100, 20, 10),
                decoration: BoxDecoration(
                  color: Color(0xFFd4a373),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50), // shadow color
                      blurRadius: 15, // how soft the shadow is
                      spreadRadius: 8, // how wide the shadow spreads
                      offset: Offset(0, 0), // x,y offset 0 = all around
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "Asset/Images/graduation_cap.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Your Gateway to Global Education",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1D3557),
                          shadows: [
                            Shadow(
                              offset: Offset(
                                2,
                                2,
                              ), // x and y offset of the shadow
                              blurRadius: 4, // how soft the shadow is
                              color: const Color.fromARGB(
                                255,
                                77,
                                76,
                                76,
                              ).withAlpha(150), // shadow color
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '"UniBridge makes studying abroad simple and accessible. Explore top universities, discover programs that fit your goals, and get guidance every step of the way — from applications to acceptance. Your international journey starts here."',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Get Started",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF023e8a),
                              ),
                            ),
                          ),
                          SizedBox(width: 3),
                          Icon(
                            Icons.arrow_forward,
                            size: 16,
                            color: Color(0xFF023e8a),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50),
              //Popular Contries Section
              Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFFccd5ae),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "Popular Countries",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              Container(
                key: _countriesKey,
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
                width: MediaQuery.of(context).size.width * 100,
                decoration: BoxDecoration(color: const Color(0xFFfefae0)),
                child: Wrap(
                  spacing: 30, // horizontal gap
                  runSpacing: 30, // vertical gap
                  alignment: WrapAlignment.center,
                  children: [
                    _box(
                      title: "Study in USA",
                      imagePath: "Asset/Images/us.jpeg",
                      countryName: "USA",
                    ),
                    _box(
                      title: "Study in UK",
                      imagePath: "Asset/Images/uk.jpeg",
                      countryName: "UK",
                    ),
                    _box(
                      title: "Study in Canada",
                      imagePath: "Asset/Images/canada.jpeg",
                      countryName: "Canada",
                    ),
                    _box(
                      title: "Study in Australia",
                      imagePath: "Asset/Images/australia.jpeg",
                      countryName: "Australia",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(
        username: userNameFromAuth ?? 'User',
        email: userEmailFromAuth ?? '',
      ),
    );
  }

  //Box of Countries Section
  Widget _box({
    required String title,
    required String imagePath,
    required String countryName,
  }) {
    return Container(
      width: 270,
      height: 350,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D3557),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50), // shadow color
            blurRadius: 15, // how soft the shadow is
            spreadRadius: 8, // how wide the shadow spreads
            offset: Offset(0, 0), // x,y offset 0 = all around
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 170,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Title
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          const Spacer(),

          // Same button for all
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Universities(country: countryName),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                "Explore The Country",
                style: TextStyle(
                  color: Color(0xFF1D3557),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
