import 'dart:convert';
import 'dart:developer';

void prettyLog(dynamic input, {String tag = 'Hasan LOG'}) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final pretty = encoder.convert(input);
  log('\x1B[32m RESPONSE $pretty', name: tag);
}