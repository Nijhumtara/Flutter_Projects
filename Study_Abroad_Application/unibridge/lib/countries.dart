import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<StatefulWidget> createState() => _CountryState();
}

class _CountryState extends State {
  @override
  Widget build(BuildContext context) {
    var uniInfo = [
      {"img": "Asset/Images/austUni1.jpg", "name": "University of Melbourne"},
      {"img": "Asset/Images/austUni2.png", "name": "University of Sydney"},
      {
        "img": "Asset/Images/austUni3.jpg",
        "name": "University of New South Wales",
      },
      {
        "img": "Asset/Images/austUni4.jpeg",
        "name": "Australian National University",
      },
      {"img": "Asset/Images/austUni5.jpg", "name": "Monash University"},
    ];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0B2545), Color(0xFF13315c), Color(0xFF134074)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Text("Best Universities in Australia",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFccd5ae)
            ),),
            SizedBox(height: 30,),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(80, 20, 80, 20),
                itemCount: uniInfo.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20, // 👈 horizontal gap
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Text(
                          uniInfo[index]["name"]!,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFd4a373),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(uniInfo[index]["img"]!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Get To Know More Information",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
