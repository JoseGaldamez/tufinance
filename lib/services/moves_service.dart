import 'package:http/http.dart' as http;
import 'package:tufinance/models/move_model.dart';

// login
Future<bool> addMoveService(MoveModel move, String userEmail) async {
  final usercode = userEmail.split("@").first.replaceAll(".", "_");
  final currentDate = DateTime.now();
  final currentMonth = getCurrentMonth(currentDate);

  var urlPostMove = Uri.https('uth-chat-default-rtdb.firebaseio.com',
      'users/$usercode/moves/$currentMonth/${move.type}.json');

  var response = await http.post(urlPostMove, body: moveModelToJson(move));

  if (response.statusCode != 200) {
    return false;
  }

  return true;
}

String getCurrentMonth(DateTime date) {
  switch (date.month) {
    case 1:
      return "enero";
    case 2:
      return "febrero";
    case 3:
      return "marzo";
    case 4:
      return "abril";
    case 5:
      return "mayo";
    case 6:
      return "junio";
    case 7:
      return "julio";
    case 8:
      return "agosto";
    case 9:
      return "septiembre";
    case 10:
      return "octubre";
    case 11:
      return "noviembre";
    case 12:
      return "diciembre";
  }
  return "enero";
}
