//! THIS FILE HOLDS ALL APP URLS / END POINT
//! UPDATE  WITH CAUTION
//!

abstract class AppUrls {
  //! BASE URL
  static const String _baseUrl = "";

  //! AUTHENTICATION
  //! USER SIGN UP
  static const String signUp = "$_baseUrl/account/auth/user/signup";

  //! LOGIN
  static const String loginWithEmailOrMatric = "$_baseUrl/account/login/";

  //! CHANGE PASSWORD
  static const String changePassword = "$_baseUrl/account/change-password/";

  //! FORGOT PASSWORD
  static const String forgotPassword =
      "$_baseUrl/account/auth/user/forgot-password";

  //! RESET PASSWORD
  static const String resetPassword =
      "$_baseUrl/account/auth/user/reset-password";

  //!
  //!
  //! PROFILE
  //! FETCH USER DETAIL
  static const fetchUserDetail = "$_baseUrl/account/profile/";

  //! EDIT USER DETAIL
  static const editUserDetail = "$_baseUrl/account/edit-details/";

  //!
  //!
  //! POSTS
  //! CREATE POST
  static const createPost = "$_baseUrl/post/create/";

  //! GET POST DETAILS
  static String getPostDetails({required String postID}) =>
      "$_baseUrl/post/$postID/";

  //! ADD CONTENT TO POST
  static const addContentToPost = "$_baseUrl/post/add-content/";

  //! FETCH POSTS
  static const fetchPosts = "$_baseUrl/post/";
}
