import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/Utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/context_extensions.dart';
import 'package:{{name.snakeCase()}}/screens/dashboard/cart_screen.dart';
import 'package:{{name.snakeCase()}}/screens/dashboard/chat_screen.dart';
import 'package:{{name.snakeCase()}}/screens/dashboard/profile_screen.dart';
import 'package:{{name.snakeCase()}}/screens/dashboard/wishlist.dart';

import '../../utils/app_images.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final tab = [
    HomeScreen(),
    CartScreen(isBack: false,),
    WishlistScreen(),
    ChatScreen(),
    ProfileScreen()
  ];
  final List<Map<String, String>> _icons = [
    {
      "filled": ic_home_fill,
      "outline": ic_home,
    },
    {
      "filled": ic_cart_fill,
      "outline": ic_cart,
    },{
      "filled": ic_like_fill,
      "outline": ic_like,
    },
    {
      "filled": ic_chat_fill,
      "outline": ic_chat,
    },{
      "filled": ic_profile_fill,
      "outline": ic_profile,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        color: context.cardColor,
        duration: const Duration(seconds: 1),
        child: IndexedStack(index: _selectedIndex, children: tab),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_icons.length, (index) {
              bool isSelected = index == _selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    isSelected
                        ? _icons[index]["filled"]!
                        : _icons[index]["outline"]!,
                    color:isSelected ? primaryColor:Colors.white,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
