import 'package:jobhunt/servercon/requests.dart';

 class HttpRequests {
  // HttpRequests(this.data, this.url, this.timeout);
  Requests httpRequest = Requests();

  // final Map data;
  // final String url;
  // final int timeout;

   Future<dynamic> requests(data, url, stime,rtime) async {
    var a = await httpRequest.postData(data, url, stime, rtime);
    return a;
   }
}
