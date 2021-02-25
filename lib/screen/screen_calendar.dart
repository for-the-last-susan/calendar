import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


final Map<DateTime, List> _holidays = {
  DateTime(2021, 1, 1): ['New Year\'s Day'],
  DateTime(2021, 2, 14): ['Valentine\'s Day'],
};

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List<dynamic> _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;


  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    //이벤트를 만드는 것!!
    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        'Event A0',
        'Event B0',
        'Event C0'
      ],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): [
        'Event A2',
        'Event B2'
      ],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): [
        'Event A4',
        'Event B4',
        'Event C4'
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        'Event A5',
        'Event B5',
        'Event C5'
      ],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7'],
      _selectedDay.add(Duration(days: 1)): [
        'Event A8',
        'Event B8'
      ],
      _selectedDay.add(Duration(days: 3)):
      Set.from(['Event A9', 'Event A9']).toList(),
      _selectedDay.add(Duration(days: 7)): [
        'Event A10',
        'Event B10'
      ],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): [
        'Event A12',
        'Event B12'
      ],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): [
        'Event A14',
        'Event B14'
      ],

    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();


    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }



  @override
  //dispose는 위젯이 완전히 종료될떄 호출된다.
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('공지',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color:  Color.fromRGBO(0, 0, 0, 0.6000000238418579),
                  fontFamily: 'SF Pro Display',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Color.fromRGBO(0, 0, 0, 0.8999999761581421),
            tabs: <Widget>[
              Tab(text: "달력"),
              Tab(text: "목록"),
            ],
          ),
        ),
        body:
        TabBarView(
          children:<Widget>[ Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                _buildTableCalendarWithBuilders(),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'Daily Tasks',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                const SizedBox(height: 8.0),
                Expanded(child: _buildEventList()),
              ],
            ),
          ),
        Container(child: _buildEventList()),
      ]
        ),
      ),
    );
  }


  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'ko_KR',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
            fontFamily: 'SF Pro Rounded',
            fontWeight: FontWeight.normal),
        weekdayStyle: TextStyle().copyWith(color:Color.fromRGBO(0, 0, 0, 0.4000000059604645),
            fontFamily: 'SF Pro Rounded',
            fontWeight: FontWeight.normal),
        holidayStyle: TextStyle().copyWith(color:Color.fromRGBO(0, 0, 0, 0.4000000059604645),
            fontFamily: 'SF Pro Rounded',
            fontWeight: FontWeight.normal),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color:Color.fromRGBO(0, 0, 0, 0.4000000059604645),
            fontFamily: 'SF Pro Rounded',
            fontWeight: FontWeight.normal,
            fontSize: 16),
        weekdayStyle: TextStyle().copyWith(color: Color.fromRGBO(0, 0, 0, 0.4000000059604645),
            fontFamily: 'SF Pro Rounded',
            fontWeight:FontWeight.normal,
            fontSize: 16),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle().copyWith(color:Color(0xff30484c),
            fontSize: 20,
            fontWeight: FontWeight.bold ),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: Color(0xff30484c),
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: Color(0xff30484c),
        ),
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),

      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: //_calendarController.isSelected(date)
        //? Colors.brown[500]
        _calendarController.isToday(date)
            ? Colors.teal[300]
            : Colors.teal[300],
      ),
      width: 52,
      height: 13,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 10.0,
          ),
        ),
      ),


    );
  }


  Widget _buildEventList() {

    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.8),
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.teal[300],
            boxShadow:[
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 2.0)
            ]
        ),
        margin:
        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          title: Text(event.toString(),
            style: TextStyle(
                color: Colors.white,
                fontSize: 12
            ),
          ),
          onTap: () => print('$event tapped!'),


        ),
      ))
          .toList(),
    );


  }
}