class PermisionDataModel {
  int? status;
  List<Result>? result;

  PermisionDataModel({this.status, this.result});

  PermisionDataModel.fromJson(Map<String, dynamic> json) {
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
  String? empName;
  int? docNo;
  String? fromDate;
  String? fromTime;
  String? toTime;
  String? totalTime;
  String? status;
  String? purposeofvist;

  Result(
      {this.empName,
        this.docNo,
        this.fromDate,
        this.fromTime,
        this.toTime,
        this.totalTime,
        this.status,
        this.purposeofvist});

  Result.fromJson(Map<String, dynamic> json) {
    empName = json['EmpName'];
    docNo = json['DocNo'];
    fromDate = json['FromDate'];
    fromTime = json['FromTime'];
    toTime = json['ToTime'];
    totalTime = json['TotalTime'];
    status = json['Status'];
    purposeofvist = json['Purposeofvist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmpName'] = this.empName;
    data['DocNo'] = this.docNo;
    data['FromDate'] = this.fromDate;
    data['FromTime'] = this.fromTime;
    data['ToTime'] = this.toTime;
    data['TotalTime'] = this.totalTime;
    data['Status'] = this.status;
    data['Purposeofvist'] = this.purposeofvist;
    return data;
  }
}
