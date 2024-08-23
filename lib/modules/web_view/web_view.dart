import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
String url;
  WebViewScreen({super.key,required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {

  late WebViewController controller ;
  int loadingPercent = 0;

@override
  void initState(){
  super.initState();
  initiateWebController();
}

   void initiateWebController(){

     controller = WebViewController()
       ..setJavaScriptMode(JavaScriptMode.unrestricted)
       ..setNavigationDelegate(
       NavigationDelegate(
         onPageStarted: (url)=>setState(() {
           loadingPercent = 0;
         }),
         onPageFinished: (url)=>setState(() {
           loadingPercent = 100;
         }),
         onProgress: (v)=>setState(() {
           loadingPercent = v;
         }),
         onNavigationRequest: (request)=>NavigationDecision.prevent,
       ),
     )..loadRequest(Uri.parse(widget.url));
   }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              WebViewWidget(
                controller: controller,
              ),
              if(loadingPercent < 100)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
              
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LinearProgressIndicator(
                              color: Colors.orange,
                              minHeight: 2,
                              value: loadingPercent.toDouble() / 100.0,
                            ),
                            const Text('Loading...'),
                          ],
                        ),
                    ),
              )
              
            ],
          ),
        )
    );
  }
}
