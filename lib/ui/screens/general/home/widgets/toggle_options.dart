part of 'widget_imports.dart';

final oneWayToggleProvider = StateProvider<bool>((ref) => true);
final roundTripToggleProvider = StateProvider<bool>((ref) => false);
final toggleOptionVisible = StateProvider.autoDispose<bool>((ref) => false);

class ToggleOption extends StatelessWidget {
  final String label;
  final bool isSelected;

  final VoidCallback onPressed;

  const ToggleOption({
    required this.label,
    required this.isSelected,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.grey,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: MyColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ToggleOptions extends ConsumerWidget {
  final bool isVisible;
  final String label1;
  final String label2;

  const ToggleOptions({
    required this.isVisible,
    required this.label1,
    required this.label2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oneWayToggle = ref.watch(oneWayToggleProvider.notifier);
    final roundTripToggle = ref.watch(roundTripToggleProvider.notifier);

    return isVisible
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ToggleOption(
                label: label1,
                isSelected: oneWayToggle.state,
                onPressed: () {
                  ref.read(oneWayToggleProvider.notifier).state =
                      !oneWayToggle.state;
                  ref.read(roundTripToggleProvider.notifier).state = false;
                },
              ),
              ToggleOption(
                label: label2,
                isSelected: roundTripToggle.state,
                onPressed: () {
                  ref.read(roundTripToggleProvider.notifier).state =
                      !roundTripToggle.state;
                  ref.read(oneWayToggleProvider.notifier).state = false;
                },
              ),
            ],
          )
        : Container();
  }
}
