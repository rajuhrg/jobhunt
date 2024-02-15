import 'dart:async';


import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:jobhunt/utils/constantss.dart';


import 'package:flutter/foundation.dart' show kIsWeb; // remove after web complete /// using for local json if request  from web

class Requests {
  late Dio dio; // = Dio();

  Requests() {
    dio = Dio();
  }
  Future<dynamic> getData(String id) async {
    try {
      var apiRespon = await dio.get(
        '$baseURL/mahasiswa/get/id/$id',
      );
      var apiResponJson = apiRespon.data;
      debugPrint(apiResponJson);
      return apiResponJson;
      // return (apiResponJson['data'] as List)
      //     .map((p) => Mosque.fromJson(p))
      //     .toList();
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        debugPrint("${e.response?.statusCode}");
      } else {
        debugPrint("Message: ${e.message}");
        debugPrint("Error: ${e.error}");
        debugPrint("Error Response: ${e.response}");
      }
    }
  }

  Future<dynamic> postData(Map data, String url, int stime,rtime) async {

    if(kIsWeb){

    }
    Dio dio = Dio();
    debugPrint("$baseURL$url , $data , $stime, $rtime");
              // 'Auth': 'Bearer TESTRAJU1234',
          // 'Connection': 'keep-alive', 'Access-Control-Allow-Origin': "*"
          String urli = "$baseURL$url";
    try {
      Response apiRespon = await dio.post(
        urli,
        data: data,
        options: Options(
          headers: <String,dynamic>{
// // "Accept":" text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
         "Content-Type": "application/json; charset=utf-8",
// //           "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
// //   "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
// //   "Access-Control-Allow-Methods": "GET, POST"
//
//     //     "Access-Control-Allow-Origin": "*",
//     //  "Access-Control-Allow-Credentials": "true",
//     //  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//     //  "Access-Control-Allow-Methods": "POST, OPTIONS"
        },
  //        baseUrl: "http://example.org",
  // connectTimeout: 5000,
  sendTimeout: stime,
  receiveTimeout: rtime,
        ),
      );
      var apiResponJson = apiRespon.data;
      // var a = apiRespon.toString;
      // print(a);
      debugPrint("Raw resopnse: $apiResponJson");
      return apiResponJson;
      // return (apiResponJson['data'] as List)
      //     .map((p) => Mosque.fromJson(p))
      //     .toList();
    } on DioError catch (e) {
      var error = e;
      String message = error.message;
      if (error.type == DioErrorType.connectTimeout) {
        message = 'Connection Timeout';
      } else {
        if (error.type == DioErrorType.receiveTimeout) {
          message = 'Receive Timeout';
        } else if (error.type == DioErrorType.response) {
          message = "404 server not found ${error.response?.statusCode}";
        }
      }
      // return Text('Error: ${message}');
      debugPrint("this message $message");

      if (e.response?.statusCode == 404) {
        debugPrint("status code ${e.response?.statusCode}");
      } else {
        debugPrint("Message: ${e.message}");
        debugPrint("Error: ${e.error}");
        debugPrint("Error Response: ${e.response}");
      }
    }
  }

// Future<dynamic> postDatahttp(Map data, String url, int timeout) async {

// var responseJson;
//  try {
//       var response =  await http.post(Uri.parse(url), body: data, headers:
//      <String, String>{
//   'ContentType': 'application/json; charset=UTF-8',
// "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
//   "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
//   "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
//   },
//        ).timeout(Duration(seconds: timeout));//.onError((error, stackTrace) => throw error.toString());
//       // printr("CallingHttpresponse: $response");
//       responseJson = _response(response);
//       // printr("CallingHttpresponse2: $responseJson");
//     } on SocketException  {
//       // printr("Socket Errr exception");
//       // responseJson = {'suc':-10,'msg':"No Internet connection"};
//        throw FetchDataException('No Internet connection');
//     }on TimeoutException catch (_) {
//       // var res = {
//       //   "suc": 0,
//       //   "status": "Connection Error",
//       //   "msg": "Connection timeout"
//       // };
//       throw ConnectionTimeOut("Connection timeout");
//       // responseJson = jsonEncode(res);
//     } on Error catch (_) {
//       // printr('Error: $e');
//     }
//     return responseJson;
//   }

//   String _response(http.Response response) {
//     print("response  : $response");
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = response.body.toString();
//         return responseJson;
//       case 400:
//         // printr("httperror 400");
//         throw BadRequestException(response.body.toString());
//       case 401:
//         // printr("httperror 401");
//         // throw "401 Exception";
//         throw FileNotFoundException("File Not Found Exception");
//       case 403:
//         // printr("httperror 403");
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//         // printr("httperror 500");
//         throw InvalidInputException("Internal Server Error");
//       default:
//         throw FetchDataException('Error occured while Communication with Server with StatusCode: ${response.statusCode}');
//     }
//   }


}




class CustomException implements Exception {
  final  _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  // // @override
  String toString() {
    return "$_prefix $_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException(String message) : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException(message) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException(message) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException(String message) : super(message, "Invalid Input: ");
}

class InternalServerError extends CustomException {
  InternalServerError(String message) : super(message, "Server Error: ");
}

class ConnectionTimeOut extends CustomException {
  ConnectionTimeOut(String message) : super(message, "Network Error: ");
}

class FileNotFoundException extends CustomException {
  FileNotFoundException(String message) : super(message, "Not Found");
}



