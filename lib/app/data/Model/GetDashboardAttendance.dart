class GetDashboardAttendance {
  int? status;
  List<Result>? result;

  GetDashboardAttendance({this.status, this.result});

  GetDashboardAttendance.fromJson(Map<String, dynamic> json) {
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
  String? day;
  String? date;
  String? myDay;
  String? empId;
  String? empName;
  String? attStatus;

  Result({this.day, this.date, this.myDay,this.empId,this.empName,this.attStatus});

  Result.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    date = json['date'];
    myDay = json['MyDay'];
    empId = json['EmpId'];
    empName = json['EmpName'];
    attStatus = json['AttStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['date'] = date;
    data['MyDay'] = myDay;
    data['EmpId'] = empId;
    data['EmpName'] = empName;
    data['AttStatus'] = attStatus;
    return data;
  }
}
