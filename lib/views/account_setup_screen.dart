import 'package:delete/controllers/accout_setup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepProgressUI extends StatelessWidget {
  const StepProgressUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Step Progress UI'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Step 1: Owner Details
            StepCard(
              stepNumber: "1",
              title: "Owner details",
              iconData: Icons.person,
              isCompleted: true,
            ),
            // Step 2: Store Details
            StepCard(
              stepNumber: "2",
              title: "Store details",
              iconData: Icons.store,
              isCompleted: true,
            ),
            // Step 3: Business Details
            StepCard(
              stepNumber: "3",
              title: "Business details",
              iconData: Icons.folder,
              isCompleted: false,
            ),
          ],
        ),
      ),
    );
  }
}

// class StepCard extends StatelessWidget {
//   final String stepNumber;
//   final String title;
//   final IconData iconData;
//   final bool isCompleted;

//   const StepCard({
//     Key? key,
//     required this.stepNumber,
//     required this.title,
//     required this.iconData,
//     required this.isCompleted,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(12),
//         leading: CircleAvatar(
//           backgroundColor: Colors.blue.shade50,
//           child: Text(stepNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
//         ),
//         title: Row(
//           children: [
//             Icon(iconData, color: Colors.blueAccent),
//             const SizedBox(width: 8),
//             Text(
//               title,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//           ],
//         ),
//         trailing: isCompleted
//             ? const Icon(Icons.check_circle, color: Colors.green, size: 28)
//             : ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red.shade400,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: () {
//                   // Add your "Add" button action here
//                 },
//                 child: const Text("Add", style: TextStyle(color: Colors.white)),
//               ),
//       ),
//     );
//   }
// }

class StepCard extends StatelessWidget {
  final String stepNumber;
  final String title;
  final IconData iconData;
  final bool isCompleted;

  const StepCard({
    super.key,
    required this.stepNumber,
    required this.title,
    required this.iconData,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  // color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.blueAccent, size: 28),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    stepNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),

          // Title
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),

          // Trailing - Icon or Button
          isCompleted
              ? const Icon(Icons.check_circle, color: Colors.green, size: 28)
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Add your "Add" button action here
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
        ],
      ),
    );
  }
}
