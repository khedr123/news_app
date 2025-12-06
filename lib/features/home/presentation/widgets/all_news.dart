import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utilises/colors/colors.dart';
import '../../data/models/article_model.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import 'all_news_item.dart';

class AllNews extends StatelessWidget {
  const AllNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: BlocBuilder<HomeCubit, HomeStates>(
        buildWhen: (previous, current) =>
            current is GetAllNewsFaluire ||
            current is GetAllNewsLoading ||
            current is GetAllNewsSuccess,
        builder: (context, state) {
          if (state is GetAllNewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetAllNewsFaluire) {
            return Center(child: Text('Error'));
          } else if (state is GetAllNewsSuccess) {
            final List<ArticleModel> articles = state.articles;

            return articles.isEmpty
                ? Center(
                    child: Text(
                      'No News Found',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return AllNewsItemWidget(article: articles[index]);
                    },
                  );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
