import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

import '../pages/auth_page.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
/// Назначение: главный виджет приложения
/// Дата создания: 25.05.2026
/// Создал: Захар
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: .new(390, 884),
      child: MaterialApp(
        theme: .light().copyWith(
          extensions: [CustomTheme(palette: LightPalette())],
        ),
        debugShowCheckedModeBanner: false,
        home: FilePickerScreen(),
      ),
    );
  }
}

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  File? _selectedFile;
  File? _selectedImage;

  Future<void> _pickPDF() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      setState(() {
        _selectedImage = File(result.path);
      });
    }
  }

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final result = await picker.pickImage(source: ImageSource.camera);

    if (result != null) {
      setState(() {
        _selectedImage = File(result.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File & Image Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // PDF секция
            const Text(
              'PDF File',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: _pickPDF,
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Pick PDF'),
            ),
            if (_selectedFile != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('📄 ${_selectedFile!.path.split('/').last}'),
                    Text('${(_selectedFile!.lengthSync() / 1024).toStringAsFixed(2)} KB'),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            // Image секция
            const Text(
              'Image',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: const Icon(Icons.photo_library),
                    label: const Text('Gallery'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _takePhoto,
                    icon: const Icon(Icons.camera_alt),
                    label: const Text('Camera'),
                  ),
                ),
              ],
            ),
            if (_selectedImage != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Image.file(
                      _selectedImage!,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Text(_selectedImage!.path.split('/').last),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            // Кнопка отправки
            ElevatedButton(
              onPressed: (_selectedFile != null || _selectedImage != null)
                  ? () {
                // Тут вызывай свои API методы
                print('PDF: ${_selectedFile?.path}');
                print('Image: ${_selectedImage?.path}');
              }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Upload',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}