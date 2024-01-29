part of 'home_imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.assetsImagesRideLogo,
                    width: 200.w,
                    height: 74.h,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_active,
                      size: 35,
                      color: MyColors.whiteColor,
                    ),
                  ),
                ],
              ),
              10.h.heightBox,
              "India’s Leading One Way Inter-City Cab Service Provider"
                  .text
                  .xl
                  .maxLines(2)
                  .fontWeight(FontWeight.w700)
                  .color(MyColors.whiteColor)
                  .make(),
              10.h.heightBox,
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      Assets.assetsImagesBanner1,
                      width: 400.w,
                      height: 150.h,
                    ),
                    // 10.h.heightBox,
                    SmoothPageIndicator(
                        controller:
                            homeViewModel.BannerController, // PageController
                        count: 3,
                        effect: const WormEffect(
                            activeDotColor: MyColors.secondaryColor,
                            dotHeight: 12.0,
                            dotWidth: 12.0), // your preferred effect
                        onDotClicked: (index) {}),
                  ],
                ),
              ),
              20.h.heightBox,
              VxScrollHorizontal(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TripeTypeButton(title: "Outstation Trip", onTap: () {}),
                    TripeTypeButton(title: "Local Trip", onTap: () {}),
                    TripeTypeButton(title: "Aiport Transfer", onTap: () {})
                  ],
                ),
              ),
              10.h.heightBox,
              const ToggleOptions(),
               FormFields()
            ],
          ),
        ),
      ),
    );
  }
}
