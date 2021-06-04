import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;
  const ImageInput({Key? key, required this.onSelectImage}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _stordImage;

  _takeImage() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(source: ImageSource.camera);
    if (imageFile == null) {
      return;
    }
    setState(() {
      _stordImage = File(imageFile.path);
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await _stordImage?.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _stordImage != null
              ? Image.file(
                  _stordImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text('No Image Taken', textAlign: TextAlign.center),
          alignment: Alignment.center,
        ),
        const SizedBox(width: 10),
        const Spacer(),
        TextButton.icon(
          onPressed: _takeImage,
          style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
          label: const Text('Take Picture'),
          icon: const Icon(Icons.camera_alt),
        )
      ],
    );
  }
}
