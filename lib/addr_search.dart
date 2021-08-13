import 'dart:async';
import 'package:flutter/material.dart';
import 'package:debounce_throttle/debounce_throttle.dart';

import 'package:zapdart/widgets.dart';

import 'autocomplete_service.dart';

class AddressSearch extends SearchDelegate<Suggestion?> {
  final PlaceApi apiClient;
  var completer = Completer<List<Suggestion>>();
  late final debouncer;
  String lang = 'en';

  AddressSearch(this.apiClient) {
    debouncer = Debouncer<String>(Duration(milliseconds: 2000),
        initialValue: '', onChanged: debouncerChanged);
  }

  void debouncerChanged(String query) async {
    completer.complete(await apiClient.fetchSuggestions(query, lang));
    completer = Completer<List<Suggestion>>();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    lang = Localizations.localeOf(context).languageCode;
    debouncer.value = query;
    return FutureBuilder(
      future: completer.future,
      builder: (context, AsyncSnapshot<List<Suggestion>> snapshot) =>
          query == ''
              ? Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Enter your address'),
                )
              : snapshot.connectionState != ConnectionState.done
                  ? Center(child: CircularProgressIndicator())
                  : snapshot.hasData
                      ? ListView.builder(
                          itemBuilder: (context, index) => ListTile(
                            title: Text((snapshot.data![index]).description),
                            onTap: () {
                              close(context, snapshot.data![index]);
                            },
                          ),
                          itemCount: snapshot.data!.length,
                        )
                      : Center(child: Text('Error retrieving data')),
    );
  }
}

class AddressForm extends StatefulWidget {
  @override
  AddressFormState createState() {
    return AddressFormState();
  }
}

class AddressFormState extends State<AddressForm> {
  final TextEditingController _streetNumberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size(0, 0),
        ),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Center(
                        child: Column(children: [
                      Text('Enter your address'),
                      TextFormField(
                          controller: _streetNumberController,
                          decoration:
                              InputDecoration(labelText: 'Street Number'),
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) {
                            if (value != null && value.isEmpty)
                              return 'Please enter a street number';
                            return null;
                          }),
                      TextFormField(
                          controller: _streetController,
                          decoration: InputDecoration(labelText: 'Street'),
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a street';
                            return null;
                          }),
                      TextFormField(
                          controller: _cityController,
                          decoration: InputDecoration(labelText: 'City'),
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a city';
                            return null;
                          }),
                      TextFormField(
                          controller: _stateController,
                          decoration: InputDecoration(labelText: 'State'),
                          keyboardType: TextInputType.streetAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a state';
                            return null;
                          }),
                      TextFormField(
                          controller: _zipCodeController,
                          decoration: InputDecoration(labelText: 'Zip Code'),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a zip code';
                            return null;
                          }),
                      TextFormField(
                          controller: _countryController,
                          decoration: InputDecoration(labelText: 'Country'),
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter a country';
                            return null;
                          }),
                      raisedButton(
                        child: Text("Ok"),
                        onPressed: () async {
                          if (_formKey.currentState == null) return;
                          if (_formKey.currentState!.validate()) {
                            var place = Place(
                              _streetNumberController.text,
                              _streetController.text,
                              _cityController.text,
                              _stateController.text,
                              _zipCodeController.text,
                              _countryController.text,
                            );
                            Navigator.of(context).pop(place);
                          }
                        },
                      ),
                      raisedButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ]))))));
  }
}
