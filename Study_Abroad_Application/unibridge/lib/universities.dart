import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unibridge/university_model.dart';

class Universities extends StatefulWidget {
  final String country;
  const Universities({super.key, required this.country});

  @override
  State<Universities> createState() => _UniversitiesState();
}

class _UniversitiesState extends State<Universities> {
  List<University> universities = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUniversities(country: widget.country);
  }

  //Fetching Universities from 'universities' table
  Future<void> fetchUniversities({required String country}) async {
    try {
      final response =
          await Supabase.instance.client
                  .from('universities')
                  .select()
                  .eq('country', country)
              as List<dynamic>; // cast to List

      setState(() {
        universities = response
            .map((uni) => University.fromMap(Map<String, dynamic>.from(uni)))
            .toList();
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Error fetching universities: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFF003049)),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(50), // shadow color
                    blurRadius: 12, // how soft the shadow is
                    spreadRadius: 8, // how wide the shadow spreads
                    offset: Offset(0, 0), // x,y offset 0 = all around
                  ),
                ],
              ),
              //University Section Title
              child: Center(
                child: Text(
                  "Best Universities in ${widget.country}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFd4a373),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            //Loading Universities Info
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : universities.isEmpty
                  ? const Center(
                      child: Text(
                        "No universities found",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      //Showing Info to list view
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      itemCount: universities.length,
                      itemBuilder: (context, index) {
                        final uni = universities[index];
                        return Container(
                          width: MediaQuery.of(context).size.width * 95,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              12,
                            ), // match Card's radius
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // University image
                              Center(
                                child: Container(
                                  height: 180,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: NetworkImage(uni.imagePath),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // University info
                              Center(
                                child: Text(
                                  uni.name,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0B2545),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text("${uni.city}, ${uni.country}"),
                              const SizedBox(height: 7),
                              Text("Rank: ${uni.ranking}"),
                              const SizedBox(height: 7),
                              Text("IELTS: ${uni.ielts}"),
                              const SizedBox(height: 7),
                              Text(
                                "Programs: ${uni.programs.join(', ')}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 7),
                              Text(
                                "Tution Fees: \$${uni.tuitionMin} - \$${uni.tuitionMax}",
                              ),
                              const SizedBox(height: 7),
                              Text(
                                "Intakes: ${uni.intakes.join(', ')}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 7),
                              if (uni.scholarship != null &&
                                  uni.scholarship!.isNotEmpty)
                                Text(
                                  "Scholarship: ${uni.scholarship}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 44, 160, 48),
                                  ),
                                ),
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
