import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _displayText = ''; //To store value now it's empty
  bool _isChecked = false; // Define the default value of _isChecked value
  var _show = '';
// Above error coz we don't use both in our code here we just define it.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Text Display Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TextField
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(labelText: 'Add Text here'),
            ),

            //Checkbox
            Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  //value retured when checkbox is clicked
                  setState(() {
                    _isChecked = value!;
                  });
                }),

            const SizedBox(
              height: 16,
            ),
            //Button
            ElevatedButton(
              onPressed: () {
                _updateDisplayText();
              },
              child: const Text('Click to show text'),
            ),
            const SizedBox(height: 16),
            // Add where you want to display text
            Text(
              // Values display
              'Displayed Text : $_displayText, $_show ',
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  //Write this code inside
  void _updateDisplayText() {
// when user hit button the value pass through these variables
// define the value of checkbox below
    String result = _isChecked ? 'Accepted' : 'Not Accepted';

    setState(() {
      _displayText = _textEditingController.text;
      //define another variable to store result value/Text
      _show = result;
    });
  }
}
