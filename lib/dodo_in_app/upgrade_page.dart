import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

import 'in_app.dart';
import 'in_app_constant.dart';

class UpgradePage extends StatefulWidget {
  const UpgradePage({Key? key}) : super(key: key);

  @override
  State<UpgradePage> createState() => _UpgradePageState();
}

class _UpgradePageState extends State<UpgradePage> {
  final DodoInApp _inApp = Get.put(
    DodoInApp(
      useAmazon: true,
      enableSub: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    _inApp.init();
  }

  @override
  void dispose() {
    _inApp.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upgrade"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepOrange.withOpacity(0.0),
                Colors.pink.withOpacity(0.4),
              ],
            ),
          ),
          child: Center(
            child: Column(
              children: [
                // Subscription------------------
                Obx(
                  () => ListTile(
                    title: const Text(
                      "Upgrade to Premium 1",
                      style: TextStyle(fontSize: 24),
                    ),
                    trailing: ElevatedButton(
                      onPressed: _inApp.isProductReady(kSub1)
                          ? () {
                              _inApp.buySubById(kSub1);
                            }
                          : null,
                      child: const Text("Buy"),
                    ),
                    subtitle: Text(_inApp.getPrice(kSub1)),
                  ),
                ),
                Obx(
                  () => ListTile(
                    title: const Text(
                      "Upgrade to Premium 2",
                      style: TextStyle(fontSize: 24),
                    ),
                    trailing: ElevatedButton(
                      onPressed: _inApp.isProductReady(kSub2)
                          ? () {
                              _inApp.buySubById(kSub2);
                            }
                          : null,
                      child: const Text("Buy"),
                    ),
                    subtitle: Text(_inApp.getPrice(kSub2)),
                  ),
                ),
                Obx(
                  () => ListTile(
                    title: const Text(
                      "Upgrade to Premium 3",
                      style: TextStyle(fontSize: 24),
                    ),
                    trailing: ElevatedButton(
                      onPressed: _inApp.isProductReady(kSub3)
                          ? () {
                              _inApp.buySubById(kSub3);
                            }
                          : null,
                      child: const Text("Buy"),
                    ),
                    subtitle: Text(_inApp.getPrice(kSub3)),
                  ),
                ),
                Obx(
                  () => ListTile(
                    title: const Text(
                      "Upgrade to Premium 4",
                      style: TextStyle(fontSize: 24),
                    ),
                    trailing: ElevatedButton(
                      onPressed: _inApp.isProductReady(kSub4)
                          ? () {
                              _inApp.buySubById(kSub4);
                            }
                          : null,
                      child: const Text("Buy"),
                    ),
                    subtitle: Text(_inApp.getPrice(kSub4)),
                  ),
                ),
                //--------------------------------
                Expanded(
                  child: ListView.builder(
                    itemCount: kConsumables.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Obx(
                            () => Container(
                              padding: const EdgeInsets.all(8),
                              foregroundDecoration: index % 1 == 0
                                  ? RotatedCornerDecoration(
                                      color: Theme.of(context).primaryColor,
                                      geometry: const BadgeGeometry(
                                        width: 32,
                                        height: 32,
                                        alignment: BadgeAlignment.topLeft,
                                        cornerRadius: 8,
                                      ),
                                      textSpan: const TextSpan(
                                        text: 'Sale',
                                        style: TextStyle(
                                          fontSize: 8,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      labelInsets:
                                          const LabelInsets(baselineShift: 3),
                                    )
                                  : null,
                              child: ListTile(
                                title: Text(
                                  "${index + 1} s for you",
                                  style: const TextStyle(fontSize: 24),
                                ),
                                trailing: ElevatedButton(
                                  onPressed: _inApp
                                          .isProductReady(kConsumables[index])
                                      ? () {
                                          _inApp.buyById(kConsumables[index]);
                                        }
                                      : null,
                                  child: const Text("Buy"),
                                ),
                                subtitle:
                                    Text(_inApp.getPrice(kConsumables[index])),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class BuyItem extends StatelessWidget {
//   const BuyItem({
//     Key? key,
//     required this.productId,
//   }) : super(key: key);

//   final String productId;

//   @override
//   Widget build(BuildContext context) {
//     final _inApp = Get.find<DodoInApp>();
//     return Obx(
//       () => ListTile(
//         title: Text(_inApp.getPrice(productId)),
//         trailing: ElevatedButton(
//           onPressed: _inApp.isProductReady(productId)
//               ? () {
//                   _inApp.buyBuyId(productId);
//                 }
//               : null,
//           child: const Text("Buy"),
//         ),
//       ),
//     );
//   }
// }
