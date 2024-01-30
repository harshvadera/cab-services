part of 'general_imports.dart';

class General extends ConsumerWidget {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  General({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });
    List<TabItem> items = [
      const TabItem(
        icon: FeatherIcons.home,
        // title: 'Home',
      ),
      const TabItem(
        icon: Icons.trip_origin,
        // title: 'Wishlist',
      ),
      const TabItem(
        icon: FeatherIcons.user,
        // title: 'profile',
      ),
    ];

    List<Widget> pages = [
      FadedScaleAnimation(child: const Home()),
      const Mytrip(),
      // const More(),
      const Profile(),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: pages,
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
          valueListenable: _currentPage,
          builder: (context, index, child) {
            return BottomBarCreative(
              iconSize: 30.h,
              items: items,
              backgroundColor: MyColors.primaryColor,
              color: MyColors.primaryColor.withOpacity(0.3),
              colorSelected: MyColors.secondaryColor,
              indexSelected: index,
              highlightStyle: const HighlightStyle(
                isHexagon: true,
              ),
              onTap: (int index) {
                _pageController.jumpToPage(index);
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                );
              },
            );
          }),
    );
  }
}
