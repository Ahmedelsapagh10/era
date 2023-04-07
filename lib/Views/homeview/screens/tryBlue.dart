import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../../constants.dart';
import '../../../controller/Bluetooth2/cubit/BluetoothCubit.dart';
import '../../../controller/Bluetooth2/state/BluetoothState.dart';

class TryBlue extends StatelessWidget {
  const TryBlue({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    return BlocConsumer<BluetoothCubit, BluetoothStates>(
        listener: (context, state) {
      if (state is LoadingState) {
        isLoading = true;
      } else if (state is SucessState) {
        isLoading = false;
      }
    }, builder: (context, state) {
      var controller = BlocProvider.of<BluetoothCubit>(context);
      return Scaffold(
          floatingActionButton: FloatingActionButton(
              backgroundColor: pColor,
              onPressed: () async {
                await controller.scanDevices(context);
              },
              child: isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
          body: StreamBuilder<List<ScanResult>>(
              stream: controller.scanResults,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 2,
                            child: ListTile(
                              title: Text(
                                data.device.name.isNotEmpty
                                    ? data.device.name
                                    : data.advertisementData.localName
                                            .isNotEmpty
                                        ? data.advertisementData.localName
                                        : 'N/A',
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                data.device.id.id,
                                style: const TextStyle(color: Colors.white),
                              ),
                              trailing: Text(
                                data.rssi.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              leading: IconButton(
                                  onPressed: () async {
                                    await controller.connectMethod(
                                        device: data.device);
                                  },
                                  icon: Icon(controller.blueIcon)),
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: Text(
                      'No devices found',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              }));
    });
  }
}
