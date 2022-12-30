import 'package:basketball_counter_app/cubits/counter_screen_cubit.dart';
import 'package:basketball_counter_app/cubits/counter_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PointsCounter extends StatelessWidget {
  const PointsCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int teamAPoints = 0;
    int teamBPoints = 0;

    return BlocProvider(
      create: (BuildContext context) {
        return CounterScreenCubit();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<CounterScreenCubit, CounterState>(
          listener: (context, state) {
            if (state is TeamACounterIncrementState) {
              // we want here to access the value the cubit carrying
              teamAPoints = BlocProvider.of<CounterScreenCubit>(context).teamAPoints;
            } else {
              teamAPoints = BlocProvider.of<CounterScreenCubit>(context).teamBPoints;
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.orange,
                title: Text('Points Counter'),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Team A',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                            Text(
                              '$teamAPoints',
                              style: TextStyle(
                                fontSize: 150,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(8),
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed: () {
                                setState(() {
                                  teamAPoints++;
                                });
                                print(teamAPoints);
                              },
                              child: Text(
                                'Add 1 Point ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed: () {
                                setState(() {
                                  teamAPoints += 2;
                                });
                              },
                              child: Text(
                                'Add 2 Point',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed: () {
                                setState(() {
                                  teamAPoints += 3;
                                });
                              },
                              child: Text(
                                'Add 3 Point ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 500,
                        child: VerticalDivider(
                          indent: 50,
                          endIndent: 50,
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ),
                      Container(
                        height: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Team B',
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                            Text(
                              '$teamBPoints',
                              style: TextStyle(
                                fontSize: 150,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(8),
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed: () {
                                setState(() {});
                                teamBPoints++;
                              },
                              child: Text(
                                'Add 1 Point ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed: () {
                                setState(() {});
                                teamBPoints += 2;
                              },
                              child: Text(
                                'Add 2 Point ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                minimumSize: Size(150, 50),
                              ),
                              onPressed: () {
                                setState(() {
                                  teamBPoints += 3;
                                });
                              },
                              child: Text(
                                'Add 3 Point ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      primary: Colors.orange,
                      minimumSize: Size(150, 50),
                    ),
                    onPressed: () {
                      setState(() {
                        teamAPoints = 0;
                        teamBPoints = 0;
                      });
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
