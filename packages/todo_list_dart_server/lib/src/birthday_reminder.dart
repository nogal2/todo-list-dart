import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';

class BirthdayReminder extends FutureCall<Greeting> {
  @override
  Future<void> invoke(Session session, Greeting? object) async {
    session.log('${object?.message} Remember to send a birthday card!');
  }
}
