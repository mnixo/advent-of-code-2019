import 'dart:io';

Future<void> main() async {
  var totalPart1 = 0;
  var totalPart2 = 0;
  (await File('input/01').readAsLines()).map(int.parse).forEach((m) {
    totalPart1 += getFuelRequiredPart1(m);
    totalPart2 += getFuelRequiredPart2(m);
  });
  print('Part 1 Total: ' + totalPart1.toString());
  print('Part 2 Total: ' + totalPart2.toString());
}

int getFuelRequiredPart1(int mass) {
  return (mass / 3).floor() - 2;
}

int getFuelRequiredPart2(int mass) {
  var fuelRequired = (mass / 3).floor() - 2;
  if (fuelRequired > 5) {
    fuelRequired += getFuelRequiredPart2(fuelRequired);
  }
  return fuelRequired;
}
