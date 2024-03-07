// import 'dart:io';
//
// /**
//  * Created by Imtiyazaehmad Parasara.
//  * Date: 17/01/24
//  */
//
// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
//
// class AdsConstant {
//   static bool mode = kReleaseMode;
//
//   //Android Test IDs
//   static String testAdmobAndroidAppId =
//       "ca-app-pub-3940256099942544~3347511713";
//   static String testAppOpenAndroidId = "ca-app-pub-3940256099942544/9257395921";
//   static String testBannerAndroidId = "ca-app-pub-3940256099942544/6300978111";
//   static String testRewardAndroidId = "ca-app-pub-3940256099942544/5224354917";
//   static String testNativeAdvanceAndroidId =
//       "ca-app-pub-3940256099942544/1044960115";
//   static String testInterstitialAndroidId =
//       "ca-app-pub-3940256099942544/1033173712";
//
//   //iOS Test IDs
//   static String testAdmobIOSAppId = "ca-app-pub-3940256099942544~1458002511";
//   static String testAppOpenIosId = "ca-app-pub-3940256099942544/5575463023";
//   static String testBannerIosId = "ca-app-pub-3940256099942544/2934735716";
//   static String testRewardIosId = "ca-app-pub-3940256099942544/1712485313";
//   static String testNativeAdvanceIOSId =
//       "ca-app-pub-3940256099942544/2521693316";
//   static String testInterstitialIOSId =
//       "ca-app-pub-3940256099942544/4411468910";
//
//
//   //Application ID
//   static String admobAppId = Platform.isAndroid
//       ? mode
//           ? "ca-app-pub-3140823008482432~1429538308"
//           : testAdmobAndroidAppId
//       : mode
//           ? ""
//           : testAppOpenIosId;
//
//   //AppOpen ID
//   static String appOpenAdsId = Platform.isAndroid
//       ? mode
//           ? "ca-app-pub-3140823008482432/3716822145"
//           : testAppOpenAndroidId
//       : mode
//           ? ""
//           : testAppOpenIosId;
//
//   //Native Advance ID
//   static String nativeNewsAdUnitId = Platform.isAndroid
//       ? mode
//           ? "ca-app-pub-3140823008482432/8813204306"
//           : testNativeAdvanceAndroidId
//       : mode
//           ? ""
//           : testNativeAdvanceIOSId;
//
//   static const String nativeArticlesAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/2766670700" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String interstitialHistoryAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/1589158708" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String interstitialActuanAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/2355724707" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String interstitialPassbookAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/7990196277" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String interstitialOnlineAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/6212056658" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String interstitialClaimStatusAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/5144541083" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String interstitialIncomeTaxAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/6066068373" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String interstitialEpfModifyAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/3191167606" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String interstitialChatbotAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/6701068553" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String interstitialFaqAndFormsAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/5856661876" // Live Ad ID
//       : ""; // Test Ad ID
//
//   //Banner ID
//
//   static const String bannerSliderAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/2627069904" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String nameRegistrationActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/2913786102" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String googleLoginActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/4997023962" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String passbookActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/9507114617" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String captchaActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/8849828434" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String claimStatusActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/6223665094" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String claimStatusDetailActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/4910583424" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String faqAndFormActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/8658256746" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String incomeTaxCalculatorActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/4773662682" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String emiCalculatorActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/6038449379" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String gratuityActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/2558562885" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String loanEligibilityActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/3460581014" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String resetPasswordActivityBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/1482395996" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String activateUanBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/4198488749" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String knowYourUanBannerId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/5451860665" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerHomeId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/8519221177" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerProfileId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/4564498441" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerEducationId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/9844691384" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerExperienceId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/4635499252" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerSkillId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/8531609711" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerObjectiveId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/6999090099" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerReferenceId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/5893057831" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerProjectId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/4372926756" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerChooseTemplateId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/2009335919" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerPersonalDetailId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/3518956183" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerLoginId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/9887825939" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbBannerDownloadId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/3327384495" // Live Ad ID
//       : ""; // Test Ad ID
//
//   //Reward Video Ad IDs
//   static const String epfoLoginTimeFromPassbookRewardVideoAdUnitId =
//       kReleaseMode
//           ? "ca-app-pub-3140823008482432/3727407117" // Live Ad ID
//           : ""; // Test Ad ID
//
//   static const String epfoLoginTimeFromClaimRewardVideoAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/9473831739" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String passbookDownloadTimeRewardVideoAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/7619317877" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String claimStatusDetailRewardVideoAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/9632779687" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String resetPasswordActivityRewardId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/9527287414" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String viewProfileActivityRewardId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/3579090307" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String serviceHistoryActivityRewardId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/6590560165" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String rbRewardDownloadId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/8383172575" // Live Ad ID
//       : ""; // Test Ad ID
//
//   // Reward Interstitial Video Ad IDs
//   static const String epfoLoginTimeFromPassbookRewardIntVideoAdUnitId =
//       kReleaseMode
//           ? "ca-app-pub-3140823008482432/9068130917" // Live Ad ID
//           : ""; // Test Ad ID
//
//   static const String epfoLoginTimeFromClaimRewardIntVideoAdUnitId =
//       kReleaseMode
//           ? "ca-app-pub-3140823008482432/8561217075" // Live Ad ID
//           : ""; // Test Ad ID
//
//   static const String passbookDownloadTimeRewardIntVideoAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/2502722560" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String claimStatusDetailRewardIntVideoAdUnitId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/8894413085" // Live Ad ID
//       : ""; // Test Ad ID
//
//   static const String resetPasswordActivityIntRewardId = kReleaseMode
//       ? "ca-app-pub-3140823008482432/3800318016" // Live Ad ID
//       : ""; // Test Ad ID
// }
