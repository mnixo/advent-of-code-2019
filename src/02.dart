import 'dart:io';

Future<void> main() async {
  var input = await File('input/02').readAsString();
  print(updateIntCode(updateNounVerb(input, '12', '2')));
  List<int> nounVerb = findNounVerb(input, 19690720);
  print(100 * nounVerb[0] + nounVerb[1]);
}

String updateNounVerb(String intCode, String noun, String verb) {
  var data = intCode.split(',');
  data[1] = noun;
  data[2] = verb;
  return data.join(',');
}

void updateValue(List<int> data, idx, fn) {
  data[data[idx + 3]] = fn(data[data[idx + 1]], data[data[idx + 2]]);
}

String updateIntCode(String s) {
  var data = s.split(',').map(int.parse).toList();
  for(var i = 0; i < s.length; i += 4) {
    var opcode = data[i];
    if (opcode == 99) {
      return data.join(',');
    } else if (opcode == 1) {
      updateValue(data, i, (a, b) => a + b);
    } else if (opcode == 2) {
      updateValue(data, i, (a, b) => a * b);
    }
  }
  return data.join(',');
}

List<int> findNounVerb(String intCode, int value) {
  for (var i = 0; i < 100; i++) {
    for (var j = 0; j < 100; j++) {
      String code = updateNounVerb(intCode, i.toString(), j.toString());
      code = updateIntCode(code);
      if (code.split(',')[0] == value.toString()) {
        return [i, j];
      }
    }
  }
  return null;
}
