import 'package:body_ai_buddy/screens/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatMental extends StatefulWidget {
  const ChatMental({super.key});

  @override
  State<ChatMental> createState() => _ChatMentalState();
}

class _ChatMentalState extends State<ChatMental> {
late final GenerativeModel _model;
late final ChatSession _chatSession;
final FocusNode _textFieldFocus = FocusNode();
final TextEditingController _textController = TextEditingController();
final ScrollController _scrollController = ScrollController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro', 
      apiKey: const String.fromEnvironment('API_KEY')
      // apiKey: dotenv.env['API_KEY'] ?? '',
      );
      _chatSession = _model.startChat();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Mental Health check in',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: theme.colorScheme.primary),
        ),
      ),
      body:Padding(padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _chatSession.history.length,
              itemBuilder: (context, index) {
                final Content content = _chatSession.history.toList()[index];
                final text = 
                content.parts.whereType<TextPart>().map<String>((e) => e.text).join('');

                return MessageWidget(
                  text: text, 
                  isFromUser: content.role == 'user'
                  );
              }
            ), 
            ),
            Padding(padding: const EdgeInsetsDirectional.symmetric(
              vertical: 25,
              horizontal: 15,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      focusNode: _textFieldFocus,
                      decoration: textFiedlDecoration(),
                      controller: _textController,
                      onSubmitted: _sendChatMessage,
                    ) ),
                    const SizedBox(height: 15,),
                    if (!_loading)
                      IconButton(
                          onPressed: () async {
                              _sendChatMessage(_textController.text);
                          },
                          icon: Icon(
                              Icons.send,
                              color: Theme.of(context).colorScheme.primary,
                          ),
                      )
                  else
                      const CircularProgressIndicator(),
                ],
              ),

              )
        ],
      ),
      ),
    );
  }
  InputDecoration textFiedlDecoration() {
    return const InputDecoration(
      contentPadding: EdgeInsets.all(15),
      hintText: 'Enter prompt..',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(
          color: Color(0xFF4d302a),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(
          color: Color(0xFF4d302a),
        ),
      )
    );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await _chatSession.sendMessage(
        Content.text(message),
      );
      final text = response.text;
      if (text == null) {
        _showError('No response from API.');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
    (_) => _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(
        milliseconds: 750,
      ),
      curve: Curves.easeOutCirc,
    ),
    );
  }

  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'))
          ],
        );
      });
  }
}


  