import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import '../services/storage_service.dart';

class ValentineScreen extends StatefulWidget {
  const ValentineScreen({super.key});

  @override
  State<ValentineScreen> createState() => _ValentineScreenState();
}

class _ValentineScreenState extends State<ValentineScreen> {
  late ConfettiController _controller;
  DateTime? _acceptedAt; // ❌ null initially

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatDate(DateTime d) {
    return "${d.day.toString().padLeft(2, '0')}-"
        "${d.month.toString().padLeft(2, '0')}-"
        "${d.year}  •  "
        "${d.hour.toString().padLeft(2, '0')}:"
        "${d.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // 🌻 Background
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFF8E1),
                Color(0xFFFFE082),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),

        // 🌻 Content
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Valentine for life?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6D4C41),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Not just for today.\n"
                "Not just for a season.\n\n"
                "For this life —\n"
                "and every ordinary, magical moment.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  color: Color(0xFF5D4037),
                ),
              ),

              const SizedBox(height: 30),

              // 🌻 YES BUTTON (always visible)
              GestureDetector(
                onTap: () async {
                  _controller.play();

                  final now = DateTime.now();
                  await StorageService.saveYesMoment(); // save JSON
                  setState(() => _acceptedAt = now); // show card
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 52, vertical: 16),
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
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Text(
                    "YES 💛",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),

              // 📅 CARD SHOWS ONLY AFTER CLICK
              if (_acceptedAt != null) ...[
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Agreed to be Valentines 💛",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6D4C41),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _formatDate(_acceptedAt!),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF5D4037),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),

        // 🎉 Confetti
        ConfettiWidget(
          confettiController: _controller,
          blastDirectionality: BlastDirectionality.explosive,
          numberOfParticles: 25,
          gravity: 0.25,
        ),
      ],
    );
  }
}
