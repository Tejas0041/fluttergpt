import 'package:flutter/material.dart';
import 'package:fluttergpt/constants/colors.dart';
import 'package:fluttergpt/models/chatlistview.dart';
import 'package:fluttergpt/models/conversation.dart';
import 'package:fluttergpt/views/widgets/chattextfield.dart';
import 'package:fluttergpt/views/widgets/examples.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  List<Conversation> conversations = [];

  bool get isConversationStarted => conversations.isNotEmpty;

  @override
  Widget build(context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isConversationStarted) ...[
                  const SizedBox(height: 40),
                  Image.asset(
                    "assets/images/logo.webp",
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'Welcome to\nChatGPT',
                    style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Ask anything, get your answer',
                    style: textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        /*crossAxisAlignment: CrossAxisAlignment.center,*/
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.wb_sunny_outlined),
                          const SizedBox(height: 10),
                          Text('Examples', style: textTheme.titleLarge),
                          const SizedBox(height: 40),
                          const Example(
                            text: ("Explain quantum computing in simple terms"),
                          ),
                          const Example(
                            text:
                                ("Got any creative ideas for a 10 year old's birthday?"),
                          ),
                          const Example(
                            text:
                                ("How do I make a http request in JavaScript"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ] else
                  Expanded(
                    child: ChatListView(conversations: conversations),
                  ),
                ChatTextField(
                    controller: controller,
                    onSubmitted: (question) {
                      //API CALL
                      controller.clear();
                      conversations.add(Conversation(question, ""));
                      setState(() {});
                      post(Uri.parse("http://10.0.2.2:8000/get-response"),
                              body: jsonEncode({"text": question}),
                              headers: {"Content-Type": "application/json"})
                          .then((response) {
                        String result = jsonDecode(response.body)['response'];
                        conversations.last =
                            Conversation(conversations.last.question, result);
                        setState(() {});
                      });
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
