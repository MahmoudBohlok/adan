import 'package:flutter/material.dart';
import 'package:task_app/core/helper/helper_method.dart';
import 'package:task_app/data/model/Parameters.dart';
import 'package:task_app/presntation/componnents/dialog.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/AdanCubit/order_cubit.dart';
import '../cubit/AdanCubit/orders_states.dart';
import '../cubit/internetState/internet_cubit.dart';
import '../cubit/internetState/internet_state.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String locationMessage = "جاري الحصول على الموقع...";

  @override
  void initState() {
    super.initState();
    checkLocation();
  }

  Future<void> checkLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showLocationDialog();
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showDialog(
            context: context,
            builder: (context) {
              return buildActionDialog(context: context, fun: checkLocation);
            });
        setState(() {
          locationMessage = "تم رفض الإذن.";
        });
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      setState(() {
        locationMessage = "الإذن مرفوض دائمًا. لا يمكن استخدام الموقع.";
      });
      return;
    }

    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      AdanCubit.get(context).changeStatusOrder(
          parameters: Parameters(
              latitude: position.latitude.toString(),
              longitude: position.longitude.toString()));

      setState(() {
        locationMessage =
            "الموقع الحالي: \nLat: ${position.latitude}, Long: ${position.longitude}";
      });
    }).catchError((error) {
      setState(() {
        locationMessage = "حدث خطأ أثناء الحصول على الموقع: $error";
      });
    });
  }

  void _showLocationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("خدمة الموقع غير مفعّلة"),
        content: Text("يرجى تفعيل خدمة الموقع للمتابعة."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Geolocator.openLocationSettings();
            },
            child: Text("فتح الإعدادات"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("الموقع الحالي"),
        ),
        body: BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
          if (state is NotConnectedState) {
            return Column(
              children: [
                Center(
                  child: Text("لايوجد اتصال بالانترنت"),
                )
              ],
            );
          } else {
            return Column(
              children: [
                Center(
                  child: Text(
                    locationMessage,
                    textAlign: TextAlign.center,
                  ),
                ),
                BlocConsumer<AdanCubit, AdanStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is AdanLoadingState) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (state is AdanErrorState) {
                        return Center(
                          child: Text("error"),
                        );
                      } else if (state is AdanSuccessState) {
                        Map<String, String> prayerTimes =
                            state.response.data!.timings!.toMap();
                        if (prayerTimes != null) {
                          HelperMethod.scheduleAllAdhans(prayerTimes);
                        }

                        return Expanded(
                          child: ListView(
                            children: prayerTimes.entries.map((entry) {
                              return ListTile(
                                title: Text(entry.key),
                                subtitle: Text(entry.value),
                              );
                            }).toList(),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    })
              ],
            );
          }
        }));
  }
}
