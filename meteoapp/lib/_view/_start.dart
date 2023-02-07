import 'package:meteoapp/_resources/_imports.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stateful Clicker Counter',
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}
