class ActiveModel {
  int? status;
  List<Result>? result;

  ActiveModel({this.status, this.result});

  ActiveModel.fromJson(Map<String, dynamic> json) {
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
  var empID;
  String? name;
  String? sattus;

  Result({this.empID, this.name, this.sattus});

  Result.fromJson(Map<String, dynamic> json) {
    empID = json['EmpID'];
    name = json['Name'];
    sattus = json['Sattus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EmpID'] = this.empID;
    data['Name'] = this.name;
    data['Sattus'] = this.sattus;
    return data;
  }
}
