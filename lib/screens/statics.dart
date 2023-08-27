import 'package:flutter/material.dart';
import 'package:proyecto/widgets/chart.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int index_color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Estadisticas',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          4,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  index_color = index;
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 80,
                                alignment: Alignment.center,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Informe',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_downward_sharp,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Chart(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            // SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            //     return ListTile(
            //      Leading: Image.asset('images/${geter_top()[index].image!}',
            //      height: 40,
            //      ),
            //      title: Text(
            //         geter_top()[index].name!,
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 16,
            //             fontWeight: FontWeight.bold),
            //       ),
            //       subtitle: Text(
            //         geter_top()[index].time!,
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.w600,
            //       ),
            //     ),
            //     trailing: Text(
            //       geter_top()[index].fee!,
            //       style: TextStyle(
            //         fontSize: 17,
            //             color: Colors.red,
            //             fontWeight: FontWeight.bold,
            //             ),
            //     ),
            //     );
            //   },
            //   childCount: geter_top().length,

            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
