import 'package:flutter/cupertino.dart';


void main() {
  runApp(const CupertinoApp(
    title: 'Simple Navigation App',
    home: FirstScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      navigationBar: const CupertinoNavigationBar(
        middle: Text('TO-DO-LIST'),
      ),

      child: Center(
        child: CupertinoButton(
          child: const Text('Settings'),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const SecondScreen()),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('TO-DO LIST'),
        ),
      ),
    );
  }
}