import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:news_app/features/home/presentation/cubit/home_states.dart';
import 'package:news_app/features/home/presentation/widgets/trending_news_item.dart';

import '../../../../core/utilises/colors/colors.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          spacing: 20,
          children: [
            Row(
              children: [
                Icon(color: Colors.red, Icons.trending_up),
                Text('  Trending Now'),
              ],
            ),
            BlocBuilder<HomeCubit, HomeStates>(
              buildWhen: (previous, current) =>
              current is GetTrendingNewsFaluire ||
                  current is GetTrendingNewsLoading ||
                  current is GetTrendingNewsSuccess,
              builder: (context, state) {
                if (state is GetTrendingNewsLoading) {
                  return Center(
                    child: LoadingAnimationWidget.dotsTriangle(
                      color: AppColors.backgroundColor,
                      size: 15,
                    ),
                  );
                } else if (state is GetTrendingNewsFaluire) {
                  return Center(
                    child: Text(
                      'Error',
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  );
                } else if (state is GetTrendingNewsSuccess) {
                  final List<ArticleModel> articles = state.articles;
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: TrendingNewsItemWidget(
                            article: articles[index],
                            index: index,
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
