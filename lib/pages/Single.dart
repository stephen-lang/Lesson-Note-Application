import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter/services.dart';
class SinglePage extends StatefulWidget {
  const SinglePage({super.key});
static String routeName = '/entry';
  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
final Gemini gemini =Gemini.instance;
 String cleanedResponse = '';
   final TextEditingController grade = TextEditingController();
  final TextEditingController indicators = TextEditingController();
  final TextEditingController contentstandard = TextEditingController();
    final TextEditingController substrand = TextEditingController();
  final TextEditingController strand = TextEditingController();

    void _sendRequest () async {
    String input1 = grade.text;
    String input2 = indicators.text;
    String input3 = contentstandard.text;
    String input4 = strand.text;
if (input1.isEmpty || input2.isEmpty || input3.isEmpty|| input4.isEmpty){
 // Show an alert dialog if any input is empty
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Empty Fields'),
            content: Text('Please fill out all fields. No field can be left empty.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

} else{
 
try {
  
  final response=  await gemini.text( """generate a lesson note for $grade students using the indicators  $input2
                                                 content standard:
                                  $contentstandard
                                   sub-strand: $substrand
                                    strand:  $strand
                                   The lesson note should be in the following format: strand , sub-strand , Content standard, indicators, 
                                    performance indicator, core competencies, 
                                     Learners Activities( Phase 1 : Starter (preparing the brain for learning) 10 minutes, Phase 2: Main (new learning, including assessment ) 40 minutes, Phase 3:
                              Plenary / Reflections ( Learner or facilitator) 10 minutes resources were used for all these phases. Write short notes under each learner activity, """);
   if (response!=null){
    setState(() {
 
       
       final response0 = response.content?.parts?.fold("", (previous,current)=>"$previous ${current.text}")??"";
         cleanedResponse =  response0.replaceAll('*', '');
    });
  print(cleanedResponse);
   }else {
  // This code will run if response is null
  print('No data received.');
}
} catch (e) {
  print(e);
  
}
     
}
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        title: Text('Data Entry form'),
      ),
      body:SingleChildScrollView( 
        child: 
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: grade,
              decoration: const InputDecoration(labelText: 'Grade'),
            ),
            TextField(
              controller: indicators,
              decoration: const InputDecoration(labelText: 'Indicators'),
            ),
            TextField(
              controller: contentstandard,
              decoration: const InputDecoration(labelText: 'contentstandard'),
            ),
            TextField(
              controller: substrand,
              decoration: const InputDecoration(labelText: 'substrand'),
            ),
            TextField(
              controller: strand,
              decoration: const InputDecoration(labelText: 'strand'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendRequest,
              child: const Text('Generate My Lesson'),
            ),
            SizedBox(height: 10),
            
              Container( 
        margin: const EdgeInsets.all(10.0), 
        padding: const EdgeInsets.all(3.0), 
        height: 250.0, 
        decoration: BoxDecoration( 
          border: Border.all( 
            color: const Color.fromARGB(255, 139, 104, 137), 
            width: 1.0, 
          ), 
        ), 
        child: Row(
          children: [
            Expanded( 
            
              child: SingleChildScrollView( 
             
                scrollDirection: Axis.vertical, 
                child: Text( 
                  cleanedResponse, 
                  style: const TextStyle( 
                    color: Colors.black, 
                    fontSize: 13.0, 
                    letterSpacing: 3, 
                    wordSpacing: 3, 
                  ), 
                ), 
              ), 
            ),
            IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: cleanedResponse));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Text copied to clipboard!'),
                    ),
                  );
                },
              ),
          ],
          
        ), 
      ), 
          ]
      ),
    ) ,),);
  
    
  }


  }

