import 'package:flutter/material.dart';

class ConverterCard extends StatelessWidget {
  final TextEditingController inputController;
  final String conversionType;
  final double? result;
  final VoidCallback onConvert;
  final ValueChanged<String?> onConversionTypeChanged;

  const ConverterCard({
    super.key,
    required this.inputController,
    required this.conversionType,
    required this.result,
    required this.onConvert,
    required this.onConversionTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Temperature Converter',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            
            // Conversion Type Selection
            const Text(
              'Conversion Type:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('°F to °C'),
                    value: 'F to C',
                    groupValue: conversionType,
                    onChanged: onConversionTypeChanged,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('°C to °F'),
                    value: 'C to F',
                    groupValue: conversionType,
                    onChanged: onConversionTypeChanged,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Temperature Input
            TextField(
              controller: inputController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Enter temperature',
                hintText: conversionType == 'F to C' ? 'Temperature in °F' : 'Temperature in °C',
                border: const OutlineInputBorder(),
                suffixText: conversionType == 'F to C' ? '°F' : '°C',
              ),
            ),
            const SizedBox(height: 20),
            
            // Convert Button
            ElevatedButton(
              onPressed: onConvert,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Convert',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            
            // Result Display
            if (result != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  border: Border.all(color: Colors.green.shade200),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Result:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${result!.toStringAsFixed(2)}${conversionType == 'F to C' ? '°C' : '°F'}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}