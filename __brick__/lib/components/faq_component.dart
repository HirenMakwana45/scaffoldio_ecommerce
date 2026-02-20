import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/extensions/app_text_field.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/text_styles.dart';
import 'package:{{name.snakeCase()}}/utils/app_common.dart';

import '../Utils/app_colors.dart';
import '../extensions/widgets.dart';

class FaqComponent extends StatefulWidget {
  const FaqComponent({super.key});

  @override
  State<FaqComponent> createState() => _FaqComponentState();
}

class _FaqComponentState extends State<FaqComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("FAQs", center: true, context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              iconColor: primaryColor,
              collapsedIconColor: primaryColor,
              minTileHeight: 0,
              dense: true,
              title: Text(
                'What is I Talk?',
                style: boldTextStyle(color: primaryColor),
              ),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  title: Text(
                    'I Talk is a pseudonymous social network where you can share anything anonymously. Feel free to express yourself, ask for help, or just chat with new people.',
                    style: secondaryTextStyle(color: Colors.grey),
                  ),
                ),
              ],
              tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
            ),
            ExpansionTile(
              iconColor: primaryColor,
              collapsedIconColor: primaryColor,
              minTileHeight: 0,
              dense: true,
              title: Text(
                'What is {{name.snakeCase()}}?',
                style: boldTextStyle(color: primaryColor),
              ),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  title: Text(
                    '{{name.snakeCase()}} lets you post real-life needs like finding a plumber, blood donor, tuition teacher, etc. Everyone in the community gets notified and can help instantly.',
                    style: secondaryTextStyle(color: Colors.grey),

                  ),
                ),
              ],
              tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
            ),
            ExpansionTile(
              iconColor: primaryColor,
              collapsedIconColor: primaryColor,
              minTileHeight: 0,
              dense: true,
              title: Text(
                'How long does a post stay live?',
                style: boldTextStyle(color: primaryColor),
              ),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  title: Text(
                    'All posts, comments, and replies stay live for 48 hours only. After that, they are automatically deleted to keep the content fresh and relevant.',
                    style: secondaryTextStyle(color: Colors.grey),

                  ),
                ),
              ],
              tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
            ),
            ExpansionTile(
              iconColor: primaryColor,
              collapsedIconColor: primaryColor,
              minTileHeight: 0,
              dense: true,
              title: Text(
                'Can I really chat with strangers?',
                style: boldTextStyle(color: primaryColor),
              ),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  title: Text(
                    'Yes, you can chat with unknown friends while staying within community guidelines. It’s a great way to make new connections and share thoughts.',
                    style: secondaryTextStyle(color: Colors.grey),

                  ),
                ),
              ],
              tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
            ),
            ExpansionTile(
              iconColor: primaryColor,
              collapsedIconColor: primaryColor,
              minTileHeight: 0,
              dense: true,
              title: Text(
                'Is it only for Bhavnagar?',
                style: boldTextStyle(color: primaryColor),
              ),
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                  title: Text(
                    'We’re starting with Bhavnagar and building a strong local community first. More cities will be added soon!',
                    style: secondaryTextStyle(color: Colors.grey),

                  ),
                ),
              ],
              tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
            ),
            ExpansionTile(
              iconColor: primaryColor,
              collapsedIconColor: primaryColor,
              minTileHeight: 0,
              dense: true,
              title: Text(
                'Where can I contact for support?',
                style: boldTextStyle(color: primaryColor),
              ),
              children: <Widget>[
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'For any queries or support, feel free to contact us:',
                        style: secondaryTextStyle(color: Colors.grey),
                      ),
                      8.height,
                      GestureDetector(
                        onTap: () {
                          launchUrls('tel:+91 9638469716');
                        },
                        child: Text(
                          'Phone: +91 9638469716',
                          style: boldTextStyle(size: 14, color: primaryColor),
                        ),
                      ),
                      4.height,
                      GestureDetector(
                        onTap: () {
                          launchUrls(
                            'mailto:contact@heypion.com?subject=${Uri.encodeComponent("Query Related Issue")}&body=${Uri.encodeComponent("Hi Team,\n\nI have the following query:")}',
                          );
                        },
                        child: Text(
                          'Email: contact@heypion.com',
                          style: boldTextStyle(size: 14, color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              tilePadding: EdgeInsets.symmetric(horizontal: 6.0),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}

