import 'package:delete/controllers/business_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class BusinessDetailsScreen extends StatelessWidget {
//   final BusinessDetailsController con = Get.put(BusinessDetailsController());

//   BusinessDetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Business details'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: GetBuilder<BusinessDetailsController>(
//         builder: (con) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: con.formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Enter PAN of legal entity',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'This will be your primary PAN number and will be used for all your outlets',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 24),

//                   // PAN Number Field
//                   TextFormField(
//                     controller: con.panNumberController,
//                     decoration: InputDecoration(
//                       labelText: 'PAN number',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter PAN number';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),

//                   // Legal Entity Name Field
//                   TextFormField(
//                     controller: con.entityNameController,
//                     decoration: InputDecoration(
//                       labelText: 'Legal entity name',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter legal entity name';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 16),

//                   // Date of Birth/Registration Field
//                   TextFormField(
//                     controller: con.dobController,
//                     decoration: InputDecoration(
//                       labelText: 'Date of birth/registration',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter date of birth/registration';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 32),

//                   // Next Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         con.validateForm();
//                         con.update(); // Update UI if needed
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.grey.shade300,
//                         foregroundColor: Colors.white,
//                       ),
//                       child: const Text(
//                         'Next',
//                         style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class BusinessDetailsScreen extends StatelessWidget {
  final BusinessDetailsController con = Get.put(BusinessDetailsController());

  BusinessDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business details'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GetBuilder<BusinessDetailsController>(
        builder: (con) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: con.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Enter PAN of legal entity',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This will be your primary PAN number and will be used for all your outlets',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 24),

                  // PAN Number Field
                  buildTextField(
                    controller: con.panNumberController,
                    labelText: 'PAN number',
                  ),
                  const SizedBox(height: 16),

                  // Legal Entity Name Field
                  buildTextField(
                    controller: con.entityNameController,
                    labelText: 'Legal entity name',
                  ),
                  const SizedBox(height: 16),

                  // Date of Birth/Registration Field
                  buildTextField(
                    controller: con.dobController,
                    labelText: 'Date of birth/registration',
                  ),
                  const SizedBox(height: 32),

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        con.validateForm();
                        con.update(); // Update UI if needed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Common Method for TextFormField
  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $labelText';
        }
        return null;
      },
    );
  }
}
