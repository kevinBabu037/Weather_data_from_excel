
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newtok/application/screens/user/excel%20upload/screen_excelupload.dart';
import 'package:newtok/application/screens/user/home/cubit/theme.dart';
import 'package:newtok/application/screens/user/home/screen_home.dart';
import 'package:newtok/application/screens/user/profile/screen_profile.dart';
import 'package:newtok/application/screens/user/screen_nav/cubit/nav_bar.dart';
import 'package:newtok/application/utils/colors.dart';

class ScreenNavBar extends StatefulWidget {
  const ScreenNavBar({super.key});

  @override
  State<ScreenNavBar> createState() => _ScreenNavBarState();
}

class _ScreenNavBarState extends State<ScreenNavBar> {
  final List<Widget> _screens = const [
    ScreenHome(),
    ScreenExcelupload(),
    ScreenProfile()
    
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavIndex, int>(
      builder: (context, selectedIndex) {
        final theme = context.watch<ThemeCubit>().state;
        final isDarkMode = theme.brightness == Brightness.dark;

        return Scaffold(
          body: _screens[selectedIndex],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GNav(
              onTabChange: (value) {
                context.read<NavIndex>().updateIndex(value);
              },
              activeColor: kClrBlue,
              iconSize: 30,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              duration: const Duration(milliseconds: 500),
              tabBackgroundColor: isDarkMode ? kClrLigtBlk: kClrLiteBlue,
              tabs: const [
                GButton(
                  icon: CupertinoIcons.home,
                ),
                GButton(
                  icon: Icons.upload_outlined,
                ),
                GButton(
                  icon: CupertinoIcons.person,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
