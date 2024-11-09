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
  String? attendate;
  String? inTime;
  String? outTime;
  String? totalhrs;
  String? shifintime;
  String? shifoutTime;
  String? purchase;
  String? status;

  Result(
      {this.docNo,
        this.empName,
        this.attendate,
        this.inTime,
        this.outTime,
        this.totalhrs,
        this.shifintime,
        this.shifoutTime,
        this.purchase,this.status

      });

  Result.fromJson(Map<String, dynamic> json) {
    docNo = json['DocNo'];
    empName = json['EmpName'];
    attendate = json['AttendanceDate'];
    inTime = json['InTime'];
    outTime = json['OutTime'];
    totalhrs = json['TotalHrs'];
    shifintime = json['ShifInTime'];
    shifoutTime = json['ShiftOutTime'];
    purchase = json['PuchType'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocNo'] = this.docNo;
    data['EmpName'] = this.empName;
    data['AttendanceDate'] = this.attendate;
    data['InTime'] = this.inTime;
    data['OutTime'] = this.outTime;
    data['TotalHrs'] = this.totalhrs;
    data['ShifInTime'] = this.shifintime;
    data['ShiftOutTime'] = this.shifoutTime;
    data['PuchType'] = this.purchase;
    data['Status'] = this.status;
    return data;
  }
}
