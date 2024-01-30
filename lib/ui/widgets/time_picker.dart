part of 'common_widgets_imports.dart';

final selectedTimeProvider = StateProvider.autoDispose<TimeOfDay>((ref) {
  return TimeOfDay.now();
});

class TimePickerFormField extends ConsumerWidget {
  const TimePickerFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = ref.watch(selectedTimeProvider);

    return TextFormField(
      readOnly: true,
      onTap: () => _selectTime(context, ref, selectedTime),
      decoration: InputDecoration(
        fillColor: MyColors.secondaryColor,
        filled: true,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: MyColors.secondaryColor,
            ),
            borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.all(15),
        hintText: 'Pick-up Time',
        helperText: "Select a Time",
        prefixIcon: const Icon(Icons.access_time),
      ),
      controller: TextEditingController(
        text: selectedTime.format(context), // Dynamically set the text
      ),
    );
  }

  Future<void> _selectTime(
      BuildContext context, WidgetRef ref, TimeOfDay selectedTime) async {
    final newTime = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.inputOnly,
      initialTime: selectedTime,
    );

    if (newTime != null) {
      ref.read(selectedTimeProvider.notifier).state = newTime;
    }
  }
}
