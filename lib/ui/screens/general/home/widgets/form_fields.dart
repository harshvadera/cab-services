part of 'widget_imports.dart';

class FormFields extends StatelessWidget {
  const FormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Pick-up City',
              prefixIcon: Icon(Icons.location_on),
            ),
            items: ['City A', 'City B', 'City C'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {},
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Drop City',
              prefixIcon: Icon(Icons.location_off),
            ),
            items: ['City A', 'City B', 'City C'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {},
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Pick-up Date',
              prefixIcon: Icon(Icons.calendar_today),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (pickedDate != null) {
                // Handle picked date
              }
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Pick-up Time',
              prefixIcon: Icon(Icons.access_time),
            ),
            onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (pickedTime != null) {
                // Handle picked time
              }
            },
          ),
        ],
      ),
    );
  }
}
