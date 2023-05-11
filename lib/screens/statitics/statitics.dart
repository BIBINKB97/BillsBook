import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:money_management_project/database/chart_db/chart_db.dart';
import 'package:money_management_project/screens/home_page/balance/balance.dart';
import 'package:money_management_project/screens/statitics/model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FinancialReport extends StatefulWidget {
  const FinancialReport({Key? key}) : super(key: key);

  @override
  State<FinancialReport> createState() => _FinancialReportState();
}

class _FinancialReportState extends State<FinancialReport>
    with TickerProviderStateMixin {
  List<ChartDatas> dataExpense = chartLogic(expenseNotifier1.value);
  List<ChartDatas> dataIncome = chartLogic(incomeNotifier1.value);
  List<ChartDatas> overview = chartLogic(overviewNotifier.value);
  List<ChartDatas> yesterday = chartLogic(yesterdayNotifier.value);
  List<ChartDatas> today = chartLogic(todayNotifier.value);
  List<ChartDatas> month = chartLogic(lastMonthNotifier.value);
  List<ChartDatas> week = chartLogic(lastWeekNotifier.value);
  List<ChartDatas> todayIncome = chartLogic(incomeTodayNotifier.value);
  List<ChartDatas> incomeYesterday = chartLogic(incomeYesterdayNotifier.value);
  List<ChartDatas> incomeweek = chartLogic(incomeLastWeekNotifier.value);
  List<ChartDatas> incomemonth = chartLogic(incomeLastMonthNotifier.value);
  List<ChartDatas> todayExpense = chartLogic(expenseTodayNotifier.value);
  List<ChartDatas> expenseYesterday =
      chartLogic(expenseYesterdayNotifier.value);
  List<ChartDatas> expenseweek = chartLogic(expenseLastWeekNotifier.value);
  List<ChartDatas> expensemonth = chartLogic(expenseLastMonthNotifier.value);
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    filterFunction();
    chartdivertFunctionExpense();
    chartdivertFunctionIncome();
    super.initState();
  }

  String categoryId2 = 'All';
  int touchIndex = 1;

  @override
  Widget build(BuildContext context) {
    chartdivertFunctionOverview();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Statitics',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        toolbarHeight: 70,
        elevation: 1,
        backgroundColor: Color.fromARGB(210, 151, 52, 184),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: const [
                Color.fromARGB(210, 151, 52, 184),
                Colors.white,
              ],
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: expenseNotifier,
            builder: (context, value, Widget? _) => Column(
              children: [
                SizedBox(
                  height: height * 0.039,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 24,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(18),
                    elevation: 10,
                    child: Container(
                      height: height * 0.057,
                      width: width * 0.85,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const []),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 10,
                          left: 22,
                        ),
                        child: DropdownButton<String>(
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          isExpanded: true,
                          underline: Container(),
                          value: categoryId2,
                          items: <String>[
                            'All',
                            'Today',
                            'Yesterday',
                            'This week',
                            'month',
                          ]
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              categoryId2 = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.9,
                  child: TabBar(
                    unselectedLabelStyle: TextStyle(color: Colors.grey),
                    labelStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    controller: tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'Overview',
                      ),
                      Tab(
                        text: 'Income',
                      ),
                      Tab(
                        text: 'Expense',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.0263,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: height * 0.526,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                          16,
                        ),
                        child: chartdivertFunctionOverview().isEmpty
                            ? Center(
                                child: Column(
                                  children: [
                                    ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black, BlendMode.srcIn),
                                      child: Lottie.asset(
                                        'images/noresults.json',
                                        width: width * 0.5,
                                        height: height * 0.3,
                                      ),
                                    ),
                                    Text(
                                      "  No transactions yet !",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color:
                                              Color.fromARGB(140, 151, 52, 184),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )
                            : SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.bottom,
                                ),
                                series: <CircularSeries>[
                                  PieSeries<ChartDatas, String>(
                                    dataLabelSettings: DataLabelSettings(
                                      color: Color.fromARGB(210, 151, 52, 184),
                                      isVisible: true,
                                      connectorLineSettings:
                                          ConnectorLineSettings(
                                              type: ConnectorType.curve),
                                      overflowMode: OverflowMode.shift,
                                      showZeroValue: false,
                                      labelPosition:
                                          ChartDataLabelPosition.outside,
                                    ),
                                    dataSource: chartdivertFunctionOverview(),
                                    xValueMapper: (ChartDatas data, _) =>
                                        data.category,
                                    yValueMapper: (ChartDatas data, _) =>
                                        data.amount,
                                    explode: true,
                                  )
                                ],
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                          16,
                        ),
                        child: chartdivertFunctionIncome().isEmpty
                            ? Center(
                                child: Column(
                                  children: [
                                    ColorFiltered(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black, BlendMode.srcIn),
                                      child: Lottie.asset(
                                        'images/noresults.json',
                                        width: width * 0.5,
                                        height: height * 0.3,
                                      ),
                                    ),
                                    Text(
                                      "  No transactions yet !",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color:
                                              Color.fromARGB(140, 151, 52, 184),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )
                            : SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.bottom,
                                ),
                                series: <CircularSeries>[
                                  PieSeries<ChartDatas, String>(
                                    dataLabelSettings: DataLabelSettings(
                                      color: Color.fromARGB(210, 151, 52, 184),
                                      isVisible: true,
                                      connectorLineSettings:
                                          ConnectorLineSettings(
                                              type: ConnectorType.curve),
                                      overflowMode: OverflowMode.shift,
                                      showZeroValue: false,
                                      labelPosition:
                                          ChartDataLabelPosition.outside,
                                    ),
                                    dataSource: chartdivertFunctionIncome(),
                                    xValueMapper: (ChartDatas data, _) =>
                                        data.category,
                                    yValueMapper: (ChartDatas data, _) =>
                                        data.amount,
                                    explode: true,
                                  )
                                ],
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          16,
                        ),
                        child: chartdivertFunctionExpense().isEmpty
                            ? Column(
                               
                                children: [
                                  ColorFiltered(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black, BlendMode.srcIn),
                                    child: Lottie.asset(
                                      'images/noresults.json',
                                      width: width * 0.5,
                                      height: height * 0.3,
                                    ),
                                  ),
                                  Text(
                                    "  No transactions yet !",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color:
                                            Color.fromARGB(140, 151, 52, 184),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            : SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  overflowMode: LegendItemOverflowMode.wrap,
                                  position: LegendPosition.bottom,
                                ),
                                series: <CircularSeries>[
                                  PieSeries<ChartDatas, String>(
                                    dataLabelSettings: DataLabelSettings(
                                      color: Color.fromARGB(210, 151, 52, 184),
                                      isVisible: true,
                                      connectorLineSettings:
                                          ConnectorLineSettings(
                                              type: ConnectorType.curve),
                                      overflowMode: OverflowMode.shift,
                                      showZeroValue: false,
                                      labelPosition:
                                          ChartDataLabelPosition.outside,
                                    ),
                                    dataSource: chartdivertFunctionExpense(),
                                    xValueMapper: (ChartDatas data, _) =>
                                        data.category,
                                    yValueMapper: (ChartDatas data, _) =>
                                        data.amount,
                                    explode: true,
                                  )
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  chartdivertFunctionOverview() {
    if (categoryId2 == 'All') {
      return overview;
    }
    if (categoryId2 == 'Today') {
      return today;
    }
    if (categoryId2 == 'Yesterday') {
      return yesterday;
    }
    if (categoryId2 == 'This week') {
      return week;
    }
    if (categoryId2 == 'month') {
      return month;
    }
  }

  chartdivertFunctionIncome() {
    if (categoryId2 == 'All') {
      return dataIncome;
    }
    if (categoryId2 == 'Today') {
      return todayIncome;
    }
    if (categoryId2 == 'Yesterday') {
      return incomeYesterday;
    }
    if (categoryId2 == 'This week') {
      return incomeweek;
    }
    if (categoryId2 == 'month') {
      return incomemonth;
    }
  }

  chartdivertFunctionExpense() {
    if (categoryId2 == 'All') {
      return dataExpense;
    }
    if (categoryId2 == 'Today') {
      return todayExpense;
    }
    if (categoryId2 == 'Yesterday') {
      return expenseYesterday;
    }
    if (categoryId2 == 'This week') {
      return expenseweek;
    }
    if (categoryId2 == 'month') {
      return expensemonth;
    }
  }
}
