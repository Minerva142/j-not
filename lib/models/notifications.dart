class listofnot{
  final List<Nots> bildirim;
  listofnot({
    this.bildirim,
  });
  factory listofnot.fromJson(List<dynamic> parsedJson){
    List<Nots> bildirim=new List<Nots>();
    bildirim=parsedJson.map((i) => Nots.fromJson(i)).toList();
    return new listofnot(
      bildirim: bildirim,
    );
  }
}

class Nots{
  String actualdate;
  int bosstatus;
  int log_ref;
  String subject;
  int priority;
  final message_content;
  int not_type;
  Nots({
    this.actualdate,
    this.bosstatus,
    this.log_ref,
    this.subject,
    this.priority,
    this.message_content,
    this.not_type,
  });
  factory Nots.fromJson(Map<String, dynamic> json){
    return new Nots(
      actualdate: json["ACTUALDATE"],
      bosstatus: json["BOSTATUS"],
      log_ref: json["LOGICALREF"],
      subject: json["MESSAGESUBJECT"],
      priority: json["PRIORITY"],
      message_content: json["MESSAGECONTENT"],
      not_type: json["NOTIFICATIONTYPE"],
    );
  }

}