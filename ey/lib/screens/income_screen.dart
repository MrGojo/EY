import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../widgets/custom_text_field.dart';
import 'dashboard_screen.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedAnnualIncome;
  final _sourceController = TextEditingController();
  final _categoryController = TextEditingController();
  final _documentController = TextEditingController();
  String? _selectedUploadStatus;
  final _ageController = TextEditingController();
  PlatformFile? _selectedFile; // Add this variable

  Future<void> _pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
      );

      if (result != null) {
        setState(() {
          _selectedFile = result.files.first;
          _documentController.text = _selectedFile!.name;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error picking document'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Replace the document TextField with this new widget
  Widget _buildDocumentField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _documentController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Document',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) return 'Document is required';
                    return null;
                  },
                ),
              ),
              TextButton.icon(
                onPressed: _pickDocument,
                icon: const Icon(Icons.attach_file),
                label: const Text('Choose File'),
              ),
            ],
          ),
        ),
        if (_selectedFile != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Selected file: ${_selectedFile!.name} (${(_selectedFile!.size / 1024).toStringAsFixed(2)} KB)',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8FAE0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Tell us about Income',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: _selectedAnnualIncome,
                decoration: const InputDecoration(
                  labelText: 'Annual Income',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: ['Below 1 Lakh', '1-3 Lakhs', '3-5 Lakhs', 'Above 5 Lakhs']
                    .map((income) => DropdownMenuItem(
                          value: income,
                          child: Text(income),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedAnnualIncome = value;
                  });
                },
                validator: (value) {
                  if (value == null) return 'Please select annual income';
                  return null;
                },
              ),
              const SizedBox(height: 15),

              CustomTextField(
                controller: _sourceController,
                label: 'Source of Income',
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Source is required';
                  return null;
                },
              ),

              CustomTextField(
                controller: _categoryController,
                label: 'Category',
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Category is required';
                  return null;
                },
              ),

              CustomTextField(
                controller: _documentController,
                label: 'Document',
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Document is required';
                  return null;
                },
              ),

              DropdownButtonFormField<String>(
                value: _selectedUploadStatus,
                decoration: const InputDecoration(
                  labelText: 'Document Upload',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: ['Uploaded', 'Not Uploaded']
                    .map((status) => DropdownMenuItem(
                          value: status,
                          child: Text(status),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedUploadStatus = value;
                  });
                },
                validator: (value) {
                  if (value == null) return 'Please select upload status';
                  return null;
                },
              ),
              const SizedBox(height: 15),

              CustomTextField(
                controller: _ageController,
                label: 'Age',
                validator: (value) {
                  if (value?.isEmpty ?? true) return 'Age is required';
                  return null;
                },
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 30),

              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
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
    );
  }

  @override
  void dispose() {
    _sourceController.dispose();
    _categoryController.dispose();
    _documentController.dispose();
    _ageController.dispose();
    super.dispose();
  }
}