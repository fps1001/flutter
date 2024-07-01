enum FromWho {mine, hers}

class Message {
  final String text;
  final String? imageUrl; //opcional
  final FromWho fromwho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromwho
  });
}

