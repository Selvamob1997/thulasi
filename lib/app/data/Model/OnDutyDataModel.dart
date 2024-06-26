class OnDutyDataModel {
  int? status;
  List<Result>? result;

  OnDutyDataModel({this.status, this.result});

  OnDutyDataModel.fromJson(Map<String, dynamic> json) {
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
  int? docNo;
  String? empName;
  String? onDutyType;
  String? fromDate;
  String? toDate;
  String? fromLoc;
  String? toLoc;
  String? fromTime;
  String? toTime;
  String? status;

  Result(
      {this.docNo,
        this.empName,
        this.onDutyType,
        this.fromDate,
        this.toDate,
        this.fromLoc,
        this.toLoc,
        this.fromTime,
        this.toTime,
        this.status});

  Result.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    empName = json['EmpName'];
    onDutyType = json['OnDutyType'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    fromLoc = json['FromLoc'];
    toLoc = json['ToLoc'];
    fromTime = json['FromTime'];
    toTime = json['ToTime'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocNo'] = this.docNo;
    data['EmpName'] = this.empName;
    data['OnDutyType'] = this.onDutyType;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['FromLoc'] = this.fromLoc;
    data['ToLoc'] = this.toLoc;
    data['FromTime'] = this.fromTime;
    data['ToTime'] = this.toTime;
    data['Status'] = this.status;
    return data;
  }
}
