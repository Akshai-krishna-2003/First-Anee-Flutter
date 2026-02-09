import 'package:flutter/material.dart';
import '../services/email_service.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFFF8E1), // soft sunflower yellow
            Color(0xFFFFECB3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🌻 TITLE
              const Text(
                "Dear Future Husband,",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6D4C41), // warm brown
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 24),

              // 🌻 POEM CARD
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: const Text(
                  "At night, sunflowers stop chasing the sun.\n\n"
                  "They turn toward each other —\n"
                  "searching for light within\n"
                  "and with their beloved.\n\n"
                  "As if reminding themselves\n"
                  "they are not alone,\n"
                  "and that love still glows\n"
                  "even when the sky is dark.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                    color: Color(0xFF5D4037),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 🌻 QUESTION
              const Text(
                "Will you be my sunflower?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4E342E),
                ),
              ),

              const SizedBox(height: 24),

              // 🌻 YES BUTTON
              GestureDetector(
                onTap: () async {
                  await EmailService.sendAnniversaryEmail();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Email sent 💛")),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFFD54F),
                        Color(0xFFFFB300),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orangeAccent.withOpacity(0.5),
                        blurRadius: 14,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Text(
                    "YES 🌻",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
