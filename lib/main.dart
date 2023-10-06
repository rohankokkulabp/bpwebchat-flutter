import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo with WebView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page with WebView'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.disabled)
  ..loadHtmlString('''
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1 viewport-fit=cover, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <style>
    body {
      margin: 0 auto;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      flex-direction: column;
      height: 100vh;
    }
    #bp-web-widget-container {
      height: 100%;
      width: 100%;
      margin: auto;
      flex-grow: 1;
    }
    #bp-web-widget-container div {
      height: 100%;
    }
    .webchatIframe {
      position: relative !important;
    }
  </style>
  <title>Chatbot</title>
</head>
<body>
  <script src="https://cdn.botpress.cloud/webchat/v1/inject.js"></script>
  <script>
    window.botpressWebChat.init(botId: "db76fba1-82ca-4a9c-ba4d-d4ac245fcdc6",
  hostUrl: "https://cdn.botpress.cloud/webchat/v1",
  messagingUrl: "https://messaging.botpress.cloud",
  clientId: "db76fba1-82ca-4a9c-ba4d-d4ac245fcdc6",);
    window.botpressWebChat.onEvent(function () { 
      window.botpressWebChat.sendEvent({ type: 'show' }) 
    }, ['LIFECYCLE.LOADED']);
  </script>
</body>
</html>
    ''');




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(
              controller: controller,
            )
          ),

        ],
      ),
    );
  }
}

