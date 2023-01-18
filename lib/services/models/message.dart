import 'package:said/services/models/user.dart';

class Message {
  final int id;

  Message(
      {required this.id,
      required this.user,
      required this.message,
      required this.dateSent});

  final User user;
  final String message;
  final DateTime dateSent;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      user: json['user'],
      message: json['message'],
      dateSent: json['dateSent'],
    );
  }

  Map toJson() => {
    'id': id,
    'user': user,
    'message': message,
    'dateSent': dateSent,
  };
}
