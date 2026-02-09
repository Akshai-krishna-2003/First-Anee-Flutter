import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  TimelineScreen({super.key});

  final List<_TimelineItem> timeline = [
    _TimelineItem(
      "April 5, 2024",
      "First met in college",
      "Thanks to our CSE HOD, a random auditorium talk at PIT, and fate quietly doing its thing.",
    ),
    _TimelineItem(
      "July 7, 2024 • 2:33 PM",
      "The first text",
      "I texted you on LinkedIn about a paper presentation — not knowing it would change everything.",
    ),
    _TimelineItem(
      "October 2024",
      "Somewhere along the way, we fell in love",
      "Softly. Slowly. Without realizing when it really happened.",
    ),
    _TimelineItem(
      "Oct 2024 – June 2025",
      "Fights, struggles, choosing each other",
      "Through misunderstandings and hard days, we stayed. We survived.",
    ),
    _TimelineItem(
      "August 2, 2025",
      "Our first date",
      "Forum Mall — nervous smiles, shared food, and quiet happiness.",
    ),
    _TimelineItem(
      "August 18, 2025",
      "Metro days began",
      "Travelling together, daily life slowly turning into memories.",
    ),
    _TimelineItem(
      "End of 2025",
      "We struggled again",
      "But endings don’t define us — choices do.",
    ),
    _TimelineItem(
      "February 10, 2026",
      "Our first anniversary 🌻",
      "New year. New beginnings. One year of us.",
    ),
  ];

  final List<String> lessons = [
    "To be respectful and speak softly when sharing my point of view, instead of challenging you.",
    "To not stress you out, but motivate you positively and gently.",
    "To love without expecting anything in return.",
    "To be more selfless and empathetic.",
    "To grow alongside you — both as a person and as a professional.",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFF8E1),
            Color(0xFFFFECB3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🌻 TITLE
            const Center(
              child: Text(
                "Our Story 🌻",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6D4C41),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 🕰️ TIMELINE
            ...timeline.map(
              (item) => Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.date,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8D6E63),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5D4037),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.description,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: Color(0xFF6D4C41),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 💛 LEARNINGS
            const Text(
              "What I learned growing with you 💛",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6D4C41),
              ),
            ),

            const SizedBox(height: 16),

            ...lessons.asMap().entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("🌻  "),
                    Expanded(
                      child: Text(
                        entry.value,
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Color(0xFF5D4037),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 💬 QUESTION
            Center(
              child: Text(
                "Now tell me…\nwhat all have *you* learned this year,\nmy love?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  fontStyle: FontStyle.italic,
                  color: Colors.brown.shade700,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// 🔹 Simple local model for timeline
class _TimelineItem {
  final String date;
  final String title;
  final String description;

  _TimelineItem(this.date, this.title, this.description);
}
