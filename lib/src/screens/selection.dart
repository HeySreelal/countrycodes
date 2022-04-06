import 'package:countrycodes/src/data/data.dart';
import 'package:countrycodes/src/models/country.dart';
import 'package:countrycodes/src/widgets/search.dart';
import 'package:flutter/material.dart';

class CountrySelection extends StatefulWidget {
  const CountrySelection({Key? key}) : super(key: key);

  @override
  State<CountrySelection> createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {
  bool isSearch = false;
  final TextEditingController searchCtrl = TextEditingController();
  String query = "";

  void onSearch(String text) {
    setState(() {
      query = text;
    });
  }

  void setSearching() {
    setState(() {
      isSearch = !isSearch;
    });
  }

  Future<bool> onPop() async {
    if (isSearch) {
      setSearching();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    List<Country> countries = isSearch
        ? CountryData.countries
            .where(
              (c) => c.toSearchString().toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList()
        : CountryData.countries;

    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? SearchField(
                controller: searchCtrl,
                onChanged: onSearch,
              )
            : const Text("Choose a country"),
        actions: isSearch
            ? null
            : [
                IconButton(
                  onPressed: setSearching,
                  icon: const Icon(Icons.search),
                ),
              ],
      ),
      body: WillPopScope(
        onWillPop: onPop,
        child: countries.isEmpty
            ? const Center(
                child: Text("🌍 No countries found"),
              )
            : ListView.separated(
                itemBuilder: (context, ix) {
                  final country = countries[ix];
                  return ListTile(
                    title: Text(country.name),
                    leading: Text(
                      country.flag,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    trailing: Text(country.dialCode),
                    onTap: () {
                      Navigator.pop(context, country);
                    },
                  );
                },
                separatorBuilder: (context, ix) {
                  final country = countries[ix];
                  final prev = countries[ix + 1];
                  if (prev.name.characters.first ==
                      country.name.characters.first) {
                    return Container();
                  }
                  return const Divider();
                },
                itemCount: countries.length,
              ),
      ),
    );
  }
}
