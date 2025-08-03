import 'package:flutter/material.dart';
import '../../../../shared/widgets/logout_button.dart';

class SignsGbvPage extends StatelessWidget {
  const SignsGbvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF9E182B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Signs of GBV',
          style: TextStyle(
            color: Color(0xFF9E182B),
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [LogoutButton()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recognizing the Signs',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Kotta One',
                  color: Color(0xFF9E182B),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              
              _buildSignCard(
                'Physical Signs',
                [
                  'Unexplained bruises, cuts, or injuries',
                  'Frequent injuries with excuses',
                  'Wearing clothing that covers injuries',
                  'Changes in eating or sleeping patterns',
                  'Physical pain or discomfort',
                ],
                Icons.healing,
              ),
              
              const SizedBox(height: 16),
              
              _buildSignCard(
                'Emotional & Behavioral Signs',
                [
                  'Anxiety, depression, or mood swings',
                  'Withdrawal from friends and family',
                  'Low self-esteem or confidence',
                  'Fear of partner or family member',
                  'Changes in personality or behavior',
                ],
                Icons.psychology,
              ),
              
              const SizedBox(height: 16),
              
              _buildSignCard(
                'Social & Economic Signs',
                [
                  'Isolation from support networks',
                  'Financial control or restrictions',
                  'Limited access to resources',
                  'Dependency on abuser',
                  'Loss of job or career opportunities',
                ],
                Icons.people,
              ),
              
              const SizedBox(height: 16),
              
              _buildSignCard(
                'Digital & Technology Signs',
                [
                  'Monitoring phone calls or messages',
                  'Controlling social media accounts',
                  'GPS tracking without consent',
                  'Threats via technology',
                  'Forced sharing of passwords',
                ],
                Icons.phone_android,
              ),
              
              const SizedBox(height: 20),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF2AFBC).withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF9E182B), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.warning, color: Color(0xFF9E182B)),
                        const SizedBox(width: 8),
                        const Text(
                          'Important Note',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9E182B),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'These signs may indicate GBV, but each situation is unique. Trust your instincts and seek help if you or someone you know is experiencing any of these signs.',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        color: Color(0xFF2D1E2F),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignCard(String title, List<String> signs, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Color(0xFF9E182B), size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D1E2F),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...signs.map((sign) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF9E182B),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    sign,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Inter',
                      color: Color(0xFF2D1E2F),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
} 