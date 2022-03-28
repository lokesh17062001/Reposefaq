// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Repose FAQ",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> exp=List<bool>.filled(14, false);

  List<String> qns=['Q8. Can I track my activity while doing it?',
    'Q9. Can I log multiple activities within the same duration?',
    'Q10. Can I modify my activities?',
    'Q11. Can I edit activities after stopping the session?',
    'Q12. How to stop the session?'];
  List<String> ans=[
    '* No. You cannot track or add an activity while performing it, as it is not a feature that can monitor your activities in real-time. This is more like a journal, and hence you can add activities only after it is finished.',
    '* No. You cannot log multiple activities within the same duration, as an over-lapping time of entries is not permitted.',
    '* Yes. Once the activities are logged, click on ‘View Activities’ at the bottom right corner of the screen to modify or delete the activities.',
    '* No. You cannot edit your activities after stopping the session.',
    '* At the end of 24 hours, open the app and click on \“stop the session\”.\n'
        '* Once Clicked, the device will synchronize the pending data and also '
        'sync the data with the server.\n'
        'Depending on the network stability, this process can take anywhere '
        'between 3 - 8 minutes. Please do not close the app during this process.\n'
        '* Upon successful sync and the session is stopped, you will be prompted'
        ' to see the reports. Clicking ‘YES’ will take you to the screen where '
        'you can view reports.\n'
        'If you fail to stop the session after 24 hours, it shall automatically stop after 30 hours. Be warned that if the data is not synced periodically within this span of 30 hours, the data collected would be lost.'
  ];
  @override
  Widget build(BuildContext context) {
    var scrsize=MediaQuery.of(context).size;
    bool mou= true;
    mou=exp.contains(true);
    var a=scrsize.width*12.5/100;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left:2,top: 2),
          child: Container(height:600,child:SvgPicture.asset('assets/netrin.svg'),),
        ),
        title: Center(child: Text('FAQ',style: GoogleFonts.montserrat(color: Colors.black,fontSize: 35),)),
        actions: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if(mou==false)
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      primary: Colors.grey, // Text Color
                    ),
                    onPressed: () {
                      setState(() {
                        exp=List<bool>.filled(14, true);
                        mou=true;
                      });
                    },
                    icon: Icon( // <-- Icon
                      Icons.arrow_drop_down,
                    ),
                    label: Text('Expand All',style: GoogleFonts.montserrat(),), // <-- Text
                  )
                else
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                      primary: Colors.grey, // Text Color
                    ),
                    onPressed: () {
                      setState(() {
                        exp=List<bool>.filled(14, false);
                        mou=false;
                      }
                      );
                    },
                    icon: Icon( // <-- Icon
                      Icons.arrow_drop_up,
                    ),
                    label: Text('Collapse All',style: GoogleFonts.montserrat()), // <-- Text
                  )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: a,right:a,top: a/4,bottom: a/4 ),
          child: Column(
            children: [
              Container(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            trailing: !exp[0]?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                            tileColor: Color(0xfefefe),
                            title: Text('Q1. How to wear the device?', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        );
                      },
                      body:
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Before assesment\n'
                                      '* Wear the strap around the chest and adjust '
                                      'its tightness accordingly. Ensure that the strap'
                                      ' is in proper contact with your body.',style: GoogleFonts.montserrat()),
                                ),
                                Container(
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: scrsize.width/6),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 170,
                                          height: 250,
                                          child: Image(
                                            image: AssetImage('assets/Q1 Male..png'),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Container(
                                          width: 150,
                                          height: 250,
                                          child: Image(
                                            image: AssetImage('assets/Q1 Female..png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text('* Attach the sensor to the strap. The '
                                    'sensor should be placed in the middle of '
                                    'the chest as shown in the figure.Align '
                                    'the pair of metal screws against the pair'
                                    ' of metallic contacts on the strap. '
                                    'Gently press until you hear a‘click’ on each of the contacts.\n',style: GoogleFonts.montserrat()),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(text: '*Note:- ',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
                                        TextSpan(text: 'The Netrin logo should be pointed upwards as shown in the picture below.',style: GoogleFonts.montserrat()),
                                      ],
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width/3,
                                    height: 200,
                                    child: Row(
                                      children: [
                                        Container(
                                          width:scrsize.width/8,
                                          height: 200,
                                          child: Image(
                                            image: AssetImage('assets/Question 1..png'),
                                          ),
                                        ),
                                        Container(
                                          height: 200,
                                          width:scrsize.width/8,
                                          child: Image(
                                            image: AssetImage('assets/Question 1.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Text('After Assessment-\n* Detach the sensor from the strap and take '
                                    'off the strap from your body. Removing the sensor'
                                    ' from the strap improves battery life.\n'
                                    '* Rinse the strap under running water and hang'
                                    ' to dry. Alternatively, the strap could be cleaned'
                                    ' using a dry cloth and sanitizer. Clean the strap'
                                    ' after every session to maintain quality data collection.\n',
                                    style: GoogleFonts.montserrat()
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: '*Note:- ',style: GoogleFonts.montserrat(fontWeight: FontWeight.bold)),
                                      TextSpan(text: 'The strap in rare cases may cause'
                                          ' mild rashes depending on your skin sensitivity.'
                                          ' If rashes appear, amoisturizer or baby oil '
                                          'could be applied to the contact areas.',style: GoogleFonts.montserrat()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      isExpanded: exp[0],
                      canTapOnHeader:true,
                    ),
                  ],
                  expansionCallback: (panelIndex, isExpanded) {
                    exp[0] = !exp[0];
                    setState(() {

                    });
                  },

                ),
              ),
              Container(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            trailing: !exp[1]?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                            tileColor: Color(0xfefefe),
                            title: Text('Q2. How to use the app?', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        );
                      },
                      body:
                      Padding(
                        padding: const EdgeInsets.only(top: 50,bottom: 50),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50,right: 50),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('* The app has three main screens:\n'
                                    '1. Device screen: All the communications with'
                                    ' the device happen here (dis/connecting, session'
                                    ' start/stop, data sync)\n'
                                    '2. Activity log screen: This screen helps to '
                                    'maintain a record of all the activities during '
                                    'the assessment\n'
                                    '3. Reports screen: This screen facilitates you '
                                    'to view all your assessment reports.\n\n'
                                    '* You can shuffle across these three screens by swiping the top card.\n',
                                    style: GoogleFonts.montserrat()
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.7,
                                height: 250,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width:scrsize.width*2/9,
                                      child: Image(
                                        image: AssetImage('assets/IMG_9826.jpg'),
                                      ),
                                    ),
                                    Container(
                                      width:scrsize.width*2/10,
                                      child: Image(
                                        image: AssetImage('assets/IMG_9823.jpg'),
                                      ),
                                    ),
                                    Container(
                                      width:scrsize.width*2/9,
                                      child: Image(
                                        image: AssetImage('assets/IMG_9824.jpg'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      isExpanded: exp[1],
                      canTapOnHeader: true,
                    ),
                  ],

                  expansionCallback: (panelIndex, isExpanded) {
                    exp[1] = !exp[1];
                    setState(() {

                    });
                  },

                ),
              ),
              Container(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            trailing: !exp[2]?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                            tileColor: Color(0xfefefe),
                            title: Text('Q3. How to connect the device?', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        );
                      },
                      body:
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('* Wear the chest strap and attach the sensor.'
                                  ' The sensor turns on automatically when you wear it.'
                                  ' The redblinking LED signifies that it is ON.\n'
                                  '* Ensure proper internet connectivity, and turn '
                                  'on your mobile Bluetooth and location.',
                                  style: GoogleFonts.montserrat()
                              ),
                              RichText(text: TextSpan(
                                  children: [
                                    TextSpan(text: '* Click the Bluetooth icon(',style: GoogleFonts.montserrat() ),
                                    WidgetSpan(child: Icon(Icons.bluetooth)),
                                    TextSpan(text:' connect) in the ‘Device’ screen of the app.',style: GoogleFonts.montserrat()),
                                  ]
                              ),
                              ),
                              Text('* The app will scan and list the sensor'
                                  ' (identified by the name Movesense).\n'
                                  '* Select the sensor and make sure that the app displays ‘connected’.',
                                  style: GoogleFonts.montserrat())
                            ],
                          ),
                        ),
                      ),
                      isExpanded: exp[2],
                      canTapOnHeader: true,
                    ),
                  ],

                  expansionCallback: (panelIndex, isExpanded) {
                    exp[2] = !exp[2];
                    setState(() {

                    });
                  },

                ),
              ),
              Container(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            trailing: !exp[3]?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                            tileColor: Color(0xfefefe),
                            title: Text('Q4. How to take a 24-hour assessment?', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        );
                      },
                      body:
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('* Once the device is connected to the mobile,'
                                  'check the battery status. If it is shown as BAD,'
                                  ' please replacethe battery.'
                                  '\n* Check for the live ECG plot and Heart Rate'
                                  ' (HR) before starting the assessment.'
                                  '\n* A dialog box pops up asking for a confirmation'
                                  ' to start a 24 hours assessment. Click Yes to'
                                  ' confirm.\n* Click accept to Calibrate.'
                                  'It is advised to take 20 seconds of calibration'
                                  ' before each session for accuracy.\n* It is '
                                  'recommended to start the session as soon as '
                                  'you wake up and continue with your routine for'
                                  ' the next 24 hours.\n* It is not advisable to'
                                  ' start a session in the middle of the day.\n'
                                  '* Never start a session before wearing the strap and device.\n'
                                  '* Do not remove the device without stopping the session.'
                                  ' However, removing the device for short durations'
                                  '(like bathing, etc.) is fine.\n'
                                  '* The device is designed to be water-resistant up'
                                  ' to 30m/100ft, thus tracking your performance evenunderwater.',
                                  style: GoogleFonts.montserrat()
                              ),
                            ],
                          ),
                        ),
                      ),
                      isExpanded: exp[3],
                      canTapOnHeader: true,
                    ),
                  ],

                  expansionCallback: (panelIndex, isExpanded) {
                    exp[3] = !exp[3];
                    setState(() {

                    });
                  },
                ),
              ),
              Container(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            trailing: !exp[4]?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                            tileColor: Color(0xfefefe),
                            title: Text('Q5. How to change the battery?', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        );
                      },
                      body:
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Text('* A new battery can be used for up to 48 - 50 hours of data collection, i.e., 2 complete 24-hour sessions. Thebattery status will be shown in the app as GOOD or BAD and based on that, a new battery is to be replaced. \n'
                                  '* You are provided with spare batteries for battery replacement.\n* When you have to replace the battery, take a new battery, and use it to open the back cover of the sensor as shown in the picture below.\n'
                                  '* Remove the old battery, and keep the new battery in its place.\n'
                                  '* Make sure that the side of the battery with the ‘ + ’ sign faces towards you.\n'
                                  '* Keep the back cover of the sensor properly and press firmly. Discard the old battery responsibly.',
                                  style: GoogleFonts.montserrat()
                              ),
                              Center(
                                child: Container(
                                  height: 200,
                                  width:scrsize.width*1/6,
                                  child: Image(
                                    image: AssetImage('assets/Battery Replacement.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      isExpanded: exp[4],
                      canTapOnHeader: true,
                    ),
                  ],

                  expansionCallback: (panelIndex, isExpanded) {
                    exp[4] = !exp[4];
                    setState(() {

                    });
                  },

                ),
              ),
              Container(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            trailing: !exp[5]?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                            tileColor: Color(0xfefefe),
                            title: Text('Q6. How to synchronize the data?', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        );
                      },
                      body:
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(

                            children: [
                              Text('* During an ongoing session, open the app '
                                  'once every 3 to 4 hours to sync the data.\n'
                                  '* Every time you open the app, the data gets synced automatically. '
                                  'If not, tap ‘Sync Now’ below the sensorname.\n'
                                  '* The sync might take around 2 to 3 minutes. Please be patient and'
                                  ' do not close the app or disconnect thedevice while the sync is happening.',
                                  style: GoogleFonts.montserrat()),
                            ],
                          ),
                        ),
                      ),
                      isExpanded: exp[5],
                      canTapOnHeader: true,
                    ),
                  ],

                  expansionCallback: (panelIndex, isExpanded) {
                    exp[5] = !exp[5];
                    setState(() {

                    });
                  },
                ),
              ),
              Container(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            trailing: !exp[6]?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                            tileColor: Color(0xfefefe),
                            title: Text('Q7. How to log my activities?', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        );
                      },
                      body:
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('*Swipe the top card and come to the second screen, you can tap on'
                                  ' ‘Choose Activity’ and log your activity.\n'
                                  '*Choose others if a specific activity is not listed. Use the dial to enter'
                                  ' the start and stop times of the activity.\n'
                                  'Note that the activity can be logged only after the activity is performed.\n\n',
                                  style: GoogleFonts.montserrat()),
                              Container(
                                width: MediaQuery.of(context).size.width*0.6,
                                height: 450,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 450,
                                      width:scrsize.width*0.3,
                                      child:Image.asset('assets/IMG_9827.jpg'),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 450,
                                        width:scrsize.width*0.3,
                                        child:Image.asset('assets/IMG_9828.jpeg'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: MediaQuery.of(context).size.width*0.6,
                                height: 450,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 450,
                                      width:scrsize.width*0.3,
                                      child:Image.asset('assets/IMG_9829.jpg'),
                                    ),
                                    Container(
                                      height: 450,
                                      width:scrsize.width*0.3,
                                      child:Image.asset('assets/IMG_9830.jpg'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      isExpanded: exp[6],
                      canTapOnHeader: true,
                    ),
                  ],

                  expansionCallback: (panelIndex, isExpanded) {
                    exp[6] = !exp[6];
                    setState(() {

                    });
                  },
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context,int index){
                    return
                      (
                          Container(
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 1000),
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: ListTile(
                                        trailing: !exp[index+7]?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                                        tileColor: Color(0xfefefe),
                                        title: Text(qns[index], style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold),),
                                      ),
                                    );
                                  },
                                  body:
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(50),
                                      child: Text(ans[index],style: GoogleFonts.montserrat()),
                                    ),
                                  ),
                                  isExpanded: exp[index+7],
                                  canTapOnHeader: true,
                                ),
                              ],

                              expansionCallback: (panelIndex, isExpanded) {
                                exp[index+7] = !exp[index+7];
                                setState(() {

                                });
                              },
                            ),
                          )
                      );
                  }
              ),
              Container(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            trailing: !exp[12]?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                            tileColor: Color(0xfefefe),
                            title: Text('Q13. Where can I view my past sessions reports?', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        );
                      },
                      body:
                      Padding(
                        padding: const EdgeInsets.all(50),
                        child: Column(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('* When you swipe the top card and come to the third screen, you\''
                                      'll see the calendar, where you\'ll be able to '
                                      'see all the assessment reports. A black dot is'
                                      ' shown against the days when you took the assessment. '
                                      'Click on the date to generate the report.\n',
                                      style: GoogleFonts.montserrat()),
                                  Center(
                                    child: Container(
                                      height: 550,
                                      child: Image.asset('assets/IMG_9831.jpg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      isExpanded: exp[12],
                      canTapOnHeader: true,
                    ),
                  ],
                  expansionCallback: (panelIndex, isExpanded) {
                    exp[12] = !exp[12];
                    setState(() {

                    });
                  },

                ),
              ),
              Container(
                child: ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 1000),
                  children: [
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            trailing: !exp[13]?Icon(Icons.arrow_drop_down):Icon(Icons.arrow_drop_up),
                            tileColor: Color(0xfefefe),
                            title: Text('Q14. Can I export my report?', style: GoogleFonts.montserrat(color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                        );
                      },
                      body:
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('* Yes, on the Report screen (third screen) at the'
                                  ' bottom of the detailed report there will be an option to export the report as a PDF. '
                                  'The downloaded report can be seen in the downloads folder of your phone',
                                  style: GoogleFonts.montserrat()),
                            ],
                          ),
                        ),
                      ),
                      isExpanded: exp[13],
                      canTapOnHeader: true,
                    ),
                  ],

                  expansionCallback: (panelIndex, isExpanded) {
                    exp[13] = !exp[13];
                    setState(() {

                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}