
import 'dart:convert';
import 'dart:ui';

import 'package:candlesticks/candlesticks.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interactive_chart/interactive_chart.dart';
import 'package:varens/blocs/theme/theme_bloc.dart';
import 'package:varens/blocs/theme/theme_event.dart';
import 'package:varens/blocs/theme/theme_state.dart';
import 'package:varens/helpers/custom_text.dart';
import 'package:varens/helpers/mock_data.dart';
import 'package:varens/helpers/text_sizer.dart';
import 'package:varens/widgets/button.dart';
import 'package:varens/widgets/icon_holder.dart';

class Home extends StatefulWidget{
  _HomeState createState() => _HomeState();

}


class _HomeState extends State<Home> {

  List<CandleData> _data = MockDataTesla.candles;
  bool _showAverage = false;
  String _currentHourSelection = '24H';
  bool _showGraphCandle = true;

  @override
  void initState() {
    super.initState();
  }

  _setCurrentHour(String v) {
    setState(() {
      _currentHourSelection = v;
    });
  }

  _toggleAppTheme() {
    VarensAppTheme theme = BlocProvider.of<ThemeBloc>(context).state.theme;
    if(theme == VarensAppTheme.light) {
      BlocProvider.of<ThemeBloc>(context).add(SetDarkThemeEvent());
    }else {
      BlocProvider.of<ThemeBloc>(context).add(SetLightThemeEvent());
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor:state.appScaffold,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 1,
              backgroundColor: state.appScaffold,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xff4941F2),
              unselectedItemColor: state.textColor.withOpacity(0.5),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (v) {},
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                        Icons.home,
                    ),
                    title: Text('')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.trending_up_outlined,),
                    title: Text(''),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet_outlined,),
                    title: Text('')
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined,),
                    title: Text('')
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(9),
                            child: Container(
                              child: Image.asset('assets/images/profile.png', fit: BoxFit.contain),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color(0xff5149F7),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: state.textColor.withOpacity(0.3))
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            shadowColor: Colors.transparent,
                            child: InkWell(
                              onTap: _toggleAppTheme,
                              child: SvgPicture.asset('assets/icons/${state.theme == VarensAppTheme.light ? 't_light.svg' : 't_dark.svg'}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: '123.342,62',
                                        style: TextStyle(
                                            color: state.textColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: mainSizer(context: context, size: 14)
                                        )
                                    ),
                                    WidgetSpan(
                                      child: Transform.translate(
                                        offset: const Offset(2,0),
                                        child: Text(
                                          'USD',
                                          textScaleFactor: 0.7,

                                          style: TextStyle(
                                              color: state.textColor.withOpacity(0.5),
                                              fontWeight: FontWeight.w700,
                                              fontSize: mainSizer(context: context, size: 24)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              )
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$120.234,21',
                                      style: TextStyle(
                                          color: state.success,
                                          fontWeight: FontWeight.w700,
                                          fontSize: mainSizer(context: context, size: 32)
                                      )
                                  ),
                                  TextSpan(text: ' '),
                                  TextSpan(
                                      text: '+8,1%',
                                      style: TextStyle(
                                          color: state.textColor.withOpacity(0.5),
                                          fontWeight: FontWeight.w700,
                                          fontSize: mainSizer(context: context, size: 32)
                                      )
                                  ),
                                ]
                              ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,vertical: 0
                      ),
                      decoration: BoxDecoration(
                        color: state.contBg
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconHolder(
                                    bgColor: state.appScaffold,
                                    icon: SvgPicture.asset('assets/icons/btc.svg')),
                                SizedBox(width: 12,),
                                Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CustomText(
                                          title: 'BTC',
                                          hasFontWeight: true,
                                          fontWeight: FontWeight.w600,
                                          textSize: mainSizer(context: context, size: 21),
                                          textColor: Color(0xffF7931A)
                                      ),
                                      CustomText(
                                          title: '-1.32%',
                                          textSize: mainSizer(context: context, size: 35),
                                          textColor: state.textColor.withOpacity(0.5)
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(child: Container(
                                  width: 200,
                                  height: 100,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(),
                                  child: LineGraph(
                                      features: [
                                        Feature(
                                          title: "Drink Water",
                                          color: Color(0xffF7931A),
                                          data: [0.2, 0.8, 0.4, 0.7, 0.6, 0.2, 0.8, 0.4, 0.7, 0.6, 0.2, 0.8, 0.4, 0.7, 0.6],
                                        ),
                                      ],
                                      showDescription: false,
                                      graphColor: Colors.white30,
                                      verticalFeatureDirection: false,
                                      graphOpacity: 0.2,
                                      labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
                                      labelY: [''],
                                      size: Size(500, 60)),
                                ),)
                              ],
                            ),
                            alignment: Alignment.center,
                          ), flex: 3,),
                          Expanded(child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 10),
                            child: Material(
                              shadowColor: Colors.transparent,
                              color: Colors.transparent,
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: state.textColor.withOpacity(0.22)
                                      ),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 12
                                  ),
                                  alignment: Alignment.center,
                                  child: CustomText(
                                    title: 'Change',
                                    textColor: Color(0xff5149F7),
                                    textSize: mainSizer(context: context, size: 43),
                                  ),
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                        left: 15, right: 15
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20,vertical: 19
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Material(
                                    shadowColor: Colors.transparent,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        _setCurrentHour('24H');
                                      },
                                      child: CustomText(
                                        title: '24H',
                                        fontWeight: FontWeight.w700,
                                        hasFontWeight: true,
                                        textSize: mainSizer(context: context, size: 28),
                                        textColor: this._currentHourSelection == '24H' ? state.main : state.textColor.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    shadowColor: Colors.transparent,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        _setCurrentHour('1W');
                                      },
                                      child: CustomText(
                                        title: '1W',
                                        fontWeight: FontWeight.w700,
                                        hasFontWeight: true,
                                        textSize: mainSizer(context: context, size: 28),
                                        textColor: this._currentHourSelection == '1W' ? state.main : state.textColor.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    shadowColor: Colors.transparent,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        _setCurrentHour('1M');
                                      },
                                      child: CustomText(
                                        title: '1M',
                                        fontWeight: FontWeight.w700,
                                        hasFontWeight: true,
                                        textSize: mainSizer(context: context, size: 28),
                                        textColor: this._currentHourSelection == '1M' ? state.main : state.textColor.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    shadowColor: Colors.transparent,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        _setCurrentHour('1Y');
                                      },
                                      child: CustomText(
                                        title: '1Y',
                                        fontWeight: FontWeight.w700,
                                        hasFontWeight: true,
                                        textSize: mainSizer(context: context, size: 28),
                                        textColor: this._currentHourSelection == '1Y' ? state.main : state.textColor.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    shadowColor: Colors.transparent,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        _setCurrentHour('All');
                                      },
                                      child: CustomText(
                                        title: 'All',
                                        fontWeight: FontWeight.w700,
                                        hasFontWeight: true,
                                        textSize: mainSizer(context: context, size: 28),
                                        textColor: this._currentHourSelection == 'All' ? state.main : state.textColor.withOpacity(0.3),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    shadowColor: Colors.transparent,
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _showGraphCandle = !_showGraphCandle;
                                        });
                                      },
                                      child: SvgPicture.asset('assets/icons/${this._showGraphCandle ? 'settings_active' : 'settings_inactive'}.svg', color: this._showGraphCandle ? state.main : state.textColor.withOpacity(0.3),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container(
                              child: AspectRatio(
                                aspectRatio: 1.2,
                                child: this._showGraphCandle ? InteractiveChart(
                                  candles: _data,
                                  style: ChartStyle(
                                    volumeHeightFactor: 0.1,
                                    timeLabelHeight: 20.0
                                  ),
                                ):LineGraph(
                                    features: [
                                      Feature(
                                        title: "Drink Water",
                                        color: Color(0xffF7931A),
                                        data: [0.2, 0.8, 0.4, 0.7, 0.6, 0.2, 0.8, 0.4, 0.7, 0.6, 0.2, 0.8, 0.4, 0.7, 0.6],
                                      ),
                                    ],
                                    showDescription: false,
                                    graphColor: Colors.white30,
                                    verticalFeatureDirection: true,
                                    graphOpacity: 0.2,
                                    labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
                                    labelY: ['Mon, Tue, Wed, Thur, Fri, Mon, Tue, Wed, thursday'],
                                    size: Size(500, 180)),
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                              bgColor: state.error.withOpacity(0.2),
                              child: CustomText(
                                  title: 'Sell',
                                  textColor: state.error,
                                  fontWeight: FontWeight.w700,
                                  hasFontWeight: true,
                                  textSize: mainSizer(context: context, size: 23),
                              ),
                              onPressed: () {}
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Button(
                              bgColor: state.main,
                              child: CustomText(
                                title: 'Buy',
                                textColor: state.white,
                                fontWeight: FontWeight.w700,
                                hasFontWeight: true,
                                textSize: mainSizer(context: context, size: 23),
                              ),
                              onPressed: () {}
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 25),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20,vertical: 0
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: 'About',
                            textColor: BlocProvider.of<ThemeBloc>(context).state.textColor,
                            textSize: mainSizer(context: context, size: 23),
                          ),
                          CustomText(
                            title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis posuere non tellus dictum at. Integer eget sed amet nisi, elit odio.',
                            lineHeight: 1.6,
                            textColor: BlocProvider.of<ThemeBloc>(context).state.textColor,
                            textSize: mainSizer(context: context, size: 29),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20,vertical: 0
                      ),
                      child: CustomText(
                          title: 'Market Stats',
                          textColor: state.textColor,
                          textSize: mainSizer(context: context, size: 23),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20,vertical: 15
                      ),
                      decoration: BoxDecoration(
                        color: state.contBg
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/mc.svg'),
                                SizedBox(width: 10,),
                                CustomText(
                                    title: 'Market Cap',
                                    textColor: state.textColor,
                                    textSize: mainSizer(context: context, size: 28),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: CustomText(
                                title: '41,228.00 BTC',
                                textColor: state.textColor,
                                textSize: mainSizer(context: context, size: 29),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20,vertical: 15
                      ),
                      decoration: BoxDecoration(
                          color: state.appScaffold
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/volume.svg'),
                                SizedBox(width: 10,),
                                CustomText(
                                  title: 'Volume (24 h)',
                                  textColor: state.textColor,
                                  textSize: mainSizer(context: context, size: 28),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: CustomText(
                              title: '\$12,999.00',
                              textColor: state.textColor,
                              textSize: mainSizer(context: context, size: 29),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20,vertical: 15
                      ),
                      decoration: BoxDecoration(
                          color: state.contBg
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/supply.svg'),
                                SizedBox(width: 10,),
                                CustomText(
                                  title: 'Available Supply',
                                  textColor: state.textColor,
                                  textSize: mainSizer(context: context, size: 28),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: CustomText(
                              title: '9,771.64',
                              textColor: state.textColor,
                              textSize: mainSizer(context: context, size: 29),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}