import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_muhammad/Components/RoundedSimpleButton.dart';
import 'package:test_muhammad/StateManagment/DataProvider.dart';
import 'package:test_muhammad/Utility/ThemeOf.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var dataSettings = Provider.of<DataProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Colors.black38,
          ),
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: Consumer<DataProvider>(
              builder: (_, dataList, __) => TextFormField(
                // initialValue: "Request",
                onChanged: (text) {
                  dataList.getNetworkSearchNews(text: text);
                },
                maxLines: 1,
                style: theme(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.black87, fontSize: 16),
                cursorColor: theme(context).buttonColor,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    hintText: "search here",
                    hintStyle: theme(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.black54, fontSize: 16)),
              ),
            ),
          ),
          RoundedSimpleButton(
            label: "Search",
          )
        ],
      ),
    );
  }
}
