import 'package:flutter/material.dart';
import 'educationDetails.dart';

class MyDrawer extends StatefulWidget {
  final String username;
  final String email;

  const MyDrawer({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<Map<String, dynamic>> educations = [];
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
    loadEducations();
    checkAdmin(); // 👈 REQUIRED
  }

  Future<void> loadEducations() async {
    final data = await fetchEducations();
    setState(() {
      educations = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF023047)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.email,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          /// 🔹 EDUCATION TITLE
          if(!isAdmin)
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Educational Information",
              style: TextStyle(
                color: Color(0xFF023047),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /// 🔹 EDUCATION LIST
          ...educations.map((edu){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFbde0fe),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${edu['degree']} • ${edu['department']} • ${edu['passing_year']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF023047),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Color(0xFF023047)),
                      onPressed: () async {
                        await showAddOrEditEducationDialog(
                          context: context,
                          existingEducation: edu,
                          onSaved: loadEducations,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Color(0xFF023047)),
                      onPressed: () async {
                        await deleteEducation(
                          edu['id'],
                          loadEducations,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }).toList(),

          /// 🔹 ADD BUTTON
          if(!isAdmin)
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () async {
                await showAddOrEditEducationDialog(
                  context: context,
                  onSaved: loadEducations,
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF023047),
                backgroundColor: const Color(0xFFbde0fe),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text(
                "Add Education",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
