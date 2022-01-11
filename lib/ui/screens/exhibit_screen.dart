import 'dart:async';

import 'package:flutter/material.dart';
import 'package:urancodetest/core/models/exhibit_model.dart';
import 'package:urancodetest/core/services/services.dart';
import 'package:urancodetest/globals.dart';
import 'package:urancodetest/resources/resources.dart';
import 'package:urancodetest/ui/widgets/appbar.dart';

class ExhibitScreen extends StatelessWidget {
  const ExhibitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dimension.init(context);
    return Scaffold(
      appBar: UranTestAppBar(
        title: 'Exhibits',
        canGoBack: false,
      ),
      backgroundColor: theme(context).primaryColor.withOpacity(0.3),
      body: ExhibitBody(), //the stateful widget
    );
  }
}

class ExhibitBody extends StatefulWidget {
  const ExhibitBody({Key? key}) : super(key: key);

  @override
  _ExhibitBodyState createState() => _ExhibitBodyState();
}

class _ExhibitBodyState extends State<ExhibitBody> {
  ExhibitList exhibitList = ExhibitList(); // the exhibit model class
  String errorMessage = ''; // in case we have an error when fetching

  bool _loading = false; // to control loading on the screen

  ExhibitRequestService _exhibitRequestService =
      ExhibitRequestService(); // the exhibit web service

  Future<ExhibitList> getExhibitList() async {
    setState(() {
      _loading = true; // spinner shows on the screen if data is being fetched
    });
    exhibitList = await _exhibitRequestService.getExhibits();
    if (exhibitList.exhibitItems!.isEmpty) {
      // show error message
      setState(() {
        _loading = false;
      });
      errorMessage = 'Failed to fetch exhibits, try again later.';
    } else {
      setState(() {
        _loading = false;
      });
    }
    return exhibitList;
  }

  @override
  void initState() {
    super.initState();
    getExhibitList();
  }

  @override
  Widget build(BuildContext context) {
    return !_loading // check to see if we are fetching data
        ? Padding(
            padding: EdgeInsets.only(
              top: dimension.smallVerticalPadding!,
              bottom: dimension.verticalPadding!,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              separatorBuilder: (context, index) => Divider(
                color: dividerColor,
              ),
              itemCount: exhibitList.exhibitItems!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: dimension.smallVerticalPadding! / 4,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: dimension.verticalPadding!,
                      left: dimension.horizontalPadding!,
                      bottom: dimension.verticalPadding!,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exhibitList.exhibitItems![index].title,
                          style: textTheme().headline2,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: exhibitList
                                  .exhibitItems![index].images.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      top: dimension.smallVerticalPadding!,
                                      bottom: dimension.smallVerticalPadding!,
                                      right: dimension.horizontalPadding!),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        dimension.buttonborderRadius!),
                                    child: Image.network(
                                      exhibitList
                                          .exhibitItems![index].images[i],
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, exception, stackTrace) {
                                        return Center(
                                            child: Text(
                                          'Image not found...',
                                          style: textTheme().bodyText2,
                                        ));
                                      },
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : Center(child: CircularProgressIndicator.adaptive());
  }
}
