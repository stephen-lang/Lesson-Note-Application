import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as imglib;
import 'package:path_provider/path_provider.dart';
import 'package:google_generative_ai/google_generative_ai.dart' ;
import 'package:lessonnote/Constants/const.dart';
import 'package:pdf_render/pdf_render.dart';
import 'package:permission_handler/permission_handler.dart';
class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
   bool _isdocisin = false;
   PlatformFile? docdoc;


 Future<void> getdoc()   async{
final result = await  FilePicker.platform.pickFiles(
  type:FileType.custom,
  allowedExtensions: ['doc', 'pdf', 'docx'],
);

if (result!= null){
  setState(() {
 final  docdoc =  result.files.first;
  });
   
}else {
      // User canceled the picker
    }
 
}

Future getimage ()async{
if (docdoc!=null) {
  setState(() {
      _isdocisin = true;
  });
try {
  

final appStorage = await getApplicationDocumentsDirectory();
final newfilepath = File('${appStorage.path}/${docdoc?.name}');
 
final doc = await PdfDocument.openFile(newfilepath.path);
final pages = doc.pageCount;
List<imglib.Image> images = [];

// get images from all the pages
for (int i = 1; i <= pages; i++) {
  var page = await doc.getPage(i);
  var imgPDF = await page.render();
  var img = await imgPDF.createImageDetached();
  var imgBytes = await img.toByteData(format: ImageByteFormat.png);
  var libImage = imglib.decodeImage(imgBytes!.buffer
  .asUint8List(imgBytes.offsetInBytes, imgBytes.lengthInBytes));
  images.add(libImage!);
}

// stitch images
int totalHeight = 0;
images.forEach((e) {
  totalHeight += e.height;
});
int totalWidth = 0;
images.forEach((element) {
  totalWidth = totalWidth < element.width ? element.width : totalWidth;
});
final mergedImage = imglib.Image(width: totalWidth, height:totalHeight);
int mergedHeight = 0;
/*
for (var element in images) {
  imglib.copyInto(mergedImage, element, dstX: 0, dstY: mergedHeight, blend: false);
  imglib.copyImageChannels(src, from: from)
  mergedHeight += element.height;
}
*/

// Save image as a file
/*
final documentDirectory = await getExternalStorageDirectory();
File imgFile = new File('${documentDirectory.path}/abc.jpg');
new File(imgFile.path).writeAsBytes(imglib.encodeJpg(mergedImage));
*/
final newImagepath = File('${appStorage.path}/${'${docdoc?.name}.jpg'}');
final  writtenfile = new File(newImagepath.path).writeAsBytes(imglib.encodeJpg(mergedImage));

print('path = $newImagepath' );
print('What is this = $writtenfile' );
print(' images $images' );

return images;
} catch (e) {
  print(e);
}
}else{
  print("No file selected.");
  // no file selected
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
appBar: AppBar(title: const Text("Upload  PDF"),
),
body: Container(
  child:  Column(
    children: [
ElevatedButton(
              onPressed: getimage,
              child: const Text('Generate My Lesson'),
            ),
      
    ],
  )
   
     ) ,);
  }


  void _sendRequest (){





  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();
    setState(() {
      print(status);
     
    });
}}