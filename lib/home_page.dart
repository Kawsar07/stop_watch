import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'custom_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  final _scrollController = ScrollController();

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
    _scrollController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stop Watch'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: _stopWatchTimer.rawTime.value,
                builder: (context, snapshot) {
                  final value = snapshot.data;
                  final displayTime =
                      StopWatchTimer.getDisplayTime(value!, hours: _isHours);

                  return Text(
                    displayTime,
                    style: const TextStyle(
                      fontSize: 40,
                    ),
                  );
                }),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    color: Colors.green,
                    label: 'Start',
                    onPress: () {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                    }),
                const SizedBox(
                  width: 10.0,
                ),
                CustomButton(
                    color: Colors.orange,
                    label: 'Stop',
                    onPress: () {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                    })
              ],
            ),
            CustomButton(
                color: Colors.green,
                label: 'Reset Button',
                onPress: () {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                }),
          ],
        ),
      ),
    );
  }
}
