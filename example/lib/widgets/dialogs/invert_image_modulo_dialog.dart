import 'package:flutter/material.dart';

/// A dialog widget that allows users to set a modulo value for image inversion.
class InvertImageModuloDialog extends StatefulWidget {
  /// Creates a [InvertImageModuloDialog].
  /// Requires an [initialModulo] which is displayed as the default value in the
  /// dialog.
  const InvertImageModuloDialog({required this.initialModulo, super.key});

  /// The initial modulo value for image inversion.
  final int initialModulo;

  @override
  State<InvertImageModuloDialog> createState() => _InvertImageModuloDialogState();
}

class _InvertImageModuloDialogState extends State<InvertImageModuloDialog> {
  late int tempModulo;

  @override
  void initState() {
    super.initState();
    tempModulo = widget.initialModulo;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Invert Image Modulo'),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            Slider(
              value: tempModulo.toDouble(),
              min: 1,
              max: 255,
              divisions: 254,
              label: '$tempModulo',
              onChanged: (double value) {
                setState(() {
                  tempModulo = value.toInt();
                });
              },
            ),
            Text('Modulo: $tempModulo'),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, tempModulo);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}