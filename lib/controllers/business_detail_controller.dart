import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessDetailsController extends GetxController {
  // TextEditingControllers
  final panNumberController = TextEditingController();
  final entityNameController = TextEditingController();
  final dobController = TextEditingController();

  // Form key
  final formKey = GlobalKey<FormState>();

  // Function to validate and proceed
  void validateForm() {
    if (formKey.currentState!.validate()) {
      // Form is valid, perform next action
      print("PAN: ${panNumberController.text}");
      print("Legal Entity: ${entityNameController.text}");
      print("DOB: ${dobController.text}");
    } else {
      print("Form is invalid!");
    }
  }
}