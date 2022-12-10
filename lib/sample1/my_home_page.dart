import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provydr/sample1/app_state.dart';
import 'package:provydr/sample1/data_model.dart';
import 'package:provydr/sample1/data_util.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appstate>(context);
    return Scaffold(
      // body: Center(
      //   child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         Text('data'),
      //         //Text(provider.temp.toString()),
      //         Consumer<Appstate>(builder: (context, providerData, child) {
      //           return Text(providerData.temp.toString());
      //         }),

      //         MaterialButton(
      //           onPressed: () {
      //             provider.updateTemp(provider.temp + 1);
      //           },
      //           color: Colors.red,
      //           child: Text('Tap'),
      //         ),
      //         MaterialButton(
      //           onPressed: () {
      //             provider.clearTemp();
      //           },
      //           color: Colors.red,
      //           child: Text('CLear'),
      //         ),
      //       ]),
      // ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(CupertinoIcons.refresh_thick),
        onPressed: () async {
          List<DataModel> data = await DataUtil().getData();
          provider.updateDataModel(data);
        },
      ),

      body: Consumer<Appstate>(
        builder: (context, value, child) {
          return Container(
            child: provider.dataList.isEmpty
                ? Center(child: Text('No Data'))
                : ListView.builder(
                    itemCount: provider.dataList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          provider.dataList[index].title.toString(),
                        ),
                        leading: Text(provider.dataList[index].id.toString()),
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
