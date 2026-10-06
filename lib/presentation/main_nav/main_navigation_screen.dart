import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_theme.dart';
import '../../domain/models/user.dart';
import '../auth/login_screen.dart';
import '../contacts/contacts_list_tab.dart';
import '../dashboard/dashboard_tab.dart';
import '../profile/profile_settings_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  final UserModel user;

  const MainNavigationScreen({
    super.key,
    required this.user,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    if (_currentIndex == index) return;
    HapticFeedback.lightImpact();
    setState(() => _currentIndex = index);
  }

  void _handleLogout() {
    HapticFeedback.mediumImpact();
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 350),
        pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      (route) => false,
    );
  }

  String get _appBarTitle {
    switch (_currentIndex) {
      case 0:
        return 'Cinema Dashboard';
      case 1:
        return 'Artist Directory';
      case 2:
        return 'Profile & Settings';
      default:
        return 'Cinema Portal';
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      DashboardTab(
        user: widget.user,
        onNavigateToContacts: () => _onTabSelected(1),
      ),
      const ContactsListTab(),
      ProfileSettingsTab(
        user: widget.user,
        onLogout: _handleLogout,
      ),
    ];

    return Scaffold(
      key: _scaffoldKey,
      extendBody: true, 
      backgroundColor: AppTheme.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.surfaceWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: AppTheme.textPrimary,
            size: 24,
          ),
          onPressed: () {
            HapticFeedback.lightImpact();
            _scaffoldKey.currentState?.openDrawer();
          },
          tooltip: 'Open Drawer Navigation',
        ),
        title: Text(
          _appBarTitle,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.4,
          ),
        ),
        actions: [
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: AppTheme.textPrimary,
                  size: 22,
                ),
                Positioned(
                  right: -1,
                  top: -1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryRed,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {
              HapticFeedback.lightImpact();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('All systems operational for ${widget.user.name}.'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            tooltip: 'Notifications',
          ),
          const SizedBox(width: 8),
        ],
      ),
      drawer: _buildSideDrawer(context),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOutCubic,
        switchOutCurve: Curves.easeInOutCubic,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: KeyedSubtree(
          key: ValueKey<int>(_currentIndex),
          child: tabs[_currentIndex],
        ),
      ),
      bottomNavigationBar: _buildFloatingBottomNavBar(),
    );
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.surfaceWhite,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryRed, AppTheme.primaryRedDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  widget.user.initials,
                  style: const TextStyle(
                    color: AppTheme.primaryRed,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            accountName: Text(
              widget.user.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.2,
              ),
            ),
            accountEmail: Text(
              widget.user.email,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          _buildDrawerItem(
            icon: Icons.dashboard_rounded,
            title: 'Dashboard',
            subtitle: 'Overview & metrics',
            isSelected: _currentIndex == 0,
            onTap: () {
              Navigator.of(context).pop();
              _onTabSelected(0);
            },
          ),
          _buildDrawerItem(
            icon: Icons.people_alt_rounded,
            title: 'Contacts Directory',
            subtitle: '8 iconic Filipino artists',
            isSelected: _currentIndex == 1,
            onTap: () {
              Navigator.of(context).pop();
              _onTabSelected(1);
            },
          ),
          _buildDrawerItem(
            icon: Icons.person_rounded,
            title: 'Profile & Settings',
            subtitle: 'Preferences & credentials',
            isSelected: _currentIndex == 2,
            onTap: () {
              Navigator.of(context).pop();
              _onTabSelected(2);
            },
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Divider(),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.cardRadius),
              ),
              tileColor: AppTheme.primaryRedLight,
              leading: const Icon(
                Icons.logout_rounded,
                color: AppTheme.primaryRed,
                size: 22,
              ),
              title: const Text(
                'Log Out Session',
                style: TextStyle(
                  color: AppTheme.primaryRed,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                'End session for ${widget.user.name}',
                style: TextStyle(
                  color: AppTheme.primaryRed.withValues(alpha: 0.8),
                  fontSize: 11.5,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
                _handleLogout();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        tileColor: isSelected ? AppTheme.primaryRedLight : Colors.transparent,
        leading: Icon(
          icon,
          color: isSelected ? AppTheme.primaryRed : AppTheme.textSecondary,
          size: 22,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppTheme.primaryRed : AppTheme.textPrimary,
            fontSize: 14.5,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: isSelected
                ? AppTheme.primaryRed.withValues(alpha: 0.75)
                : AppTheme.textSecondary,
            fontSize: 11.5,
          ),
        ),
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
      ),
    );
  }

  Widget _buildFloatingBottomNavBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.surfaceWhite,
        borderRadius: BorderRadius.circular(AppTheme.pillRadius),
        border: Border.all(color: AppTheme.borderLight, width: 0.8),
        boxShadow: AppTheme.floatingNavShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            index: 0,
            icon: Icons.dashboard_outlined,
            activeIcon: Icons.dashboard_rounded,
            label: 'Dashboard',
          ),
          _buildNavItem(
            index: 1,
            icon: Icons.people_outline_rounded,
            activeIcon: Icons.people_alt_rounded,
            label: 'Contacts',
          ),
          _buildNavItem(
            index: 2,
            icon: Icons.person_outline_rounded,
            activeIcon: Icons.person_rounded,
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onTabSelected(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 18 : 12,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryRed : Colors.transparent,
          borderRadius: BorderRadius.circular(AppTheme.pillRadius),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppTheme.primaryRed.withValues(alpha: 0.28),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected ? Colors.white : AppTheme.textSecondary,
              size: 20,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isSelected ? 1.0 : 0.0,
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
