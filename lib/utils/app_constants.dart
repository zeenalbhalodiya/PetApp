class AppConstants {
  // Network Constants

  ///Server Connection URL
  // static String apiEndPoint = "https://api.zois.app/"; // live//
  static String apiEndPoint = "http://192.168.29.234:8002/"; //jayraj maheta
  // static String apiEndPoint = "http://192.168.29.23:8587/"; //kaushal nena
  // static String apiEndPoint = "http://192.168.29.99:80/"; / foji
  // static String apiEndPoint = "http://192.168.2.10/"; // jayraj wfh
  // static String apiEndPoint = "http://192.168.29.22:3001/"; // ruchit lukhi

  ///Storage Bucket for Images and documents
  // static String imageEndPoint = "https://zois-api.s3.us-west-2.amazonaws.com/";

  static String imageEndPoint =
      "https://zois-files.s3.ap-southeast-2.amazonaws.com/";

  //Storage Bucket for Videos and video only
  static String videoEndPoint =
      "https://zois-files.s3-accelerate.amazonaws.com/";

  ///apis

  // Authentication
  static const String login = 'user/login';
  static const String signup = 'user';
  static const String otpVerify = 'user/otp_verification';
  static const String forgotPassword = 'user/forgot_password';
  static const String resetPassword = 'user/reset_password';
  static const String changePassword = 'user/change_password';
  static const String logout = 'user/logout';
  static const String facebookLogin = 'user/facebook_login';
  static const String googleLogin = 'user/google_login';

  //video
  static const String getUserVideo = 'user/video/get';
  static const String getVideoById = 'user/video/';
  static const String addLike = 'user/video/like/';
  static const String addDislike = 'user/video/dislike/';
  static const String getVideoComments = 'user/comment/video/';
  static const String addUserComment = 'user/comment';
  static const String deleteComment = 'user/comment/';
  static const String addUserCommentReply = 'user/comment/replay';
  static const String addCommentLike = 'user/comment/like/';
  static const String countIncrease = 'user/video/view/';

  //upload on the server bucket
  static const String uploadVideoImage = 'upload/image/video';
  static const String uploadCompressedVideo = 'upload/compress_video/feed';

  //upload on the database
  static const String addVideo = 'user/video';
  static const String deleteVideo = 'user/video/';

  //feed
  static const String addFeed = 'user/feed';
  static const String updateFeed = 'user/feed';
  static const String deleteFeed = 'user/feed/';
  static const String getFeedById = 'user/feed/';
  static const String getUserFeed = 'user/feed/get';
  static const String getUserFeedProfile = 'user/feed/get1';

  static const String getUserFeedProfileWithLikeComment = 'user/feed/get_user';
  static const String getUserFeedById = 'user/feed/';
  static const String addFeedLike = 'user/feed/like/';
  static const String getFeedComments = 'user/comment/feed/';

  //follow
  static const String sendFollowRequest = 'user/follower/request/';
  static const String acceptFollowRequest = 'user/follower/accept_request/';
  static const String deleteFollower = 'user/follower/';
  static const String rejectFollower = 'user/follower/reject_request/';
  static const String getFollowers = 'user/follower/get/';
  static const String getFollowing = 'user/following/get/';
  static const String getFollowRequests = 'user/follower/request/get';
  static const String unfollow = 'user/follower/unfollow_user/';
  static const String unsentRequest = 'user/follower/cancelrequest/';

  //category
  static const String getCategory = 'user/category';
  static const String getObsFeedCategory = 'user/feedcategory';
  static const String getObsFeedPostCategory = 'user/feedcategory/get';

  //messaging
  static const String getRooms = 'user/room';
  static const String getRoomMessages = 'user/message';
  static const String messagesDelete = 'user/messagedelete/';
  static const String allMessagesDelete = 'user/allmessagedelete/';

  //notification_screen
  static const String getNotificationCount = 'user/notification/count';
  static const String readNotification = 'user/notification?read=true';
  static const String getNotifications = 'user/notification/get';
  static const String getFollowingCount = 'user/follower/pending/count';
  static const String updateNotificationSetting = 'user/settingnotification';
  static const String deleteAllNotification = 'user/notification/delete';
  static const String deleteNotificationById = 'user/notification/delete';
  static const String unreadCount = 'user/message/unreadcount';
  static const String addFeedBack = 'user/feedback';

  //Profile
  static const String getUserProfile = 'user';
  static const String updateProfile = 'user';
  static const String updateAccountType = 'user/settingaccounttype/';
  static const String getUserProfileById = 'user/profile/';
  static const String getUserProfileByUsername = 'user/profilebyusername/';
  static const String getUserVideoById = 'user/video/get_by_user';
  static const String getUserVideoByProfile = 'user/video/get_by_user1';
  static const String getVideoPost = 'user/video/get_video_post';
  static const String deleteAccount = 'user/delete_account';

  //Get video by tag
  static const String getVideoByTag = 'user/video/get_by_tag';

  //report
  static const String report = 'user/report';
  static const String reportById = 'user/report/';

  //user
  static const String getUser = 'user/get';

  //block
  static const String blockUser = 'user/block/request/';
  static const String getBlockedUsers = 'user/block';

  //filter
  static const String getFilter = 'user/filter/get';
  static const String addFilter = 'user/filter';
  static const String deleteFilter = 'user/filter/';

  //Gig Economy
  static const String getGigsBiddedOn = 'user/getgigbyuserbid';
  static const String addGig = 'user/gig';
  static const String addJob = 'user/job';
  static const String getGig = 'user/gig/get';
  static const String updateGig = 'user/gig';
  static const String getGigById = 'user/gig/';
  static const String getGigBidOrNot = 'user/gig_bidornot/';
  static const String deleteGig = 'user/gig/';

  static const String deleteBiddenGig = 'user/bidgig/';
  static const String addBidGig = 'user/bidgig';
  static const String addBidGigLong = 'user/bidgiglong';
  static const String getBidGigById = 'user/bidgigbybidid';
  static const String getGigQuestionListById = 'user/getbidmessagebygig?gigId=';
  static const String addMessage = 'user/bidmessage';
  static const String requestSite = 'user/callsiterequest';
  static const String paymentCheckout = 'user/generatecheckout/';
  static const String uploadEvidence = 'user/bidgigupdate';
  static const String sendPaymentRequest = 'user/sendpaymentrequest';
  static const String contractorRaiseIssue = 'user/contractorraiseissue';
  static const String addTicket = 'user/ticketzero';
  static const String addTicketMessage = 'user/ticketmessage';
  static const String getTicketMessage = 'user/getticketmessage?ticketId=';
  static const String getTicketStatus = 'user/getticket/';
  static const String updateTicketStatus = 'user/updateticketstatus/';
  static const String addReview = 'user/review';
  static const String getReview = 'user/review/get';
  static const String makePayment = 'user/gig/payment/';
  static const String getUserCompletedJob = 'user/gig_completed/';
  static const String userBookInterview = 'user/gig/bookinterview';
  static const String getPassiveIncome = 'user/passiveIncome/get';
  static const String getTopBusinessGamification = 'user/topgamification';
  static const String addScope = 'user/scope';
  static const String getScope = 'user/scope/';
  static const String scopeAcceptDecline = 'user/scopedecline';
  // static const String getPassiveGamification = 'user/gamification/get';
  // static const String getPassiveGamification = 'user/gamification/get';
  static const String getPassiveGamification = 'user/gamification/get/';
  static const String getGigCategory = 'user/gigcategory/get';

  //Bank Details
  static const String addBank = 'user/bank/add';
  static const String updateBank = 'user/bank/update';
  static const String getBank = 'user/bank/get';
  static const String deleteBank = 'user/bank/delete/';

  // Portfolio
  static const String addPortfolio = 'user/portfolio/add';
  static const String getPortfolio = 'user/portfolio/get/';
  static const String deletePortfolio = 'user/portfolio/delete/';

  //Topic
  static const String getTopic = 'user/community/topics';
  static const String getTrendingTopic = 'user/community/trendingtopics/';

  // Community
  static const String getCommunity = 'user/community/get1';
  static const String getCommunityOfCurrentUser = 'user/community';
  static const String addCommunity = 'user/community/add';
  static const String deleteCommunity = 'community/delete/';
  static const String updateCommunity = 'user/community/update/';
  static const String addMember = 'user/community/addmember/';
  static const String removeMember = 'user/community/removemember/';
  static const String getCommunityById = 'user/community/get/';
  static const String getCommunityByUserId = 'user/communitygetbyuserid/';
  static const String communityFeedNotification =
      'user/community/getfeedinobsfeed/';
  static const String communityFeedInviteNotification =
      'user/community/notificationtoinvite';
  static const String getUserRank = 'user/rank/';
  static const String getTopRankUsers = 'user/topuserrank';

  // Story
  static const String postStory = 'user/story';
  static const String getStory = 'user/story/get';
  static const String storySeen = 'user/storyseenby/';
  static const String deleteStory = 'user/story/';
  static const String getStoryById = 'user/storybyuser/';

//strip
  // ignore: constant_identifier_names
  static const String connect_account = 'user/stripe/connect_account';
  // ignore: constant_identifier_names
  static const String stripe_login = 'user/stripe/connect_login';
  static const String getWallet = 'user/walletget';
  static const String paypalEmail = 'user/verifedemail';

  static const String payout = 'user/paypal/paypal_payout_request';
}
