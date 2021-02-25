class Events{
  DateTime selectDay;
  List<String> selectedEvents;

  Events({this.selectDay,this.selectedEvents});

  Events.fromMap(Map<String,dynamic>map)
  :selectDay =map['selectDay'],
  selectedEvents = map ['selectEvents'];
}