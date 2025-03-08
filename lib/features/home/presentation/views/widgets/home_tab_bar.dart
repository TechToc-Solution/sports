import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class HomeTabBar extends StatelessWidget {
  final TabController tabController;
  const HomeTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: TabBar(
        controller: tabController,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        padding: EdgeInsets.zero,
        indicatorColor: AppColors.primaryColors,
        labelColor: AppColors.primaryColors,
        unselectedLabelColor: AppColors.textColor,
        dividerColor: AppColors.primaryColors,
        indicatorWeight: 5,
        dividerHeight: 0.5,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(
            child: Text(
              'page1',
              style: Styles.textStyle20.copyWith(color: AppColors.textColor),
            ),
          ),
          Tab(
            child: Text(
              'page2',
              style: Styles.textStyle20.copyWith(color: AppColors.textColor),
            ),
          ),
          Tab(
            child: Text(
              'page3',
              style: Styles.textStyle20.copyWith(color: AppColors.textColor),
            ),
          ),
          Tab(
            child: Text(
              'page4',
              style: Styles.textStyle20.copyWith(color: AppColors.textColor),
            ),
          ),
          Tab(
            child: Text(
              'page5',
              style: Styles.textStyle20.copyWith(color: AppColors.textColor),
            ),
          ),
          Tab(
            child: Text(
              'page6',
              style: Styles.textStyle20.copyWith(color: AppColors.textColor),
            ),
          ),
        ],
      ),
    );
  }
}
