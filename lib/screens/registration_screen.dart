import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import 'income_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  
  final _aadharController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageController = TextEditingController();
  String? _selectedGender;

  bool get _isFormValid {
    return _formKey.currentState?.validate() == true && 
           _isChecked && 
           _selectedGender != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8FAE0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tell us about yourself',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 25),
                
                CustomTextField(
                  controller: _aadharController,
                  label: 'Enter your Aadhar card number',
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Aadhar number is required';
                    if (value!.length != 12) return 'Invalid Aadhar number';
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                
                CustomTextField(
                  controller: _lastNameController,
                  label: 'Last Name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Last name is required';
                    return null;
                  },
                ),
                
                CustomTextField(
                  controller: _firstNameController,
                  label: 'First Name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'First name is required';
                    return null;
                  },
                ),
                
                CustomTextField(
                  controller: _middleNameController,
                  label: 'Middle name',
                ),
                
                CustomTextField(
                  controller: _phoneController,
                  label: 'Phone number',
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Phone number is required';
                    if (value!.length != 10) return 'Invalid phone number';
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),
                
                DropdownButtonFormField<String>(
                  value: _selectedGender,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  items: ['Male', 'Female', 'Other']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) return 'Please select gender';
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                
                CustomTextField(
                  controller: _ageController,
                  label: 'Age',
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Age is required';
                    final age = int.tryParse(value!);
                    if (age == null || age < 0) return 'Invalid age';
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                
                const SizedBox(height: 20),
                
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                    const Text(
                      'Kabool hai',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _isFormValid
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const IncomeScreen(),
                                  ),
                                );
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        disabledBackgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Next page',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _aadharController.dispose();
    _lastNameController.dispose();
    _firstNameController.dispose();
    _middleNameController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}