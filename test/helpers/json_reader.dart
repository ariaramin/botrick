import 'dart:io';

String readJson(String path) {
  final dir = Directory.current.path;
  return File('$dir/test/$path').readAsStringSync();
}
