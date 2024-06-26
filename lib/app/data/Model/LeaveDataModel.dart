class LeaveDataModel {
  int? status;
  List<Result>? result;

  LeaveDataModel({this.status, this.result});

  LeaveDataModel.fromJson(Map<String, dynamic> json) {
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
  String? fromDate;
  String? toDate;
  String? noDays;
  String? status;

  Result(
      {this.docNo,
        this.empName,
        this.fromDate,
        this.toDate,
        this.noDays,
        this.status});

  Result.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    empName = json['EmpName'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    noDays = json['NoDays'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocNo'] = this.docNo;
    data['EmpName'] = this.empName;
    data['FromDate'] = this.fromDate;
    data['ToDate'] = this.toDate;
    data['NoDays'] = this.noDays;
    data['Status'] = this.status;
    return data;
  }
}
