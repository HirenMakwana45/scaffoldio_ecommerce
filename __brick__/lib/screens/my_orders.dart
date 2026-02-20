import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/Utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
import 'package:{{name.snakeCase()}}/extensions/extension_util/widget_extensions.dart';

import '../components/order_item_component.dart';
import '../extensions/widgets.dart';
import '../utils/app_images.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBarWidget("My Orders", center: true, context: context),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: TabBar(
                dividerColor: Colors.grey.withOpacity(0.1),
                indicator: RoundedTabIndicator(color: primaryColor, weight: 3),
                labelColor: primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontWeight: FontWeight.w600),
                tabs: [
                  Tab(text: 'Active'),
                  Tab(text: 'Completed'),
                  Tab(text: 'Cancelled'),
                ],
              ),
            ),
            TabBarView(
              children: [
                
                orderItemComponent(
                  imagePath: img_p1,
                  title: 'Brown Jacket',
                  sizeQty: 'Size : XL | Qty : 10 pcs',
                  price: '\$120',
                  actionText: 'Re-Order',
                  onActionPressed: () {
                    // Do reorder
                  },
                ).paddingAll(16),
                orderItemComponent(
                  imagePath: ic_google,
                  title: 'Brown suite',
                  sizeQty: 'Size : XL | Qty : 10 pcs',
                  price: '\$120',
                  actionText: 'Re-Order',
                  onActionPressed: () {
                    // Do reorder
                  },
                ).paddingAll(16),
                orderItemComponent(
                  imagePath: ic_google,
                  title: 'Brown suite',
                  sizeQty: 'Size : XL | Qty : 10 pcs',
                  actionText: 'Re-Order',
                  price: '\$120',
                  onActionPressed: () {
                    // Do reorder
                  },
                ).paddingAll(16),
              ],
            ).expand(),
          ],
        ),
      ),
    );
  }
}

class RoundedTabIndicator extends Decoration {
  final Color color;
  final double weight;

  const RoundedTabIndicator({required this.color, this.weight = 3});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _RoundedPainter(color: color, weight: weight);
  }
}

class _RoundedPainter extends BoxPainter {
  final Color color;
  final double weight;

  _RoundedPainter({required this.color, required this.weight});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Paint paint =
        Paint()
          ..color = color
          ..strokeCap = StrokeCap.round
          ..strokeWidth = weight;

    final double xStart = cfg.size!.width / 2 - 15;
    final double xEnd = cfg.size!.width / 2 + 15;
    final double y = cfg.size!.height - weight / 2;

    canvas.drawLine(
      Offset(offset.dx + xStart, offset.dy + y),
      Offset(offset.dx + xEnd, offset.dy + y),
      paint,
    );
  }
}
