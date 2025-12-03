import 'package:flutter/material.dart';

import '../../../../core/utilises/colors.dart';
import '../widgets/all_news.dart';
import '../widgets/home_top_section.dart';
import '../widgets/trending_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            color: AppColors.appTextColor,
            onPressed: () {},
            icon: Icon(Icons.sunny),
          ),
        ],
        backgroundColor: AppColors.appBarColor,
        title: Text('News', style: TextStyle(color: AppColors.appTextColor)),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Expanded(flex: 2, child: HomeTopSection()),
          Expanded(flex: 2,child: TrendingSection()),
          Expanded(flex:7,child: AllNews())
        ],
      ),
    );
  }
}
