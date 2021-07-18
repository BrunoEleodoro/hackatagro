/*
Error
{
	"data": null,
	"error": {
		"code": 1029,
		"message": "User not found!."
	}
}

Successful
{
	"data": {
		"token_type": "Bearer",
		"expires_in": 1295998,
		"access_token": "nhancv_dep_trai",
		"refresh_token": "call_nhancv_dep_trai"
	}
}
 */

import 'package:hackatagro/models/local/texto.dart';
import 'package:hackatagro/utils/app_log.dart';

import 'base_response.dart';

class TextosResponse extends BaseResponse<Texto> {
  TextosResponse(Map<String, dynamic>? fullJson) : super(fullJson);

  @override
  Texto? jsonToData(dynamic dataJson) {
    try {
      return Texto.fromJson(dataJson as Map<String, dynamic>);
    } catch (e) {
      logger.e('TextosResponse:jsonToData: $e');
    }
    return null;
  }
}
