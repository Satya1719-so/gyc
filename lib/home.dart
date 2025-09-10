import 'package:flutter/material.dart';

class Myinfo extends StatefulWidget {
  const Myinfo({super.key});

  @override
  State<Myinfo> createState() => _MyinfoState();
}

class _MyinfoState extends State<Myinfo> {
  List<bool> _selected = [true, true, true, true, true];
  final List<String> _options = [
    "Mutual Funds",
    "Stocks",
    "Real Estate",
    "Bonds",
    "Not invested yet",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF7E9D7), Color(0xFFD6D6F7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 16,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Investor Profiling",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Tell us about your investment preferences to personalize your experience.",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // for questions number
                    children: List.generate(4, (index) {
                      bool isActive = index == 0;
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 14,
                            backgroundColor:
                                isActive
                                    ? Colors.blue
                                    : Colors.blue.withOpacity(0.2),
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(
                                color:
                                    isActive
                                        ? Colors.white
                                        : Colors.grey.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          if (index < 3)
                            Container(
                              width: 32,
                              height: 2,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Where have you already invested?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // for checkboxes and titles
                  ...List.generate(_options.length, (index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CheckboxListTile(
                        title: Text(_options[index]),
                        value: _selected[index],
                        activeColor: Colors.blue,
                        onChanged: (val) {
                          setState(() {
                            _selected[index] = val ?? false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                  // for continue button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Continue",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
