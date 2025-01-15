import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          // GLOBAL Texts
          'system': 'System',
          'english': 'English',
          'arabic': 'العربية',
          'light': 'Light',
          'dark': 'Dark',
          'and': 'and',
          'skip': 'Skip',
          'done': 'Done',
          'submit': 'Submit',
          'appName': 'GenieGo',
          'tContinue': 'Continue',
          'loading': 'Loading ..',
          'changeLang': 'Change Language',
          'searchCountry': 'Search by country name or dial code',

          // Screens
          'home': 'Home',
          'stores': 'Stores',
          'wishlist': 'Wishlist',
          'settings': 'Settings',
          'profile': 'Profile',

          // OnBoarding Texts
          'onBoardingTitle1': 'Choose your product',
          'onBoardingTitle2': 'Select Payment Method',
          'onBoardingTitle3': 'Deliver at your door step',
          'onBoardingSubTitle1':
              'Welcome to a World of Limitless Choices - Your Perfect Product Awaits!',
          'onBoardingSubTitle2':
              'For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!',
          'onBoardingSubTitle3':
              'From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!',

          // Authentication Forms
          'firstName': 'First Name',
          'lastName': 'Last Name',
          'email': 'Email',
          'password': 'Password',
          'passwordConfirmation': 'Password Confirmation',
          'newPassword': 'New Password',
          'username': 'Username',
          'phoneNo': 'Phone Number',
          'rememberMe': 'Remember Me',
          'forgotPassword': 'Forgot Password?',
          'signIn': 'Sign In',
          'logout': 'Logout',
          'createAccount': 'Create Account',
          'deleteAccount': 'Delete Account',
          'orSignInWith': 'or sign in with',
          'orSignUpWith': 'or sign up with',
          'iAgreeTo': 'I agree to',
          'privacyPolicy': 'Privacy Policy',
          'termsOfUse': 'Terms of use',
          'verificationCode': 'verificationCode',
          'resendEmail': 'Resend Email',
          'resendEmailIn': 'Resend email in',

          // Loaders & Popups
          'noInternetTitle': 'Uh-oh! You\'re Offline.',
          'noInternetSubTitle':
              'It seems like there\'s no internet. Reconnect to continue.',
          'retryConnect': 'Retry to connect',
          'noInternetSnackBarTitle': 'Can\'t connect to network',
          'noInternetSnackBarMessage':
              'Please check your network connection again',

          'notFoundTitle': 'Page Not Found.',
          'notFoundSubTitle':
              'It seems like there\'s no page like this. Return to home.',
          'returnHome': 'Return to home',

          // Authentication Headings
          'loginTitle': 'Welcome back',
          'loginSubTitle':
              'Discover Limitless Choices and Unmatched Convenience.',
          'signupTitle': 'Let’s create your account',
          'forgotPasswordTitle': 'Forgot password',
          'forgotPasswordSubTitle':
              'Don’t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
          'changeYourPasswordTitle': 'Password Reset Email Sent',
          'changeYourPasswordSubTitle':
              "Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.",
          'confirmEmail': 'Verify your email address!',
          'confirmEmailSubTitle':
              'Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.',
          'emailNotReceivedMessage':
              'Didn’t get the email? Check your junk/spam or resend it.',
          'yourAccountCreatedTitle': 'Your account successfully created!',
          'yourAccountCreatedSubTitle':
              'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!',

          // Home
          'homeAppbarTitle': 'Good day for shopping',
          'searchStores': 'Search for Stores ..',
          'searchProducts': 'Search for Products ..',
          'popularStores': 'Popular Stores',
          'popularProducts': 'Popular Products',

          // Settings
          'accountSettings': 'Account Settings',
          'addresses': 'Addresses',
          'addressesSub': 'Set shopping delivery  address',
          'cart': 'Cart',
          'cartSub': 'Add, Remove products and move to checkout',
          'orders': 'Orders',
          'ordersSub': 'In-progress and Completed Orders',

          'appSettings': 'App Settings',
          'language': 'Language',
          'languageSub': 'Choose your language between: English and Arabic',
          'theme': 'Theme',
          'themeSub': 'Change to the app look you like',
          'geolocation': 'Geolocation',
          'geolocationSub': 'Set recommendation based on location',
          'notifications': 'Notifications',
          'notificationsSub': 'Enable or Disable app notifications',
          'fullscreen': 'Fullscreen',
          'fullscreenSub': 'Set App To Fullscreen or Not',

          // ilsndld
          'dashboard': 'Dashboard',
          'myProducts': 'My Products',
          'viewDetails': 'View Details',
          'myStore': 'My Store',
          'viewAll': 'View All',
          'deleteStore': 'Delete Store',
          'editStore': 'Edit Store',
          'description': 'Description',
          'readMore': 'read more',
          'readLess': '  read less',
          'storeInformation': 'Store Information',
          'storePicture': 'Change Store Picture',
          'englishName': 'English Name',
          'arabicName': 'Arabic Name',
          'englishDescription': 'English Description',
          'arabicDescription': 'Arabic Description',
          'saveStoreInfo': 'Save Store Info',
          'status': 'Status:',
          'stock': 'In Stock',
          'tags': 'Tags',
          'editProduct': 'Edit Product',
          'deleteProduct': 'Delete Product',
          'productInformation': 'Product Information',
          'productPicture': 'Product Picture',
          'saveProductInfo': 'Save Product Info',
          'quantity': 'Quantity',
          'price': 'Price',
          'addStore': 'Add Store',
          'addProduct': 'Add Product',
        },
        'ar': {
          // GLOBAL Texts
          'system': 'تلقائي',
          'english': 'English',
          'arabic': 'العربية',
          'light': 'الفاتح',
          'dark': 'الداكن',
          'and': 'و',
          'skip': 'تخطي',
          'done': 'تم',
          'submit': 'إرسال',
          'appName': 'جيني غو',
          'tContinue': 'متابعة',
          'loading': 'جاري التحميل ..',
          'changeLang': ' تغيير اللغة',
          'searchCountry': 'البحث حسب اسم الدولة أو رمز الاتصال',

          // Screens
          'home': 'الرئيسية',
          'stores': 'المتاجر',
          'wishlist': 'المفضلة',
          'settings': 'الإعدادات',
          'profile': 'الملف الشخصي',

          // OnBoarding Texts
          'onBoardingTitle1': 'اختر منتجك',
          'onBoardingTitle2': 'اختر طريقة الدفع',
          'onBoardingTitle3': 'توصيل إلى باب منزلك',
          'onBoardingSubTitle1':
              'مرحبًا بك في عالم الخيارات اللامحدودة - منتجك المثالي في انتظارك!',
          'onBoardingSubTitle2':
              'لإتمام المعاملات بسلاسة، اختر طريقة الدفع التي تناسبك - راحتك هي أولويتنا!',
          'onBoardingSubTitle3':
              'من بابنا إلى بابك - توصيل سريع وآمن وخالٍ من التلامس!',

          // Authentication Forms
          'firstName': 'الاسم الأول',
          'lastName': 'اسم العائلة',
          'email': 'البريد الإلكتروني',
          'password': 'كلمة المرور',
          'passwordConfirmation': 'أعد كتابة كلمة المرور',
          'newPassword': 'كلمة المرور الجديدة',
          'username': 'اسم المستخدم',
          'phoneNo': 'رقم الهاتف',
          'rememberMe': 'تذكرني',
          'forgotPassword': 'هل نسيت كلمة المرور؟',
          'signIn': 'تسجيل الدخول',
          'logout': 'تسجيل الخروج',
          'createAccount': 'إنشاء حساب',
          'deleteAccount': 'حذف الحساب',
          'orSignInWith': 'أو تسجيل الدخول باستخدام',
          'orSignUpWith': 'أو التسجيل باستخدام',
          'iAgreeTo': 'أوافق على',
          'privacyPolicy': 'سياسة الخصوصية',
          'termsOfUse': 'شروط الاستخدام',
          'verificationCode': 'رمز التحقق',
          'resendEmail': 'إعادة إرسال البريد الإلكتروني',
          'resendEmailIn': 'إعادة إرسال البريد الإلكتروني بعد',

          // Loaders & Popups
          'noInternetTitle': 'أنت غير متصل',
          'noInternetSubTitle':
              'يبدو أن اتصالك بالإنترنت قد انقطع، أعد الاتصال بالإنترنت لاستخدام التطبيق',
          'retryConnect': 'إعادة المحاولة',
          'noInternetSnackBarTitle': 'لا يمكن الوصول إلى الشبكة',
          'noInternetSnackBarMessage': 'يرجى التأكد مجددا من اتصالك بالإنترنت',

          'notFoundTitle': 'الصفحة غير موجودة.',
          'notFoundSubTitle':
              'يبدو أنه لايوجد صفحة بهذا الاسم، يمكنك العودة إلى الصفحة الرئيسية.',
          'returnHome': 'العودة إلى الصفحة الرئيسية',

          // Authentication Headings
          'loginTitle': 'مرحبًا بك مجددًا',
          'loginSubTitle': 'اكتشف خيارات لا حدود لها وراحة لا مثيل لها.',
          'signupTitle': 'لننشئ حسابك',
          'forgotPasswordTitle': 'نسيت كلمة المرور',
          'forgotPasswordSubTitle':
              'لا تقلق، في بعض الأحيان ينسى الناس. أدخل بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور.',
          'changeYourPasswordTitle': 'تم إرسال رابط إعادة تعيين كلمة المرور',
          'changeYourPasswordSubTitle':
              'أمان حسابك هو أولويتنا! لقد أرسلنا لك رابطًا آمنًا لتغيير كلمة المرور الخاصة بك والحفاظ على حماية حسابك.',
          'confirmEmail': 'تحقق من عنوان بريدك الإلكتروني!',
          'confirmEmailSubTitle':
              'تهانينا! حسابك بانتظارك: تحقق من بريدك الإلكتروني لبدء التسوق واستمتع بعروض فريدة وتجربة مخصصة.',
          'emailNotReceivedMessage':
              'لم تتلقَ البريد الإلكتروني؟ تحقق من مجلد البريد العشوائي أو أعد إرساله.',
          'yourAccountCreatedTitle': 'تم إنشاء حسابك بنجاح!',
          'yourAccountCreatedSubTitle':
              'مرحبًا بك في وجهة التسوق المثالية: تم إنشاء حسابك، استمتع بالتسوق عبر الإنترنت بكل سهولة!',

          // Home
          'homeAppbarTitle': 'يوم رائع للتسوق',
          'searchStores': 'ابحث عن متجر ..',
          'searchProducts': 'ابحث عن منتج ..',
          'popularStores': 'المتاجر الشائعة',
          'popularProducts': 'المنتجات الشائعة',

          // Settings
          'accountSettings': 'إعدادات الحساب',
          'addresses': 'أماكن التوصيل',
          'addressesSub': 'تعيين عناوين التوصيل',
          'cart': 'سلة التسوق',
          'cartSub': 'إضافة منتجات أو إزالة وإكمال التسوق',
          'orders': 'طلباتي',
          'ordersSub': 'عرض طلباتك وتتبعها',

          'appSettings': 'إعدادات التطبيق',
          'language': 'اللغة',
          'languageSub': 'يمكنك اختيار لغة التطبيق بين العربية والإنجليزية',
          'theme': 'السمة',
          'themeSub': 'غير سمة التطبيق للوضع الذي تراه مناسبا',
          'geolocation': 'الموقع',
          'geolocationSub': 'عرض الاقتراحات بناء على الموقع',
          'notifications': 'الإشعارات',
          'notificationsSub': 'تفعيل الإشعارات أو إلغاء تفعيلها',
          'fullscreen': 'ملئ الشاشة',
          'fullscreenSub': 'تفعيل ملئ الشاشة أو إلغاء تفعيلها',

          // ilsndld
          'dashboard': 'لوحة التحكم',
          'myProducts': 'منتجاتي',
          'viewDetails': 'عرض التفاصيل',
          'myStore': 'متجري',
          'viewAll': 'عرض الكل',
          'deleteStore': 'حذف المتجر',
          'editStore': 'تعديل المتجر',
          'description': 'الوصف',
          'readMore': 'قراءة المزيد',
          'readLess': '  قراءة أقل',
          'storeInformation': 'معلومات المتجر',
          'storePicture': 'تغيير صورة المتجر',
          'englishName': 'الاسم بالانجليزية',
          'arabicName': 'الاسم بالعربية',
          'englishDescription': 'الوصف بالانجليزية',
          'arabicDescription': 'الوصف بالعربية',
          'saveStoreInfo': 'حفظ معلومات المتجر',
          'status': 'الحالة:',
          'stock': 'في المخزن',
          'tags': 'الأوسمة',
          'editProduct': 'تعديل المنتج',
          'deleteProduct': 'حذف المنتج',
          'productInformation': 'معلومات المنتج',
          'productPicture': 'تغيير صورة المنتج',
          'saveProductInfo': 'حفظ معلومات المنتج',
          'quantity': 'الكمية',
          'price': 'السعر',
          'addStore': 'اضافة متجر',
          'addProduct': 'اضافة منتج',
        },
      };
}
