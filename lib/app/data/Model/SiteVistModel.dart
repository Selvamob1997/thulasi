class SiteVistModel {
  int? status;
  List<Result>? result;

  SiteVistModel({this.status, this.result});

  SiteVistModel.fromJson(Map<String, dynamic> json) {
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
  String? cardName;
  String? inTime;
  String? outTime;
  String? status;

  Result(
      {this.docNo,
        this.empName,
        this.cardName,
        this.inTime,
        this.outTime,
        this.status});

  Result.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    empName = json['EmpName'];
    cardName = json['CardName'];
    inTime = json['InTime'];
    outTime = json['OutTime'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocNo'] = this.docNo;
    data['EmpName'] = this.empName;
    data['CardName'] = this.cardName;
    data['InTime'] = this.inTime;
    data['OutTime'] = this.outTime;
    data['Status'] = this.status;
    return data;
  }
}
