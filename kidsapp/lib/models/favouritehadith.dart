class Favouritehadith {
  List<Result> result;

  Favouritehadith({this.result});

  Favouritehadith.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int id;
  int hadithId;
  int userId;
  String createdAt;
  String updatedAt;
  Hadiths hadiths;

  Result(
      {this.id,
      this.hadithId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.hadiths});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hadithId = json['hadith_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    hadiths =
        json['hadiths'] != null ? new Hadiths.fromJson(json['hadiths']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hadith_id'] = this.hadithId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.hadiths != null) {
      data['hadiths'] = this.hadiths.toJson();
    }
    return data;
  }
}

class Hadiths {
  int id;
  String title;
 
 
  
  Hadiths(
      {this.id,
      this.title,
      });

  Hadiths.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
   
  }
 
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}