class getBranchModel {
  int? status;
  List<Result>? result;

  getBranchModel({this.status, this.result});

  getBranchModel.fromJson(Map<String, dynamic> json) {
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
  int? code;
  String? branchCode;

  Result({this.code, this.branchCode});

  Result.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    branchCode = json['BranchCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Code'] = this.code;
    data['BranchCode'] = this.branchCode;
    return data;
  }
}
