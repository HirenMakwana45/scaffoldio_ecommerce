import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/Utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/text_styles.dart';
import 'package:{{name.snakeCase()}}/utils/app_images.dart';

import '../components/order_item_component.dart';
import '../extensions/widgets.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final List<_OrderStatus> statuses = [
      _OrderStatus(
        "Order Placed",
        "23 Aug 2023, 04:25 PM",
        Image.asset(ic_order_placed, color: primaryColor),
        true,
      ),
      _OrderStatus(
        "In Progress",
        "23 Aug 2023, 03:54 PM",
        Image.asset(ic_order_in_progress, color: primaryColor),
        true,
      ),
      _OrderStatus(
        "Shipped",
        "Expected 02 Sep 2023",
        Image.asset(ic_order_shipped, color: primaryColor),
        false,
      ),
      _OrderStatus(
        "Delivered",
        "23 Aug 2023",
        Image.asset(ic_order_delivered, color: primaryColor),
        false,
      ),
    ];
    return Scaffold(
      appBar: appBarWidget("Track Order", center: true, context: context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            orderItemComponent(
              imagePath: ic_google,
              title: 'Brown suite',
              sizeQty: 'Size : XL | Qty : 10 pcs',
              price: '\$120',
              // actionText: '',
              onActionPressed: () {
                // Do reorder
              },
            ),
            10.height,
            Divider(color: Colors.grey.withOpacity(0.1)),
            10.height,

            Text('Order Details', style: boldTextStyle()),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  'Expected Delivery Date',
                  style: primaryTextStyle(color: Colors.grey, size: 14),
                ),
                Text('03 Sep 2023', style: boldTextStyle(size: 14)),
              ],
            ),
            4.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tracking Id',
                  style: primaryTextStyle(color: Colors.grey, size: 14),
                ),
                Text('TRK251354', style: boldTextStyle(size: 14)),
              ],
            ),
            16.height,

            Divider(color: Colors.grey.withOpacity(0.1)),
            16.height,

            Text('Order Status', style: boldTextStyle()),
            16.height,
            SizedBox(
              height: 300,
              child: Timeline.tileBuilder(
                theme: TimelineThemeData(
                  nodePosition: 0,
                  color: primaryColor,
                  indicatorTheme: const IndicatorThemeData(
                    position: 0.5,
                    size: 20.0,
                  ),
                  connectorTheme: const ConnectorThemeData(thickness: 2.5),
                ),
                builder: TimelineTileBuilder.connected(
                  connectionDirection: ConnectionDirection.before,
                  itemCount: statuses.length,
                  contentsBuilder: (_, index) {
                    final status = statuses[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                status.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: status.image,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            status.subtitle,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    );
                  },
                  indicatorBuilder: (_, index) {
                    final status = statuses[index];
                    return status.isCompleted
                        ? const DotIndicator(color: primaryColor)
                        : const OutlinedDotIndicator(
                          color: Colors.grey,
                          borderWidth: 2.5,
                        );
                  },
                  connectorBuilder: (_, index, ___) {
                    final status = statuses[index];
                    final nextStatus =
                        statuses.length > index + 1
                            ? statuses[index + 1]
                            : null;
                    if (status.isCompleted &&
                        (nextStatus?.isCompleted ?? false)) {
                      return const SolidLineConnector(color: primaryColor);
                    } else {
                      return const DashedLineConnector(color: Colors.grey);
                    }
                  },
                ),
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}

class _OrderStatus {
  final String title;
  final String subtitle;
  final Image image;
  final bool isCompleted;

  _OrderStatus(this.title, this.subtitle, this.image, this.isCompleted);
}
