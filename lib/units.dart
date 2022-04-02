import 'package:alloy/assets.dart';
import 'package:flutter/material.dart';

import 'package:zapdart/widgets.dart';

class UnitsScreen extends StatefulWidget {
  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Units'),
        ),
        body: ListView.builder(
            itemCount: assetUnits.length,
            itemBuilder: (context, index) {
              var asset = assetUnits.keys.elementAt(index);
              var unit = assetUnits[asset]!;
              return ListTile(
                  leading: assetLogo(asset),
                  title: Text(asset),
                  subtitle: raisedButton(
                      onPressed: () {
                        var newUnit = unit;
                        var options = assetUnitOptions(asset);
                        var i = options.indexOf(unit);
                        if (i >= 0) {
                          if (i == options.length - 1)
                            newUnit = options[0];
                          else
                            newUnit = options[i + 1];
                        }
                        assetUnitSet(asset, newUnit);
                        setState(() {}); // force rerender
                      },
                      child: Text(unit)));
            }));
  }
}
