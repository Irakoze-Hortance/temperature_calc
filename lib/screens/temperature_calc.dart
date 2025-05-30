import 'package:flutter/material.dart';
import '../widgets/converter_card.dart';
import '../widgets/history_card.dart';

class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});

  @override
  State<TemperatureConverterScreen> createState() => _TemperatureConverterScreenState();
}

class _TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _conversionType = 'F to C';
  double? _result;
  final List<String> _history = [];

  void _convertTemperature() {
    final input = _inputController.text.trim();
    if (input.isEmpty) {
      _showError('Please enter a temperature value');
      return;
    }

    final double? inputValue = double.tryParse(input);
    if (inputValue == null) {
      _showError('Please enter a valid number');
      return;
    }

    double convertedValue;
    String historyEntry;

    if (_conversionType == 'F to C') {
      convertedValue = (inputValue - 32) * 5 / 9;
      historyEntry = 'F to C: ${inputValue.toStringAsFixed(1)} => ${convertedValue.toStringAsFixed(2)}';
    } else {
      convertedValue = inputValue * 9 / 5 + 32;
      historyEntry = 'C to F: ${inputValue.toStringAsFixed(1)} => ${convertedValue.toStringAsFixed(2)}';
    }

    setState(() {
      _result = convertedValue;
      _history.insert(0, historyEntry);
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _clearHistory() {
    setState(() {
      _history.clear();
    });
  }

  void _onConversionTypeChanged(String? value) {
    setState(() {
      _conversionType = value!;
      _result = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return _buildPortraitLayout();
          } else {
            return _buildLandscapeLayout();
          }
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConverterCard(
            inputController: _inputController,
            conversionType: _conversionType,
            result: _result,
            onConvert: _convertTemperature,
            onConversionTypeChanged: _onConversionTypeChanged,
          ),
          const SizedBox(height: 20),
          HistoryCard(
            history: _history,
            onClearHistory: _clearHistory,
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ConverterCard(
              inputController: _inputController,
              conversionType: _conversionType,
              result: _result,
              onConvert: _convertTemperature,
              onConversionTypeChanged: _onConversionTypeChanged,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 1,
            child: HistoryCard(
              history: _history,
              onClearHistory: _clearHistory,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}
