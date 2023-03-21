import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/constants.dart';
import '../../../models/plants.dart';
import '../detail_page.dart';
import 'mySnackbar.dart';

class AutocompleteField extends StatefulWidget {
  final List<String> list;
  final Widget? suffixIcon;

  final Widget? prefixIcon;

  const AutocompleteField(this.list,
      {Key? key, this.suffixIcon, this.prefixIcon})
      : super(key: key);

  @override
  State<AutocompleteField> createState() => _AutocompleteFieldState();
}

class _AutocompleteFieldState extends State<AutocompleteField> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return widget.list.where((String option) {
          return option
              .toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Container(
              width: 300,
              color: Constants.primaryColor.withOpacity(.2),
              child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final option = options.elementAt(index);

                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(option,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintText: 'Search Plant',
            hintStyle: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600, fontSize: 17),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          focusNode: focusNode,
          onFieldSubmitted: (String value) {
            onFieldSubmitted();
            print('You just typed a new entry  $value');
          },
        );
      },
    );
  }
}

class AutocompleteFormField extends StatefulWidget {
  final List<String> list;
  final Widget? suffixIcon;

  final Widget? prefixIcon;

  const AutocompleteFormField(
      {Key? key, required this.list, this.suffixIcon, this.prefixIcon})
      : super(key: key);

  @override
  _AutocompleteFormFieldState createState() => _AutocompleteFormFieldState();
}

class _AutocompleteFormFieldState extends State<AutocompleteFormField> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _selectedValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            onFieldSubmitted: (value) {
              int? id;
              for (Plant i in Plant.plantList) {
                if (i.plantName == value) {
                  id = i.plantId;
                }
              }
              if (id != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        plantId: id!,
                      ),
                    )).then((value) {
                  _selectedValue.clear();
                  setState(() {});
                });
              } else {
                if (value.isEmpty) {
                  showSnackbar(
                      "Enter Plant Name", "Please Enter Any Plant Name.");
                } else {
                  showSnackbar("Enter Valid Plant Name",
                      "Plant Name not Found in Our Database.");
                }
              }
            },
            controller: _selectedValue,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600, fontSize: 17),
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              hintText: 'Search Plant',
              hintStyle: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600, fontSize: 17),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          // if (widget.list.isNotEmpty) ...{
          //   SizedBox(height: 16),
          // },
          // _selectedValue.text ==
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              final suggestion = widget.list[index];
              if (_selectedValue.text.isNotEmpty &&
                  suggestion
                      .toLowerCase()
                      .contains(_selectedValue.text.toLowerCase()) &&
                  _selectedValue.text != suggestion) {
                return GestureDetector(
                  onTap: () {
                    // Plant.plantList;
                    int? id;
                    for (Plant i in Plant.plantList) {
                      if (i.plantName == suggestion) {
                        id = i.plantId;
                      }
                    }

                  if(id != null)  {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              plantId: id!,
                            ),
                          )).then((value) {
                        _selectedValue.clear();
                        setState(() {});
                      });
                    }
                  },
                  child: ListTile(
                    title: Text(
                      suggestion,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                    contentPadding: EdgeInsets.only(left: 10),
                    trailing: IconButton(
                        icon: Icon(Icons.north_west),
                        onPressed: () {
                          setState(() {
                            _selectedValue.text = suggestion;
                          });
                        }),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
