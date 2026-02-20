import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/string_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_common.dart';
import '../extensions/app_text_field.dart';
import '../extensions/colors.dart';
import '../extensions/common.dart';
import '../extensions/decorations.dart';
import '../extensions/text_styles.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';
import 'my_orders.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  TextEditingController mSearch = TextEditingController();
  FocusNode mSearchFocus = FocusNode();
  String? mSearchValue = "";

  final List<String> faqList = ["All", "Services", "General", "Account"];
  String selectedStatus = "All";

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget _getClearButton() {
    return IconButton(
      onPressed: () {
        mSearch.clear();
        mSearchValue = "";
        hideKeyboard(context);
      },
      icon: Icon(Icons.clear),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(
        appBar: appBarWidget("Help Center", center: true, context: context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            AppTextField(
              controller: mSearch,
              textFieldType: TextFieldType.oTHER,
              isValidationRequired: false,
              autoFocus: false,

              // suffix: _getClearButton(),
              decoration: defaultInputDecoration(
                mPrefix: mSuffixTextFieldIconWidget(ic_search),
                context,
                isFocusTExtField: true,
                label: 'Search',
              ),
              onChanged: (v) {
                mSearchValue = v;

                setState(() {});
              },
            ),
            10.height,
            Container(
              alignment: Alignment.center,
              child: TabBar(
                dividerColor: Colors.grey.withOpacity(0.1),
                indicator: RoundedTabIndicator(color: primaryColor, weight: 3),
                labelColor: primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontWeight: FontWeight.w600),
                tabs: [Tab(text: 'FAQ'), Tab(text: 'Contact Us')],
              ),
            ),
            16.height,
            TabBarView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 36,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: faqList.length,
                        itemBuilder: (context, index) {
                          return Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(
                                  left: 14,
                                  right: 14,
                                  bottom: 6,
                                  top: 6,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      selectedStatus == faqList[index]
                                          ? primaryColor
                                          : Colors.white,
                                  border: Border.all(
                                    width: 0.6,
                                    color:
                                        selectedStatus == faqList[index]
                                            ? primaryColor
                                            : Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Text(
                                  faqList[index]
                                      .toString()
                                      .capitalizeFirstLetter(),
                                  style: boldTextStyle(
                                    size: 13,
                                    color:
                                        selectedStatus == faqList[index]
                                            ? Colors.white
                                            : Colors.grey,
                                  ),
                                ),
                              )
                              .onTap(() {
                                selectedStatus = faqList[index];
                                print(
                                  "Selected Index" + selectedStatus.toString(),
                                );
                                setState(() {});
                              })
                              .paddingRight(10);
                        },
                      ),
                    ),
                    10.height,

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Text(
                            "Can i track my order's delivery status?",
                            style: primaryTextStyle(color: blackNewColor),
                          ),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "Lorem Text Lorem TextLorem TextLorem TextLorem Text",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Text(
                            "Is the return policy?",
                            style: primaryTextStyle(color: blackNewColor),
                          ),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "Lorem Text Lorem TextLorem TextLorem TextLorem Text",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Text(
                            "Can i save my favourite items for later?",
                            style: primaryTextStyle(color: blackNewColor),
                          ),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "Lorem Text Lorem TextLorem TextLorem TextLorem Text",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Text(
                            "Can i share my product with my friends?",
                            style: primaryTextStyle(color: blackNewColor),
                          ),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "Lorem Text Lorem TextLorem TextLorem TextLorem Text",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Text(
                            "How do i contact customer support?",
                            style: primaryTextStyle(color: blackNewColor),
                          ),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "Lorem Text Lorem TextLorem TextLorem TextLorem Text",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Text(
                            "What payment methods are accepted?",
                            style: primaryTextStyle(color: blackNewColor),
                          ),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "Lorem Text Lorem TextLorem TextLorem TextLorem Text",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Text(
                            "How to add review?",
                            style: primaryTextStyle(color: blackNewColor),
                          ),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "Lorem Text Lorem TextLorem TextLorem TextLorem Text",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                  ],
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Row(
                            children: [
                              Image.asset(
                                ic_support,
                                color: primaryColor,
                                height: 30,
                                width: 30,
                              ),
                              10.width,
                              Text(
                                "Customer Service",
                                style: primaryTextStyle(color: blackNewColor),
                              ).expand(),
                            ],
                          ).paddingOnly(top: 6, bottom: 6),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "Lorem Text Lorem TextLorem TextLorem TextLorem Text",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                ic_whatsapp,
                                color: primaryColor,
                                height: 30,
                                width: 30,
                              ),
                              10.width,
                              Text(
                                "WhatsApp",
                                style: primaryTextStyle(color: blackNewColor),
                              ).expand(),
                            ],
                          ).paddingOnly(top: 6, bottom: 6),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "+91 9876543210",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Row(
                            children: [
                              Image.asset(
                                ic_web,
                                color: primaryColor,
                                height: 30,
                                width: 30,
                              ),
                              10.width,
                              Text(
                                "Website",
                                style: primaryTextStyle(color: blackNewColor),
                              ).expand(),
                            ],
                          ).paddingOnly(top: 6, bottom: 6),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "heypion.com",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Row(
                            children: [
                              Image.asset(
                                ic_fb,
                                color: primaryColor,
                                height: 30,
                                width: 30,
                              ),
                              10.width,
                              Text(
                                "Facebook",
                                style: primaryTextStyle(color: blackNewColor),
                              ).expand(),
                            ],
                          ).paddingOnly(top: 6, bottom: 6),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Row(
                            children: [
                              Image.asset(
                                ic_twitter,
                                color: primaryColor,
                                height: 30,
                                width: 30,
                              ),
                              10.width,
                              Text(
                                "Twitter",
                                style: primaryTextStyle(color: blackNewColor),
                              ).expand(),
                            ],
                          ).paddingOnly(top: 6, bottom: 6),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "Lorem Text Lorem TextLorem TextLorem TextLorem Text",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                    10.height,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      ),
                      child: Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          iconColor: primaryColor,
                          collapsedIconColor: primaryColor,
                          minTileHeight: 0,
                          dense: true,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                ic_instagram,
                                color: primaryColor,
                                height: 30,
                                width: 30,
                              ),
                              10.width,
                              Text(
                                "Instagram",
                                style: primaryTextStyle(color: blackNewColor),
                              ).expand(),
                            ],
                          ).paddingOnly(top: 6, bottom: 6),
                          children: <Widget>[
                            Divider(color: Colors.grey.withOpacity(0.3)),

                            Text(
                              "Lorem Text Lorem TextLorem TextLorem TextLorem Text",
                              style: secondaryTextStyle(color: Colors.grey),
                            ),
                            8.height,
                          ],
                          tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
                        ).paddingSymmetric(horizontal: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ).expand(),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
