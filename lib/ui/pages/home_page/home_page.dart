import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:effective_mobile_test/ui/pages/plane_tickets_page/plane_tickets_page.dart';
import 'package:effective_mobile_test/ui/pages/temp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  static String routePath = '/home/';
  final int selectedTabIndex;

  const HomePage({
    super.key,
    this.selectedTabIndex = 0,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedTabIndex;

  List<Widget> get _screens => [
        const PlaneTicketsPage(),
        const TempPage(text: 'Отели'),
        const TempPage(text: 'Короче'),
        const TempPage(text: 'Подписки'),
        const TempPage(text: 'Профиль'),
      ];

  @override
  void initState() {
    _selectedTabIndex = widget.selectedTabIndex ?? 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _getNavBarItem('assets/icons/plane.svg', 'Авиабилеты'),
          _getNavBarItem('assets/icons/hotel.svg', 'Отели'),
          _getNavBarItem('assets/icons/map_point.svg', 'Короче'),
          _getNavBarItem('assets/icons/notification.svg', 'Подписки'),
          _getNavBarItem('assets/icons/profile.svg', 'Профиль'),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedTabIndex,
        selectedItemColor: AppColors.blue,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  BottomNavigationBarItem _getNavBarItem(String svgPath, String label) => BottomNavigationBarItem(
        icon: SvgPicture.asset(svgPath),
        activeIcon: SvgPicture.asset(
          svgPath,
          colorFilter: const ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
        ),
        label: label,
        backgroundColor: Colors.blue,
      );
}
