class HolidayListModel {
  int? status;
  List<Result>? result;

  HolidayListModel({this.status, this.result});

  HolidayListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? uLocation;
  String? uHldCode;
  String? sTADATE;
  String? eNDDATE;
  String? uRmrks;

  Result(
      {this.uLocation, this.uHldCode, this.sTADATE, this.eNDDATE, this.uRmrks});

  Result.fromJson(Map<String, dynamic> json) {
    uLocation = json['U_Location'];
    uHldCode = json['U_HldCode'];
    sTADATE = json['STADATE'];
    eNDDATE = json['ENDDATE'];
    uRmrks = json['U_Rmrks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['U_Location'] = this.uLocation;
    data['U_HldCode'] = this.uHldCode;
    data['STADATE'] = this.sTADATE;
    data['ENDDATE'] = this.eNDDATE;
    data['U_Rmrks'] = this.uRmrks;
    return data;
  }
}
