// ignore_for_file: deprecated_member_use

import 'package:facility_managing/res/constants/app_colors.dart';
import 'package:facility_managing/views/pages/user/maintenace/maintenace_page.dart';
import 'package:facility_managing/views/pages/user/map/map_page.dart';
import 'package:facility_managing/views/pages/user/profile/profile_page.dart';
import 'package:facility_managing/views/widgets/app_text.dart';
import 'package:facility_managing/views/widgets/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BNBPage extends StatefulWidget {
  const BNBPage({super.key});

  @override
  State<BNBPage> createState() => _BNBPageState();
}

class _BNBPageState extends State<BNBPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [MapPage(), MaintenacePage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final List<_NavItemData> _navItems = const [
    _NavItemData('assets/icons/map.svg', 'Map'),
    _NavItemData('assets/icons/maintenance.svg', 'Maintenance'),
    _NavItemData('assets/icons/profile.svg', 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_navItems.length, (index) {
          final item = _navItems[index];
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onItemTapped(index),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child:
                  isSelected
                      ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            item.label,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                          0.5.hSpace(context),
                          Container(
                            width: item.label.length * 8.0,
                            height: 2,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      )
                      : SvgPicture.asset(item.iconPath),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItemData {
  final String iconPath;
  final String label;
  const _NavItemData(this.iconPath, this.label);
}
