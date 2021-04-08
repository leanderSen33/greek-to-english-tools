import 'dart:async';
import 'dart:io';

// we omit async and await because we're using the then. syntax.
// .readAsString returns a String.
// void gettingString() {
//   File file = File('files/yourFile.txt');
//   file.readAsString().then((value) {
//     print('Read as String: $value');
//   });
// }

Stream<String> greekWords(Iterable<String> streamingGreekWords) async* {
  for (var words in streamingGreekWords) yield words;
}

// This is the other way. Using the async and await keywords.
// .readAsLines returns a List.
gettingLine() async {
  File file = File('yourFile.txt');
  var result2 = await file.readAsLines();
  return result2;
}

Map specialLetters = {
  'Ά': 'Α',
  'Έ': 'Ε',
  'Ή': 'Η',
  'Ί': 'Ι',
  'Ό': 'Ο',
  'Ύ': 'Υ',
  'Ώ': 'Ω',
  'Ϊ': 'Ι',
  'Ϋ': 'Υ',
};

// List<String> mismatchedLetters = [
//   'E',
//   'K',
//   'P',
//   'A',
//   'B',
//   'T',
//   'Y',
//   'I',
//   'O',
//   'H',
//   'Z',
//   'X',
//   'N',
//   'M',
// ];

RegExp mismatchedLetters = RegExp(r'[^ΕΚΡΑΒΤΥΙΟΗΖΧΝΜ]');

void fixWords(Iterable<String> list) async {
  String stringOfList = list.toString();
  String upperWord;
  List <String>finalList = [];

  for (String word in list) {
    upperWord = word.toUpperCase();

    for (String letter in specialLetters.keys) {
      upperWord = upperWord.replaceAll(letter, specialLetters[letter]);
      // print(upperWord);
    }
    if (!upperWord.contains(mismatchedLetters)) {
      //print(upperWord);
      // stringOfList = stringOfList.replaceFirst(word, upperWord);
      finalList.add(upperWord);
    }
  }

  print(finalList);
  final filename = 'file.txt';
  await File(filename).writeAsString(finalList.toString());
}

void main() async {
  print('First Task, testing...');
  Iterable<String> readAsLineList = await gettingLine();
  fixWords(readAsLineList);
}

// gettingString();

// print('Read as Line: $resultingLine \n');
// print('Type for Resulting: ${resultingLine.runtimeType}');
// // stdout.writeAll([resultingString], "");

// Stream firstStream = greekWords(resultingLine);
//
// firstStream.where((event) => event.contains('Α'));

//
// firstStream.listen(
//   (event) {
//     String modifyCase = event;
//     print('Streamed: ${modifyCase.toUpperCase()}');
//   },
// );

// String bo = '';
// for (var word in resultingLine) {
//   // print(word);
//   String newWord = word;
//   bo = newWord.toUpperCase();
//   print('UpperCasedWord: $bo');
// }
// stdout.writeln('\n result: $bo');
