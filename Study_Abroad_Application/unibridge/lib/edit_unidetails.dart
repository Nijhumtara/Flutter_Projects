import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

//EDIT DIALOG
Future<void> editUniDialog({
  required BuildContext context,
  Map<String, dynamic>? existingDetails,
}) async {
  final tuitionMinController = TextEditingController(
    text: existingDetails?['tution_min']?.toString(),
  );
  final tuitionMaxController = TextEditingController(
    text: existingDetails?['tution_max']?.toString(),
  );
  final avgmonthlyCostController = TextEditingController(
    text: existingDetails?['average_monthly_cost']?.toString(),
  );
  final avghourlyWageController = TextEditingController(
    text: existingDetails?['average_hourly_wage']?.toString(),
  );
  final avgSalaryController = TextEditingController(
    text: existingDetails?['average_starting_salary']?.toString(),
  );

  await showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: tuitionMinController,
            decoration: const InputDecoration(labelText: "TutionMin"),
          ),
          TextField(
            controller: tuitionMaxController,
            decoration: const InputDecoration(labelText: "TutionMax"),
          ),
          TextField(
            controller: avgmonthlyCostController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Average Monthly Cost",
            ),
          ),
          TextField(
            controller: avghourlyWageController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Average Hourly Wage"),
          ),
          TextField(
            controller: avgSalaryController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Average Starting Salary",
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            await supabase
                .from('universities')
                .update({
                  'tuition_min': int.parse(tuitionMinController.text),
                  'tuition_max': int.parse(tuitionMaxController.text),
                })
                .eq('id', existingDetails?['id']);

            await supabase
                .from('university_overview')
                .update({
                  'average_monthly_cost': int.parse(
                    avgmonthlyCostController.text,
                  ),
                  'average_hourly_wage': int.parse(
                    avghourlyWageController.text,
                  ),
                  'average_starting_salary': int.parse(
                    avgSalaryController.text,
                  ),
                })
                .eq('university_id', existingDetails?['id']);

            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    ),
  );
}
