import 'package:countrycodes_field/src/models/country.dart';
import 'package:countrycodes_field/src/screens/selection.dart';
import 'package:countrycodes_field/src/utils/slide.dart';
import 'package:flutter/material.dart';

class CountryField extends StatefulWidget {
  final ValueChanged<Country?>? onSelect;
  final TextStyle? textStyle;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;

  const CountryField({
    Key? key,
    this.onSelect,
    this.textStyle,
    this.disabledBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedBorder,
  }) : super(key: key);

  @override
  State<CountryField> createState() => _CountryFieldState();
}

class _CountryFieldState extends State<CountryField> {
  final TextEditingController controller = TextEditingController();
  Country? country;

  Future<void> select(BuildContext context) async {
    Country? selected = await Navigator.push(
      context,
      slidingRoute<Country>(
        const CountrySelection(),
      ) as Route<Country>,
    );
    setState(() {
      country = selected;
    });
    controller.text = selected?.name ?? "";
    widget.onSelect?.call(selected);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Country',
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.chevron_right),
        prefix: country == null
            ? null
            : SizedBox(
                width: 40,
                child: Text(
                  country!.flag,
                  textAlign: TextAlign.center,
                ),
              ),
        errorBorder: widget.errorBorder,
        focusedBorder: widget.focusedBorder,
        enabledBorder: widget.enabledBorder,
        disabledBorder: widget.disabledBorder,
      ),
      onTap: () => select(context),
    );
  }
}
