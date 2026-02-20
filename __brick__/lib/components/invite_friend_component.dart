// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:{{name.snakeCase()}}/extensions/app_button.dart';
// import 'package:{{name.snakeCase()}}/extensions/extension_util/context_extensions.dart';
// import 'package:{{name.snakeCase()}}/extensions/extension_util/int_extensions.dart';
//
// import '../Utils/app_colors.dart';
// import '../extensions/text_styles.dart';
// import '../extensions/widgets.dart';
// import '../main.dart';
// import '../services/firebase_service.dart';
// import '../utils/app_images.dart';
//
// class InviteFriendComponent extends StatefulWidget {
//   const InviteFriendComponent({super.key});
//
//   @override
//   State<InviteFriendComponent> createState() => _InviteFriendComponentState();
// }
//
// class _InviteFriendComponentState extends State<InviteFriendComponent> {
//   final TextEditingController _referralController = TextEditingController();
//   // final FirebaseService _firebaseService = FirebaseService();
//
//   String? _message;
//   bool _isApplying = false;
//   String? myReferralCode;
//
//   @override
//   void initState() {
//     // WidgetsBinding.instance.addPostFrameCallback((_) async {
//     //   final mCode = await _firebaseService.getCurrentReferralCode();
//     //   setState(() {
//     //     myReferralCode = mCode ?? '{{name.snakeCase()}}_NEW';
//     //   });
//     // });
//     super.initState();
//   }
//
//   void _onApplyReferral() async {
//     final code = _referralController.text.trim();
//     if (code.isEmpty) {
//       setState(() {
//         _message = 'Please enter a referral code';
//       });
//       return;
//     }
//
//     if (code == myReferralCode) {
//       setState(() {
//         _message = 'You cannot apply your own referral code';
//       });
//       return;
//     }
//
//     setState(() {
//       _isApplying = true;
//       _message = null;
//     });
//
//     // final success = await _firebaseService.applyReferral(code);
//
//     setState(() {
//       _isApplying = false;
//       _message =
//           success
//               ? 'Referral applied successfully!'
//               : 'Invalid or already used referral code';
//     });
//   }
//
//   void _onCopyReferral() {
//     final myCode = myReferralCode ?? '';
//     if (myCode.isNotEmpty) {
//       Clipboard.setData(ClipboardData(text: myCode));
//       setState(() {
//         _message = 'Referral code copied to clipboard';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final myCode = myReferralCode ?? 'N/A';
//
//     return Scaffold(
//       appBar: appBarWidget("Invite Friend", center: true, context: context),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//
//               8.height,
//               Text(
//                 ' With 1 referral, you get 1 free {{name.snakeCase()}} Post!',
//                 style: boldTextStyle(
//                   size: 24,
//                   color:secondaryColor,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               24.height,
//               Text(
//                 'Your Referral Code:',
//                 style: primaryTextStyle( color: appStore.isDarkMode ? Colors.white : Colors.black87,),
//               ),
//               8.height,
//               Row(
//                 children: [
//                   Expanded(
//                     child: SelectableText(
//                       myCode,
//                       style: boldTextStyle(
//                         color: primaryColor,
//                         letterSpacing: 2,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.copy, color: secondary3Color),
//                     onPressed: _onCopyReferral,
//                     tooltip: 'Copy referral code',
//                   ),
//                 ],
//               ),
//               30.height,
//               Image.asset(img_refer, scale: 2),
//
//               24.height,
//               TextField(
//                 controller: _referralController,
//                 decoration: const InputDecoration(
//                   labelText: 'Enter Referral Code',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(12)),
//                   ),
//                 ),
//               ),
//               20.height,
//               SizedBox(
//                 width: double.infinity,
//                 child: AppButton(
//                   onTap: _isApplying ? null : _onApplyReferral,
//                   child:
//                       _isApplying
//                           ? const SizedBox(
//                             height: 20,
//                             width: 20,
//                             child: CircularProgressIndicator(
//                               strokeWidth: 2,
//                               color: Colors.white,
//                             ),
//                           )
//                           : Text(
//                             'Apply Referral',
//                             style: boldTextStyle(color: appStore.isDarkMode ? Colors.black : Colors.white,),
//                           ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               if (_message != null)
//                 Text(
//                   _message!,
//                   style: TextStyle(
//                     color:
//                         _message!.contains('success')
//                             ? Colors.green
//                             : Colors.red,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
