import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet/components/static_decoration.dart';
import '../utils/app_constants.dart';
import 'app_asset.dart';
import 'app_text_style.dart';
import 'colors.dart';
import 'image/image_widget.dart';

class UiInterface {
  static Widget mainLogo() {
    return Image.asset(
      AppAsset.logo,
      height: 150,
      width: 150,
      fit: BoxFit.cover,
    );
  }

  static Widget headingWidget({required String title}) {
    return Text(
      title,
      style: AppTextStyle.normalBold14.copyWith(
        color: grey,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static Widget logoWidget() {
    return Image.asset(
      AppAsset.logo,
      color: appColor,
      height: 100,
      width: 80,
      fit: BoxFit.cover,
    );
  }

  static Widget profileImageWidget({
    String? assetImage,
    double? hw,
    String? networkImage,
    String? selectedImagePath,
    String? svgAssetsImage,
  }) {
    return SizedBox(
      height: hw ?? 95,
      width: hw ?? 95,
      child: ClipRRect(
        borderRadius: circular5BorderRadius,
        child: selectedImagePath != null
            ? Image.file(
                File(selectedImagePath.toString()),
                fit: BoxFit.cover,
              )
            : networkImage != null
                ? NetworkImageWidget(
                    isProfile: true,
                    imageUrl: networkImage.toString().contains('https')
                        ? networkImage
                        : "${AppConstants.imageEndPoint}$networkImage",
                  )
                : assetImage != null
                    ? Image.asset(
                        assetImage,
                        fit: BoxFit.fill,
                      )
                    : SvgPicture.asset(
                        svgAssetsImage!,
                        fit: BoxFit.cover,
                        color: appColor,
                      ),
      ),
    );
  }

  static Widget prefixTextFieldIcon(String assetIcon) {
    return Container(
      padding: const EdgeInsets.all(14),
      child: SvgPicture.asset(
        assetIcon,
        color: grey,
        fit: BoxFit.contain,
      ),
    );
  }

  static AppBar commonAppBar({
    actionsIcon,
    String? title,
    leadingIcon,
    leadingOnTap,
    actionsOnTap,
    Widget? leadingWidget,
    Widget? actionWidget,
  }) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leadingWidget ??
              IconButton(
                  onPressed: leadingOnTap ??
                      () {
                        Get.back();
                      },
                  icon: SvgPicture.asset(
                    leadingIcon ?? "",
                    color: primaryBlack,
                    width: leadingIcon == null ? 23 : null,
                  )),
          const Spacer(),
          Expanded(
            flex: 0,
            child: Text(
              title ?? "",
              style: AppTextStyle.normalSemiBold18,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          actionsIcon != null
              ? InkWell(
                  onTap: actionsOnTap,
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: SvgPicture.asset(actionsIcon ?? "")),
                )
              : actionWidget ??
                  IconButton(
                      onPressed: leadingOnTap ?? () {},
                      icon: SvgPicture.asset(
                        leadingIcon ?? "",
                        color: Colors.transparent,
                        width: leadingIcon == null ? 23 : null,
                      )),
        ],
      ),
      // actions: [
      //   SvgPicture.asset("assets/images/svg/ic_settings.svg"),
      // ],
    );
  }

