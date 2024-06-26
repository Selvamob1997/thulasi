class LeaveTypeModel {
  int? status;
  List<Result>? result;

  LeaveTypeModel({this.status, this.result});

  LeaveTypeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? leaveType;
  String? leaveCode;

  Result({this.leaveType, this.leaveCode});

  Result.fromJson(Map<String, dynamic> json) {
    leaveType = json['LeaveType'];
    leaveCode = json['LeaveCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LeaveType'] = leaveType;
    data['LeaveCode'] = leaveCode;
    return data;
  }
}
