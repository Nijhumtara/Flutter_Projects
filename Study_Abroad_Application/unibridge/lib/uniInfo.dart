import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unibridge/edit_unidetails.dart';

class UniInfo extends StatefulWidget {
  final String universityId;

  const UniInfo({super.key, required this.universityId});

  @override
  State<UniInfo> createState() => _UniInfoState();
}

class _UniInfoState extends State<UniInfo> {
  final supabase = Supabase.instance.client;

  Map<String, dynamic>? university;
  Map<String, dynamic>? uniDetails;
  bool isLoading = true;
  bool isAdmin = false;

  Future<void> checkAdmin() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final profile = await supabase
        .from('profiles')
        .select('email')
        .eq('id', user.id)
        .single();

    if (!mounted) return;

    setState(() {
      isAdmin = profile['email'] == 'nazma123@gmail.com';
    });
  }

  @override
  void initState() {
    super.initState();
    loadUniversityDetails();
    checkAdmin();
  }

  Future<void> loadUniversityDetails() async {
    final data1 = await supabase
        .from('universities')
        .select()
        .eq('id', widget.universityId)
        .single();

    final data2 = await supabase
        .from('university_overview')
        .select()
        .eq('university_id', widget.universityId)
        .single();

    if (!mounted) return;

    setState(() {
      university = data1;
      uniDetails = data2;
      isLoading = false;
    });
  }

  // ✅ Reusable info card widget
  Widget _infoCard(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(20),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon circle
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF0B2545).withAlpha(20),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF0B2545), size: 20),
          ),
          const SizedBox(width: 14),
          // Title + Value
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF03045e),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          uniDetails?['university_name'] ?? 'University Info',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0B2545),
          ),
        ),
        backgroundColor: const Color(0xFFd4a373),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Section title
                        const Text(
                          "Details Information",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0B2545),
                            shadows: [
                              Shadow(
                                offset: Offset(2, 2),
                                blurRadius: 4,
                                color: Color.fromARGB(150, 77, 76, 76),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // ✅ All info cards
                        _infoCard(Icons.public, "World Rank",
                            "#${uniDetails?['world_rank']}"),
                        _infoCard(Icons.verified, "Globally Recognized",
                            "${uniDetails?['globally_recognized']}"),
                        _infoCard(Icons.shield, "Safety Level",
                            "${uniDetails?['safety_level']}"),
                        _infoCard(Icons.attach_money, "Average Monthly Cost",
                            "\$${uniDetails?['average_monthly_cost']} / month"),
                        _infoCard(Icons.apartment, "On-Campus Accommodation",
                            "${uniDetails?['on_campus_accommodation']}"),
                        _infoCard(Icons.record_voice_over, "IELTS Requirement",
                            "${university?['ielts']}"),
                        _infoCard(Icons.school, "Tuition Fees",
                            "\$${university?['tuition_min']} - \$${university?['tuition_max']}"),
                        _infoCard(Icons.menu_book, "Popular Programs",
                            "${university?['programs']}"),
                        _infoCard(Icons.calendar_today, "Intakes",
                            "${university?['intakes']}"),
                        _infoCard(Icons.emoji_events, "Scholarships",
                            "${university?['scholarships']}"),
                        _infoCard(Icons.work_outline, "Part-Time Work Allowed",
                            "${uniDetails?['part_time_allowed']}"),
                        _infoCard(Icons.payments, "Average Hourly Wage",
                            "\$${uniDetails?['average_hourly_wage']} / hour"),
                        _infoCard(Icons.trending_up, "Job Market Strength",
                            "${uniDetails?['job_market_strength']}"),
                        _infoCard(Icons.bar_chart, "Employment Rate",
                            "${uniDetails?['employment_rate']}%"),
                        _infoCard(
                            Icons.account_balance_wallet,
                            "Average Starting Salary",
                            "\$${uniDetails?['average_starting_salary']} / year"),
                        _infoCard(Icons.badge, "Post-Study Work Available",
                            "${uniDetails?['post_study_work_available']}"),
                        _infoCard(Icons.card_travel, "Post-Study Visa Duration",
                            "${uniDetails?['post_study_visa_years']}"),
                        _infoCard(Icons.flag, "PR Opportunity",
                            "${uniDetails?['pr_opportunity']}"),

                        const SizedBox(height: 20),

                        // Admin edit button
                        if (isAdmin)
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                editUniDialog(
                                  context: context,
                                  existingDetails: {
                                    ...university!,
                                    ...uniDetails!,
                                    'university_id': widget.universityId,
                                  },
                                );
                              },
                              icon: const Icon(Icons.edit),
                              label: const Text("Edit University Details"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0B2545),
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Footer notes
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Color(0xFF0B2545)),
                    padding: const EdgeInsets.all(24),
                    alignment: Alignment.center,
                    child: Text(
                      "${uniDetails?['additional_notes']}".toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}