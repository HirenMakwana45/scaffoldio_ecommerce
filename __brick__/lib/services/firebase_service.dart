// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:word_generator/word_generator.dart';
// import 'dart:math';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:googleapis_auth/googleapis_auth.dart';
//
// import '../utils/app_config.dart';
//
// class FirebaseService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final _random = Random();
//   final _wordGenerator = WordGenerator();
//
//   Future<String> getDeviceId() async {
//     final deviceInfo = DeviceInfoPlugin();
//
//     if (Platform.isAndroid) {
//       final androidInfo = await deviceInfo.androidInfo;
//       return androidInfo.id ?? androidInfo.id ?? 'unknown_android';
//     } else if (Platform.isIOS) {
//       final iosInfo = await deviceInfo.iosInfo;
//       return iosInfo.identifierForVendor ?? 'unknown_ios';
//     } else {
//       return 'unknown_device';
//     }
//   }
//
//   /// Generate Anonymous ID (fallback)
//   String generateAnonymousId({int length = 8}) {
//     const chars =
//         'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
//     return List.generate(
//       length,
//       (index) => chars[_random.nextInt(chars.length)],
//     ).join();
//   }
//
//   /// Capitalize word
//   String _capitalize(String word) =>
//       word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : word;
//
//   /// Generate more meaningful anonymous username
//   String generateAnonymousUsername({int length = 12}) {
//     final word1 = _wordGenerator.randomName() ?? '';
//     final word2 = _wordGenerator.randomName() ?? '';
//     final suffix = _random.nextInt(999).toString().padLeft(3, '0');
//
//     // Combine and trim if too long
//     String base = _capitalize(word1) + _capitalize(word2);
//     base = base.replaceAll(RegExp(r'\s+'), '');
//     int maxBaseLength = length - suffix.length;
//     if (base.length > maxBaseLength) {
//       base = base.substring(0, maxBaseLength);
//     }
//
//     return '$base$suffix';
//   }
//
//   /// Check if username already exists
//   Future<bool> isUsernameTaken(String name) async {
//     final snapshot =
//         await _firestore
//             .collection('Users')
//             .where('anonymousName', isEqualTo: name)
//             .get();
//     return snapshot.docs.isNotEmpty;
//   }
//
//   /// Get unique anonymous username
//   Future<String> getUniqueAnonymousUsername({int maxAttempts = 10}) async {
//     for (int i = 0; i < maxAttempts; i++) {
//       final name = generateAnonymousUsername();
//       if (!await isUsernameTaken(name)) return name;
//     }
//     // fallback to random ID if name collision
//     return generateAnonymousId(length: 12);
//   }
//
//   /// Save or update user in Firestore
//   Future<void> saveUserIfNew({
//     required String loginMethod,
//     String? referredByCode,
//   }) async {
//     final deviceId = await getDeviceId();
//
//     final user = _auth.currentUser;
//     if (user == null) return;
//
//     final docRef = _firestore.collection('Users').doc(user.uid);
//     final snapshot = await docRef.get();
//
//     if (!snapshot.exists) {
//       final anonymousName = await getUniqueAnonymousUsername();
//       final token = await FirebaseMessaging.instance.getToken();
//
//       // Generate a unique referral code (you can customize this logic)
//       final referralCode =
//           '${anonymousName.toLowerCase().replaceAll(' ', '')}${user.uid.substring(0, 5)}';
//
//       int bonusAskAwayPosts = 0;
//
//       // If user was referred, update referrer's post count
//       if (referredByCode != null && referredByCode.isNotEmpty) {
//         final referrerSnapshot =
//             await _firestore
//                 .collection('Users')
//                 .where('referralCode', isEqualTo: referredByCode)
//                 .limit(1)
//                 .get();
//
//         if (referrerSnapshot.docs.isNotEmpty) {
//           final referrerDoc = referrerSnapshot.docs.first;
//           final referrerId = referrerDoc.id;
//
//           await _firestore.collection('Users').doc(referrerId).update({
//             'referralCount': FieldValue.increment(1),
//             'bonusAskAwayPosts': FieldValue.increment(1),
//           });
//
//           bonusAskAwayPosts = 1;
//         }
//       }
//
//       await docRef.set({
//         'uid': user.uid,
//         'anonymousName': anonymousName,
//         'loginMethod': loginMethod,
//         'timestamp': Timestamp.now(),
//         'fcmToken': token ?? '',
//         'referralCode': referralCode,
//         'referredBy': referredByCode ?? '',
//         'referralCount': 0,
//         'bonusAskAwayPosts': bonusAskAwayPosts,
//         'freePostsRemaining': 3,
//         'paidPostsRemaining': 0,
//         'totalPostsUsed': 0,
//         'deviceId': deviceId,
//       });
//     } else {
//       // Existing user - just update token if needed
//       await saveFcmTokenToFirestore();
//     }
//   }
//
//   /// Save FCM Token separately
//   Future<void> saveFcmTokenToFirestore() async {
//     final user = _auth.currentUser;
//     if (user == null) return;
//
//     final token = await FirebaseMessaging.instance.getToken();
//     if (token != null) {
//       await _firestore.collection('Users').doc(user.uid).update({
//         'fcmToken': token,
//       });
//     }
//   }
//
//   Future<bool> applyReferral(String referralCode) async {
//     final user = _auth.currentUser;
//     if (user == null) return false;
//
//     final userDoc = FirebaseFirestore.instance.collection('Users').doc(user.uid);
//     final userSnapshot = await userDoc.get();
//     final userData = userSnapshot.data();
//     if (userData == null) return false;
//
//     // Get current deviceId
//     final deviceId = await getDeviceId();
//     if (deviceId == null) return false;
//
//     // ❌ Check if device already used referral
//     final deviceUsedSnapshot = await FirebaseFirestore.instance
//         .collection('ReferralsUsedDevices')
//         .doc(deviceId)
//         .get();
//
//     if (deviceUsedSnapshot.exists) {
//       return false; // Referral already used on this device
//     }
//
//     // ✅ Check if referral code exists
//     final refQuery = await FirebaseFirestore.instance
//         .collection('Users')
//         .where('referralCode', isEqualTo: referralCode)
//         .limit(1)
//         .get();
//
//     if (refQuery.docs.isEmpty) return false;
//
//     final referrerDoc = refQuery.docs.first.reference;
//
//     // ✅ Update current user
//     await userDoc.update({
//       'referralIdUsed': referralCode,
//       'hasUsedReferral': true,
//       'freePostsRemaining': FieldValue.increment(1), // Optional bonus
//     });
//
//     // ✅ Add this device to ReferralsUsedDevices collection
//     await FirebaseFirestore.instance
//         .collection('ReferralsUsedDevices')
//         .doc(deviceId)
//         .set({
//       'uid': user.uid,
//       'referralCodeUsed': referralCode,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//
//     // ✅ Update referrer stats
//     await referrerDoc.update({
//       'referralsMade': FieldValue.increment(1),
//     });
//
//     return true;
//   }
//
//   /// ✅ Get current user's anonymous name
//   Future<String?> getCurrentAnonymousName() async {
//     final user = _auth.currentUser;
//     if (user == null) return null;
//
//     final userDoc = await _firestore.collection('Users').doc(user.uid).get();
//     return userDoc.data()?['anonymousName'];
//   }
//
//   ///Update Name
//   // Future<void> updateUsernameEverywhere(String newName) async {
//   //   final user = _auth.currentUser;
//   //   if (user == null) return;
//   //
//   //   final userId = user.uid;
//   //
//   //   // Update user profile
//   //   await _firestore.collection('Users').doc(userId).update({
//   //     'anonymousName': newName,
//   //   });
//   //
//   //   // Update posts
//   //   final postsQuery = await _firestore
//   //       .collection('Posts')
//   //       .where('uid', isEqualTo: userId)
//   //       .get();
//   //   for (var doc in postsQuery.docs) {
//   //     await doc.reference.update({'anonymousName': newName});
//   //   }
//   //
//   //   // Update comments
//   //   final commentsQuery = await _firestore
//   //       .collectionGroup('comments') // Use if comments are subcollections
//   //       .where('uid', isEqualTo: userId)
//   //       .get();
//   //   for (var doc in commentsQuery.docs) {
//   //     await doc.reference.update({'anonymousName': newName});
//   //   }
//   //
//   //   // Add similar blocks for replies, notifications, etc., if needed
//   // }
//
//
//
//   List<String> generateSearchTokens(String anonymousName, String content) {
//     return (anonymousName + ' ' + content)
//         .toLowerCase()
//         .split(RegExp(r'\s+'))
//         .where((word) => word.trim().isNotEmpty)
//         .toSet()
//         .toList();
//   }
//
//   /// ✅ Create a new post
//   Future<void> createPost({
//     required String content,
//     required bool isAskAway,
//   }) async {
//     final user = _auth.currentUser;
//     if (user == null) return;
//
//     final userDoc = await _firestore.collection('Users').doc(user.uid).get();
//     final username = userDoc['anonymousName'];
//
//     final now = Timestamp.now();
//     final expireAt = Timestamp.fromDate(now.toDate().add(Duration(hours: 48)));
//     final searchTokens = generateSearchTokens(username, content);
//
//     await _firestore.collection('Posts').add({
//       'uid': user.uid,
//       'anonymousName': username,
//       'content': content,
//       'searchTokens': searchTokens,
//       'timestamp': now,
//       'expireAt': expireAt,
//       'isAskAway': isAskAway,
//       'likes': 0,
//       'views': 0,
//       'commentCount': 0,
//     });
//   }
//
//   /// ✅ Increment view count
//   Future<void> incrementViewCount(String postId) async {
//     await _firestore.collection('Posts').doc(postId).update({
//       'views': FieldValue.increment(1),
//     });
//   }
//
//   /// ✅ Like post
//   Future<void> togglePostLike(
//     String postId,
//     String userId,
//     bool isLiked,
//   ) async {
//     final postRef = FirebaseFirestore.instance.collection('Posts').doc(postId);
//     final likeRef = postRef.collection('likes').doc(userId);
//
//     if (isLiked) {
//       await likeRef.set({'likedAt': FieldValue.serverTimestamp()});
//       await postRef.update({'likesCount': FieldValue.increment(1)});
//     } else {
//       await likeRef.delete();
//       await postRef.update({'likesCount': FieldValue.increment(-1)});
//     }
//   }
//
//   /// Check Post Like
//   Future<bool> checkIfPostLiked(String postId, String userId) async {
//     final likeDoc =
//         await FirebaseFirestore.instance
//             .collection('Posts')
//             .doc(postId)
//             .collection('likes')
//             .doc(userId)
//             .get();
//
//     return likeDoc.exists;
//   }
//
//   /// Check Comment Like
//   Future<bool> checkIfCommentLiked(
//     String postId,
//     String commentId,
//     String userId,
//   ) async {
//     final likeDoc =
//         await FirebaseFirestore.instance
//             .collection('Posts')
//             .doc(postId)
//             .collection('comments')
//             .doc(commentId)
//             .collection('likes')
//             .doc(userId)
//             .get();
//
//     return likeDoc.exists;
//   }
//
//   /// ✅ Like comment
//
//   Future<void> commentToggleLike(
//     String postId,
//     String commentId,
//     String userId,
//     bool isLiked,
//   ) async {
//     final commentRef = FirebaseFirestore.instance
//         .collection('Posts')
//         .doc(postId)
//         .collection('comments')
//         .doc(commentId);
//
//     final likeRef = commentRef.collection('likes').doc(userId);
//
//     if (isLiked) {
//       await likeRef.set({'likedAt': FieldValue.serverTimestamp()});
//       await commentRef.update({'likes': FieldValue.increment(1)});
//     } else {
//       await likeRef.delete();
//       await commentRef.update({'likes': FieldValue.increment(-1)});
//     }
//   }
//
//   /// ✅ Like reply
//   Future<void> replyToggleLike(
//     String postId,
//     String commentId,
//     String replyId,
//     String userId,
//   ) async {
//     final replyRef = FirebaseFirestore.instance
//         .collection('Posts')
//         .doc(postId)
//         .collection('comments')
//         .doc(commentId)
//         .collection('replies')
//         .doc(replyId);
//
//     final likeRef = replyRef.collection('likes').doc(userId);
//     final likeSnapshot = await likeRef.get();
//
//     if (likeSnapshot.exists) {
//       await likeRef.delete();
//       await replyRef.update({'likes': FieldValue.increment(-1)});
//     } else {
//       await likeRef.set({'likedAt': FieldValue.serverTimestamp()});
//       await replyRef.update({'likes': FieldValue.increment(1)});
//     }
//   }
//
//   Future<void> updatePost({
//     required String postId,
//     required String newContent,
//   }) async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;
//
//     final postRef = _firestore.collection('Posts').doc(postId);
//     final postSnapshot = await postRef.get();
//
//     if (postSnapshot.exists && postSnapshot.data()?['uid'] == user.uid) {
//       await postRef.update({
//         'content': newContent,
//         'lastEdited': Timestamp.now(), // optional field
//       });
//     }
//   }
//
//   Future<List<String>> getUserFcmTokens(String userId) async {
//     final userDoc =
//         await FirebaseFirestore.instance.collection('Users').doc(userId).get();
//
//     if (userDoc.exists && userDoc.data()!.containsKey('fcmToken')) {
//       // Return a list with one token
//       return [userDoc['fcmToken'] as String];
//     }
//     return [];
//   }
//
//   Future<void> saveNotification({
//     required String userId, // Who receives notification
//     required String message, // e.g. "Someone commented on your post"
//     required String postId, // Reference to post (optional)
//     DateTime? timestamp,
//   }) async {
//     await FirebaseFirestore.instance
//         .collection('Users')
//         .doc(userId)
//         .collection('Notifications')
//         .add({
//           'message': message,
//           'postId': postId,
//           'timestamp': timestamp ?? FieldValue.serverTimestamp(),
//           'read': false, // To track if notification is read
//         });
//   }
//
//
//   /// FetchReferralCode
//   Future<String?> getCurrentReferralCode() async {
//     final user = _auth.currentUser;
//     if (user == null) return null;
//
//     final userDoc = await _firestore.collection('Users').doc(user.uid).get();
//     return userDoc.data()?['referralCode'];
//   }
//
//   ///PAYMENT
//   // When user tries to post:
//   Future<bool> canUserPost({required bool isAskAway}) async {
//     final user = _auth.currentUser;
//     if (user == null) return false;
//
//     final userDoc = await _firestore.collection('Users').doc(user.uid).get();
//     final data = userDoc.data();
//
//     int freePosts = data?['freePostsRemaining'] ?? 0;
//     int paidPosts = data?['paidPostsRemaining'] ?? 0;
//     int bonusPosts = data?['bonusAskAwayPosts'] ?? 0;
//
//     if (!isAskAway) return true;
//
//     return freePosts > 0 || paidPosts > 0 || bonusPosts > 0;
//   }
//
//   //When user makes a post, deduct from free posts first, then paid posts:
//
//   Future<void> usePost({required bool isAskAway}) async {
//     if (!isAskAway) return;
//
//     final user = _auth.currentUser;
//     if (user == null) return;
//
//     final userDoc = _firestore.collection('Users').doc(user.uid);
//     final snapshot = await userDoc.get();
//     final data = snapshot.data();
//
//     int freePosts = data?['freePostsRemaining'] ?? 0;
//     int paidPosts = data?['paidPostsRemaining'] ?? 0;
//     int bonusPosts = data?['bonusAskAwayPosts'] ?? 0;
//     int totalUsed = data?['totalPostsUsed'] ?? 0;
//
//     if (bonusPosts > 0) {
//       await userDoc.update({
//         'bonusAskAwayPosts': bonusPosts - 1,
//         'totalPostsUsed': totalUsed + 1,
//       });
//     } else if (freePosts > 0) {
//       await userDoc.update({
//         'freePostsRemaining': freePosts - 1,
//         'totalPostsUsed': totalUsed + 1,
//       });
//     } else if (paidPosts > 0) {
//       await userDoc.update({
//         'paidPostsRemaining': paidPosts - 1,
//         'totalPostsUsed': totalUsed + 1,
//       });
//     } else {
//       throw Exception('No posts remaining, please purchase more.');
//     }
//   }
//   // When user successfully pays, add posts:
//
//   Future<void> addPaidPosts(int count) async {
//     final user = _auth.currentUser;
//     if (user == null) return;
//
//     final userDoc = _firestore.collection('Users').doc(user.uid);
//     await userDoc.update({'paidPostsRemaining': FieldValue.increment(count)});
//   }
// //GET CURRENT DATA
//   Future<Map<String, dynamic>> getCurrentUserData() async {
//     final user = FirebaseAuth.instance.currentUser;
//     final doc = await FirebaseFirestore.instance.collection('Users').doc(user!.uid).get();
//     return doc.data() ?? {};
//   }
//
// }
