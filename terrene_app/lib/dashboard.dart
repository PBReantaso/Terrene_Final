import 'package:flutter/material.dart';
import 'running.dart';
import 'profile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkGreen = const Color(0xFF204B3A);
    final lightGreen = const Color(0xFFAED9A3);
    final orange = const Color(0xFFF57C1F);
    final cardRadius = 18.0;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: darkGreen,
      body: SafeArea(
        child: SizedBox(
          height: size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile Row
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
                child: Row(
                  children: [
                    // Profile image
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('lib/assets/profile.jpg'), 
                    ),
                    const SizedBox(width: 12),
                    // User name
                    Text(
                      'Christian Antonio',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    // Settings icon
                    IconButton(
                      icon: const Icon(Icons.settings, color: Color.fromARGB(255, 255, 255, 255), size: 32),
                      onPressed: () {}, // TODO: Add settings navigation
                    ),
                  ],
                ),
              ),
              // Progress Card
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 1),
                child: Container(
                  decoration: BoxDecoration(
                    color: lightGreen,
                    borderRadius: BorderRadius.circular(cardRadius),
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.thumb_up_alt_rounded, color: Colors.white, size: 32),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                '11 KM',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'More till the next story unlock',
                                style: TextStyle(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.chevron_right, color: Colors.white, size: 28),
                        ],
                      ),
                      const SizedBox(height: 14),
                      // Progress bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            Container(
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.7, // 70% progress
                              child: Container(
                                height: 12,
                                decoration: BoxDecoration(
                                  color: orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Start Running Button (full width, bold)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RunningScreen()),
                      );
                    },
                    child: Image.asset(
                      'lib/assets/Start.png',
                      height: 100,
                    ),
                  ),
                ),
              ),
              // Recent Activity Title
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  children: [
                    const Text(
                      'Recent Activity',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text('All', style: TextStyle(color: orange, fontWeight: FontWeight.bold, fontSize: 13)),
                    ),
                  ],
                ),
              ),
              // Recent Activity Card (fills available space)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 20),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(cardRadius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: 3,
                      separatorBuilder: (context, index) => const Divider(height: 16, color: Colors.transparent),
                      itemBuilder: (context, index) => _ActivityCard(orange: orange, radius: cardRadius),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _DashboardNavBarBig(darkGreen: darkGreen, lightGreen: lightGreen),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final Color orange;
  final double radius;
  const _ActivityCard({required this.orange, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        children: [
          // Map image placeholder
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.map, color: Colors.grey, size: 22),
          ),
          const SizedBox(width: 10),
          // Activity details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('May 2', style: TextStyle(fontSize: 12, color: Colors.black54)),
                SizedBox(height: 2),
                Text('10.12 KM', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.orange)),
                SizedBox(height: 2),
                Text('701 kcal    2 km/hr', style: TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
          // Arrow icon
          Icon(Icons.chevron_right, color: orange, size: 26),
        ],
      ),
    );
  }
}

class _DashboardNavBarBig extends StatelessWidget {
  final Color darkGreen;
  final Color lightGreen;
  const _DashboardNavBarBig({required this.darkGreen, required this.lightGreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, size: 40, color: Colors.white),
          Icon(Icons.bar_chart, size: 40, color: Colors.black54),
          Icon(Icons.receipt_long, size: 40, color: Colors.black54),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: Icon(Icons.person, size: 40, color: Colors.black54),
          ),
        ],
      ),
    );
  }
} 