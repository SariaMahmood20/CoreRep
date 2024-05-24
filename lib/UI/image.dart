// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class Camera_picker extends StatefulWidget {
//   const Camera_picker({Key? key}) : super(key: key);

//   @override
//   State<Camera_picker> createState() => _Camera_pickerState();
// }

// class _Camera_pickerState extends State<Camera_picker> {
//   File? selectedImage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           TextButton(
//             onPressed: () {
//               imagePickerFromGallery();
//             },
//             child: const Text('Select image from gallery'),
//             style: ButtonStyle(
//                 backgroundColor: MaterialStatePropertyAll(Colors.red),
//                 foregroundColor: MaterialStatePropertyAll(Colors.white)),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           TextButton(
//             onPressed: () {
//               imagePickerFromCamera();
//             },
//             child: const Text('Select image from Camera'),
//             style: ButtonStyle(
//                 backgroundColor: MaterialStatePropertyAll(Colors.blue),
//                 foregroundColor: MaterialStatePropertyAll(Colors.black)),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           selectedImage != null
//               ? Image.file(selectedImage!)
//               : const Text('Please select an image: ')
//         ],
//       ),
//     );
//   }

//   Future imagePickerFromGallery() async {
//     final returnedimage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (returnedimage == null) return;
//     setState(() {
//       selectedImage = File(returnedimage.path);
//     });
//   }

//   Future imagePickerFromCamera() async {
//     final returnedimage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (returnedimage == null) return;
//     setState(() {
//       selectedImage = File(returnedimage.path);
//     });
//   }
// }
