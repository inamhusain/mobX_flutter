// ignore_for_file: unnecessary_question_mark, prefer_void_to_null, unnecessary_this, prefer_collection_literals

class TaskModel {
  Null? cursor;
  List<Items>? items;
  Null? nextPage;

  TaskModel({this.cursor, this.items, this.nextPage});

  TaskModel.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    nextPage = json['next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cursor'] = this.cursor;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['next_page'] = this.nextPage;
    return data;
  }
}

class Items {
  bool? bIsDeleted;
  String? sUser;
  String? sUuid;
  bool? completed;
  String? title;

  Items({this.bIsDeleted, this.sUser, this.sUuid, this.completed, this.title});

  Items.fromJson(Map<String, dynamic> json) {
    bIsDeleted = json['_is_deleted'];
    sUser = json['_user'];
    sUuid = json['_uuid'];
    completed = json['completed'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_is_deleted'] = this.bIsDeleted;
    data['_user'] = this.sUser;
    data['_uuid'] = this.sUuid;
    data['completed'] = this.completed;
    data['title'] = this.title;
    return data;
  }
}
