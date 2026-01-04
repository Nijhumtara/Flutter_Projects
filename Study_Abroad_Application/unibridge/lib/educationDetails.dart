import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

/// FETCH
Future<List<Map<String, dynamic>>> fetchEducations() async {
  final user = supabase.auth.currentUser;

  final response = await supabase
      .from('educations')
      .select()
      .eq('user_id', user!.id)
      .order('passing_year', ascending: false);

  return List<Map<String, dynamic>>.from(response);
}

/// ADD / EDIT DIALOG
Future<void> showAddOrEditEducationDialog({
  required BuildContext context,
  Map<String, dynamic>? existingEducation,
  required VoidCallback onSaved,
}) async {
  final degreeController =
      TextEditingController(text: existingEducation?['degree']);
  final deptController =
      TextEditingController(text: existingEducation?['department']);
  final yearController =
      TextEditingController(text: existingEducation?['passing_year']?.toString());

  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(existingEducation == null ? "Add Education" : "Edit Education"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: degreeController, decoration: const InputDecoration(labelText: "Degree")),
          TextField(controller: deptController, decoration: const InputDecoration(labelText: "Department or Group")),
          TextField(
            controller: yearController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Passing Year"),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
        ElevatedButton(
          onPressed: () async {
            final user = supabase.auth.currentUser;

            if (existingEducation == null) {
              await supabase.from('educations').insert({
                'user_id': user!.id,
                'degree': degreeController.text,
                'department': deptController.text,
                'passing_year': int.parse(yearController.text),
              });
            } else {
              await supabase.from('educations').update({
                'degree': degreeController.text,
                'department': deptController.text,
                'passing_year': int.parse(yearController.text),
              }).eq('id', existingEducation['id']);
            }

            Navigator.pop(context);
            onSaved();
          },
          child: const Text("Save"),
        ),
      ],
    ),
  );
}

/// DELETE
Future<void> deleteEducation(String id, VoidCallback onDeleted) async {
  await supabase.from('educations').delete().eq('id', id);
  onDeleted();
}
