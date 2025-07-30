import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../shared/widgets/custom_bottom_navigation_bar.dart';
import '../providers/support_provider.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  void initState() {
    super.initState();
    // Load support items when the page is first created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SupportProvider>().loadSupportItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/User.png'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Support Directory',
                    style: TextStyle(
                      color: Color(0xFFB05A7A),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Center(
                child: Text(
                  'Hotlines, clinics and safe spaces',
                  style: TextStyle(
                    color: Color(0xFFB05A7A),
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Consumer<SupportProvider>(
                  builder: (context, supportProvider, child) {
                    if (supportProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    
                    if (supportProvider.error != null) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Error: ${supportProvider.error}',
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => supportProvider.loadSupportItems(),
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      );
                    }
                    
                    if (supportProvider.supportItems.isEmpty) {
                      return const Center(
                        child: Text(
                          'No support entries found.',
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }
                    
                    return ListView.separated(
                      itemCount: supportProvider.supportItems.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final supportItem = supportProvider.supportItems[index];
                        
                        // Use the desc field from the model, or compose from other fields
                        String desc = supportItem.desc;
                        if (desc.isEmpty) {
                          // Fallback: compose description from available fields
                          List<String> parts = [];
                          if (supportItem.tollFree.isNotEmpty) {
                            parts.add(supportItem.tollFree);
                          }
                          if (supportItem.address.isNotEmpty) {
                            parts.add(supportItem.address);
                          }
                          if (supportItem.availableHours.isNotEmpty) {
                            parts.add(supportItem.availableHours);
                          }
                          if (supportItem.region.isNotEmpty) {
                            parts.add(supportItem.region);
                          }
                          if (supportItem.type.isNotEmpty) {
                            parts.add(supportItem.type);
                          }
                          desc = parts.join(' • ');
                        }
                        
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(204),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon
                              Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.only(right: 12),
                                child: Image.asset('assets/images/app_icon.png'),
                              ),
                              // Texts
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      supportItem.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black87,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      desc,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}