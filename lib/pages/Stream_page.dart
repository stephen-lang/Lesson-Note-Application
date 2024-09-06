
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
 
class Homepage extends StatefulWidget {
  
    Homepage({super.key});
 static String routeName = '/chatpage';
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 final Gemini gemini =Gemini.instance;
 List<ChatMessage> messages = <ChatMessage>[
    
  ];
   ChatUser Currenuser = ChatUser(
    id: '0',
    firstName: 'Charles',
    lastName: 'Leclerc',
  );
   ChatUser geminiUser = ChatUser(
id: "1",
firstName: "Gemini",
profileImage:
"https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
);

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(" Chat"),
      ),
      body:  buildUi(),
    );
  }





Widget buildUi()  {
  return DashChat(currentUser: Currenuser, onSend: _sendMessage, messages: messages);
}

void _sendMessage (ChatMessage chatMessage){
setState(() {
  // this code adds the senders message to message list 
  messages =[chatMessage, ...messages];
});
try {
  // question from our user
 String question= chatMessage.text;
 // give the question to gemini
  
 gemini.streamGenerateContent( question).listen((event){
  
  // take the first message or nothing from the list of messages and give it to last message
  ChatMessage? lastmessage = messages.firstOrNull;
  if (lastmessage!= null && lastmessage.user == geminiUser){
    //if last message is from gemini
       lastmessage = messages.removeAt(0);
   String response = event.content?.parts?.fold("", (previous,current)=>"$previous ${current.text}")??"";

   lastmessage.text+=response;
  setState(() {
    messages=[lastmessage!, ...messages];
  });
  }else{
   //if last message is from user

   // response from gemini below
   String response = event.content?.parts?.fold("", (previous,current)=>"$previous ${current.text}") ??"";
   // create a new message below
    ChatMessage message =ChatMessage(user: geminiUser, createdAt: DateTime.now(), text: response,);
    setState(() {
      messages = [message, ...messages] ;
    });
  }
 });
} catch (e) {
  print(e);
}
}
}