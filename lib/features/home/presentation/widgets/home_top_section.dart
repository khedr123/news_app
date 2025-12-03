import 'package:flutter/material.dart';
import 'package:news_app/core/utilises/colors.dart';

class HomeTopSection extends StatefulWidget {
  HomeTopSection({super.key});

  @override
  State<HomeTopSection> createState() => _HomeTopSectionState();
}

class _HomeTopSectionState extends State<HomeTopSection> {
  final TextEditingController controller = TextEditingController();
  List<String> news = [
    'All',
    'Politics',
    'Business',
    'Sports',
    'Technology',
    'Health',
  ];
  int currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.backgroundColor,
      body: Container(padding:EdgeInsets.all(10) ,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
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
                    child: InkWell(borderRadius:BorderRadius.circular(15) ,splashColor:Colors.transparent ,focusColor: Colors.grey,onTap: (){
                      setState(() {
                        currentIndex = index ;
                      });
                    },
                      child: Chip(
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: currentIndex==index?Colors.green:Colors.grey,
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
