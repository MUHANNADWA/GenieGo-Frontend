import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          // GLOBAL Texts
          'and': 'and',
          'skip': 'Skip',
          'done': 'Done',
          'submit': 'Submit',
          'appName': 'App-Store',
          'tContinue': 'Continue',
          'changeLang': 'Change Language',
          'searchCountry': 'Search by country name or dial code',

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
          'newPassword': 'New Password',
          'username': 'Username',
          'phoneNo': 'Phone Number',
          'rememberMe': 'Remember Me',
          'forgotPassword': 'Forgot Password?',
          'signIn': 'Sign In',
          'createAccount': 'Create Account',
          'orSignInWith': 'or sign in with',
          'orSignUpWith': 'or sign up with',
          'iAgreeTo': 'I agree to',
          'privacyPolicy': 'Privacy Policy',
          'termsOfUse': 'Terms of use',
          'verificationCode': 'verificationCode',
          'resendEmail': 'Resend Email',
          'resendEmailIn': 'Resend email in',

          // Authentication Headings
          'loginTitle': 'Welcome back,',
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

          // Product
          'popularProducts': 'Popular Products',

          // Home
          'homeAppbarTitle': 'Good day for shopping',
          'homeAppbarSubTitle': 'User Name',
          'searchStore': 'Search what you want ..'
        },
        'ar': {
          // GLOBAL Texts
          'and': 'و',
          'skip': 'تخطي',
          'done': 'تم',
          'submit': 'إرسال',
          'appName': 'متجر التطبيقات',
          'tContinue': 'متابعة',
          'changeLang': ' تغيير اللغة',
          'searchCountry': 'البحث حسب اسم الدولة أو رمز الاتصال',

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
          'newPassword': 'كلمة المرور الجديدة',
          'username': 'اسم المستخدم',
          'phoneNo': 'رقم الهاتف',
          'rememberMe': 'تذكرني',
          'forgotPassword': 'هل نسيت كلمة المرور؟',
          'signIn': 'تسجيل الدخول',
          'createAccount': 'إنشاء حساب',
          'orSignInWith': 'أو تسجيل الدخول باستخدام',
          'orSignUpWith': 'أو التسجيل باستخدام',
          'iAgreeTo': 'أوافق على',
          'privacyPolicy': 'سياسة الخصوصية',
          'termsOfUse': 'شروط الاستخدام',
          'verificationCode': 'رمز التحقق',
          'resendEmail': 'إعادة إرسال البريد الإلكتروني',
          'resendEmailIn': 'إعادة إرسال البريد الإلكتروني بعد',

          // Authentication Headings
          'loginTitle': 'مرحبًا بك مجددًا،',
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

          // Product
          'popularProducts': 'المنتجات الشائعة',

          // Home
          'homeAppbarTitle': 'يوم رائع للتسوق',
          'homeAppbarSubTitle': 'اسم المستخدم',
          'searchStore': '.. ابحث عن ما تريد'
        },
      };
}
