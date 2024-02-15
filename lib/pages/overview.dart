import 'package:flutter/material.dart';
import 'package:responsive/logic.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../utils/colors.dart';

class OverView extends StatefulWidget {
  const OverView({Key? key}) : super(key: key);

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  List<Employee> employees = <Employee>[];
  // late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    // employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size mediaquerySize = mediaQuery.size;
    double screenWidth = mediaquerySize.width;
    double screenHeight = mediaquerySize.height;
    var a = Responsive.gridSize(screenWidth);
    var maxW = 0.0;
    double i1 = 0.0;
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                maxW = constraints.maxWidth;
                i1 = (a <= 2) ? maxW / 1.2 : maxW / 1.7;
                var i2 = (a <= 2) ? i1 : maxW - i1;
                return Wrap(
                  direction: (a <= 2) ? Axis.vertical : Axis.horizontal,
                  alignment: WrapAlignment.spaceAround,
                  children: [
                    Container(
                      // color: Colors.red,
                      width: i1,
                      padding: EdgeInsets.symmetric(
                          horizontal: i1 * (a * 0.01),
                          vertical: screenHeight * 0.02),
                      child: Card(
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircularStepProgressIndicator(
                                totalSteps: 90,
                                currentStep: 25,
                                stepSize: 6,
                                selectedColor: primaryPurple,
                                unselectedColor: const Color(0xFFD1D1D1),
                                padding: 0,
                                width: 137,
                                height: 137,
                                selectedStepSize: 7,
                                roundedCap: (_, __) => true,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    foregroundImage: AssetImage(
                                        "assets/images/girl-profile.png"),
                                  ),
                                ),
                              ),
                              Text("Hello, Roopa $a"),
                              const Text("About me"),
                              const Text(
                                  "Pariatur fugiat dolore proident esse elit culpa velit nisi esse incididunt ad voluptate anim quis. Nisi dolor ex id officia irure qui ad anim velit pariatur tempor velit. Irure consequat sit anim pariatur ipsum incididunt veniam labore laboris. Adipisicing adipisicing adipisicing duis dolore nisi minim veniam mollit incididunt exercitation tempor exercitation. Voluptate labore est magna tempor labore et excepteur."),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.amber.shade300,
                      width: i2,
                      padding: EdgeInsets.symmetric(
                          horizontal: i1 * (a * 0.01),
                          vertical: screenHeight * 0.02),

                      child: Card(
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: const <Widget>[
                              Text("Calendar"),
                              Text("Call the Freshworks"),
                              Text("HR interview at Freshworks"),
                              Text("Walk in Freshworks"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          // horizontal: i1 * (a * 0.01),
                          vertical: screenHeight * 0.02),
                      child: Card(
                        elevation: 10,
                        margin: const EdgeInsets.all(20.0),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SfDataGrid(
                              //   source: employeeDataSource,
                              //   columnWidthMode: ColumnWidthMode.fill,
                              //   columns: <GridColumn>[
                              //     GridColumn(
                              //         columnName: 'cmpname',
                              //         label: Container(
                              //             padding:const EdgeInsets.all(16.0),
                              //             alignment: Alignment.center,
                              //             child: const Text(
                              //               'Company Name',
                              //             ))),
                              //     GridColumn(
                              //         columnName: 'loc',
                              //         label: Container(
                              //             padding:const EdgeInsets.all(8.0),
                              //             alignment: Alignment.center,
                              //             child: const Text('Location'))),
                              //     GridColumn(
                              //         columnName: 'sentdate',
                              //         label: Container(
                              //             padding:const EdgeInsets.all(8.0),
                              //             alignment: Alignment.center,
                              //             child:const Text(
                              //               'Sent Date',
                              //               overflow: TextOverflow.ellipsis,
                              //             ))),
                              //     GridColumn(
                              //         columnName: 'status',
                              //         label: Container(
                              //             padding:const EdgeInsets.all(8.0),
                              //             alignment: Alignment.center,
                              //             child:const Text('Status'))),
                              //     GridColumn(
                              //         columnName: 'duedate',
                              //         label: Container(
                              //             padding:const EdgeInsets.all(8.0),
                              //             alignment: Alignment.center,
                              //             child: const Text('Due Date'))),
                              //   ],
                              // ),

                              // PlutoGrid(
                              //   columns: columns,
                              //   rows: rows,
                              //   columnGroups: columnGroups,
                              //   onLoaded:
                              //       (PlutoGridOnLoadedEvent event) {
                              //     stateManager = event.stateManager;
                              //   },
                              //   onChanged:
                              //       (PlutoGridOnChangedEvent event) {
                              //     print(event);
                              //   },
                              //   configuration:
                              //       const PlutoGridConfiguration(
                              //     enableColumnBorder: true,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee("Freshworks", 'Chennai, Tamil Nadu', '03/03/12 22:43', "Viewed",
          "01/22/15 17:15"),
      Employee("Freshworks", 'Chennai, Tamil Nadu', '04/30/19 10:03', "Closed",
          "01/22/15 17:15"),
      Employee("Freshworks", 'Chennai, Tamil Nadu', '01/28/19 14:11', "Pending",
          "01/22/15 17:15"),
      Employee("Freshworks", 'Chennai, Tamil Nadu', '03/17/12 08:48',
          "Interview", "01/22/15 17:15"),
      Employee("Freshworks", 'Chennai, Tamil Nadu', '04/19/12 00:52',
          "Canceled", "01/22/15 17:15"),
    ];
  }
}

class Employee {
  final String duedate;

  final String loc;

  final String sentdate;

  final String status;
  final String cmpname;

  /// Creates the employee class with required details.
  Employee(this.cmpname, this.loc, this.sentdate, this.status, this.duedate);
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
// class EmployeeDataSource extends DataGridSource {
//   /// Creates the employee data source class with required details.
//   EmployeeDataSource({required List<Employee> employeeData}) {
//     _employeeData = employeeData
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<String>(
//                   columnName: 'Company Name', value: e.cmpname),
//               DataGridCell<String>(columnName: 'Location', value: e.loc),
//               DataGridCell<String>(columnName: 'Sent Date', value: e.sentdate),
//               DataGridCell<String>(columnName: 'Status', value: e.status),
//               DataGridCell<String>(columnName: 'Due Date', value: e.duedate),
//             ]))
//         .toList();
//   }

//   List<DataGridRow> _employeeData = [];

//   @override
//   List<DataGridRow> get rows => _employeeData;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(8.0),
//         child: Text(e.value.toString()),
//       );
//     }).toList());
//   }
// }
