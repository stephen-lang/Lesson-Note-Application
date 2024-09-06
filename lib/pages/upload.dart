import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as imglib;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:path/path.dart' as p;
import 'package:flutter_gemini/flutter_gemini.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});
  static const String routeName = '/upload';

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final Gemini gemini = Gemini.instance;

  Future<File?> pickPdfDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );
    double sizeKbs = 0;
    const int maxSizeKbs = 890;
    if (result != null) {
      final size = result.files.first.size;
      sizeKbs = size / 1024;
      if (sizeKbs > maxSizeKbs) {
        print('size should be less than $maxSizeKbs Kb');
      } else {
        print('file size accepted');
        return File(result.files.single.path!);

        //Upload your file
      }
    }
  }

  Future convertPDFtoimages(File pdfFile) async {
    // get the file name
    final String fileName = p.basename(pdfFile.path);

    //send it to the storage path
    final appStorage = await getApplicationDocumentsDirectory();
    final newfilepath = File('${appStorage.path}/$fileName');

    final doc = await PdfDocument.openFile(pdfFile.path);

    List<Uint8List> images = [];

// get images from all the pages
    for (int i = 1; i <= doc.pageCount; i++) {
      var page = await doc.getPage(i);
      var imgPDF = await page.render();
      var img = await imgPDF.createImageDetached();
      var imgBytes = await img.toByteData(format: ImageByteFormat.png);
      Uint8List imageData = imgBytes!.buffer
          .asUint8List(imgBytes.offsetInBytes, imgBytes.lengthInBytes);
      images.add(imageData);
      /*var page = await doc.getPage(i);
  var imgPDF = await page.render();
  var img = await imgPDF.createImageDetached();
  var imgBytes = await img.toByteData(format: ImageByteFormat.png);
  var libImage = imglib.decodeImage(imgBytes!.buffer
  .asUint8List(imgBytes.offsetInBytes, imgBytes.lengthInBytes));
  
  images.add(libImage!);
  */
    }

// stitch images
    int totalHeight = 0;
    images.forEach((e) {
      //totalHeight += e.height;
    });
    int totalWidth = 0;
    images.forEach((element) {
      // totalWidth = totalWidth < element.width ? element.width : totalWidth;
    });
    final mergedImage = imglib.Image(width: totalWidth, height: totalHeight);
 
    final newImagepath = File('${appStorage.path}/${'$fileName.jpg'}');
    final writtenfile =
        new File(newImagepath.path).writeAsBytes(imglib.encodeJpg(mergedImage));

//print('path = $newImagepath' );
//print('What is this = $writtenfile' );
//print(' images $images' );

    //List<int> intList = images.cast<int>().toList(); //This is the magical line.
    //Uint8List data = Uint8List.fromList(intList);
    return images;
  }

  Future<void> sendImagesToGemini(List<Uint8List> images) async {
    var response = await gemini.textAndImage(
        text:
            "Can you generate my lesson plan for mathematics B7 for 3 weeks allocated using the document added?",
        images: images);

    if (response != null) {
      try {
        var response0 = response.content?.parts?.fold(
                "", (previous, current) => "$previous ${current.text}") ??
            "";
        print('------Main Response = $response0');
        //print('Image sent successfully: ${response.toString()}');
      } catch (e) {
        print('Error ofr you --- $e');
      }
    }
  }

/* main() async {
  final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: GEMINI_API_KEY,
  );
 

 }

*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload  PDF"),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final pdfFile = await pickPdfDocument();
                try {
                  if (pdfFile != null) {
                    final images = await convertPDFtoimages(pdfFile);
                    //print(images);
                    // print(pdfFile.path);

                    await sendImagesToGemini(images);
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Generate My Lesson'),
            ),
          ],
        ),
      ),
    );
  }
}
