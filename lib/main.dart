import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/app_platform.dart';
import 'package:multiplatform_solutions/t4/users.dart';
import 'mock_webview.dart'
    if (dart.library.io) 'non_web_platform_webview.dart'
    if (dart.library.html) 'web_platform_webview.dart';

void main() {
  // runApp(MyAdaptiveApp());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _link = 'https://flutter.dev';

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView Multiplatform Solutions'),
      ),
      body: Column(
        children: [
          Expanded(child: _link.isEmpty ? const SizedBox() : webView(_link)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        print(_controller.text);
                        setState(() {
                          print(_controller.text);
                          _link = _controller.text;
                        });
                      },
                      child: const Text('LOAD')),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'APPLICATION RUNNING ON ${AppPlatform.platform.name.toUpperCase()}'),
          ),
        ],
      ),
    );
  }
}