  Container backArrow(BuildContext context,
      {IconData? icon, double? hw, required VoidCallback onTap}) {
    return Container(
      height: hw ?? 43,
      width: hw ?? 43,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: primaryWhite,
          borderRadius: circular5BorderRadius,
          border: Border.all(color: borderGrey)),
      child: IconButton(
        icon: Icon(
          icon ?? Icons.keyboard_backspace_rounded,
        ),
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        color: titleBlack,
        onPressed: onTap,
      ),
    );
  }

  static Widget buildHorizontalDivider({double? padding}) => Container(
        margin: EdgeInsets.symmetric(vertical: padding ?? 25),
        height: 1.5,
        color: lightGrey,
      );

  static Widget verticalDivider({double? width}) {
    return Container(
      width: width ?? 1,
      height: 25,
      color: lightGrey,
    );
  }

  Widget customIconSquareWidget({
    required String assetIcon,
    required VoidCallback onPressed,
    Color? bgColor,
    double? hw,
    EdgeInsetsGeometry? padding,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: hw ?? 44,
        width: hw ?? 44,
        padding: padding ?? const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor ?? primaryWhite,
          shape: BoxShape.rectangle,
          borderRadius: circular5BorderRadius,
        ),
        child: SvgPicture.asset(
          assetIcon,
          color: iconColor,
        ),
      ),
    );
  }

  static Widget titleViewAllWidget(
      {required String title,
      VoidCallback? onTap,
      required bool isViewallVisible}) {
    return Container(
        padding: const EdgeInsets.fromLTRB(25, 0, 20, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title.toString(),
              style: AppTextStyle.normalBold18,
            ),
            Visibility(
              visible: isViewallVisible,
              child: InkWell(
                onTap: onTap,
                child: Text(
                  'View All',
                  style: AppTextStyle.normalRegular14.copyWith(color: appColor),
                ),
              ),
            ),
          ],
        ));
  }

  static Widget menuItemWidget(
      {required String svgImage,
      required String title,
      required bool isLeadingArrowExist,
      bool isLogout = false,
      required VoidCallback onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      horizontalTitleGap: 10,
      onTap: onTap,
      leading: isLogout
          ? Container(
              padding: const EdgeInsets.all(8),
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: appColor),
              child: SvgPicture.asset(
                svgImage,
                color: primaryWhite,
                height: 20,
              ),
            )
          : SvgPicture.asset(
              svgImage,
              color: primaryBlack,
              height: 22,
            ),
      title: Text(
        title,
        style: AppTextStyle.normalRegular16,
      ),
      trailing: isLeadingArrowExist == true
          ? SvgPicture.asset(
              AppAsset.icRightArrow,
              color: titleBlack,
              height: 12,
            )
          : const SizedBox(),
    );
  }

  static Widget listTileHeaderSection(
      {String? leadingImage,
      String? restaurantId,
      required String title,
      required String subTitle,
      String? trailingImage,
      EdgeInsetsGeometry? padding}) {
    return Container(
      padding: padding ?? const EdgeInsets.fromLTRB(25, 0, 25, 10),
      child: Row(
        children: [
          leadingImage != null
              ? UiInterface.profileImageWidget(
                  networkImage: leadingImage, hw: 50)
              : UiInterface.profileImageWidget(
                  assetImage: AppAsset.dummyProfileImage, hw: 50),
          width15,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.normalSemiBold18,
                ),
                customHeight(8),
                Text(
                  subTitle,
                  style: AppTextStyle.normalRegular13.copyWith(color: hintGrey),
                ),
              ],
            ),
          ),
          if (trailingImage != null) SvgPicture.asset(trailingImage)
        ],
      ),
    );
  }

