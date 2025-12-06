import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/appbar.dart';
import '../../../../core/utilises/colors/colors.dart';
import '../widgets/all_news.dart';
import '../widgets/home_top_section.dart';
import '../widgets/trending_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'News',
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.sunny),
            color: AppColors.appTextColor,
          ),
        ],
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
