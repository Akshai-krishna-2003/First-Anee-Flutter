import 'package:flutter/material.dart';
import 'screens/story_screen.dart';
import 'screens/timeline_screen.dart';
import 'screens/valentine_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const SunflowerApp());
}

class SunflowerApp extends StatefulWidget {
  const SunflowerApp({super.key});

  @override
  State<SunflowerApp> createState() => _SunflowerAppState();
}

class _SunflowerAppState extends State<SunflowerApp> {
  int _index = 0;

  final pages = [
    StoryScreen(),
    TimelineScreen(),
    ValentineScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[_index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_florist),
              label: "Story",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.timeline),
              label: "Moments",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Valentine",
            ),
          ],
        ),
      ),
    );
  }
}