// static Widget imageSliderHome(
//   imageList,
// ) {
//   return CarouselSlider(
//     options: CarouselOptions(
//       height: Get.height / 4,
//       autoPlay: true,
//       viewportFraction: 1,
//       disableCenter: true,
//       initialPage: 1,
//       pageSnapping: false,
//       pauseAutoPlayOnTouch: true,
//       scrollPhysics: NeverScrollableScrollPhysics(),
//       enlargeCenterPage: true,
//     ),
//     items: List.generate(
//       imageList.length != 0 ? imageList.length : 1,
//       (index) => Stack(
//         children: [
//           Stack(
//             children: [
//               Container(
//                 width: Get.width,
//                 child: imageList.length != 0 && imageList[index].image != null
//                     ? NetworkImageWidget(
//                         imageUrl:
//                             '${AppConstants.imageEndPoint}${imageList[index].image}',
//                       )
//                     : SvgPicture.asset(
//                         AppAsset.logo,
//                         color: appColor,
//                       ),
//               ),
//               BackdropFilter(
//                   filter: new ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
//                   child: Container(
//                       width: Get.width, color: blackColor.withOpacity(0.4)))
//             ],
//           ),
//           Positioned(
//             top: 50,
//             left: 20,
//             right: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   imageList != null &&
//                           imageList.length != 0 &&
//                           imageList[index].message != null
//                       ? '${imageList[index].message}'
//                       : "",
//                   style: AppTextStyle.normalSemiBold26
//                       .copyWith(color: primaryWhite),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// static Widget imageSliderRestaurantDetails(
//   imageList,
// ) {
//   return CarouselSlider(
//     options: CarouselOptions(
//       height: Get.height / 4,
//       autoPlay: true,
//       viewportFraction: 1,
//       disableCenter: true,
//       initialPage: 1,
//       pageSnapping: false,
//       pauseAutoPlayOnTouch: true,
//       scrollPhysics: NeverScrollableScrollPhysics(),
//       enlargeCenterPage: true,
//     ),
//     items: List.generate(
//       imageList.length != 0 ? imageList.length : 1,
//       (index) => Container(
//         width: Get.width,
//         child: imageList.length != 0 && imageList[index] != null
//             ? NetworkImageWidget(
//                 imageUrl: '${AppConstants.imageEndPoint}${imageList[index]}',
//               )
//             : Center(
//                 child: Image.asset(AppAsset.noImage),
//               ),
//       ),
//     ),
//   );
// }

// static Widget showMultipleImage({
//   Function()? onTap,
//   List? imageList,
//   Color? removeIconColor,
//   Color? removeIconBgColor,
//   bool? isAddStore = false,
//   bool? isEditStore = false,
// }) {
//   return Obx(
//     () => imageList!.length == 0
//         ? Container(
//             height: 135,
//             width: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: circular5BorderRadius,
//               border: Border.all(
//                   color:
//                       isAddStore != true ? borderGrey : Colors.transparent),
//             ),
//             child: InkWell(
//               borderRadius: circular5BorderRadius,
//               radius: 30,
//               onTap: onTap,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SvgPicture.asset(AppAsset.icCamera),
//                   height15,
//                   Text(
//                     'Add review image!',
//                     style: AppTextStyle.normalRegular15
//                         .copyWith(color: contentGrey),
//                   )
//                 ],
//               ),
//             ),
//           )
//         : GridView.builder(
//             padding: EdgeInsets.only(bottom: 15),
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: imageList.length + 1,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 4,
//               mainAxisSpacing: 1.0,
//               crossAxisSpacing: 1.0,
//             ),
//             itemBuilder: (context, index) {
//               return index >= 10
//                   ? Container()
//                   : index == imageList.length
//                       ? Container(
//                           width: 60,
//                           height: 60,
//                           margin: EdgeInsets.all(8),
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: offWhite,
//                             border: Border.all(color: hintGrey, width: 2),
//                             borderRadius: circular8BorderRadius,
//                           ),
//                           child: IconButton(
//                               onPressed: onTap,
//                               icon: Icon(
//                                 Icons.add_a_photo_outlined,
//                                 color: hintGrey,
//                               )),
//                         )
//                       : Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             ClipRRect(
//                                 borderRadius: circular8BorderRadius,
//                                 child: isEditStore == true
//                                     ? Image.network(
//                                         "${AppConstants.imageEndPoint}${imageList[index]}",
//                                         width: 60,
//                                         height: 60,
//                                         fit: BoxFit.cover,
//                                       )
//                                     : Image.file(
//                                         File(imageList[index].path),
//                                         width: 60,
//                                         height: 60,
//                                         fit: BoxFit.cover,
//                                       )),
//                             Align(
//                               alignment: Alignment.topRight,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   imageList.removeAt(index);
//                                 },
//                                 child: Padding(
//                                   padding: EdgeInsets.all(4),
//                                   child: CircleAvatar(
//                                     child: Icon(
//                                       Icons.close,
//                                       color: removeIconColor ?? primaryBlack,
//                                       size: 14,
//                                     ),
//                                     radius: 10,
//                                     backgroundColor:
//                                         removeIconBgColor ?? primaryWhite,
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         );
//             },
//           ),
//   );
// }
}
