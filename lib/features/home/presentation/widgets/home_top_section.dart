import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utilises/colors/colors.dart';
import 'package:news_app/features/home/presentation/cubit/home_cubit.dart';

class HomeTopSection extends StatefulWidget {
  const HomeTopSection({super.key});

  @override
  State<HomeTopSection> createState() => _HomeTopSectionState();
}

class _HomeTopSectionState extends State<HomeTopSection> {
  final TextEditingController _controller = TextEditingController();
  List<String> news = [
    'All',
    'Politics',
    'Business',
    'Sports',
    'Technology',
    'Health',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                BlocProvider.of<HomeCubit>(context).getFilteredNews(value);
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {
                    BlocProvider.of<HomeCubit>(
                      context,
                    ).getFilteredNews(_controller.text);
                  },
                  icon: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                  onPressed: () {_controller.clear();
                  BlocProvider.of<HomeCubit>(context).getFilteredNews('');

                  },
                  icon: Icon(Icons.close),
                ),
                hintText: 'Search For Article',
                filled: true,
                fillColor: AppColors.fillColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      splashColor: Colors.transparent,
                      focusColor: Colors.grey,
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Chip(
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: currentIndex == index
                            ? Colors.green
                            : Colors.grey,
                        label: Text(news[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
