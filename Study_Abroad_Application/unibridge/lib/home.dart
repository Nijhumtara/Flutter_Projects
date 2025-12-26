import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unibridge/hoverEffect.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95),
        child: Container(
          margin: EdgeInsets.all(20),
          child: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF1D3557),
            title: Text(
              "UniBridge",
              style: GoogleFonts.lobster(
                textStyle: TextStyle(
                  color: const Color(0xFF1D3557),
                  fontSize: 25,
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
              SizedBox(width: 10),
              HoverText(
                text: "Countries",
                onTap: () {
                  scrollToSection(_countriesKey);
                },
              ),
              SizedBox(width: 10),
              IconButton(
                icon: const Icon(Icons.logout),
                color: Color(0xFF1D3557),
                onPressed: () async {
                  await Supabase.instance.client.auth.signOut();
                },
              ),
              SizedBox(width: 40),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Asset/Images/home_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
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
                    padding: const EdgeInsets.fromLTRB(50, 50, 70, 50),
                    child: Row(
                      children: [
                        Expanded(
                          // 👈 ADD THIS
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your Gateway to Global Education",
                                style: GoogleFonts.poppins(
                                  fontSize: 30,
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
                              SizedBox(height: 30),
                              Text(
                                '"UniBridge makes studying abroad simple and accessible. Explore top universities, discover programs that fit your goals, and get guidance every step of the way — from applications to acceptance. Your international journey starts here."',
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Get Started",
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xFF023e8a),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.arrow_forward),
                                    color: const Color(0xFF023e8a),
                                    iconSize: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 100),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Container(
                            height: 180,
                            width: 180,
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
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
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
                      fontSize: 20,
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
                    spacing: 30, // horizontal gap (like gap in CSS)
                    runSpacing: 30, // vertical gap
                    alignment: WrapAlignment.center,
                    children: [
                      _box(
                        title: "Study in USA",
                        imagePath: "Asset/Images/us.jpeg",
                      ),
                      _box(
                        title: "Study in UK",
                        imagePath: "Asset/Images/uk.jpeg",
                      ),
                      _box(
                        title: "Study in Canada",
                        imagePath: "Asset/Images/canada.jpeg",
                      ),
                      _box(
                        title: "Study in Australia",
                        imagePath: "Asset/Images/australia.jpeg",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _box({required String title, required String imagePath}) {
    return Container(
      width: 220,
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D3557),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 120,
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
              onPressed: () {},
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
