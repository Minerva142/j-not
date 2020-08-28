
class listlogref{
  final List<Logicalref> refs;
  listlogref({
    this.refs,
  });
  factory listlogref.fromJson(List<dynamic> parsedJson){
    List<Logicalref> refs=new List<Logicalref>();
    refs=parsedJson.map((i)=>Logicalref.fromJson(i)).toList();
    return new listlogref(
      refs: refs,
    );
  }
}

class Logicalref{
  int ref;
  Logicalref({this.ref});
  factory Logicalref.fromJson(Map<String, dynamic> json){
    return new Logicalref(
      ref: json['LOGICALREF'] as int,
    );
  }
}