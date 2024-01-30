part of 'widget_imports.dart';

class TripeTypeButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TripeTypeButton({
    super.key,
    required,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 80.h,
          width: 120.w,
          decoration: BoxDecoration(
              color: MyColors.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  children: [
                    const Icon(FeatherIcons.map),
                    10.h.heightBox,
                    title.text
                        .size(12.sp)
                        .fontWeight(FontWeight.w700)
                        .color(MyColors.whiteColor)
                        .make(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
