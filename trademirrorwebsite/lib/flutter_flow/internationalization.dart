import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginScreen
  {
    'opv8acjr': {
      'en': 'Trademirror',
      'hi': '',
    },
    'ira4oq1u': {
      'en': 'Sign up with',
      'hi': '',
    },
    '6c992dul': {
      'en': 'or via',
      'hi': '',
    },
    'zae8t6b7': {
      'en': 'Email',
      'hi': '',
    },
    'f8ot20ny': {
      'en': 'Password',
      'hi': '',
    },
    '1a9xbwq4': {
      'en': 'I confirm that I am not a U.S. citizen, resident, or affiliate.',
      'hi': '',
    },
    'mn4a8nha': {
      'en': 'See why this is important ',
      'hi': '',
    },
    'a6osu1i6': {
      'en':
          'I confirm that I am not a U.S. citizen, resident, or affiliate. See why this is important ',
      'hi': '',
    },
    'jz74a1w5': {
      'en': 'Sign up',
      'hi': '',
    },
    'tubt9sfl': {
      'en': 'Sign up',
      'hi': '',
    },
    '49qznaeb': {
      'en': 'By pressing ',
      'hi': '',
    },
    'scxs5fap': {
      'en': 'Sign Up',
      'hi': '',
    },
    'wvx7qvgk': {
      'en':
          ', you entitle us to contact you for marketing purposes. For details, view our ',
      'hi': '',
    },
    'djosqxr0': {
      'en': 'Marketing and Communication Policy Statement.',
      'hi': '',
    },
    'bj1svl6b': {
      'en':
          'I confirm that I am not a U.S. citizen, resident, or affiliate. See why this is important ',
      'hi': '',
    },
    'c2c2ku2u': {
      'en': 'Trademirror',
      'hi': '',
    },
    '1zs5i86v': {
      'en': 'Sign up with',
      'hi': '',
    },
    'jn6ss40g': {
      'en': 'or via',
      'hi': '',
    },
    '4ysfbefw': {
      'en': 'Email',
      'hi': '',
    },
    'p8uprw03': {
      'en': 'Password',
      'hi': '',
    },
    '6feq7unw': {
      'en': 'I confirm that I am not a U.S. citizen, resident, or affiliate.',
      'hi': '',
    },
    'jlfbga4m': {
      'en': 'See why this is important ',
      'hi': '',
    },
    'ohuc8uv0': {
      'en':
          'I confirm that I am not a U.S. citizen, resident, or affiliate. See why this is important ',
      'hi': '',
    },
    'g6q2cv5e': {
      'en': 'Sign up',
      'hi': '',
    },
    'm6wjlblc': {
      'en': 'Login',
      'hi': '',
    },
    '0s62hzkw': {
      'en': 'By pressing ',
      'hi': '',
    },
    '0026cnq4': {
      'en': 'Sign Up',
      'hi': '',
    },
    'q41t8hqc': {
      'en':
          ', you entitle us to contact you for marketing purposes. For details, view our ',
      'hi': '',
    },
    'ttvu0la9': {
      'en': 'Marketing and Communication Policy Statement.',
      'hi': '',
    },
    'j9befkxg': {
      'en':
          'I confirm that I am not a U.S. citizen, resident, or affiliate. See why this is important ',
      'hi': '',
    },
    'fs0oaj0a': {
      'en': 'Home',
      'hi': '',
    },
  },
  // KYCVerification
  {
    'rpgfppp1': {
      'en': 'Trademirror',
      'hi': '',
    },
    '4tbq3box': {
      'en': 'KYC Verification',
      'hi': '',
    },
    'mcc3sa22': {
      'en':
          'To ensure the security of your account and comply with regulatory requirements,we need to verify your identity. ',
      'hi': '',
    },
    'd2jd0z0s': {
      'en': 'You will be done in 5mins!',
      'hi': '',
    },
    'euynguxb': {
      'en':
          'I confirm that I am not a U.S. citizen, resident, or affiliate. See why this is important ',
      'hi': '',
    },
    '9qki1n4w': {
      'en': 'Start Verification',
      'hi': '',
    },
    'wsrlmich': {
      'en': 'Skip for later ',
      'hi': '',
    },
    'wrjpyzhu': {
      'en': 'Trademirror',
      'hi': '',
    },
    '4rg0g9op': {
      'en': 'KYC Verification',
      'hi': '',
    },
    'xwsgzi65': {
      'en':
          'To ensure the security of your account and comply with regulatory requirements,we need to verify your identity. ',
      'hi': '',
    },
    '4dx9dixu': {
      'en': 'You will be done in 5mins!',
      'hi': '',
    },
    '1idohuwy': {
      'en':
          'I confirm that I am not a U.S. citizen, resident, or affiliate. See why this is important ',
      'hi': '',
    },
    'n4zo6r9h': {
      'en': 'Start Verification',
      'hi': '',
    },
    'ehf0yj0t': {
      'en': 'Skip for later ',
      'hi': '',
    },
    '89kpsgww': {
      'en': 'Home',
      'hi': '',
    },
  },
  // KYCVerification1
  {
    'r1lcyqkg': {
      'en': 'Trademirror',
      'hi': '',
    },
    '09hg9r9k': {
      'en': 'KYC Verification',
      'hi': '',
    },
    'xuztrldg': {
      'en': 'Step 1 of 2',
      'hi': '',
    },
    '73ydoapz': {
      'en': 'Personal information',
      'hi': '',
    },
    'ssxfgmwe': {
      'en': 'Please provide your accurate information',
      'hi': '',
    },
    'dkqiv4k3': {
      'en': 'Full Name',
      'hi': '',
    },
    'xseldvyg': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'l53hq6xy': {
      'en': 'Date of birth',
      'hi': '',
    },
    'dkn79j7h': {
      'en': '00/00/0000',
      'hi': '',
    },
    '3kadqibf': {
      'en': 'Email address',
      'hi': '',
    },
    'skkw5oda': {
      'en': 'harshsharma@gmail.com',
      'hi': '',
    },
    'szy7i3ad': {
      'en': 'Phone number',
      'hi': '',
    },
    'l5doayty': {
      'en': '1234567891',
      'hi': '',
    },
    '1tp7x5o9': {
      'en': 'Continue',
      'hi': '',
    },
    '4zdx2vhx': {
      'en': 'Trademirror',
      'hi': '',
    },
    'gtpxoylm': {
      'en': 'KYC Verification',
      'hi': '',
    },
    'e4pb3too': {
      'en': 'Step 1 of 2',
      'hi': '',
    },
    '7k2uxoag': {
      'en': 'Personal information',
      'hi': '',
    },
    'xxv2pfxb': {
      'en': 'Please provide your accurate information',
      'hi': '',
    },
    'sffow855': {
      'en': 'Full Name',
      'hi': '',
    },
    '99r0gbrd': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'xeekm5s1': {
      'en': 'Date of birth',
      'hi': '',
    },
    '9oavgw92': {
      'en': '00/00/0000',
      'hi': '',
    },
    'iiarbgvo': {
      'en': 'Email address',
      'hi': '',
    },
    '5ac110jk': {
      'en': 'harshsharma@gmail.com',
      'hi': '',
    },
    'd5m10ywx': {
      'en': 'Phone number',
      'hi': '',
    },
    'zthpshp3': {
      'en': '1234567891',
      'hi': '',
    },
    'd8mt9tcl': {
      'en': 'Continue',
      'hi': '',
    },
    'kdtl1hor': {
      'en': 'Home',
      'hi': '',
    },
  },
  // KYCVerification2
  {
    'ulx593nq': {
      'en': 'Trademirror',
      'hi': '',
    },
    'oklnmn4k': {
      'en': 'KYC Verification',
      'hi': '',
    },
    '2c5rywx3': {
      'en': 'Step 2 of 2',
      'hi': '',
    },
    'exvxiosk': {
      'en': 'ID Verification',
      'hi': '',
    },
    '7t8183ps': {
      'en': 'Aadhar Card Number',
      'hi': '',
    },
    'b32mnw7h': {
      'en': '0000 0000 0000',
      'hi': '',
    },
    'umf1837g': {
      'en': 'Upload document',
      'hi': '',
    },
    '1fv8sdug': {
      'en': 'Click here to upload document',
      'hi': '',
    },
    'j3gjla11': {
      'en': 'JPG,PNG,PDF and SVG files up to 5MB',
      'hi': '',
    },
    '0x31vd47': {
      'en': 'Continue',
      'hi': '',
    },
    'dzic3z9d': {
      'en': 'Cancel',
      'hi': '',
    },
    '8ia941u0': {
      'en': 'Trademirror',
      'hi': '',
    },
    'psdq0q3z': {
      'en': 'KYC Verification',
      'hi': '',
    },
    'b6nmxzvk': {
      'en': 'Step 2 of 2',
      'hi': '',
    },
    'fokqps7m': {
      'en': 'ID Verification',
      'hi': '',
    },
    'mi7qxaro': {
      'en': 'Aadhar Card Number',
      'hi': '',
    },
    'kgkkj5j0': {
      'en': '0000 0000 0000',
      'hi': '',
    },
    'qbp5r7z3': {
      'en': 'Upload document',
      'hi': '',
    },
    'tmureka5': {
      'en': 'Click here to upload document',
      'hi': '',
    },
    'loeldt4t': {
      'en': 'JPG,PNG,PDF and SVG files up to 5MB',
      'hi': '',
    },
    'h4n0i2t1': {
      'en': 'Continue',
      'hi': '',
    },
    'dtf0w9eo': {
      'en': 'Cancel',
      'hi': '',
    },
    'ptwsl5bv': {
      'en': 'Home',
      'hi': '',
    },
  },
  // KYCVerificationCompleted
  {
    'u3g0c728': {
      'en': 'Trademirror',
      'hi': '',
    },
    '638hwj5q': {
      'en': 'KYC Verification Completed',
      'hi': '',
    },
    '4wdwz6ma': {
      'en':
          'You will get an email once your documents have been approved. \nWe appreciate your patience.',
      'hi': '',
    },
    '27s1u4qf': {
      'en':
          'I confirm that I am not a U.S. citizen, resident, or affiliate. See why this is important ',
      'hi': '',
    },
    'tfvdatfr': {
      'en': 'Back to profile',
      'hi': '',
    },
    '6tsheubs': {
      'en': 'Trademirror',
      'hi': '',
    },
    '3ykgf206': {
      'en': 'KYC Verification Completed',
      'hi': '',
    },
    '8r0ctj09': {
      'en':
          'You will get an email once your documents have been approved. \nWe appreciate your patience.',
      'hi': '',
    },
    'lhxjfudi': {
      'en':
          'I confirm that I am not a U.S. citizen, resident, or affiliate. See why this is important ',
      'hi': '',
    },
    '1qtgjmon': {
      'en': 'Back to profile',
      'hi': '',
    },
    '4dam2bdn': {
      'en': 'Home',
      'hi': '',
    },
  },
  // LandingPage
  {
    'a65bxlox': {
      'en': 'Trademirror',
      'hi': '',
    },
    '1ce99ohd': {
      'en': 'Home',
      'hi': '',
    },
    'wgrlcg19': {
      'en': 'FAQ’s',
      'hi': '',
    },
    'jydj6fk1': {
      'en': 'About',
      'hi': '',
    },
    'cla6invl': {
      'en': 'contact',
      'hi': '',
    },
    'fzalxo0a': {
      'en': 'Login',
      'hi': '',
    },
    'byngje4b': {
      'en': 'Sign up',
      'hi': '',
    },
    'hugx9gfx': {
      'en': 'Trade Like a Pro:\n',
      'hi': '',
    },
    'xp06hnoh': {
      'en': 'Copy Trading\n',
      'hi': '',
    },
    'gy0w6aqk': {
      'en': 'Made Easy!',
      'hi': '',
    },
    '68gjzkfe': {
      'en':
          'Effortlessly mirror the success of expert traders with our user-friendly copy trading platform.',
      'hi': '',
    },
    'n0l0stol': {
      'en': 'Get started',
      'hi': '',
    },
    'ror3uhml': {
      'en': '05,00,000+ users',
      'hi': '',
    },
    '356bizmy': {
      'en': 'Signed up to the platform',
      'hi': '',
    },
    'xg8pa2w2': {
      'en': 'Multiple Master Accounts',
      'hi': '',
    },
    'o9x17ss0': {
      'en': 'Follow multiple strategies at no extra cost.',
      'hi': '',
    },
    'jx096b5e': {
      'en': 'Capital Protection Stop',
      'hi': '',
    },
    'ek6wa3an': {
      'en': 'Set equity limits to control losses',
      'hi': '',
    },
    '2qwhnotr': {
      'en': 'Trade Risk-Free:Try Our ',
      'hi': '',
    },
    'xfmtrr8x': {
      'en': 'Paper Trading ',
      'hi': '',
    },
    'paciq4r2': {
      'en': 'Platform',
      'hi': '',
    },
    '9q0fk8tr': {
      'en':
          'Discover the power of paper trading, where you can simulate real-market scenarios without risking your capital. ',
      'hi': '',
    },
    'ulp9pmvq': {
      'en': 'Start trading',
      'hi': '',
    },
    '9dszqwgw': {
      'en': 'Choose your Plan',
      'hi': '',
    },
    '8kqiwuyu': {
      'en': 'MONTLY',
      'hi': '',
    },
    'kfomi5zb': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    'pvyrjpf6': {
      'en': 'save 28%',
      'hi': '',
    },
    '2hne2rxo': {
      'en': '₹511.76',
      'hi': '',
    },
    '09w7n0h5': {
      'en': ' / month ',
      'hi': '',
    },
    'xnag8j4h': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    '77rw5fg5': {
      'en': 'Add to cart',
      'hi': '',
    },
    'b674e7e5': {
      'en': 'Basic copy trade access',
      'hi': '',
    },
    'f910zxq5': {
      'en': 'Limited premium trader access',
      'hi': '',
    },
    '33y46m5t': {
      'en': 'First-month discount',
      'hi': '',
    },
    '6vk12l1z': {
      'en': 'ANNUAL',
      'hi': '',
    },
    '4uer2t67': {
      'en': 'PRIMIUM ACCESS & SAVINGS ',
      'hi': '',
    },
    'e8jn54sx': {
      'en': 'save 28%',
      'hi': '',
    },
    'q8en1vi1': {
      'en': '₹1215.56',
      'hi': '',
    },
    'nmixfxn6': {
      'en': ' / month ',
      'hi': '',
    },
    'o51sk3gt': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    'qvgxsqfd': {
      'en': 'Add to cart',
      'hi': '',
    },
    'tryo0u8a': {
      'en': 'Full premium features',
      'hi': '',
    },
    'sycvy4tg': {
      'en': 'Unlimited trader access',
      'hi': '',
    },
    '4rgft2yf': {
      'en': 'Annual discount',
      'hi': '',
    },
    'yz58u15l': {
      'en': 'VIP referral rewards',
      'hi': '',
    },
    'cwv8my6m': {
      'en': 'MOST POPULAR',
      'hi': '',
    },
    '1jptv2m9': {
      'en': 'QUARTERLY',
      'hi': '',
    },
    'wl2qlr5q': {
      'en': 'ENHANCED FEATURES',
      'hi': '',
    },
    'numwulg5': {
      'en': 'save 28%',
      'hi': '',
    },
    '6rs6pyf8': {
      'en': '₹708.76',
      'hi': '',
    },
    'yrr75ret': {
      'en': ' / month ',
      'hi': '',
    },
    'ynriyvv8': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    'ukhjopru': {
      'en': 'Add to cart',
      'hi': '',
    },
    'dlg00t7c': {
      'en': 'Enhanced copy trade',
      'hi': '',
    },
    '777u19up': {
      'en': 'More trader access',
      'hi': '',
    },
    'm37d4pw4': {
      'en': 'Quarterly bonus credit',
      'hi': '',
    },
    '3hhgak1j': {
      'en': 'What users think ',
      'hi': '',
    },
    '7vxzko9v': {
      'en': 'About US',
      'hi': '',
    },
    'j3504ncj': {
      'en': '2nd April, 2024',
      'hi': '',
    },
    'bw9p53ya': {
      'en':
          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet.',
      'hi': '',
    },
    'pm12b87q': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    '55kchnfs': {
      'en': 'High achiever',
      'hi': '',
    },
    'yo8y56v0': {
      'en': '2nd April, 2024',
      'hi': '',
    },
    '9urukw0a': {
      'en':
          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet.',
      'hi': '',
    },
    'awvjtg8l': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    '8zuxh0w8': {
      'en': 'High achiever',
      'hi': '',
    },
    '027r9c8p': {
      'en': '2nd April, 2024',
      'hi': '',
    },
    '8p22phf3': {
      'en':
          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet.',
      'hi': '',
    },
    '4q9tejwo': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    '6eilogoj': {
      'en': 'High achiever',
      'hi': '',
    },
    'c7nbcibc': {
      'en': 'Trademirror',
      'hi': '',
    },
    'lc0hsfv8': {
      'en': 'Home',
      'hi': '',
    },
    'qj51zznk': {
      'en': 'FAQ’s',
      'hi': '',
    },
    'su10h1q4': {
      'en': 'About',
      'hi': '',
    },
    '99ypfuh2': {
      'en': 'contact',
      'hi': '',
    },
    'l4da1ou3': {
      'en': 'Login',
      'hi': '',
    },
    'yjehiyls': {
      'en': 'Sign up',
      'hi': '',
    },
    'x3jup8sh': {
      'en': 'Trade Like a Pro:\n',
      'hi': '',
    },
    'zaugy8jh': {
      'en': 'Copy Trading\n',
      'hi': '',
    },
    'rbuvi9vn': {
      'en': 'Made Easy!',
      'hi': '',
    },
    '9cy5qxyo': {
      'en':
          'Effortlessly mirror the success of expert traders with our user-friendly copy trading platform.',
      'hi': '',
    },
    'me4x3vof': {
      'en': 'Get started',
      'hi': '',
    },
    'zpgs5z1l': {
      'en': '05,00,000+ users',
      'hi': '',
    },
    'q4jqs0b2': {
      'en': 'Signed up to the platform',
      'hi': '',
    },
    '1lcxbisf': {
      'en': 'Multiple Master Accounts',
      'hi': '',
    },
    'qi7garwh': {
      'en': 'Follow multiple strategies at no extra cost.',
      'hi': '',
    },
    'jm0zgfvq': {
      'en': 'Capital Protection Stop',
      'hi': '',
    },
    'w9snaoi4': {
      'en': 'Set equity limits to control losses',
      'hi': '',
    },
    'erxx3jn0': {
      'en': 'Trade Risk-Free:Try Our ',
      'hi': '',
    },
    'v2xz5x0d': {
      'en': 'Paper Trading ',
      'hi': '',
    },
    'mg6g590t': {
      'en': 'Platform',
      'hi': '',
    },
    'ka0conql': {
      'en':
          'Discover the power of paper trading, where you can simulate real-market scenarios without risking your capital. ',
      'hi': '',
    },
    'i4ht4mm1': {
      'en': 'Start trading',
      'hi': '',
    },
    'm4w78tvv': {
      'en': 'Choose your Plan',
      'hi': '',
    },
    '3ec7covn': {
      'en': 'MONTLY',
      'hi': '',
    },
    'ik9m6m66': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    'tji80kti': {
      'en': 'save 28%',
      'hi': '',
    },
    'ttfnzrg6': {
      'en': '₹511.76',
      'hi': '',
    },
    'ok29dek2': {
      'en': ' / month ',
      'hi': '',
    },
    '72n2wki7': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    'we8bp87s': {
      'en': 'Add to cart',
      'hi': '',
    },
    '9tb8g9qz': {
      'en': 'Basic copy trade access',
      'hi': '',
    },
    'trgiu2zd': {
      'en': 'Limited premium trader access',
      'hi': '',
    },
    'waoiuc5g': {
      'en': 'First-month discount',
      'hi': '',
    },
    'wg5323oy': {
      'en': 'ANNUAL',
      'hi': '',
    },
    'lod7qn2u': {
      'en': 'PRIMIUM ACCESS & SAVINGS ',
      'hi': '',
    },
    'u3sstmrr': {
      'en': 'save 28%',
      'hi': '',
    },
    'wcsokhc3': {
      'en': '₹1215.56',
      'hi': '',
    },
    '9j2654v2': {
      'en': ' / month ',
      'hi': '',
    },
    'mvkv0hch': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    '2bz1ahn6': {
      'en': 'Add to cart',
      'hi': '',
    },
    '3jtgy0lz': {
      'en': 'Full premium features',
      'hi': '',
    },
    'xgzzearh': {
      'en': 'Unlimited trader access',
      'hi': '',
    },
    '8wg2oz7r': {
      'en': 'Annual discount',
      'hi': '',
    },
    'pc2nz6aq': {
      'en': 'VIP referral rewards',
      'hi': '',
    },
    'te56svsm': {
      'en': 'MOST POPULAR',
      'hi': '',
    },
    'v4nzvdbg': {
      'en': 'QUARTERLY',
      'hi': '',
    },
    'oj3v7lji': {
      'en': 'ENHANCED FEATURES',
      'hi': '',
    },
    'dwsopz3p': {
      'en': 'save 28%',
      'hi': '',
    },
    'zrbtfc0m': {
      'en': '₹708.76',
      'hi': '',
    },
    's3ok9ntw': {
      'en': ' / month ',
      'hi': '',
    },
    'sexab0p0': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    'h5pe8u4e': {
      'en': 'Add to cart',
      'hi': '',
    },
    '3podfgwd': {
      'en': 'Enhanced copy trade',
      'hi': '',
    },
    'ect3z7z7': {
      'en': 'More trader access',
      'hi': '',
    },
    'os3qjba2': {
      'en': 'Quarterly bonus credit',
      'hi': '',
    },
    'rtja31d8': {
      'en': 'What users think ',
      'hi': '',
    },
    'c4vzyt34': {
      'en': 'About US',
      'hi': '',
    },
    'h2bd6j8f': {
      'en': '2nd April, 2024',
      'hi': '',
    },
    'im8yi8av': {
      'en':
          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet.',
      'hi': '',
    },
    'rmq7dlg0': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'xkf1ccix': {
      'en': 'High achiever',
      'hi': '',
    },
    '5iijfnwf': {
      'en': '2nd April, 2024',
      'hi': '',
    },
    'uqdafy96': {
      'en':
          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet.',
      'hi': '',
    },
    'l9ewbmon': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    '97z2eqcs': {
      'en': 'High achiever',
      'hi': '',
    },
    'kpga9avl': {
      'en': '2nd April, 2024',
      'hi': '',
    },
    'b4kniwej': {
      'en':
          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet.',
      'hi': '',
    },
    '43tnb70n': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'gx3tswzu': {
      'en': 'High achiever',
      'hi': '',
    },
    'rtl2oh7l': {
      'en': 'Trademirror',
      'hi': '',
    },
    'mp4bjloa': {
      'en': 'Login',
      'hi': '',
    },
    'djarw4bi': {
      'en': 'Sign up',
      'hi': '',
    },
    'dq3z5768': {
      'en': 'Home',
      'hi': '',
    },
    'qs8bbk65': {
      'en': 'FAQ’s',
      'hi': '',
    },
    '7xf9pugl': {
      'en': 'About',
      'hi': '',
    },
    'hznkpbcf': {
      'en': 'contact',
      'hi': '',
    },
    'h4uviyjs': {
      'en': 'Trade Like a Pro:\n',
      'hi': '',
    },
    '5qf1dimj': {
      'en': 'Copy Trading\n',
      'hi': '',
    },
    'jid15zv2': {
      'en': 'Made Easy!',
      'hi': '',
    },
    'zbncd14d': {
      'en':
          'Effortlessly mirror the success of expert traders with our user-friendly copy trading platform.',
      'hi': '',
    },
    '8d6ml74i': {
      'en': 'Get started',
      'hi': '',
    },
    'vxvkjgk9': {
      'en': '05,00,000+ users',
      'hi': '',
    },
    'voanp9po': {
      'en': 'Signed up to the platform',
      'hi': '',
    },
    '4m3uq06z': {
      'en': 'Multiple Master Accounts',
      'hi': '',
    },
    'aqyhaapf': {
      'en': 'Follow multiple strategies at no extra cost.',
      'hi': '',
    },
    'noapb7ku': {
      'en': 'Capital Protection Stop',
      'hi': '',
    },
    'n3915fa3': {
      'en': 'Set equity limits to control losses',
      'hi': '',
    },
    'rjgsmznz': {
      'en': 'Trade Risk-Free:Try Our ',
      'hi': '',
    },
    'yc3fpm6m': {
      'en': 'Paper Trading ',
      'hi': '',
    },
    'smdgrwju': {
      'en': 'Platform',
      'hi': '',
    },
    'zxnhqujl': {
      'en':
          'Discover the power of paper trading, where you can simulate real-market scenarios without risking your capital. ',
      'hi': '',
    },
    'nlsdyi8q': {
      'en': 'Start trading',
      'hi': '',
    },
    'ch45vkrb': {
      'en': 'Choose your Plan',
      'hi': '',
    },
    'rcdzcqcw': {
      'en': 'MONTLY',
      'hi': '',
    },
    '6l7b62vw': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    'b51waq45': {
      'en': 'save 28%',
      'hi': '',
    },
    'l0hhg39v': {
      'en': '₹511.76',
      'hi': '',
    },
    '4716cnjm': {
      'en': ' / month ',
      'hi': '',
    },
    'gipzlp8e': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    'ne5jtfp0': {
      'en': 'Add to cart',
      'hi': '',
    },
    'u98ond82': {
      'en': 'Basic copy trade access',
      'hi': '',
    },
    '3hpf3tau': {
      'en': 'Limited premium trader access',
      'hi': '',
    },
    'xuenwiav': {
      'en': 'First-month discount',
      'hi': '',
    },
    'wpa0232y': {
      'en': 'ANNUAL',
      'hi': '',
    },
    'y3uaur6x': {
      'en': 'PRIMIUM ACCESS & SAVINGS ',
      'hi': '',
    },
    'dhrexdsw': {
      'en': 'save 28%',
      'hi': '',
    },
    '5lehdqwu': {
      'en': '₹1215.56',
      'hi': '',
    },
    '02p2ygz3': {
      'en': ' / month ',
      'hi': '',
    },
    '5n37x278': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    'wz1g97ll': {
      'en': 'Add to cart',
      'hi': '',
    },
    'o9m2z8t1': {
      'en': 'Full premium features',
      'hi': '',
    },
    'wukei5b5': {
      'en': 'Unlimited trader access',
      'hi': '',
    },
    'msbgh6yf': {
      'en': 'Annual discount',
      'hi': '',
    },
    'j19ltm8c': {
      'en': 'VIP referral rewards',
      'hi': '',
    },
    'cug4elcg': {
      'en': 'MOST POPULAR',
      'hi': '',
    },
    '7ufpjg4v': {
      'en': 'QUARTERLY',
      'hi': '',
    },
    '4111rsxf': {
      'en': 'ENHANCED FEATURES',
      'hi': '',
    },
    'waen9j30': {
      'en': 'save 28%',
      'hi': '',
    },
    'jp816yw9': {
      'en': '₹708.76',
      'hi': '',
    },
    '53hu074f': {
      'en': ' / month ',
      'hi': '',
    },
    'mbutw0zh': {
      'en': 'BASIC ACCESS',
      'hi': '',
    },
    'l3zwfmxi': {
      'en': 'Add to cart',
      'hi': '',
    },
    'phfj1zr4': {
      'en': 'Enhanced copy trade',
      'hi': '',
    },
    '6zf071x5': {
      'en': 'More trader access',
      'hi': '',
    },
    'r6kercxz': {
      'en': 'Quarterly bonus credit',
      'hi': '',
    },
    '697uawhp': {
      'en': 'What users think ',
      'hi': '',
    },
    'oqk5gjvb': {
      'en': 'About US',
      'hi': '',
    },
    '488hm894': {
      'en': '2nd April, 2024',
      'hi': '',
    },
    'h7nx1qzt': {
      'en':
          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet.',
      'hi': '',
    },
    'u6i706i5': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'szspouzy': {
      'en': 'High achiever',
      'hi': '',
    },
    'o9ei1eh9': {
      'en': '2nd April, 2024',
      'hi': '',
    },
    'fhtzr4g5': {
      'en':
          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet.',
      'hi': '',
    },
    'h6poxdhp': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    '36wivul4': {
      'en': 'High achiever',
      'hi': '',
    },
    '5tpekdad': {
      'en': '2nd April, 2024',
      'hi': '',
    },
    'zx0y8emb': {
      'en':
          'Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet, Consectetur Adipiscing Elit, Sed Do Eiusmod Tempor Incididunt Ut Labore. Lorem Ipsum Dolor Sit Amet.',
      'hi': '',
    },
    'g21x9084': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'r8x0bl10': {
      'en': 'High achiever',
      'hi': '',
    },
    '9bzo5zec': {
      'en': 'Home',
      'hi': '',
    },
  },
  // CopyTrading
  {
    '6ri28hgb': {
      'en': 'Trademirror',
      'hi': '',
    },
    'mz830pfg': {
      'en': 'Copytrading',
      'hi': '',
    },
    'm45p8jk4': {
      'en': 'Paper Trading',
      'hi': '',
    },
    'o5ts97f7': {
      'en': 'Referral programs',
      'hi': '',
    },
    'x9gwmvcw': {
      'en': 'contact',
      'hi': '',
    },
    'x5vaxm2h': {
      'en': '1',
      'hi': '',
    },
    '966r63b4': {
      'en': 'Trademirror Copytrading',
      'hi': '',
    },
    'kfwufsgs': {
      'en': 'Rating',
      'hi': '',
    },
    'qj2pu8kw': {
      'en': 'Proficiency rating',
      'hi': '',
    },
    'sa0ab957': {
      'en': 'Risk score',
      'hi': '',
    },
    'cmp5zco1': {
      'en': 'Risk score',
      'hi': '',
    },
    'mqk8mywd': {
      'en': 'Whom to show first',
      'hi': '',
    },
    'xgyy4ff7': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'yy0si01n': {
      'en': 'Risk score',
      'hi': '',
    },
    'n408sfmx': {
      'en': 'Risk score',
      'hi': '',
    },
    'obqz7zhd': {
      'en': 'For what time',
      'hi': '',
    },
    'qz4owmdx': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '29usitcs': {
      'en': 'Risk score',
      'hi': '',
    },
    '0nogit4m': {
      'en': 'Risk score',
      'hi': '',
    },
    'i1kxyms7': {
      'en': 'Minimum investment',
      'hi': '',
    },
    'b5m31v9b': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'ykmga6lu': {
      'en': 'Risk score',
      'hi': '',
    },
    '4708jyxg': {
      'en': 'Risk score',
      'hi': '',
    },
    'dj9o13bc': {
      'en': 'Minimum expertise',
      'hi': '',
    },
    'wq0hiprj': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '2zz5phxb': {
      'en': 'Free 7-day trial',
      'hi': '',
    },
    'tlfnkjc2': {
      'en': 'Nickname',
      'hi': '',
    },
    'er5d5waq': {
      'en': '1000 Master Traders shown',
      'hi': '',
    },
    '6p19o8cb': {
      'en': 'Reset all',
      'hi': '',
    },
    '3mqacubr': {
      'en': 'Risk score',
      'hi': '',
    },
    'cpgy9yyq': {
      'en': 'All time',
      'hi': '',
    },
    'rcyy609u': {
      'en': 'Gain',
      'hi': '',
    },
    'schvbscz': {
      'en': 'All time',
      'hi': '',
    },
    'xl4qaspb': {
      'en': 'Profit and loss',
      'hi': '',
    },
    'b93wv29a': {
      'en': 'All time',
      'hi': '',
    },
    'pzdb58dn': {
      'en': 'Copiers',
      'hi': '',
    },
    'toysts6o': {
      'en': 'All time',
      'hi': '',
    },
    'jzo326c5': {
      'en': 'Commission',
      'hi': '',
    },
    'tdhoi4fa': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'rugqgjd2': {
      'en': 'High achiever',
      'hi': '',
    },
    'pj0oxbqx': {
      'en': '1 risk',
      'hi': '',
    },
    'eu08s41m': {
      'en': '+53%',
      'hi': '',
    },
    '5uz0tafo': {
      'en': '₹4,024',
      'hi': '',
    },
    'n5zcz3c3': {
      'en': '₹0',
      'hi': '',
    },
    'e9mdxuod': {
      'en': '1597',
      'hi': '',
    },
    'cl5vdh47': {
      'en': '1597',
      'hi': '',
    },
    '3xmxb1lw': {
      'en': '+53%',
      'hi': '',
    },
    'vdn8g9oa': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'y4nkpb3j': {
      'en': 'High achiever',
      'hi': '',
    },
    'zfutgoci': {
      'en': '1 risk',
      'hi': '',
    },
    'hs7uhnm3': {
      'en': '+53%',
      'hi': '',
    },
    '6obf455l': {
      'en': '₹4,024',
      'hi': '',
    },
    'mlw35l5c': {
      'en': '₹0',
      'hi': '',
    },
    'okxqk7jw': {
      'en': '1597',
      'hi': '',
    },
    'jzdlfokj': {
      'en': '1597',
      'hi': '',
    },
    'rbfi2mnn': {
      'en': '+53%',
      'hi': '',
    },
    '2jvvd6pa': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'ndsahhu3': {
      'en': 'High achiever',
      'hi': '',
    },
    'e43yfhlj': {
      'en': '1 risk',
      'hi': '',
    },
    'jzwdq0y1': {
      'en': '+53%',
      'hi': '',
    },
    'aw91xd40': {
      'en': '₹4,024',
      'hi': '',
    },
    'm2crbzoe': {
      'en': '₹0',
      'hi': '',
    },
    'xnnjqoud': {
      'en': '1597',
      'hi': '',
    },
    'nivrjl22': {
      'en': '1597',
      'hi': '',
    },
    'dpa827qr': {
      'en': '+53%',
      'hi': '',
    },
    '4yuobe6n': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'lxnearqz': {
      'en': 'High achiever',
      'hi': '',
    },
    'uwoej6d8': {
      'en': '1 risk',
      'hi': '',
    },
    'anscjtch': {
      'en': '+53%',
      'hi': '',
    },
    'x7m4srki': {
      'en': '₹4,024',
      'hi': '',
    },
    'fexq1ki4': {
      'en': '₹0',
      'hi': '',
    },
    '2iwzathp': {
      'en': '1597',
      'hi': '',
    },
    '81fbg3hq': {
      'en': '1597',
      'hi': '',
    },
    'xwx4p0at': {
      'en': '+53%',
      'hi': '',
    },
    'newfkhoa': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    '5lpjlsy6': {
      'en': 'High achiever',
      'hi': '',
    },
    '21f23f2g': {
      'en': '1 risk',
      'hi': '',
    },
    '9nrr21cw': {
      'en': '+53%',
      'hi': '',
    },
    'm0zy6bu6': {
      'en': '₹4,024',
      'hi': '',
    },
    'xtfbgk6c': {
      'en': '₹0',
      'hi': '',
    },
    '8xbmsjwp': {
      'en': '1597',
      'hi': '',
    },
    'xz0ihbyu': {
      'en': '1597',
      'hi': '',
    },
    '9up6en9p': {
      'en': '+53%',
      'hi': '',
    },
    'm4j29tkh': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'pheuafst': {
      'en': 'High achiever',
      'hi': '',
    },
    'aj722mio': {
      'en': '1 risk',
      'hi': '',
    },
    '6vovs4o0': {
      'en': '+53%',
      'hi': '',
    },
    '2z563z27': {
      'en': '₹4,024',
      'hi': '',
    },
    'dbfagoey': {
      'en': '₹0',
      'hi': '',
    },
    '0n491mu5': {
      'en': '1597',
      'hi': '',
    },
    'vaidrpxm': {
      'en': '1597',
      'hi': '',
    },
    'w83ibcmn': {
      'en': '+53%',
      'hi': '',
    },
    'ppvq3z0v': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'vbmvm3j5': {
      'en': 'High achiever',
      'hi': '',
    },
    'kowjnud2': {
      'en': '1 risk',
      'hi': '',
    },
    'auyxhcit': {
      'en': '+53%',
      'hi': '',
    },
    'y8mjcc4t': {
      'en': '₹4,024',
      'hi': '',
    },
    'b1bgr4f3': {
      'en': '₹0',
      'hi': '',
    },
    'z64b75mi': {
      'en': '1597',
      'hi': '',
    },
    'ds1aqmlx': {
      'en': '1597',
      'hi': '',
    },
    'koq6uddd': {
      'en': '+53%',
      'hi': '',
    },
    'oy8tq2uv': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'u0abk2co': {
      'en': 'High achiever',
      'hi': '',
    },
    'fbqu7is4': {
      'en': '1 risk',
      'hi': '',
    },
    'sd3dxjvs': {
      'en': '+53%',
      'hi': '',
    },
    '9gn5dk8v': {
      'en': '₹4,024',
      'hi': '',
    },
    'w9sakd7q': {
      'en': '₹0',
      'hi': '',
    },
    'dsc7c4u1': {
      'en': '1597',
      'hi': '',
    },
    'jcu49fd8': {
      'en': '1597',
      'hi': '',
    },
    '8wcmfe4z': {
      'en': '+53%',
      'hi': '',
    },
    'ofv4n33d': {
      'en': '1',
      'hi': '',
    },
    's8bnwcud': {
      'en': '2',
      'hi': '',
    },
    'as8ly7rr': {
      'en': '.',
      'hi': '',
    },
    'myha6n8l': {
      'en': '.',
      'hi': '',
    },
    'sewrw5jq': {
      'en': '.',
      'hi': '',
    },
    'p88zi82f': {
      'en': '5',
      'hi': '',
    },
    'acxf0bw4': {
      'en': 'Terms & Conditions',
      'hi': '',
    },
    '3kr7vfjx': {
      'en': 'Tab View 2',
      'hi': '',
    },
    'c4d6ostq': {
      'en': 'Trademirror',
      'hi': '',
    },
    '3olg0zru': {
      'en': 'Copytrading',
      'hi': '',
    },
    'izcqe44n': {
      'en': 'Paper Trading',
      'hi': '',
    },
    '4jdlnzvr': {
      'en': 'Referral programs',
      'hi': '',
    },
    'x2j7mtsw': {
      'en': 'contact',
      'hi': '',
    },
    '6sk07t20': {
      'en': '1',
      'hi': '',
    },
    'fyknclal': {
      'en': 'Trademirror Copytrading',
      'hi': '',
    },
    'zep060te': {
      'en': 'Rating',
      'hi': '',
    },
    'n1kikqmh': {
      'en': 'Proficiency rating',
      'hi': '',
    },
    'ygsuymx0': {
      'en': 'Risk score',
      'hi': '',
    },
    '0vpseoft': {
      'en': 'Risk score',
      'hi': '',
    },
    'iulne7g0': {
      'en': 'Whom to show first',
      'hi': '',
    },
    'hcdpta56': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'z8d4rr9r': {
      'en': 'Risk score',
      'hi': '',
    },
    'b2f8xw6u': {
      'en': 'Risk score',
      'hi': '',
    },
    'b75awxeg': {
      'en': 'For what time',
      'hi': '',
    },
    'l651kqou': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'l3wt17gu': {
      'en': 'Risk score',
      'hi': '',
    },
    'lauy6ucr': {
      'en': 'Risk score',
      'hi': '',
    },
    'soof5qwc': {
      'en': 'Minimum investment',
      'hi': '',
    },
    'r0jsz7gu': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'cg4awfox': {
      'en': 'Risk score',
      'hi': '',
    },
    'oci7tl2z': {
      'en': 'Risk score',
      'hi': '',
    },
    'x1e4jqay': {
      'en': 'Minimum expertise',
      'hi': '',
    },
    'em1cihcv': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'w9huo2zb': {
      'en': 'Free 7-day trial',
      'hi': '',
    },
    '0c8e2ewz': {
      'en': 'Nickname',
      'hi': '',
    },
    'wwx4aqcs': {
      'en': '1000 Master Traders shown',
      'hi': '',
    },
    'aen91383': {
      'en': 'Reset all',
      'hi': '',
    },
    'y2k0bhbt': {
      'en': 'Risk score',
      'hi': '',
    },
    '1hsqhb1a': {
      'en': 'All time',
      'hi': '',
    },
    't9238adr': {
      'en': 'Gain',
      'hi': '',
    },
    'o4j4yeaf': {
      'en': 'All time',
      'hi': '',
    },
    '642w6ekc': {
      'en': 'Profit and loss',
      'hi': '',
    },
    'a5gff5lb': {
      'en': 'All time',
      'hi': '',
    },
    'a2bee4i3': {
      'en': 'Copiers',
      'hi': '',
    },
    'bzwqyuo6': {
      'en': 'All time',
      'hi': '',
    },
    '5n9qd0d0': {
      'en': 'Commission',
      'hi': '',
    },
    'fqwfuetx': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'xs1q7rev': {
      'en': 'High achiever',
      'hi': '',
    },
    'jnm06wod': {
      'en': '1 risk',
      'hi': '',
    },
    'upjz6yn2': {
      'en': '+53%',
      'hi': '',
    },
    '87eibfrf': {
      'en': '₹4,024',
      'hi': '',
    },
    'i9n16uif': {
      'en': '₹0',
      'hi': '',
    },
    'l67gxsay': {
      'en': '1597',
      'hi': '',
    },
    'i6whatyx': {
      'en': '1597',
      'hi': '',
    },
    'v3z1dozx': {
      'en': '+53%',
      'hi': '',
    },
    'mnihv4pk': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'g6pyp34o': {
      'en': 'High achiever',
      'hi': '',
    },
    'spof16qb': {
      'en': '1 risk',
      'hi': '',
    },
    's065ego8': {
      'en': '+53%',
      'hi': '',
    },
    'cc5mr1sv': {
      'en': '₹4,024',
      'hi': '',
    },
    'hayzipmb': {
      'en': '₹0',
      'hi': '',
    },
    'c2y5x6ee': {
      'en': '1597',
      'hi': '',
    },
    'v7ac674m': {
      'en': '1597',
      'hi': '',
    },
    'ldrhqcij': {
      'en': '+53%',
      'hi': '',
    },
    'xhisuq8s': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'mr6rw1bx': {
      'en': 'High achiever',
      'hi': '',
    },
    'y15s7ke3': {
      'en': '1 risk',
      'hi': '',
    },
    'k4w7s8ax': {
      'en': '+53%',
      'hi': '',
    },
    'uyofm6su': {
      'en': '₹4,024',
      'hi': '',
    },
    '25b51181': {
      'en': '₹0',
      'hi': '',
    },
    'wdjxzg8a': {
      'en': '1597',
      'hi': '',
    },
    '1ux9j3ca': {
      'en': '1597',
      'hi': '',
    },
    'owe6i651': {
      'en': '+53%',
      'hi': '',
    },
    '09lhy01b': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'fqtcnjdp': {
      'en': 'High achiever',
      'hi': '',
    },
    'skck2eyr': {
      'en': '1 risk',
      'hi': '',
    },
    '6n2xnx16': {
      'en': '+53%',
      'hi': '',
    },
    'gzl86niu': {
      'en': '₹4,024',
      'hi': '',
    },
    'ikeignfk': {
      'en': '₹0',
      'hi': '',
    },
    'e7q04zdu': {
      'en': '1597',
      'hi': '',
    },
    'swwdm7xb': {
      'en': '1597',
      'hi': '',
    },
    'zgnhdcpb': {
      'en': '+53%',
      'hi': '',
    },
    '428m2tec': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'lq8jiygv': {
      'en': 'High achiever',
      'hi': '',
    },
    '71yc3g5f': {
      'en': '1 risk',
      'hi': '',
    },
    '3jk12w1x': {
      'en': '+53%',
      'hi': '',
    },
    '1i90axcd': {
      'en': '₹4,024',
      'hi': '',
    },
    'a1s5nzoc': {
      'en': '₹0',
      'hi': '',
    },
    'hwl789p8': {
      'en': '1597',
      'hi': '',
    },
    '49s0ee05': {
      'en': '1597',
      'hi': '',
    },
    '81paummz': {
      'en': '+53%',
      'hi': '',
    },
    'inkm36ig': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'opkffz2q': {
      'en': 'High achiever',
      'hi': '',
    },
    'km4bvav5': {
      'en': '1 risk',
      'hi': '',
    },
    'qwwxoh9p': {
      'en': '+53%',
      'hi': '',
    },
    'pev0g676': {
      'en': '₹4,024',
      'hi': '',
    },
    'wn51ss50': {
      'en': '₹0',
      'hi': '',
    },
    'o01g8ggf': {
      'en': '1597',
      'hi': '',
    },
    'nh4tlmdc': {
      'en': '1597',
      'hi': '',
    },
    's9bwh4lj': {
      'en': '+53%',
      'hi': '',
    },
    '170b8iqx': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'dcw81lvr': {
      'en': 'High achiever',
      'hi': '',
    },
    '7bcjhtqj': {
      'en': '1 risk',
      'hi': '',
    },
    'zq91vdvn': {
      'en': '+53%',
      'hi': '',
    },
    'rt1rlbxm': {
      'en': '₹4,024',
      'hi': '',
    },
    '3ap1pwzk': {
      'en': '₹0',
      'hi': '',
    },
    'piltikmq': {
      'en': '1597',
      'hi': '',
    },
    'e68xubtm': {
      'en': '1597',
      'hi': '',
    },
    '6jdbaccy': {
      'en': '+53%',
      'hi': '',
    },
    'kovz4w66': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'k7uj7b6n': {
      'en': 'High achiever',
      'hi': '',
    },
    'hn5uxxwr': {
      'en': '1 risk',
      'hi': '',
    },
    '315vxwd9': {
      'en': '+53%',
      'hi': '',
    },
    'zy6q77dz': {
      'en': '₹4,024',
      'hi': '',
    },
    'bu2z7xfc': {
      'en': '₹0',
      'hi': '',
    },
    'ay65k8u4': {
      'en': '1597',
      'hi': '',
    },
    '4lwowzce': {
      'en': '1597',
      'hi': '',
    },
    'b5qglnbu': {
      'en': '+53%',
      'hi': '',
    },
    'xx3b8ozi': {
      'en': '1',
      'hi': '',
    },
    '0er336sd': {
      'en': '2',
      'hi': '',
    },
    'na4ynsqk': {
      'en': '.',
      'hi': '',
    },
    'aqhtoshq': {
      'en': '.',
      'hi': '',
    },
    'y8ft5im7': {
      'en': '.',
      'hi': '',
    },
    'x7rqyisn': {
      'en': '5',
      'hi': '',
    },
    'i2iw6z1q': {
      'en': 'Terms & Conditions',
      'hi': '',
    },
    'pf098dhp': {
      'en': 'Tab View 2',
      'hi': '',
    },
    'uopmjixl': {
      'en': 'Trademirror',
      'hi': '',
    },
    'y6xxjxsd': {
      'en': '1',
      'hi': '',
    },
    'stfiec8h': {
      'en': 'Copytrading',
      'hi': '',
    },
    'lteaaav9': {
      'en': 'Paper Trading',
      'hi': '',
    },
    'fzzmj8oj': {
      'en': 'Referral programs',
      'hi': '',
    },
    'cu73c04d': {
      'en': 'contact',
      'hi': '',
    },
    'wczj3fyq': {
      'en': 'Trademirror Copytrading',
      'hi': '',
    },
    'wsk122gq': {
      'en': 'Rating',
      'hi': '',
    },
    'sy1zxae6': {
      'en': 'Proficiency rating',
      'hi': '',
    },
    '9222wm1n': {
      'en': 'Risk score',
      'hi': '',
    },
    '91bqn5ck': {
      'en': 'Risk score',
      'hi': '',
    },
    'm2hu0vlk': {
      'en': 'Whom to show first',
      'hi': '',
    },
    'qamum7rl': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'j9km5svp': {
      'en': 'Risk score',
      'hi': '',
    },
    '0waylenh': {
      'en': 'Risk score',
      'hi': '',
    },
    '3944kv7h': {
      'en': 'For what time',
      'hi': '',
    },
    'vr5zhddo': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'k62lveto': {
      'en': 'Risk score',
      'hi': '',
    },
    '32n42458': {
      'en': 'Risk score',
      'hi': '',
    },
    '6z8393cx': {
      'en': 'Minimum investment',
      'hi': '',
    },
    'vp6ia1ez': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'ofdxgtr8': {
      'en': 'Risk score',
      'hi': '',
    },
    'm01oi93u': {
      'en': 'Risk score',
      'hi': '',
    },
    'iwrh5xs2': {
      'en': 'Minimum expertise',
      'hi': '',
    },
    '88ye4xlb': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '5oeuqf35': {
      'en': '1000 Master Traders shown',
      'hi': '',
    },
    'az5ig0us': {
      'en': 'Reset all',
      'hi': '',
    },
    '6um2dj7x': {
      'en': 'Risk score',
      'hi': '',
    },
    'zhqdyqaj': {
      'en': 'All time',
      'hi': '',
    },
    'sq9jakxg': {
      'en': 'Gain',
      'hi': '',
    },
    'k5m8h524': {
      'en': 'All time',
      'hi': '',
    },
    'jr9hdvls': {
      'en': 'Profit and loss',
      'hi': '',
    },
    '76u311il': {
      'en': 'All time',
      'hi': '',
    },
    'oou6h6l9': {
      'en': 'Copiers',
      'hi': '',
    },
    'gzyanjk1': {
      'en': 'All time',
      'hi': '',
    },
    'd4ixlz7c': {
      'en': 'Commission',
      'hi': '',
    },
    'l5uof6ec': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'aqmupew5': {
      'en': 'High achiever',
      'hi': '',
    },
    'uo5dp9f6': {
      'en': '1 risk',
      'hi': '',
    },
    'yjs2xtpe': {
      'en': '+53%',
      'hi': '',
    },
    'lyb4nzzv': {
      'en': '₹4,024',
      'hi': '',
    },
    '02v1pzyb': {
      'en': '₹0',
      'hi': '',
    },
    '0yphulsa': {
      'en': '1597',
      'hi': '',
    },
    'xu78nfi2': {
      'en': '+53%',
      'hi': '',
    },
    'eym3m3i3': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    '3m1bxlbs': {
      'en': 'High achiever',
      'hi': '',
    },
    'sk8o25x7': {
      'en': '1 risk',
      'hi': '',
    },
    'bseqysyf': {
      'en': '+53%',
      'hi': '',
    },
    'c0n2fzhg': {
      'en': '₹4,024',
      'hi': '',
    },
    'l5to5ox2': {
      'en': '₹0',
      'hi': '',
    },
    'zouf5xh9': {
      'en': '1597',
      'hi': '',
    },
    '308lbdow': {
      'en': '+53%',
      'hi': '',
    },
    'u5wi2t4x': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'ir44td0n': {
      'en': 'High achiever',
      'hi': '',
    },
    'u5wyk9an': {
      'en': '1 risk',
      'hi': '',
    },
    'ypbqyhn6': {
      'en': '+53%',
      'hi': '',
    },
    'h38xrt5a': {
      'en': '₹4,024',
      'hi': '',
    },
    'feapi4bu': {
      'en': '₹0',
      'hi': '',
    },
    '0otp9xmj': {
      'en': '1597',
      'hi': '',
    },
    'ls9ovb45': {
      'en': '+53%',
      'hi': '',
    },
    'jp638w0q': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'dgdjeget': {
      'en': 'High achiever',
      'hi': '',
    },
    'oijr1333': {
      'en': '1 risk',
      'hi': '',
    },
    '17mqjee2': {
      'en': '+53%',
      'hi': '',
    },
    '6kcet8aw': {
      'en': '₹4,024',
      'hi': '',
    },
    'ocwefs95': {
      'en': '₹0',
      'hi': '',
    },
    'o299m74o': {
      'en': '1597',
      'hi': '',
    },
    '3aqi2d6w': {
      'en': '+53%',
      'hi': '',
    },
    'f5c8f6wn': {
      'en': '1',
      'hi': '',
    },
    '86j3r10r': {
      'en': '2',
      'hi': '',
    },
    'b7eo9o9l': {
      'en': '.',
      'hi': '',
    },
    '59eokj7j': {
      'en': '.',
      'hi': '',
    },
    '5inowtlt': {
      'en': '.',
      'hi': '',
    },
    'qj3pugp1': {
      'en': '5',
      'hi': '',
    },
    'drhadiek': {
      'en': 'Terms & Conditions',
      'hi': '',
    },
    '4ywj0b6c': {
      'en': 'Tab View 2',
      'hi': '',
    },
    '3rrc9kga': {
      'en': 'Home',
      'hi': '',
    },
  },
  // CopyTradingCopy
  {
    'jccgd4eg': {
      'en': 'Trademirror',
      'hi': '',
    },
    'gz31eorw': {
      'en': 'Copytrading',
      'hi': '',
    },
    'olk6bolk': {
      'en': 'Paper Trading',
      'hi': '',
    },
    'vs2pgryb': {
      'en': 'Referral programs',
      'hi': '',
    },
    'aufrgtfa': {
      'en': 'contact',
      'hi': '',
    },
    'n2mpvsys': {
      'en': '1',
      'hi': '',
    },
    '5ezj4mfi': {
      'en': 'Trademirror Copytrading',
      'hi': '',
    },
    'fg07qgt1': {
      'en': 'Rating',
      'hi': '',
    },
    '7n68rcgo': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'v38s1wrd': {
      'en': 'High achiever',
      'hi': '',
    },
    '898ir86s': {
      'en': 'Set up copying',
      'hi': '',
    },
    'lb0f6fty': {
      'en': 'Minimum investment ₹2000',
      'hi': '',
    },
    '5scwmlvu': {
      'en': 'Risk score',
      'hi': '',
    },
    'jkqg506e': {
      'en': '1 risk',
      'hi': '',
    },
    'rzzrvqyi': {
      'en': 'Risk score',
      'hi': '',
    },
    'uwvbgz33': {
      'en': '₹45,765',
      'hi': '',
    },
    'zuktc3ut': {
      'en': 'Commission',
      'hi': '',
    },
    'bjv4e712': {
      'en': '34%',
      'hi': '',
    },
    'kpokeeeo': {
      'en': 'with us',
      'hi': '',
    },
    '73cy4lx9': {
      'en': '124d',
      'hi': '',
    },
    'f2wzc3zk': {
      'en': 'Strategy description',
      'hi': '',
    },
    'n8p7p6wk': {
      'en':
          'Low risk trader. Check our performance first, then decide. We only need dedicated\ncopiers who are committed to earning consistent profit at low risk. Lets grow together.',
      'hi': '',
    },
    'iu60dg03': {
      'en': 'Join chat: ',
      'hi': '',
    },
    'kovlxg79': {
      'en': ' https://t.me/Legit_harsh_sharma',
      'hi': '',
    },
    'acyp3jvg': {
      'en': 'Performance',
      'hi': '',
    },
    '23p999qb': {
      'en': '2W',
      'hi': '',
    },
    '0q3mj861': {
      'en': '1M',
      'hi': '',
    },
    'cezw0ebf': {
      'en': '3M',
      'hi': '',
    },
    '3g0l3gp1': {
      'en': '6M',
      'hi': '',
    },
    'hrzwrl4r': {
      'en': 'ALL',
      'hi': '',
    },
    'lg7qm1fl': {
      'en': 'Gain',
      'hi': '',
    },
    'x2oc11kv': {
      'en': '+53%',
      'hi': '',
    },
    '08o3gaeo': {
      'en': 'copiers',
      'hi': '',
    },
    'dl24eq1e': {
      'en': '1597',
      'hi': '',
    },
    'ee7t16fo': {
      'en': '1597',
      'hi': '',
    },
    'wi0bwcue': {
      'en': 'profit and loss',
      'hi': '',
    },
    '6ogwiwut': {
      'en': '₹4,024',
      'hi': '',
    },
    '37fuxn54': {
      'en': '₹0',
      'hi': '',
    },
    'ff3z1p4o': {
      'en': 'Account details',
      'hi': '',
    },
    '6ecm93nm': {
      'en': 'floating profit',
      'hi': '',
    },
    '14b9nyc5': {
      'en': '₹0.00',
      'hi': '',
    },
    'f4esdt4g': {
      'en': 'Balance',
      'hi': '',
    },
    '8617qnbi': {
      'en': '₹56,987.56',
      'hi': '',
    },
    'jrvxk1vh': {
      'en': 'Master Trader\'s bonus',
      'hi': '',
    },
    'xwq6x5pg': {
      'en': '₹0.00',
      'hi': '',
    },
    'l5m9elz5': {
      'en': 'Leverage',
      'hi': '',
    },
    'kbm15y7d': {
      'en': '1:1000',
      'hi': '',
    },
    '7oucgh5i': {
      'en': 'Account details',
      'hi': '',
    },
    'njeu056a': {
      'en': 'Maximum unrealised loss',
      'hi': '',
    },
    'fdyisgfk': {
      'en': '-\$54,888.00',
      'hi': '',
    },
    's8zz3b8q': {
      'en': 'Maximum drawdown duration',
      'hi': '',
    },
    'orm2mrqn': {
      'en': '18d',
      'hi': '',
    },
    '3qa3xsfx': {
      'en': 'Activity',
      'hi': '',
    },
    'usfnh312': {
      'en': '2W',
      'hi': '',
    },
    'x7jv9ysv': {
      'en': '1M',
      'hi': '',
    },
    'e6ztffxh': {
      'en': '3M',
      'hi': '',
    },
    'jpvh0fiw': {
      'en': '6M',
      'hi': '',
    },
    'gokyg3ax': {
      'en': 'ALL',
      'hi': '',
    },
    'xjthv06a': {
      'en': 'History',
      'hi': '',
    },
    'bl0lso52': {
      'en': 'Closed orders',
      'hi': '',
    },
    '1vbt8s8l': {
      'en': 'Risk score',
      'hi': '',
    },
    'ymeflq90': {
      'en': 'Risk score',
      'hi': '',
    },
    'vtrhr0cn': {
      'en': 'Risk score',
      'hi': '',
    },
    'gwmis866': {
      'en': 'Risk score',
      'hi': '',
    },
    'urmmarws': {
      'en': 'Yesterday',
      'hi': '',
    },
    'c2psmlqn': {
      'en': '0.02',
      'hi': '',
    },
    'uyljjc0x': {
      'en': 'Vedanta',
      'hi': '',
    },
    '28a68gls': {
      'en': '20:21',
      'hi': '',
    },
    'joktwjm0': {
      'en': '54m 52s',
      'hi': '',
    },
    'pzim4hkq': {
      'en': '₹80.00',
      'hi': '',
    },
    'wf1lwghy': {
      'en': 'Yesterday',
      'hi': '',
    },
    'djd5e6z7': {
      'en': '0.02',
      'hi': '',
    },
    'ypaoutyg': {
      'en': 'Vedanta',
      'hi': '',
    },
    '16qr6v2i': {
      'en': '20:21',
      'hi': '',
    },
    'vccu63ua': {
      'en': '54m 52s',
      'hi': '',
    },
    'oo3j64bz': {
      'en': '₹80.00',
      'hi': '',
    },
    'r7we8v6w': {
      'en': 'Show more',
      'hi': '',
    },
    '60xv05mo': {
      'en': 'Open orders (0)',
      'hi': '',
    },
    'g0jy2hb8': {
      'en': 'Tab View 2',
      'hi': '',
    },
    '924u3ld7': {
      'en': 'Balance operations',
      'hi': '',
    },
    'pttubg44': {
      'en': 'Tab View 3',
      'hi': '',
    },
    'fm7wx3pm': {
      'en': 'Terms & Conditions',
      'hi': '',
    },
    '8isl6yan': {
      'en': 'Tab View 2',
      'hi': '',
    },
    'iqko01gd': {
      'en': 'Trademirror',
      'hi': '',
    },
    's52ei3uh': {
      'en': 'Copytrading',
      'hi': '',
    },
    'n9oiiugi': {
      'en': 'Paper Trading',
      'hi': '',
    },
    '9duul6sv': {
      'en': 'Referral programs',
      'hi': '',
    },
    '8udxzqyw': {
      'en': 'contact',
      'hi': '',
    },
    '8hmdj1vo': {
      'en': '1',
      'hi': '',
    },
    'vp84dhy6': {
      'en': 'Trademirror Copytrading',
      'hi': '',
    },
    'oom7uvzi': {
      'en': 'Rating',
      'hi': '',
    },
    '4qx6g7i2': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'mol461i3': {
      'en': 'High achiever',
      'hi': '',
    },
    'lhj03n71': {
      'en': 'Set up copying',
      'hi': '',
    },
    'iqjrlipr': {
      'en': 'Minimum investment ₹2000',
      'hi': '',
    },
    '7tnwbw9i': {
      'en': 'Risk score',
      'hi': '',
    },
    'ndxm1fkp': {
      'en': '1 risk',
      'hi': '',
    },
    'i3t87ue6': {
      'en': 'Risk score',
      'hi': '',
    },
    'six2djzm': {
      'en': '₹45,765',
      'hi': '',
    },
    'y90ceoct': {
      'en': 'Commission',
      'hi': '',
    },
    'q4kh1ngl': {
      'en': '34%',
      'hi': '',
    },
    'y6c8x4l3': {
      'en': 'with us',
      'hi': '',
    },
    'cdirndi0': {
      'en': '124d',
      'hi': '',
    },
    'pgkm0zof': {
      'en': 'Strategy description',
      'hi': '',
    },
    'pagt91q8': {
      'en':
          'Low risk trader. Check our performance first, then decide. We only need dedicated\ncopiers who are committed to earning consistent profit at low risk. Lets grow together.',
      'hi': '',
    },
    'rpymnla6': {
      'en': 'Join chat: ',
      'hi': '',
    },
    '0zezexwj': {
      'en': ' https://t.me/Legit_harsh_sharma',
      'hi': '',
    },
    'kac6jayg': {
      'en': 'Performance',
      'hi': '',
    },
    'muw62pfr': {
      'en': '2W',
      'hi': '',
    },
    'ocp0x6s0': {
      'en': '1M',
      'hi': '',
    },
    'ywnis4w1': {
      'en': '3M',
      'hi': '',
    },
    'kh0mtlhf': {
      'en': '6M',
      'hi': '',
    },
    'n2e23v2s': {
      'en': 'ALL',
      'hi': '',
    },
    'fkz0qaqu': {
      'en': 'Gain',
      'hi': '',
    },
    '30ategbx': {
      'en': '+53%',
      'hi': '',
    },
    '6fxrrrsx': {
      'en': 'copiers',
      'hi': '',
    },
    '6o2bqz9o': {
      'en': '1597',
      'hi': '',
    },
    'nfp3lwuf': {
      'en': '1597',
      'hi': '',
    },
    '10xywrh8': {
      'en': 'profit and loss',
      'hi': '',
    },
    'aicy9c5c': {
      'en': '₹4,024',
      'hi': '',
    },
    '19kvp0e5': {
      'en': '₹0',
      'hi': '',
    },
    'zot6n3vz': {
      'en': 'Account details',
      'hi': '',
    },
    'hhnz77di': {
      'en': 'floating profit',
      'hi': '',
    },
    'omse62su': {
      'en': '₹0.00',
      'hi': '',
    },
    'wzsk725o': {
      'en': 'Balance',
      'hi': '',
    },
    '9uvhoyy7': {
      'en': '₹56,987.56',
      'hi': '',
    },
    'm14llzbl': {
      'en': 'Master Trader\'s bonus',
      'hi': '',
    },
    'pcds9iuq': {
      'en': '₹0.00',
      'hi': '',
    },
    'l3ylp2ny': {
      'en': 'Leverage',
      'hi': '',
    },
    '7bpdk9d2': {
      'en': '1:1000',
      'hi': '',
    },
    'f2zpxqzh': {
      'en': 'Account details',
      'hi': '',
    },
    'mz0xsb0x': {
      'en': 'Maximum unrealised loss',
      'hi': '',
    },
    '8uf7xsms': {
      'en': '-\$54,888.00',
      'hi': '',
    },
    '1ebf6l3w': {
      'en': 'Maximum drawdown duration',
      'hi': '',
    },
    '38yu5feb': {
      'en': '18d',
      'hi': '',
    },
    '9oizd576': {
      'en': 'Activity',
      'hi': '',
    },
    'bwb2nne0': {
      'en': '2W',
      'hi': '',
    },
    'g66lw7s0': {
      'en': '1M',
      'hi': '',
    },
    'ql5227ol': {
      'en': '3M',
      'hi': '',
    },
    '782euy2d': {
      'en': '6M',
      'hi': '',
    },
    'e6xqfqc0': {
      'en': 'ALL',
      'hi': '',
    },
    '9n2551u9': {
      'en': 'History',
      'hi': '',
    },
    'hmrqefyw': {
      'en': 'Closed orders',
      'hi': '',
    },
    'doywf2tf': {
      'en': 'Risk score',
      'hi': '',
    },
    'nuqfk9v4': {
      'en': 'Risk score',
      'hi': '',
    },
    'lkc7rs3t': {
      'en': 'Risk score',
      'hi': '',
    },
    '0z2323v2': {
      'en': 'Risk score',
      'hi': '',
    },
    'wlyws2im': {
      'en': 'Yesterday',
      'hi': '',
    },
    '6flndql5': {
      'en': '0.02',
      'hi': '',
    },
    '0qvg50a0': {
      'en': 'Vedanta',
      'hi': '',
    },
    'p6l6opvd': {
      'en': '20:21',
      'hi': '',
    },
    'a5cqat9m': {
      'en': '54m 52s',
      'hi': '',
    },
    '4qowg70x': {
      'en': '₹80.00',
      'hi': '',
    },
    'fzbpc99q': {
      'en': 'Yesterday',
      'hi': '',
    },
    'pfcky5u3': {
      'en': '0.02',
      'hi': '',
    },
    'y1pufhqz': {
      'en': 'Vedanta',
      'hi': '',
    },
    'mzkfry2c': {
      'en': '20:21',
      'hi': '',
    },
    'ywy25tvv': {
      'en': '54m 52s',
      'hi': '',
    },
    '070p2rzb': {
      'en': '₹80.00',
      'hi': '',
    },
    'mt5zcgld': {
      'en': 'Show more',
      'hi': '',
    },
    'juzoq3h3': {
      'en': 'Open orders (0)',
      'hi': '',
    },
    'sgkk92t0': {
      'en': 'Tab View 2',
      'hi': '',
    },
    'k2mbbe0d': {
      'en': 'Balance operations',
      'hi': '',
    },
    '0vp2ge1f': {
      'en': 'Tab View 3',
      'hi': '',
    },
    '4b4hj9fe': {
      'en': 'Terms & Conditions',
      'hi': '',
    },
    'z4y94c89': {
      'en': 'Tab View 2',
      'hi': '',
    },
    'qjyv7vme': {
      'en': 'Trademirror',
      'hi': '',
    },
    '9h8b66kx': {
      'en': '1',
      'hi': '',
    },
    'f7ui18ja': {
      'en': 'Copytrading',
      'hi': '',
    },
    '9ew8icr8': {
      'en': 'Paper Trading',
      'hi': '',
    },
    '1b62djbk': {
      'en': 'Referral programs',
      'hi': '',
    },
    'ce8pa9ew': {
      'en': 'contact',
      'hi': '',
    },
    'lhixsr81': {
      'en': 'Trademirror Copytrading',
      'hi': '',
    },
    'ddhjltyb': {
      'en': 'Rating',
      'hi': '',
    },
    'spkqf8zm': {
      'en': 'Harsh sharma',
      'hi': '',
    },
    'qzz01mw8': {
      'en': 'High achiever',
      'hi': '',
    },
    'q3apin7n': {
      'en': 'Set up copying',
      'hi': '',
    },
    'k5p5qaff': {
      'en': 'Minimum investment ₹2000',
      'hi': '',
    },
    '6endhlcp': {
      'en': 'Risk score',
      'hi': '',
    },
    'izrx7wj7': {
      'en': '1 risk',
      'hi': '',
    },
    'pq681jpq': {
      'en': 'Risk score',
      'hi': '',
    },
    '2fqs2jn1': {
      'en': '₹45,765',
      'hi': '',
    },
    'dyfciqcq': {
      'en': 'Commission',
      'hi': '',
    },
    'w2adpo1z': {
      'en': '34%',
      'hi': '',
    },
    'l39ongej': {
      'en': 'with us',
      'hi': '',
    },
    '06k0nna2': {
      'en': '124d',
      'hi': '',
    },
    'byscpmcq': {
      'en': 'Strategy description',
      'hi': '',
    },
    'kdw3owj4': {
      'en':
          'Low risk trader. Check our performance first, then decide. We only need dedicated copiers who are committed to earning consistent profit at low risk. Lets grow together.',
      'hi': '',
    },
    'nuzlh4uv': {
      'en': 'Join chat: ',
      'hi': '',
    },
    'wuf2vsu5': {
      'en': ' https://t.me/Legit_harsh_sharma',
      'hi': '',
    },
    '2dnr107j': {
      'en': 'Performance',
      'hi': '',
    },
    'xd0h9zxc': {
      'en': '2W',
      'hi': '',
    },
    'p2fi1si2': {
      'en': '1M',
      'hi': '',
    },
    'f0nlekwx': {
      'en': '3M',
      'hi': '',
    },
    't0jdn3hq': {
      'en': '6M',
      'hi': '',
    },
    'lizijam8': {
      'en': 'ALL',
      'hi': '',
    },
    'gx5s7fpt': {
      'en': 'Gain',
      'hi': '',
    },
    '20db22xc': {
      'en': '+53%',
      'hi': '',
    },
    'npasx9hc': {
      'en': 'copiers',
      'hi': '',
    },
    'y15lu82e': {
      'en': '1597',
      'hi': '',
    },
    'njzy5lro': {
      'en': '1597',
      'hi': '',
    },
    'j63e17i2': {
      'en': 'profit and loss',
      'hi': '',
    },
    'xlltt4jt': {
      'en': '₹4,024',
      'hi': '',
    },
    '76vs3o7u': {
      'en': '₹0',
      'hi': '',
    },
    'lpkony4z': {
      'en': 'Account details',
      'hi': '',
    },
    'exnt2i9b': {
      'en': 'floating profit',
      'hi': '',
    },
    '5ps5a8g5': {
      'en': '₹0.00',
      'hi': '',
    },
    '7g51za96': {
      'en': 'Balance',
      'hi': '',
    },
    '2tuwf8qa': {
      'en': '₹56,987.56',
      'hi': '',
    },
    'hni03543': {
      'en': 'Master Trader\'s bonus',
      'hi': '',
    },
    'b1ukc2a9': {
      'en': '₹0.00',
      'hi': '',
    },
    'qcznboet': {
      'en': 'Leverage',
      'hi': '',
    },
    '27qfv5h4': {
      'en': '1:1000',
      'hi': '',
    },
    'ow4jd3p4': {
      'en': 'Account details',
      'hi': '',
    },
    '82w2e964': {
      'en': 'Maximum unrealised loss',
      'hi': '',
    },
    'y82iy7ma': {
      'en': '-\$54,888.00',
      'hi': '',
    },
    'b0bxl14r': {
      'en': 'Maximum drawdown duration',
      'hi': '',
    },
    'pqbd45y7': {
      'en': '18d',
      'hi': '',
    },
    '5qelopry': {
      'en': 'Activity',
      'hi': '',
    },
    '1du8s0xr': {
      'en': '2W',
      'hi': '',
    },
    'jn761vb4': {
      'en': '1M',
      'hi': '',
    },
    'affkfevv': {
      'en': '3M',
      'hi': '',
    },
    '2ot3j63h': {
      'en': '6M',
      'hi': '',
    },
    'zkfz8tfb': {
      'en': 'ALL',
      'hi': '',
    },
    'bh4otd28': {
      'en': 'History',
      'hi': '',
    },
    'v31nb7h0': {
      'en': 'Closed orders',
      'hi': '',
    },
    'zu1hayv8': {
      'en': 'Risk score',
      'hi': '',
    },
    'mtk3cbkn': {
      'en': 'Risk score',
      'hi': '',
    },
    'w5st33zr': {
      'en': 'Risk score',
      'hi': '',
    },
    'djb27j21': {
      'en': 'Risk score',
      'hi': '',
    },
    '0jrjz4tz': {
      'en': 'Yesterday',
      'hi': '',
    },
    'xklz6021': {
      'en': '0.02',
      'hi': '',
    },
    'jf7r9bmb': {
      'en': 'Vedanta',
      'hi': '',
    },
    'y13stz21': {
      'en': '20:21',
      'hi': '',
    },
    'xfnk0apc': {
      'en': '54m 52s',
      'hi': '',
    },
    'w7pvccg6': {
      'en': '₹80.00',
      'hi': '',
    },
    'nzi6ruy9': {
      'en': 'Yesterday',
      'hi': '',
    },
    'vho2fvzj': {
      'en': '0.02',
      'hi': '',
    },
    'tzaq6d7f': {
      'en': 'Vedanta',
      'hi': '',
    },
    '457046dg': {
      'en': '20:21',
      'hi': '',
    },
    'ntvh01ed': {
      'en': '54m 52s',
      'hi': '',
    },
    'wn1e0z6d': {
      'en': '₹80.00',
      'hi': '',
    },
    'd9p42acu': {
      'en': 'Show more',
      'hi': '',
    },
    '2qdt8fn5': {
      'en': 'Open orders (0)',
      'hi': '',
    },
    'b0jqft3r': {
      'en': 'Tab View 2',
      'hi': '',
    },
    'u040vabk': {
      'en': 'Balance operations',
      'hi': '',
    },
    'hm3fud1a': {
      'en': 'Tab View 3',
      'hi': '',
    },
    'c0xjz69n': {
      'en': 'Terms & Conditions',
      'hi': '',
    },
    'vmj3kq92': {
      'en': 'Tab View 2',
      'hi': '',
    },
    'gzc4jqpo': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Referral
  {
    'oko5fzkl': {
      'en': 'Trademirror',
      'hi': '',
    },
    'd9iecnxj': {
      'en': 'Copytrading',
      'hi': '',
    },
    '87p8vfva': {
      'en': 'Paper Trading',
      'hi': '',
    },
    'rr0dbvpv': {
      'en': 'Referral programs',
      'hi': '',
    },
    'qabiesch': {
      'en': 'contact',
      'hi': '',
    },
    '6e8hu87x': {
      'en': '1',
      'hi': '',
    },
    'xso28y28': {
      'en': 'Referral Rewards:\nYour Earning Potential!',
      'hi': '',
    },
    '7dw82059': {
      'en':
          'Refer a friend, earn ₹5000. Plus, earn 5% of their referrals. Keep earning with every referral chain.',
      'hi': '',
    },
    '3n9ycycv': {
      'en': 'CODE-BvvK12',
      'hi': '',
    },
    'q3a3a58c': {
      'en': 'Copy ',
      'hi': '',
    },
    'be5eptl6': {
      'en': 'Referral program',
      'hi': '',
    },
    'zf0r2xnl': {
      'en': 'Withdraw Funds ',
      'hi': '',
    },
    'pce9nl5u': {
      'en': '₹45,765',
      'hi': '',
    },
    'y7myvgq2': {
      'en': 'Total earnings',
      'hi': '',
    },
    'qzi7eylw': {
      'en': '13',
      'hi': '',
    },
    'kf1rmfw8': {
      'en': 'Total Referrals',
      'hi': '',
    },
    'mh8m05un': {
      'en': '₹4 024',
      'hi': '',
    },
    'lybjka89': {
      'en': 'Available to withdraw',
      'hi': '',
    },
    'y5e7n1fg': {
      'en': 'Referral stats',
      'hi': '',
    },
    '355usf1i': {
      'en': 'Date',
      'hi': '',
    },
    '88q7qjae': {
      'en': 'Type',
      'hi': '',
    },
    'ajuh2o6u': {
      'en': 'From',
      'hi': '',
    },
    'mtmdwfvu': {
      'en': 'Level',
      'hi': '',
    },
    '0i9e9u38': {
      'en': 'Earning',
      'hi': '',
    },
    'ju07i0do': {
      'en': '18.08.2024',
      'hi': '',
    },
    '74kwqbdw': {
      'en': 'Referral',
      'hi': '',
    },
    'nevyr4u3': {
      'en': 'Aditya435',
      'hi': '',
    },
    'tpx789j1': {
      'en': 'First',
      'hi': '',
    },
    '7h1ayy2g': {
      'en': '₹5000',
      'hi': '',
    },
    '8v5o68ss': {
      'en': '18.08.2024',
      'hi': '',
    },
    '640vmbfa': {
      'en': 'Referral',
      'hi': '',
    },
    'hna06j7d': {
      'en': 'Aditya435',
      'hi': '',
    },
    '0zn3fehd': {
      'en': 'First',
      'hi': '',
    },
    'fc5ixhou': {
      'en': '₹5000',
      'hi': '',
    },
    'ubmo7yry': {
      'en': '18.08.2024',
      'hi': '',
    },
    '1cyh9cwi': {
      'en': 'Referral',
      'hi': '',
    },
    'sth6xlxj': {
      'en': 'Aditya435',
      'hi': '',
    },
    'qczxoqsy': {
      'en': 'First',
      'hi': '',
    },
    'ci18v6s5': {
      'en': '₹5000',
      'hi': '',
    },
    'xju80o8a': {
      'en': '18.08.2024',
      'hi': '',
    },
    'neczxaex': {
      'en': 'Referral',
      'hi': '',
    },
    'yrb7373j': {
      'en': 'Aditya435',
      'hi': '',
    },
    'ed3s7v1n': {
      'en': 'First',
      'hi': '',
    },
    'hhvbekty': {
      'en': '₹5000',
      'hi': '',
    },
    'pz45m7al': {
      'en': '18.08.2024',
      'hi': '',
    },
    'w6zwim2k': {
      'en': 'Referral',
      'hi': '',
    },
    'frhjbbrx': {
      'en': 'Aditya435',
      'hi': '',
    },
    'vk3zng1h': {
      'en': 'First',
      'hi': '',
    },
    '3h02ag4l': {
      'en': '₹5000',
      'hi': '',
    },
    'rmd0fqba': {
      'en': 'Show More',
      'hi': '',
    },
    'cxizq49w': {
      'en': 'Trademirror',
      'hi': '',
    },
    'l9ms3645': {
      'en': 'Copytrading',
      'hi': '',
    },
    'sz2wf4ba': {
      'en': 'Paper Trading',
      'hi': '',
    },
    'ljeh4whk': {
      'en': 'Referral programs',
      'hi': '',
    },
    'vtwd4jmz': {
      'en': 'contact',
      'hi': '',
    },
    'b6eywzs5': {
      'en': '1',
      'hi': '',
    },
    '1gu3u8mc': {
      'en': 'Referral Rewards:\nYour Earning Potential!',
      'hi': '',
    },
    'pyhlnfow': {
      'en':
          'Refer a friend, earn ₹5000. Plus, earn 5% of their referrals. Keep earning with every referral chain.',
      'hi': '',
    },
    '427lucwo': {
      'en': 'CODE-BvvK12',
      'hi': '',
    },
    'y995th2w': {
      'en': 'Copy ',
      'hi': '',
    },
    '1lyxpxmr': {
      'en': 'Referral program',
      'hi': '',
    },
    'hv1gtwj5': {
      'en': 'Withdraw Funds ',
      'hi': '',
    },
    'fisd4ev4': {
      'en': '₹45,765',
      'hi': '',
    },
    'qccyeo54': {
      'en': 'Total earnings',
      'hi': '',
    },
    '57j70lmw': {
      'en': '13',
      'hi': '',
    },
    'smp48mcr': {
      'en': 'Total Referrals',
      'hi': '',
    },
    'ec79x7i7': {
      'en': '₹4 024',
      'hi': '',
    },
    'zlp9lmix': {
      'en': 'Available to withdraw',
      'hi': '',
    },
    'g82ntmua': {
      'en': 'Referral stats',
      'hi': '',
    },
    'mvttjj9u': {
      'en': 'Date',
      'hi': '',
    },
    '0i90ly3l': {
      'en': 'Type',
      'hi': '',
    },
    '25qydh8t': {
      'en': 'From',
      'hi': '',
    },
    'exh0hnnz': {
      'en': 'Level',
      'hi': '',
    },
    'o8adoggy': {
      'en': 'Earning',
      'hi': '',
    },
    'uefzufpe': {
      'en': '18.08.2024',
      'hi': '',
    },
    '94cpusdv': {
      'en': 'Referral',
      'hi': '',
    },
    'vvee8xf2': {
      'en': 'Aditya435',
      'hi': '',
    },
    'z0si2mjb': {
      'en': 'First',
      'hi': '',
    },
    'ar5c8vmy': {
      'en': '₹5000',
      'hi': '',
    },
    's1212ed0': {
      'en': '18.08.2024',
      'hi': '',
    },
    'h3if6ux1': {
      'en': 'Referral',
      'hi': '',
    },
    '1zciliwi': {
      'en': 'Aditya435',
      'hi': '',
    },
    'p46wpl2f': {
      'en': 'First',
      'hi': '',
    },
    'xcstywko': {
      'en': '₹5000',
      'hi': '',
    },
    'eah8wbpj': {
      'en': '18.08.2024',
      'hi': '',
    },
    'njdpvyx0': {
      'en': 'Referral',
      'hi': '',
    },
    'xjn9amjq': {
      'en': 'Aditya435',
      'hi': '',
    },
    'bowk7pcz': {
      'en': 'First',
      'hi': '',
    },
    'jwx5v6dl': {
      'en': '₹5000',
      'hi': '',
    },
    '2tfkkl3p': {
      'en': '18.08.2024',
      'hi': '',
    },
    's5z8f7q6': {
      'en': 'Referral',
      'hi': '',
    },
    'dwidpicc': {
      'en': 'Aditya435',
      'hi': '',
    },
    'c0co6izd': {
      'en': 'First',
      'hi': '',
    },
    'ux1p1ze5': {
      'en': '₹5000',
      'hi': '',
    },
    'y3qxr1dl': {
      'en': '18.08.2024',
      'hi': '',
    },
    'ho14drd6': {
      'en': 'Referral',
      'hi': '',
    },
    '2hwsboq5': {
      'en': 'Aditya435',
      'hi': '',
    },
    'xfib5urg': {
      'en': 'First',
      'hi': '',
    },
    'nzchjxsv': {
      'en': '₹5000',
      'hi': '',
    },
    'h7n0kds0': {
      'en': 'Show More',
      'hi': '',
    },
    '1y27lewi': {
      'en': 'Trademirror',
      'hi': '',
    },
    'mmd9ngbl': {
      'en': '1',
      'hi': '',
    },
    '17a06d4q': {
      'en': 'Copytrading',
      'hi': '',
    },
    '9p3xmiyd': {
      'en': 'Paper Trading',
      'hi': '',
    },
    'ln1914c5': {
      'en': 'Referral programs',
      'hi': '',
    },
    'routxc1f': {
      'en': 'contact',
      'hi': '',
    },
    'fwuuyq1e': {
      'en': 'Referral Rewards:\nYour Earning Potential!',
      'hi': '',
    },
    '071dtuq3': {
      'en':
          'Refer a friend, earn ₹5000. Plus, earn 5% of their referrals. Keep earning with every referral chain.',
      'hi': '',
    },
    '2e6c1gz6': {
      'en': 'CODE-BvvK12',
      'hi': '',
    },
    'z0ditlz0': {
      'en': 'Copy ',
      'hi': '',
    },
    'znq9g3gp': {
      'en': 'Referral program',
      'hi': '',
    },
    '0aa65sqt': {
      'en': 'Withdraw Funds ',
      'hi': '',
    },
    'cl7b8trr': {
      'en': '₹45,765',
      'hi': '',
    },
    'ng0ggxlr': {
      'en': 'Total earnings',
      'hi': '',
    },
    '3bb6hnnb': {
      'en': '13',
      'hi': '',
    },
    't1cntrua': {
      'en': 'Total Referrals',
      'hi': '',
    },
    '7d8fmb31': {
      'en': '₹4 024',
      'hi': '',
    },
    '8v7ubxd6': {
      'en': 'Available to withdraw',
      'hi': '',
    },
    'b3x5bb2g': {
      'en': 'Referral stats',
      'hi': '',
    },
    'lb19jryz': {
      'en': 'Date',
      'hi': '',
    },
    'ewl0osxk': {
      'en': 'Type',
      'hi': '',
    },
    '0vobhqsz': {
      'en': 'From',
      'hi': '',
    },
    '4vgy5ljd': {
      'en': 'Level',
      'hi': '',
    },
    'svz8eoy9': {
      'en': 'Earning',
      'hi': '',
    },
    'm7hv6qvk': {
      'en': '18.08.2024',
      'hi': '',
    },
    'u5wgrpgf': {
      'en': 'Referral',
      'hi': '',
    },
    'yaljgs9m': {
      'en': 'Aditya435',
      'hi': '',
    },
    'd1arubum': {
      'en': 'First',
      'hi': '',
    },
    'u7pklrch': {
      'en': '₹5000',
      'hi': '',
    },
    'fjdcpx0t': {
      'en': '18.08.2024',
      'hi': '',
    },
    'esecarrx': {
      'en': 'Referral',
      'hi': '',
    },
    'rz8aamgn': {
      'en': 'Aditya435',
      'hi': '',
    },
    '04k4115n': {
      'en': 'First',
      'hi': '',
    },
    'zfa3et4l': {
      'en': '₹5000',
      'hi': '',
    },
    'aoub8n41': {
      'en': 'Show More',
      'hi': '',
    },
    'mfdb7nav': {
      'en': 'Home',
      'hi': '',
    },
  },
  // PaperTradingweb
  {
    'hqptiffr': {
      'en': 'Trademirror',
      'hi': '',
    },
    'arsjjzno': {
      'en': 'Copytrading',
      'hi': '',
    },
    'ykl5nuvq': {
      'en': 'Paper Trading',
      'hi': '',
    },
    'xr9b208m': {
      'en': 'Referral programs',
      'hi': '',
    },
    '1qzu4qv8': {
      'en': 'contact',
      'hi': '',
    },
    'zaxp7s2g': {
      'en': '1',
      'hi': '',
    },
    'z1zx6sie': {
      'en': 'Trademirror Copytrading',
      'hi': '',
    },
    'oi4zp6mq': {
      'en': 'Paper trading',
      'hi': '',
    },
    'a109c5oe': {
      'en': 'MARKET OPENS AT 09:15 AM',
      'hi': '',
    },
    'ci8evc14': {
      'en': 'Index',
      'hi': '',
    },
    'ipexi8en': {
      'en': 'All indices',
      'hi': '',
    },
    'fi15n272': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'ktz85x9z': {
      'en': '22,519.40',
      'hi': '',
    },
    '7e8jkk2u': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'ohtgzlva': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'drn18r1p': {
      'en': '22,519.40',
      'hi': '',
    },
    'rxj7cqan': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'ppcql4ca': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    '9bgxab47': {
      'en': '22,519.40',
      'hi': '',
    },
    'wsg6eqbd': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'ropl2tsf': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    '5jqgocr2': {
      'en': '22,519.40',
      'hi': '',
    },
    'q5qzp172': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'rj9lhesr': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'vsx10egc': {
      'en': '22,519.40',
      'hi': '',
    },
    'vtha512l': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'zxonx4zl': {
      'en': 'Most Bought on Trade mirror',
      'hi': '',
    },
    'mwqqb0w3': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'ee4slxcl': {
      'en': '₹12.95',
      'hi': '',
    },
    't975fmfr': {
      'en': '0.00',
      'hi': '',
    },
    'e9xf6ffi': {
      'en': '(0.72%)',
      'hi': '',
    },
    'm7xmpwlc': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '4qrz0c8d': {
      'en': '₹12.95',
      'hi': '',
    },
    'msjh1788': {
      'en': '0.00',
      'hi': '',
    },
    'lnnspxc6': {
      'en': '(0.72%)',
      'hi': '',
    },
    'l5e7yxoe': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '1q8ninic': {
      'en': '₹12.95',
      'hi': '',
    },
    'tw0fqk9z': {
      'en': '0.00',
      'hi': '',
    },
    'yh2qyeu2': {
      'en': '(0.72%)',
      'hi': '',
    },
    'r1igr55e': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'qqm2j853': {
      'en': '₹12.95',
      'hi': '',
    },
    'sb4rpocs': {
      'en': '0.00',
      'hi': '',
    },
    'lufkibhw': {
      'en': '(0.72%)',
      'hi': '',
    },
    'a0f807bu': {
      'en': 'Top Gainers',
      'hi': '',
    },
    '4uc1bln4': {
      'en': 'See more',
      'hi': '',
    },
    'mvao14fv': {
      'en': 'Large',
      'hi': '',
    },
    'z23fb9gc': {
      'en': 'Mid',
      'hi': '',
    },
    'm5kzo9lf': {
      'en': 'Small',
      'hi': '',
    },
    '3y3duo1k': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '52xm5jzo': {
      'en': '₹12.95',
      'hi': '',
    },
    '5wz4o4an': {
      'en': '0.00',
      'hi': '',
    },
    'wubpfzre': {
      'en': '(0.72%)',
      'hi': '',
    },
    'syzw6p04': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'i2kdgow0': {
      'en': '₹12.95',
      'hi': '',
    },
    'ukuzryxc': {
      'en': '0.00',
      'hi': '',
    },
    'qf2trfe4': {
      'en': '(0.72%)',
      'hi': '',
    },
    'l2lvnytf': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '5a4sklwd': {
      'en': '₹12.95',
      'hi': '',
    },
    'yyec7110': {
      'en': '0.00',
      'hi': '',
    },
    'ev9zd73n': {
      'en': '(0.72%)',
      'hi': '',
    },
    'exuov3qk': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'lsjp2siy': {
      'en': '₹12.95',
      'hi': '',
    },
    'ijjo2f25': {
      'en': '0.00',
      'hi': '',
    },
    'g2dd2ulp': {
      'en': '(0.72%)',
      'hi': '',
    },
    '8yy2iqx5': {
      'en': 'Stocks in News',
      'hi': '',
    },
    '0b2zart7': {
      'en': 'News',
      'hi': '',
    },
    'lmd9dle2': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '036z1777': {
      'en': '₹12.95',
      'hi': '',
    },
    '9v8379ck': {
      'en': '0.00',
      'hi': '',
    },
    'g6kp26mv': {
      'en': '(0.72%)',
      'hi': '',
    },
    'j4p0ykf2': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'r1v0256t': {
      'en': '₹12.95',
      'hi': '',
    },
    'g7p4w1x7': {
      'en': '0.00',
      'hi': '',
    },
    'mp5bp2kv': {
      'en': '(0.72%)',
      'hi': '',
    },
    '2pfw3gbw': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'zb8jbhvk': {
      'en': '₹12.95',
      'hi': '',
    },
    '0h7a455a': {
      'en': '0.00',
      'hi': '',
    },
    'hobctl63': {
      'en': '(0.72%)',
      'hi': '',
    },
    'tkw5xn5y': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'c9bi4jyy': {
      'en': '₹12.95',
      'hi': '',
    },
    'rfyzpnpg': {
      'en': '0.00',
      'hi': '',
    },
    '55vfp4bo': {
      'en': '(0.72%)',
      'hi': '',
    },
    'fbfdskp9': {
      'en': 'Top Losers',
      'hi': '',
    },
    'vvbc3zv5': {
      'en': 'See more',
      'hi': '',
    },
    '22vq117e': {
      'en': 'Large',
      'hi': '',
    },
    '0q156wml': {
      'en': 'Mid',
      'hi': '',
    },
    'flf3vcqz': {
      'en': 'Small',
      'hi': '',
    },
    '9428s5h1': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '5lq2w4lr': {
      'en': '₹12.95',
      'hi': '',
    },
    'p486z7o3': {
      'en': '0.00',
      'hi': '',
    },
    '83664aoh': {
      'en': '(0.72%)',
      'hi': '',
    },
    'ijs8xnxa': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'bykzrnpu': {
      'en': '₹12.95',
      'hi': '',
    },
    'len3rkvm': {
      'en': '0.00',
      'hi': '',
    },
    't9hp5i8v': {
      'en': '(0.72%)',
      'hi': '',
    },
    'olru3fh2': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'l7tpwz26': {
      'en': '₹12.95',
      'hi': '',
    },
    'fxem7fpq': {
      'en': '0.00',
      'hi': '',
    },
    '422pzwj7': {
      'en': '(0.72%)',
      'hi': '',
    },
    'xljfdo6w': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'eqqbjs5n': {
      'en': '₹12.95',
      'hi': '',
    },
    '3yrwkitd': {
      'en': '0.00',
      'hi': '',
    },
    'xzrver7g': {
      'en': '(0.72%)',
      'hi': '',
    },
    'denrrj06': {
      'en': 'Top Sectors',
      'hi': '',
    },
    '5q2r243i': {
      'en': 'See more',
      'hi': '',
    },
    '6u22s6rx': {
      'en': 'Banking',
      'hi': '',
    },
    'sy2sx56o': {
      'en': '37',
      'hi': '',
    },
    'zbfiljog': {
      'en': 'Banking',
      'hi': '',
    },
    'tikg4w5y': {
      'en': '37',
      'hi': '',
    },
    'pf4c9uw8': {
      'en': 'Banking',
      'hi': '',
    },
    'gjbwt3oo': {
      'en': '37',
      'hi': '',
    },
    'vzhvzefw': {
      'en': 'Banking',
      'hi': '',
    },
    'vr02z7dk': {
      'en': '37',
      'hi': '',
    },
    'ph3im79i': {
      'en': 'Banking',
      'hi': '',
    },
    'itus3nkv': {
      'en': '37',
      'hi': '',
    },
    'xjkfe8s4': {
      'en': 'Banking',
      'hi': '',
    },
    'quw6f3dj': {
      'en': '37',
      'hi': '',
    },
    '699zdcpz': {
      'en': 'Top by Market Cap',
      'hi': '',
    },
    'ckrzwuii': {
      'en': 'See more',
      'hi': '',
    },
    '7t1slay7': {
      'en': 'Company',
      'hi': '',
    },
    'miumdz7r': {
      'en': 'Watchlist',
      'hi': '',
    },
    'emumxl13': {
      'en': 'Zomato',
      'hi': '',
    },
    'qespq43s': {
      'en': '180 shares',
      'hi': '',
    },
    'ougyjw9s': {
      'en': '₹ 38,546.56',
      'hi': '',
    },
    'v3kopjab': {
      'en': '(₹ 37,546.56)',
      'hi': '',
    },
    'ueha5p9k': {
      'en': 'Zomato',
      'hi': '',
    },
    'vtvbov9u': {
      'en': '180 shares',
      'hi': '',
    },
    'x4n9n32a': {
      'en': '₹ 38,546.56',
      'hi': '',
    },
    'he7zykym': {
      'en': '(₹ 37,546.56)',
      'hi': '',
    },
    'mq7d4sgu': {
      'en': 'Zomato',
      'hi': '',
    },
    'ockytax8': {
      'en': '180 shares',
      'hi': '',
    },
    'ejkqguiu': {
      'en': '₹ 38,546.56',
      'hi': '',
    },
    'q4yh0nvx': {
      'en': '(₹ 37,546.56)',
      'hi': '',
    },
    'odwd73f9': {
      'en': '1',
      'hi': '',
    },
    '4bglhrxq': {
      'en': '2',
      'hi': '',
    },
    'onbaamnj': {
      'en': '.',
      'hi': '',
    },
    'mxy69gh5': {
      'en': '.',
      'hi': '',
    },
    'i4vezl40': {
      'en': '.',
      'hi': '',
    },
    'q0q9i145': {
      'en': '5',
      'hi': '',
    },
    '5f57l9kp': {
      'en': 'Your Investments',
      'hi': '',
    },
    '3t111zhb': {
      'en': 'Dashboard',
      'hi': '',
    },
    'q1rlredq': {
      'en': '₹0',
      'hi': '',
    },
    'jrjxn8hj': {
      'en': 'Total Return',
      'hi': '',
    },
    'n15odncf': {
      'en': '₹0',
      'hi': '',
    },
    'crgrl7ed': {
      'en': 'Current Value',
      'hi': '',
    },
    '06qx3zue': {
      'en': 'All watchlists',
      'hi': '',
    },
    '5vlg3l0s': {
      'en': 'View all',
      'hi': '',
    },
    'qcg77vks': {
      'en': 'Harsh\'s Watchlist',
      'hi': '',
    },
    'z73z4w9j': {
      'en': '1 items',
      'hi': '',
    },
    '9roih7ic': {
      'en': 'Create new watchlist',
      'hi': '',
    },
    'x6nldt9m': {
      'en': 'Trademirror',
      'hi': '',
    },
    'p9ei11p0': {
      'en': 'Copytrading',
      'hi': '',
    },
    'f4af3v69': {
      'en': 'Paper Trading',
      'hi': '',
    },
    '0d6gk9sx': {
      'en': 'Referral programs',
      'hi': '',
    },
    '6w47hc14': {
      'en': 'contact',
      'hi': '',
    },
    'c5oxjja0': {
      'en': '1',
      'hi': '',
    },
    '4xdddhxq': {
      'en': 'Trademirror Copytrading',
      'hi': '',
    },
    'zstfberb': {
      'en': 'Paper trading',
      'hi': '',
    },
    'cp152d9m': {
      'en': 'MARKET OPENS AT 09:15 AM',
      'hi': '',
    },
    '7t1tz08b': {
      'en': 'Index',
      'hi': '',
    },
    'fiidsuh5': {
      'en': 'All indices',
      'hi': '',
    },
    'nel2jasm': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'em6ib9cv': {
      'en': '22,519.40',
      'hi': '',
    },
    't64rp37w': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'q26geuuf': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    '3ht8hyii': {
      'en': '22,519.40',
      'hi': '',
    },
    'b172vbdt': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'pedi65cp': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'j2qpjmmk': {
      'en': '22,519.40',
      'hi': '',
    },
    'ekkwrzg2': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'w6tt230l': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'pya5rsvs': {
      'en': '22,519.40',
      'hi': '',
    },
    'h037brst': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'l8y9nmzm': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'veqzd597': {
      'en': '22,519.40',
      'hi': '',
    },
    'ixno0t3g': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'sgy6r9gz': {
      'en': 'Most Bought on Trade mirror',
      'hi': '',
    },
    'jt1g21hz': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '9nx5v57c': {
      'en': '₹12.95',
      'hi': '',
    },
    'w8dqn7k6': {
      'en': '0.00',
      'hi': '',
    },
    'hlsdbmt0': {
      'en': '(0.72%)',
      'hi': '',
    },
    'wjhtqrsa': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'cryc606w': {
      'en': '₹12.95',
      'hi': '',
    },
    'it81alqn': {
      'en': '0.00',
      'hi': '',
    },
    'uacp28wm': {
      'en': '(0.72%)',
      'hi': '',
    },
    'hcl2fghx': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    't76544os': {
      'en': '₹12.95',
      'hi': '',
    },
    '4gm2adx6': {
      'en': '0.00',
      'hi': '',
    },
    '7i86296r': {
      'en': '(0.72%)',
      'hi': '',
    },
    'gcwj003a': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'zdqdj80n': {
      'en': '₹12.95',
      'hi': '',
    },
    'edp8xdpf': {
      'en': '0.00',
      'hi': '',
    },
    'zjibu7es': {
      'en': '(0.72%)',
      'hi': '',
    },
    'u8bqsmkq': {
      'en': 'Top Gainers',
      'hi': '',
    },
    'ylbr3ic4': {
      'en': 'See more',
      'hi': '',
    },
    'zaw16hvt': {
      'en': 'Large',
      'hi': '',
    },
    'l9p7dzp6': {
      'en': 'Mid',
      'hi': '',
    },
    'z4xokvsl': {
      'en': 'Small',
      'hi': '',
    },
    'v0lhxsj8': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '8i2d6lnl': {
      'en': '₹12.95',
      'hi': '',
    },
    'q65edx6g': {
      'en': '0.00',
      'hi': '',
    },
    '06k4ejcc': {
      'en': '(0.72%)',
      'hi': '',
    },
    '2mwk6tq0': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'pdtfsllr': {
      'en': '₹12.95',
      'hi': '',
    },
    '0zzmyztq': {
      'en': '0.00',
      'hi': '',
    },
    'u97lu3jr': {
      'en': '(0.72%)',
      'hi': '',
    },
    'ate72smp': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'nj19ejq7': {
      'en': '₹12.95',
      'hi': '',
    },
    '2g5ke9zo': {
      'en': '0.00',
      'hi': '',
    },
    'z4995niy': {
      'en': '(0.72%)',
      'hi': '',
    },
    'get7dsdd': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'g23dj6gm': {
      'en': '₹12.95',
      'hi': '',
    },
    'z9gx5pw1': {
      'en': '0.00',
      'hi': '',
    },
    'dsdyh1id': {
      'en': '(0.72%)',
      'hi': '',
    },
    'cp3p8rnx': {
      'en': 'Stocks in News',
      'hi': '',
    },
    '86qqfuxj': {
      'en': 'News',
      'hi': '',
    },
    'hswbjoei': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '6x7w95fg': {
      'en': '₹12.95',
      'hi': '',
    },
    '8m1dcpod': {
      'en': '0.00',
      'hi': '',
    },
    'ce7n9xdn': {
      'en': '(0.72%)',
      'hi': '',
    },
    'dmxl6ihv': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'nfywdi7m': {
      'en': '₹12.95',
      'hi': '',
    },
    'ekukirs8': {
      'en': '0.00',
      'hi': '',
    },
    '2g2ploum': {
      'en': '(0.72%)',
      'hi': '',
    },
    'ju988s4k': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'md4ab4kb': {
      'en': '₹12.95',
      'hi': '',
    },
    'o7n7l933': {
      'en': '0.00',
      'hi': '',
    },
    'ix0uqnzc': {
      'en': '(0.72%)',
      'hi': '',
    },
    '6jnphw3w': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'tf8cwkw7': {
      'en': '₹12.95',
      'hi': '',
    },
    'emo05bju': {
      'en': '0.00',
      'hi': '',
    },
    '2hif9lp1': {
      'en': '(0.72%)',
      'hi': '',
    },
    '5tzpeg4l': {
      'en': 'Top Losers',
      'hi': '',
    },
    'lu32yx4q': {
      'en': 'See more',
      'hi': '',
    },
    '9m009rd6': {
      'en': 'Large',
      'hi': '',
    },
    'w1fws1pc': {
      'en': 'Mid',
      'hi': '',
    },
    'x9n08p5a': {
      'en': 'Small',
      'hi': '',
    },
    'qu7w49fb': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'jc25s2vj': {
      'en': '₹12.95',
      'hi': '',
    },
    'v56v3okq': {
      'en': '0.00',
      'hi': '',
    },
    '87vhlv5e': {
      'en': '(0.72%)',
      'hi': '',
    },
    '1rr0qb2e': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '3wrku5qd': {
      'en': '₹12.95',
      'hi': '',
    },
    'lomrswcx': {
      'en': '0.00',
      'hi': '',
    },
    'wqkl7z53': {
      'en': '(0.72%)',
      'hi': '',
    },
    'dwqq7k6u': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'yalvaxis': {
      'en': '₹12.95',
      'hi': '',
    },
    '50uuqo6l': {
      'en': '0.00',
      'hi': '',
    },
    'vme84f74': {
      'en': '(0.72%)',
      'hi': '',
    },
    '1xy90yii': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '678uljfi': {
      'en': '₹12.95',
      'hi': '',
    },
    'anb5okf3': {
      'en': '0.00',
      'hi': '',
    },
    'ml0mppxi': {
      'en': '(0.72%)',
      'hi': '',
    },
    '2mhr76s2': {
      'en': 'Top Sectors',
      'hi': '',
    },
    '1caugqz7': {
      'en': 'See more',
      'hi': '',
    },
    'k5woij5c': {
      'en': 'Banking',
      'hi': '',
    },
    'rjfg4bu2': {
      'en': '37',
      'hi': '',
    },
    'of62za38': {
      'en': 'Banking',
      'hi': '',
    },
    'ip49p7kv': {
      'en': '37',
      'hi': '',
    },
    'ywpxykr7': {
      'en': 'Banking',
      'hi': '',
    },
    'rzd5uwgn': {
      'en': '37',
      'hi': '',
    },
    'uzcr04qk': {
      'en': 'Banking',
      'hi': '',
    },
    'huhli0py': {
      'en': '37',
      'hi': '',
    },
    'his6i9r0': {
      'en': 'Banking',
      'hi': '',
    },
    '9tzbem8c': {
      'en': '37',
      'hi': '',
    },
    '9jr37ikj': {
      'en': 'Banking',
      'hi': '',
    },
    'ddielr42': {
      'en': '37',
      'hi': '',
    },
    'ijb3j2ic': {
      'en': 'Top by Market Cap',
      'hi': '',
    },
    'b0ehjmj7': {
      'en': 'See more',
      'hi': '',
    },
    'gg1hm5o9': {
      'en': 'Company',
      'hi': '',
    },
    'x09u2zr3': {
      'en': 'Watchlist',
      'hi': '',
    },
    'bi87jj78': {
      'en': 'Zomato',
      'hi': '',
    },
    'nv5640u9': {
      'en': '180 shares',
      'hi': '',
    },
    'j4wsuqhk': {
      'en': '₹ 38,546.56',
      'hi': '',
    },
    'wto4333r': {
      'en': '(₹ 37,546.56)',
      'hi': '',
    },
    '1bo5mhn8': {
      'en': 'Zomato',
      'hi': '',
    },
    'f3o1ffzq': {
      'en': '180 shares',
      'hi': '',
    },
    '475htm4e': {
      'en': '₹ 38,546.56',
      'hi': '',
    },
    'ud2xzntg': {
      'en': '(₹ 37,546.56)',
      'hi': '',
    },
    'jyogm5ye': {
      'en': 'Zomato',
      'hi': '',
    },
    '0giaavx8': {
      'en': '180 shares',
      'hi': '',
    },
    'rn7ue48g': {
      'en': '₹ 38,546.56',
      'hi': '',
    },
    'aqniboyg': {
      'en': '(₹ 37,546.56)',
      'hi': '',
    },
    '77hyxi27': {
      'en': '1',
      'hi': '',
    },
    'g6hg529f': {
      'en': '2',
      'hi': '',
    },
    'a1l969k3': {
      'en': '.',
      'hi': '',
    },
    'vv6le6wm': {
      'en': '.',
      'hi': '',
    },
    '3qd78fcg': {
      'en': '.',
      'hi': '',
    },
    '958q72xe': {
      'en': '5',
      'hi': '',
    },
    'tcwpfxfy': {
      'en': 'Your Investments',
      'hi': '',
    },
    'xpvpmvex': {
      'en': 'Dashboard',
      'hi': '',
    },
    '1fp0y8pa': {
      'en': '₹0',
      'hi': '',
    },
    'b7vtkuhq': {
      'en': 'Total Return',
      'hi': '',
    },
    '7a13kl4g': {
      'en': '₹0',
      'hi': '',
    },
    '1chb09uz': {
      'en': 'Current Value',
      'hi': '',
    },
    'tlrbvwdn': {
      'en': 'All watchlists',
      'hi': '',
    },
    'k37f7xj7': {
      'en': 'View all',
      'hi': '',
    },
    '6j7octm6': {
      'en': 'Harsh\'s Watchlist',
      'hi': '',
    },
    'i45gw65w': {
      'en': '1 items',
      'hi': '',
    },
    'om6mdy8n': {
      'en': 'Create new watchlist',
      'hi': '',
    },
    'stnw8r99': {
      'en': 'Trademirror',
      'hi': '',
    },
    'j5jdp72l': {
      'en': '1',
      'hi': '',
    },
    '8g61w14l': {
      'en': 'Copytrading',
      'hi': '',
    },
    'xn79xxk1': {
      'en': 'Paper Trading',
      'hi': '',
    },
    '2a4xdcub': {
      'en': 'Referral programs',
      'hi': '',
    },
    'k7a63ccb': {
      'en': 'contact',
      'hi': '',
    },
    'msu3mxts': {
      'en': 'Trademirror Copytrading',
      'hi': '',
    },
    'uxt96rf0': {
      'en': 'Paper trading',
      'hi': '',
    },
    'ozopwe39': {
      'en': 'MARKET OPENS AT 09:15 AM',
      'hi': '',
    },
    'yri6a1du': {
      'en': 'Index',
      'hi': '',
    },
    '35beikqh': {
      'en': 'All indices',
      'hi': '',
    },
    'tm5zvcrq': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    '2kngpzxw': {
      'en': '22,519.40',
      'hi': '',
    },
    '9hlixwjs': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'tll7k3pa': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'nyyvgp4p': {
      'en': '22,519.40',
      'hi': '',
    },
    'wzze4ucy': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'usabq41z': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'attu0bit': {
      'en': '22,519.40',
      'hi': '',
    },
    'n7or8zlt': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'xt31tqwo': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'gf3mznd6': {
      'en': '22,519.40',
      'hi': '',
    },
    'jci1fsi4': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    'f0xiuccp': {
      'en': 'NIFTY 50',
      'hi': '',
    },
    'ahdd3vn2': {
      'en': '22,519.40',
      'hi': '',
    },
    'gxrsmmwe': {
      'en': '-234.40 (1.03%)',
      'hi': '',
    },
    '3m0xrqc2': {
      'en': 'Most Bought on Trade mirror',
      'hi': '',
    },
    'vy7eu8b1': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'k4h1s0qm': {
      'en': '₹12.95',
      'hi': '',
    },
    'hnd7p26h': {
      'en': '0.00',
      'hi': '',
    },
    'ob42uaar': {
      'en': '(0.72%)',
      'hi': '',
    },
    'pmobk9uh': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '8x5tfw3d': {
      'en': '₹12.95',
      'hi': '',
    },
    '2ascvbbb': {
      'en': '0.00',
      'hi': '',
    },
    'e69icwma': {
      'en': '(0.72%)',
      'hi': '',
    },
    '1w4z4oi5': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'l9dggry3': {
      'en': '₹12.95',
      'hi': '',
    },
    '8x7p10av': {
      'en': '0.00',
      'hi': '',
    },
    '56dpvpc1': {
      'en': '(0.72%)',
      'hi': '',
    },
    '65ebls8x': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'o0w27s36': {
      'en': '₹12.95',
      'hi': '',
    },
    '7rpj0mvz': {
      'en': '0.00',
      'hi': '',
    },
    '2h6su048': {
      'en': '(0.72%)',
      'hi': '',
    },
    'h61nmowy': {
      'en': 'Top Gainers',
      'hi': '',
    },
    'gz9abzco': {
      'en': 'See more',
      'hi': '',
    },
    'rcgvtyuy': {
      'en': 'Large',
      'hi': '',
    },
    'aettchzq': {
      'en': 'Mid',
      'hi': '',
    },
    '1l3qwpmu': {
      'en': 'Small',
      'hi': '',
    },
    'zleedrxm': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '7i0neaih': {
      'en': '₹12.95',
      'hi': '',
    },
    'j5eehd9a': {
      'en': '0.00',
      'hi': '',
    },
    '9qnyguxw': {
      'en': '(0.72%)',
      'hi': '',
    },
    'ijf4ouq7': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '5287eudo': {
      'en': '₹12.95',
      'hi': '',
    },
    '1vw2pv6z': {
      'en': '0.00',
      'hi': '',
    },
    'q4qegmw0': {
      'en': '(0.72%)',
      'hi': '',
    },
    'ptkmmqmh': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'zbcov477': {
      'en': '₹12.95',
      'hi': '',
    },
    '004nezzq': {
      'en': '0.00',
      'hi': '',
    },
    'wedqkwzs': {
      'en': '(0.72%)',
      'hi': '',
    },
    'de8zgoeh': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '6u62lvh9': {
      'en': '₹12.95',
      'hi': '',
    },
    'tcqpl7pn': {
      'en': '0.00',
      'hi': '',
    },
    '8xjhik50': {
      'en': '(0.72%)',
      'hi': '',
    },
    '4in3hsor': {
      'en': 'Stocks in News',
      'hi': '',
    },
    '0040mbzt': {
      'en': 'News',
      'hi': '',
    },
    'gmn3qlum': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'xvh6bk39': {
      'en': '₹12.95',
      'hi': '',
    },
    '1tos3bqx': {
      'en': '0.00',
      'hi': '',
    },
    'ric3kxqd': {
      'en': '(0.72%)',
      'hi': '',
    },
    'zk9s41gr': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '73rb01x8': {
      'en': '₹12.95',
      'hi': '',
    },
    'xmbc322f': {
      'en': '0.00',
      'hi': '',
    },
    'm52t1bld': {
      'en': '(0.72%)',
      'hi': '',
    },
    'j86n95jz': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'sgnab3oc': {
      'en': '₹12.95',
      'hi': '',
    },
    'smvv1n90': {
      'en': '0.00',
      'hi': '',
    },
    '3dhudmte': {
      'en': '(0.72%)',
      'hi': '',
    },
    'e28b6kx9': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '6l0ubbvk': {
      'en': '₹12.95',
      'hi': '',
    },
    'si2am4k7': {
      'en': '0.00',
      'hi': '',
    },
    'bdardwti': {
      'en': '(0.72%)',
      'hi': '',
    },
    'xp5jqfvw': {
      'en': 'Top Losers',
      'hi': '',
    },
    'tl6t6hz5': {
      'en': 'See more',
      'hi': '',
    },
    '3640ecaz': {
      'en': 'Large',
      'hi': '',
    },
    '3e8kvy55': {
      'en': 'Mid',
      'hi': '',
    },
    'byvr80f5': {
      'en': 'Small',
      'hi': '',
    },
    'txoc0rbw': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'hpubynn0': {
      'en': '₹12.95',
      'hi': '',
    },
    '40v87mri': {
      'en': '0.00',
      'hi': '',
    },
    'fphkg7sf': {
      'en': '(0.72%)',
      'hi': '',
    },
    'fh35r173': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'ij7kknns': {
      'en': '₹12.95',
      'hi': '',
    },
    'brnb8lhp': {
      'en': '0.00',
      'hi': '',
    },
    'tu91cn44': {
      'en': '(0.72%)',
      'hi': '',
    },
    'ldcwb4bm': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'g0nrvn1o': {
      'en': '₹12.95',
      'hi': '',
    },
    '474rst4w': {
      'en': '0.00',
      'hi': '',
    },
    '43cble87': {
      'en': '(0.72%)',
      'hi': '',
    },
    'b8wbj686': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'uxkxve2g': {
      'en': '₹12.95',
      'hi': '',
    },
    'hp7xrvhr': {
      'en': '0.00',
      'hi': '',
    },
    'l9lejn1e': {
      'en': '(0.72%)',
      'hi': '',
    },
    '8bnue9kg': {
      'en': 'Top Sectors',
      'hi': '',
    },
    'gmst6zqh': {
      'en': 'See more',
      'hi': '',
    },
    '9nru3aaw': {
      'en': 'Banking',
      'hi': '',
    },
    '2b14xyat': {
      'en': '37',
      'hi': '',
    },
    '2jf10d2g': {
      'en': 'Banking',
      'hi': '',
    },
    '05f176zv': {
      'en': '37',
      'hi': '',
    },
    'ojeb6nr7': {
      'en': 'Banking',
      'hi': '',
    },
    'licrbp2p': {
      'en': '37',
      'hi': '',
    },
    '2u4jl1l2': {
      'en': 'Banking',
      'hi': '',
    },
    'tw226l3z': {
      'en': '37',
      'hi': '',
    },
    'gi3qdzm1': {
      'en': 'Banking',
      'hi': '',
    },
    'p0e5mvby': {
      'en': '37',
      'hi': '',
    },
    '4fzvehxt': {
      'en': 'Banking',
      'hi': '',
    },
    'kvzgv7xo': {
      'en': '37',
      'hi': '',
    },
    'eyuqkkg8': {
      'en': 'Top by Market Cap',
      'hi': '',
    },
    'syshmchm': {
      'en': 'See more',
      'hi': '',
    },
    'qx99tm5a': {
      'en': 'Company',
      'hi': '',
    },
    '09icqmsi': {
      'en': 'Watchlist',
      'hi': '',
    },
    '04eidxra': {
      'en': 'Zomato',
      'hi': '',
    },
    'r27a8rni': {
      'en': '180 shares',
      'hi': '',
    },
    'q3gdx5k9': {
      'en': '₹ 38,546.56',
      'hi': '',
    },
    'qly5im0l': {
      'en': '(₹ 37,546.56)',
      'hi': '',
    },
    'j3ept493': {
      'en': 'Zomato',
      'hi': '',
    },
    'spa3jp7j': {
      'en': '180 shares',
      'hi': '',
    },
    'k3tds3g2': {
      'en': '₹ 38,546.56',
      'hi': '',
    },
    'rlupvvdz': {
      'en': '(₹ 37,546.56)',
      'hi': '',
    },
    '848wr9iz': {
      'en': 'Zomato',
      'hi': '',
    },
    'egcbrq0s': {
      'en': '180 shares',
      'hi': '',
    },
    'ha0yildd': {
      'en': '₹ 38,546.56',
      'hi': '',
    },
    'idh7o4db': {
      'en': '(₹ 37,546.56)',
      'hi': '',
    },
    'rl3ot7df': {
      'en': '1',
      'hi': '',
    },
    '8r5glhv8': {
      'en': '2',
      'hi': '',
    },
    'nt1ybvfz': {
      'en': '.',
      'hi': '',
    },
    'tmh0qf3v': {
      'en': '.',
      'hi': '',
    },
    '1obac8e4': {
      'en': '.',
      'hi': '',
    },
    'xh8z1eii': {
      'en': '5',
      'hi': '',
    },
    '4o9ow01d': {
      'en': 'Home',
      'hi': '',
    },
  },
  // PaperTradingwebCopy
  {
    'o7267ynh': {
      'en': 'Trademirror',
      'hi': '',
    },
    'xftxawds': {
      'en': 'Copytrading',
      'hi': '',
    },
    'o5r28zkt': {
      'en': 'Paper Trading',
      'hi': '',
    },
    'emvqx4nl': {
      'en': 'Referral programs',
      'hi': '',
    },
    'yug1hnbb': {
      'en': 'contact',
      'hi': '',
    },
    '4hswz7pz': {
      'en': '1',
      'hi': '',
    },
    'hkqlq1z4': {
      'en': 'Create Alert',
      'hi': '',
    },
    'x30bo7os': {
      'en': 'Watchlist',
      'hi': '',
    },
    'cf82upch': {
      'en': 'Reliance Industries',
      'hi': '',
    },
    'nig85pgs': {
      'en': '₹163.50',
      'hi': '',
    },
    'zperqt27': {
      'en': '+16.85 (0.57%)',
      'hi': '',
    },
    '0cea5yxz': {
      'en': '1D',
      'hi': '',
    },
    '0mrufy9a': {
      'en': 'Option Chain',
      'hi': '',
    },
    'myomvmye': {
      'en': 'Financial Services',
      'hi': '',
    },
    'jhj6fr9k': {
      'en': 'NSE',
      'hi': '',
    },
    'ovn9pwjt': {
      'en': '1D',
      'hi': '',
    },
    'huk9yihw': {
      'en': '1W',
      'hi': '',
    },
    'lhc4gbl6': {
      'en': '1M',
      'hi': '',
    },
    'bvi69dom': {
      'en': '1Y',
      'hi': '',
    },
    'wx6ylvsv': {
      'en': '5Y',
      'hi': '',
    },
    'recotkrh': {
      'en': 'All',
      'hi': '',
    },
    'zeiw903j': {
      'en': 'Overview',
      'hi': '',
    },
    '0y2s7ud9': {
      'en': 'Performance',
      'hi': '',
    },
    'zb4peqsn': {
      'en': 'Today’s low',
      'hi': '',
    },
    'y42zretn': {
      'en': '₹143.50',
      'hi': '',
    },
    'vx0ijt97': {
      'en': 'Today’s High',
      'hi': '',
    },
    '4oxdo3p0': {
      'en': '₹153.50',
      'hi': '',
    },
    'wudd54s1': {
      'en': '52W Low',
      'hi': '',
    },
    '33p07ur0': {
      'en': '2,111.68',
      'hi': '',
    },
    'b3uhpd84': {
      'en': '52W High',
      'hi': '',
    },
    'thzugjhe': {
      'en': '3,024.90',
      'hi': '',
    },
    'vftf2skx': {
      'en': 'Open',
      'hi': '',
    },
    '4hud7a5f': {
      'en': '2,922.00',
      'hi': '',
    },
    'bzn5t2kd': {
      'en': 'Prev. Close',
      'hi': '',
    },
    'igtjq356': {
      'en': '2,934.30',
      'hi': '',
    },
    '5pex33hx': {
      'en': 'Volume',
      'hi': '',
    },
    '8h7xk0ne': {
      'en': '47,51,963',
      'hi': '',
    },
    '5u83jz85': {
      'en': 'Open',
      'hi': '',
    },
    'v02cf91f': {
      'en': '2,922.00',
      'hi': '',
    },
    'bf62bd1m': {
      'en': 'Upper Circuit',
      'hi': '',
    },
    'ady1yf0c': {
      'en': '3,227.70',
      'hi': '',
    },
    'ddkr2vtd': {
      'en': 'Lower Circuit',
      'hi': '',
    },
    'esjrvsbc': {
      'en': '2,640.90',
      'hi': '',
    },
    'gs225p2r': {
      'en': 'Market Depth',
      'hi': '',
    },
    'qdvea3m8': {
      'en': 'Buy order quantity',
      'hi': '',
    },
    'y1pbq57q': {
      'en': 'Sell order quantity',
      'hi': '',
    },
    'mifhcsb6': {
      'en': '41.87%',
      'hi': '',
    },
    'shqrlfp6': {
      'en': '58.13%',
      'hi': '',
    },
    '2z66e7sm': {
      'en': 'Bid Price',
      'hi': '',
    },
    'vpgp01jw': {
      'en': '2,951.15',
      'hi': '',
    },
    '8vxd76sn': {
      'en': '2,951.00',
      'hi': '',
    },
    'a7nhhq95': {
      'en': '2,950.95',
      'hi': '',
    },
    'w7p5xv7t': {
      'en': '2,950.90',
      'hi': '',
    },
    'wo0dj22e': {
      'en': '2,950.85',
      'hi': '',
    },
    '39uzcpuw': {
      'en': 'Bid Total',
      'hi': '',
    },
    'qhvhflhe': {
      'en': 'Qty',
      'hi': '',
    },
    'ldbqggfy': {
      'en': '96',
      'hi': '',
    },
    'fh72c1qk': {
      'en': '888',
      'hi': '',
    },
    'kgxdqj5q': {
      'en': '2',
      'hi': '',
    },
    'cx468s2a': {
      'en': '77',
      'hi': '',
    },
    'se87gn1p': {
      'en': '1',
      'hi': '',
    },
    'ez09cb7o': {
      'en': '2,20,427',
      'hi': '',
    },
    'asebxpd6': {
      'en': 'Ask Price',
      'hi': '',
    },
    'd6zecy5v': {
      'en': '2,951.20',
      'hi': '',
    },
    'wecxu63w': {
      'en': '2,951.40',
      'hi': '',
    },
    '56g4dku9': {
      'en': '2,951.45',
      'hi': '',
    },
    'mjui4ds0': {
      'en': '2,951.90',
      'hi': '',
    },
    'tehb8pq4': {
      'en': '2,951.95',
      'hi': '',
    },
    'ogwmr2u6': {
      'en': 'Bid Total',
      'hi': '',
    },
    '1ncfb94g': {
      'en': 'Qty',
      'hi': '',
    },
    'wtlw7psp': {
      'en': '96',
      'hi': '',
    },
    '8gvfzqot': {
      'en': '250',
      'hi': '',
    },
    's5rr403l': {
      'en': '14',
      'hi': '',
    },
    '05590jnm': {
      'en': '19',
      'hi': '',
    },
    'rd4y3vqv': {
      'en': '21',
      'hi': '',
    },
    'w0rvbf7l': {
      'en': '3,06,022',
      'hi': '',
    },
    'esaqhl5l': {
      'en': 'Analyst Estimates',
      'hi': '',
    },
    'blk2654l': {
      'en': '78%',
      'hi': '',
    },
    '2e6rqr2h': {
      'en': 'Buy',
      'hi': '',
    },
    'u17k8h11': {
      'en': '78%',
      'hi': '',
    },
    'bc5x9kgl': {
      'en': 'Hold',
      'hi': '',
    },
    'voka0bdl': {
      'en': '12%',
      'hi': '',
    },
    'avra9v0x': {
      'en': 'Sell',
      'hi': '',
    },
    'fr0dtwyi': {
      'en': '9%',
      'hi': '',
    },
    'urmiswvi': {
      'en': 'Aggregated by Refinitiv from 32 Analysts',
      'hi': '',
    },
    'g5bx0eaf': {
      'en': 'Market Depth',
      'hi': '',
    },
    'lo1g2bxk': {
      'en': 'Market Cap',
      'hi': '',
    },
    '6ng8dlgl': {
      'en': 'P/E Ratio(TTM)',
      'hi': '',
    },
    '06r910oj': {
      'en': 'P/B Ratio',
      'hi': '',
    },
    'ji1zyryj': {
      'en': 'Industry P/E',
      'hi': '',
    },
    'aqm1j6lz': {
      'en': 'Debt to Equity',
      'hi': '',
    },
    'j5o6uqsa': {
      'en': '₹19,85,797Cr',
      'hi': '',
    },
    'kv287cbb': {
      'en': '28.38',
      'hi': '',
    },
    'qt9gcbdg': {
      'en': '2.64',
      'hi': '',
    },
    'l2btpp90': {
      'en': '14.43',
      'hi': '',
    },
    'hu3hg0pf': {
      'en': '0.42',
      'hi': '',
    },
    'bos594h8': {
      'en': 'Understand Fundamentals',
      'hi': '',
    },
    'ane76uzr': {
      'en': 'ROE',
      'hi': '',
    },
    'wwsgaqtk': {
      'en': 'EPS(TTM)',
      'hi': '',
    },
    '8ygku6dx': {
      'en': 'Dividend Yield',
      'hi': '',
    },
    'u62fgcl6': {
      'en': 'Book Value',
      'hi': '',
    },
    '6i8u1xyo': {
      'en': 'Face Value',
      'hi': '',
    },
    '98uk4om0': {
      'en': '9.12%',
      'hi': '',
    },
    'a7926unz': {
      'en': '103.42',
      'hi': '',
    },
    'cvri7fzu': {
      'en': '0.31%',
      'hi': '',
    },
    '8nnpvj29': {
      'en': '1110.34',
      'hi': '',
    },
    'n3bcwp71': {
      'en': '10',
      'hi': '',
    },
    '6f57ccn9': {
      'en': 'Financials',
      'hi': '',
    },
    'o19br0lc': {
      'en': 'Revenue',
      'hi': '',
    },
    'ltcwyje4': {
      'en': 'Profit',
      'hi': '',
    },
    'ibudpj6w': {
      'en': 'Net Worth',
      'hi': '',
    },
    'l41w6dta': {
      'en': 'About Reliance Industries',
      'hi': '',
    },
    'wxw8b798': {
      'en':
          'Reliance Industries Limited is an India-based company, which is engaged in the activities of hydrocarbon exploration and production, petroleum refining and marketing, petrochemicals, advanced materials and composites, renewables (solar and hydrogen), retail and digital services. The Company\'s....Read More',
      'hi': '',
    },
    'ebi2f4cr': {
      'en': 'Parent Organisation',
      'hi': '',
    },
    '06gf1hms': {
      'en': 'Managing Director',
      'hi': '',
    },
    'g0lj11n7': {
      'en': 'Reliance Industries',
      'hi': '',
    },
    '15xf4elr': {
      'en': 'Shri. Mukesh Ambani',
      'hi': '',
    },
    'ey84f740': {
      'en': 'NSE Symbol',
      'hi': '',
    },
    'yq2l8sxt': {
      'en': 'RELIANCE',
      'hi': '',
    },
    'ihvp5enz': {
      'en': 'Shareholding Pattern',
      'hi': '',
    },
    '2erakvpg': {
      'en': 'Dec \'22',
      'hi': '',
    },
    '1u06z9vw': {
      'en': 'Mar \'23',
      'hi': '',
    },
    'cumdag76': {
      'en': 'Jun \'23',
      'hi': '',
    },
    '6sz179tb': {
      'en': 'Sep \'23',
      'hi': '',
    },
    '6qifrn47': {
      'en': 'Dec \'23',
      'hi': '',
    },
    'xd1as9dw': {
      'en': 'Promoters',
      'hi': '',
    },
    'kk7pcvcm': {
      'en': '50.30%',
      'hi': '',
    },
    'qhxyrtyh': {
      'en': 'Foreign Institutions',
      'hi': '',
    },
    'pnerbnaf': {
      'en': '22.14%',
      'hi': '',
    },
    'v7vj541z': {
      'en': 'Retail And Others',
      'hi': '',
    },
    '24un593r': {
      'en': '10.89%',
      'hi': '',
    },
    'cfh1fey9': {
      'en': 'See More',
      'hi': '',
    },
    'p3gqp993': {
      'en': 'Similar Stocks',
      'hi': '',
    },
    'nkfqe619': {
      'en': 'COMPANY',
      'hi': '',
    },
    '4arms3w0': {
      'en': '52 week',
      'hi': '',
    },
    '7stg8a1l': {
      'en': 'P/E Ratio',
      'hi': '',
    },
    'y3jazl5w': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    'aagtzepz': {
      'en': '₹168.10',
      'hi': '',
    },
    'gpomsrvp': {
      'en': '(-1.23%)',
      'hi': '',
    },
    '3fptts0o': {
      'en': '5.13',
      'hi': '',
    },
    'x2qzz46u': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    '3ttc12dp': {
      'en': '₹168.10',
      'hi': '',
    },
    'cu8h5ftt': {
      'en': '(-1.23%)',
      'hi': '',
    },
    '0rr3xrqs': {
      'en': '5.13',
      'hi': '',
    },
    'rvfhtmbe': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    '05q78cn1': {
      'en': '₹168.10',
      'hi': '',
    },
    'k2hqu9wf': {
      'en': '(-1.23%)',
      'hi': '',
    },
    '9mrf5ex4': {
      'en': '5.13',
      'hi': '',
    },
    'ty1a8mkv': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    'xa9nuqqz': {
      'en': '₹168.10',
      'hi': '',
    },
    '9heompof': {
      'en': '(-1.23%)',
      'hi': '',
    },
    'ku4owgsc': {
      'en': '5.13',
      'hi': '',
    },
    'ybc9h5s7': {
      'en': 'Recently Viewed',
      'hi': '',
    },
    'lnulq5h7': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'glsmpte4': {
      'en': '₹12.95',
      'hi': '',
    },
    'hlv40mj9': {
      'en': '0.00',
      'hi': '',
    },
    'c58eztml': {
      'en': '(0.72%)',
      'hi': '',
    },
    '0x515egq': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'cvkwngsu': {
      'en': '₹12.95',
      'hi': '',
    },
    'y21s3duq': {
      'en': '0.00',
      'hi': '',
    },
    'ltp2jp3c': {
      'en': '(0.72%)',
      'hi': '',
    },
    'wvdnzdph': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'bzbw654f': {
      'en': '₹12.95',
      'hi': '',
    },
    'aqvgm89p': {
      'en': '0.00',
      'hi': '',
    },
    '3b1hfbtp': {
      'en': '(0.72%)',
      'hi': '',
    },
    'keb8rs0q': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'euk9mnhn': {
      'en': '₹12.95',
      'hi': '',
    },
    'v74ymeaa': {
      'en': '0.00',
      'hi': '',
    },
    'hdzpa8nk': {
      'en': '(0.72%)',
      'hi': '',
    },
    '26ylhrfm': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'tes23t2n': {
      'en': '₹12.95',
      'hi': '',
    },
    'a0zfxywv': {
      'en': '0.00',
      'hi': '',
    },
    '4uuv7vc1': {
      'en': '(0.72%)',
      'hi': '',
    },
    'ymtqfgvf': {
      'en': 'News',
      'hi': '',
    },
    '9ogl2h96': {
      'en': 'Tab View 2',
      'hi': '',
    },
    '68ene3az': {
      'en': 'Events',
      'hi': '',
    },
    'smpnpsa6': {
      'en': 'Tab View 3',
      'hi': '',
    },
    'j5ycdhl4': {
      'en': 'F&O',
      'hi': '',
    },
    'btkrpzpk': {
      'en': 'Tab View 4',
      'hi': '',
    },
    'zcq8xt48': {
      'en': 'Reliance Industries',
      'hi': '',
    },
    'f1bvx8h6': {
      'en': '₹2,951.15 (+0.57%)',
      'hi': '',
    },
    '8vsts9l5': {
      'en': 'Depth',
      'hi': '',
    },
    'kute837r': {
      'en': 'BUY',
      'hi': '',
    },
    'kjnf31wk': {
      'en': 'Delivery',
      'hi': '',
    },
    'jrolspv8': {
      'en': 'Intraday',
      'hi': '',
    },
    '6e406uju': {
      'en': 'Qty',
      'hi': '',
    },
    'xmrorus7': {
      'en': 'NSE',
      'hi': '',
    },
    '8kxm046m': {
      'en': 'Price',
      'hi': '',
    },
    'sw22c9m5': {
      'en': 'Market',
      'hi': '',
    },
    'f74vg71j': {
      'en': 'At Market',
      'hi': '',
    },
    'ughoc0ht': {
      'en': '₹2,951.15 (+0.57%)',
      'hi': '',
    },
    'uwg2sbav': {
      'en': 'Balance : ₹59,911',
      'hi': '',
    },
    '0r4vjrha': {
      'en': 'Required : ₹0',
      'hi': '',
    },
    'mfygezpa': {
      'en': 'BUY',
      'hi': '',
    },
    'sl3551s7': {
      'en': 'SELL',
      'hi': '',
    },
    'fm9img7b': {
      'en': 'Tab View 2',
      'hi': '',
    },
    '1bfe9unk': {
      'en': 'Trademirror',
      'hi': '',
    },
    '1ciit02w': {
      'en': 'Copytrading',
      'hi': '',
    },
    '63rgan2w': {
      'en': 'Paper Trading',
      'hi': '',
    },
    'awyyk5yd': {
      'en': 'Referral programs',
      'hi': '',
    },
    '9mfvbf39': {
      'en': 'contact',
      'hi': '',
    },
    'dt454u2c': {
      'en': '1',
      'hi': '',
    },
    'skk79ff0': {
      'en': 'Create Alert',
      'hi': '',
    },
    'mv9mpnuh': {
      'en': 'Watchlist',
      'hi': '',
    },
    'ha0qkvy2': {
      'en': 'Reliance Industries',
      'hi': '',
    },
    'bjpxauh9': {
      'en': '₹163.50',
      'hi': '',
    },
    'bdpa1uaf': {
      'en': '+16.85 (0.57%)',
      'hi': '',
    },
    '48ajnfj9': {
      'en': '1D',
      'hi': '',
    },
    '76j2issq': {
      'en': 'Option Chain',
      'hi': '',
    },
    'ivnebibq': {
      'en': 'Financial Services',
      'hi': '',
    },
    'owqb1zci': {
      'en': 'NSE',
      'hi': '',
    },
    'bfmv50m3': {
      'en': '1D',
      'hi': '',
    },
    'd9vuhykz': {
      'en': '1W',
      'hi': '',
    },
    '8oms9i12': {
      'en': '1M',
      'hi': '',
    },
    '7xzsbl82': {
      'en': '1Y',
      'hi': '',
    },
    'xelmgc4w': {
      'en': '5Y',
      'hi': '',
    },
    'a1i9qxci': {
      'en': 'All',
      'hi': '',
    },
    'uml9nzet': {
      'en': 'Overview',
      'hi': '',
    },
    'wtwgn7g5': {
      'en': 'Performance',
      'hi': '',
    },
    'tzrcjlqx': {
      'en': 'Today’s low',
      'hi': '',
    },
    'd215xdma': {
      'en': '₹143.50',
      'hi': '',
    },
    '7en2l0ow': {
      'en': 'Today’s High',
      'hi': '',
    },
    'gpeyb754': {
      'en': '₹153.50',
      'hi': '',
    },
    'nx0kdtyt': {
      'en': '52W Low',
      'hi': '',
    },
    'yzww1whl': {
      'en': '2,111.68',
      'hi': '',
    },
    '28fpwblp': {
      'en': '52W High',
      'hi': '',
    },
    't4k3gno2': {
      'en': '3,024.90',
      'hi': '',
    },
    'y8nrg35q': {
      'en': 'Open',
      'hi': '',
    },
    'ykrrhysl': {
      'en': '2,922.00',
      'hi': '',
    },
    '2y60xx6u': {
      'en': 'Prev. Close',
      'hi': '',
    },
    'bdvhsa62': {
      'en': '2,934.30',
      'hi': '',
    },
    '4lqu5h2s': {
      'en': 'Volume',
      'hi': '',
    },
    'mma3xiqj': {
      'en': '47,51,963',
      'hi': '',
    },
    '3jtgfw8v': {
      'en': 'Open',
      'hi': '',
    },
    '7r3aee32': {
      'en': '2,922.00',
      'hi': '',
    },
    'ipd5kg31': {
      'en': 'Upper Circuit',
      'hi': '',
    },
    '810aw88x': {
      'en': '3,227.70',
      'hi': '',
    },
    'z9lbk670': {
      'en': 'Lower Circuit',
      'hi': '',
    },
    'yyf8ilga': {
      'en': '2,640.90',
      'hi': '',
    },
    '4ap0q8j4': {
      'en': 'Market Depth',
      'hi': '',
    },
    'sxm9s82t': {
      'en': 'Buy order quantity',
      'hi': '',
    },
    'f3y98l9t': {
      'en': 'Sell order quantity',
      'hi': '',
    },
    'z56o3qvu': {
      'en': '41.87%',
      'hi': '',
    },
    'yfmpjmgm': {
      'en': '58.13%',
      'hi': '',
    },
    'd10qx40j': {
      'en': 'Bid Price',
      'hi': '',
    },
    'hes966gs': {
      'en': '2,951.15',
      'hi': '',
    },
    '687bocbn': {
      'en': '2,951.00',
      'hi': '',
    },
    '7kqffhdm': {
      'en': '2,950.95',
      'hi': '',
    },
    '76dbtqp1': {
      'en': '2,950.90',
      'hi': '',
    },
    'hjs2xypp': {
      'en': '2,950.85',
      'hi': '',
    },
    'bktsdsgk': {
      'en': 'Bid Total',
      'hi': '',
    },
    'pkbcfwpn': {
      'en': 'Qty',
      'hi': '',
    },
    'wjthr8cx': {
      'en': '96',
      'hi': '',
    },
    'i0pfs9y5': {
      'en': '888',
      'hi': '',
    },
    'ngwynufw': {
      'en': '2',
      'hi': '',
    },
    '4s9wbs08': {
      'en': '77',
      'hi': '',
    },
    'e3bvi77m': {
      'en': '1',
      'hi': '',
    },
    '5fmrg8kg': {
      'en': '2,20,427',
      'hi': '',
    },
    'ndb9g8s7': {
      'en': 'Ask Price',
      'hi': '',
    },
    '2dmvcgo0': {
      'en': '2,951.20',
      'hi': '',
    },
    'kg6m51bf': {
      'en': '2,951.40',
      'hi': '',
    },
    'j57ky6vo': {
      'en': '2,951.45',
      'hi': '',
    },
    'u7zajxbl': {
      'en': '2,951.90',
      'hi': '',
    },
    'jklcwtp8': {
      'en': '2,951.95',
      'hi': '',
    },
    'rgrms0u6': {
      'en': 'Bid Total',
      'hi': '',
    },
    'rg8f4tdw': {
      'en': 'Qty',
      'hi': '',
    },
    'xg8eqq73': {
      'en': '96',
      'hi': '',
    },
    'd7aaqrrm': {
      'en': '250',
      'hi': '',
    },
    '5d6gmnz0': {
      'en': '14',
      'hi': '',
    },
    'kfx3pc0i': {
      'en': '19',
      'hi': '',
    },
    'allbp8ie': {
      'en': '21',
      'hi': '',
    },
    '1jprm3sb': {
      'en': '3,06,022',
      'hi': '',
    },
    'sny4iy44': {
      'en': 'Analyst Estimates',
      'hi': '',
    },
    '6iopwly6': {
      'en': '78%',
      'hi': '',
    },
    '2s0yk7m9': {
      'en': 'Buy',
      'hi': '',
    },
    'i1i7kane': {
      'en': '78%',
      'hi': '',
    },
    'qk44u3et': {
      'en': 'Hold',
      'hi': '',
    },
    '1my7mnfu': {
      'en': '12%',
      'hi': '',
    },
    'dielwv07': {
      'en': 'Sell',
      'hi': '',
    },
    'qytwqptk': {
      'en': '9%',
      'hi': '',
    },
    '6t5ty2su': {
      'en': 'Aggregated by Refinitiv from 32 Analysts',
      'hi': '',
    },
    'lz5ntqwt': {
      'en': 'Market Depth',
      'hi': '',
    },
    'qf7jd56f': {
      'en': 'Market Cap',
      'hi': '',
    },
    'xmxizjui': {
      'en': 'P/E Ratio(TTM)',
      'hi': '',
    },
    'zow32xta': {
      'en': 'P/B Ratio',
      'hi': '',
    },
    '786x9juk': {
      'en': 'Industry P/E',
      'hi': '',
    },
    'vxmk3xeq': {
      'en': 'Debt to Equity',
      'hi': '',
    },
    '8cq0i2ce': {
      'en': '₹19,85,797Cr',
      'hi': '',
    },
    'e0l825gf': {
      'en': '28.38',
      'hi': '',
    },
    'ur8zfn45': {
      'en': '2.64',
      'hi': '',
    },
    'fss40tsa': {
      'en': '14.43',
      'hi': '',
    },
    '7kbdgqlx': {
      'en': '0.42',
      'hi': '',
    },
    'njtf6rli': {
      'en': 'Understand Fundamentals',
      'hi': '',
    },
    'v7voygh6': {
      'en': 'ROE',
      'hi': '',
    },
    '5n8c1k2o': {
      'en': 'EPS(TTM)',
      'hi': '',
    },
    'mwk4iaka': {
      'en': 'Dividend Yield',
      'hi': '',
    },
    'vf33umvy': {
      'en': 'Book Value',
      'hi': '',
    },
    '0phqyw9e': {
      'en': 'Face Value',
      'hi': '',
    },
    '6fzbswbk': {
      'en': '9.12%',
      'hi': '',
    },
    'we2dzq5i': {
      'en': '103.42',
      'hi': '',
    },
    'db4ipq5e': {
      'en': '0.31%',
      'hi': '',
    },
    'bwakll7h': {
      'en': '1110.34',
      'hi': '',
    },
    'zyduwlxy': {
      'en': '10',
      'hi': '',
    },
    '9deozmzg': {
      'en': 'Financials',
      'hi': '',
    },
    'sx8h3da9': {
      'en': 'Revenue',
      'hi': '',
    },
    'b6xowp0q': {
      'en': 'Profit',
      'hi': '',
    },
    'aday5ima': {
      'en': 'Net Worth',
      'hi': '',
    },
    'c3xnixlj': {
      'en': 'About Reliance Industries',
      'hi': '',
    },
    'b5og01sp': {
      'en':
          'Reliance Industries Limited is an India-based company, which is engaged in the activities of hydrocarbon exploration and production, petroleum refining and marketing, petrochemicals, advanced materials and composites, renewables (solar and hydrogen), retail and digital services. The Company\'s....Read More',
      'hi': '',
    },
    'yik38jih': {
      'en': 'Parent Organisation',
      'hi': '',
    },
    'pblx6vss': {
      'en': 'Managing Director',
      'hi': '',
    },
    'k8x6n7rz': {
      'en': 'Reliance Industries',
      'hi': '',
    },
    'ys30uzei': {
      'en': 'Shri. Mukesh Ambani',
      'hi': '',
    },
    'adlj4qyj': {
      'en': 'NSE Symbol',
      'hi': '',
    },
    '33es3hj1': {
      'en': 'RELIANCE',
      'hi': '',
    },
    '3kqggw27': {
      'en': 'Shareholding Pattern',
      'hi': '',
    },
    'b03zim64': {
      'en': 'Dec \'22',
      'hi': '',
    },
    'cpjb9r1n': {
      'en': 'Mar \'23',
      'hi': '',
    },
    'lsce66v8': {
      'en': 'Jun \'23',
      'hi': '',
    },
    'qxqea7rb': {
      'en': 'Sep \'23',
      'hi': '',
    },
    'r86i4t1v': {
      'en': 'Dec \'23',
      'hi': '',
    },
    'hwwe5wdy': {
      'en': 'Promoters',
      'hi': '',
    },
    'fppkxdad': {
      'en': '50.30%',
      'hi': '',
    },
    'sd1q88qe': {
      'en': 'Foreign Institutions',
      'hi': '',
    },
    '5u0y9wox': {
      'en': '22.14%',
      'hi': '',
    },
    '89fz2vwt': {
      'en': 'Retail And Others',
      'hi': '',
    },
    'ztmzsjkk': {
      'en': '10.89%',
      'hi': '',
    },
    'ihvz3a6u': {
      'en': 'See More',
      'hi': '',
    },
    'eanv4n05': {
      'en': 'Similar Stocks',
      'hi': '',
    },
    'vxozt490': {
      'en': 'COMPANY',
      'hi': '',
    },
    '3m94qeq5': {
      'en': '52 week',
      'hi': '',
    },
    'gkplu32i': {
      'en': 'P/E Ratio',
      'hi': '',
    },
    'bqba3dsc': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    '31hr8ne4': {
      'en': '₹168.10',
      'hi': '',
    },
    'eqer5rnq': {
      'en': '(-1.23%)',
      'hi': '',
    },
    'y7lxyjcs': {
      'en': '5.13',
      'hi': '',
    },
    'xqh8nr2y': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    'tc8hsz74': {
      'en': '₹168.10',
      'hi': '',
    },
    'oz3uyl6g': {
      'en': '(-1.23%)',
      'hi': '',
    },
    '41dqnzi4': {
      'en': '5.13',
      'hi': '',
    },
    'ad6k4qkb': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    '16vl04ma': {
      'en': '₹168.10',
      'hi': '',
    },
    '5pxw9mfm': {
      'en': '(-1.23%)',
      'hi': '',
    },
    'eyo9uoih': {
      'en': '5.13',
      'hi': '',
    },
    '0zmbybvs': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    '6o2z0ye7': {
      'en': '₹168.10',
      'hi': '',
    },
    'k5tmqaao': {
      'en': '(-1.23%)',
      'hi': '',
    },
    'l4r7afez': {
      'en': '5.13',
      'hi': '',
    },
    '5505lumi': {
      'en': 'Recently Viewed',
      'hi': '',
    },
    '9x36rtpl': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '7u1z2tya': {
      'en': '₹12.95',
      'hi': '',
    },
    'gpyvdgy1': {
      'en': '0.00',
      'hi': '',
    },
    'wfyw40wb': {
      'en': '(0.72%)',
      'hi': '',
    },
    '39kc0t1r': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'ic9n9u9m': {
      'en': '₹12.95',
      'hi': '',
    },
    '8djtzv4t': {
      'en': '0.00',
      'hi': '',
    },
    '3ezm515a': {
      'en': '(0.72%)',
      'hi': '',
    },
    '7yhinlms': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    '5mzlsezf': {
      'en': '₹12.95',
      'hi': '',
    },
    'e0i57sf8': {
      'en': '0.00',
      'hi': '',
    },
    'ukaoqiwx': {
      'en': '(0.72%)',
      'hi': '',
    },
    'mjazg9ka': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'potkhrbv': {
      'en': '₹12.95',
      'hi': '',
    },
    'bsh2otoi': {
      'en': '0.00',
      'hi': '',
    },
    '9zm4iwy6': {
      'en': '(0.72%)',
      'hi': '',
    },
    'j5l9vhox': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'gk9mjfwe': {
      'en': '₹12.95',
      'hi': '',
    },
    'eiopk1c5': {
      'en': '0.00',
      'hi': '',
    },
    'ul8bc45r': {
      'en': '(0.72%)',
      'hi': '',
    },
    'h9ugs0bm': {
      'en': 'News',
      'hi': '',
    },
    'x0xf3t71': {
      'en': 'Tab View 2',
      'hi': '',
    },
    '25k1nlfn': {
      'en': 'Events',
      'hi': '',
    },
    'z01iwhkw': {
      'en': 'Tab View 3',
      'hi': '',
    },
    'cublz7ns': {
      'en': 'F&O',
      'hi': '',
    },
    'g362dml9': {
      'en': 'Tab View 4',
      'hi': '',
    },
    '1cyq9lm9': {
      'en': 'Reliance Industries',
      'hi': '',
    },
    '42ss78zf': {
      'en': '₹2,951.15 (+0.57%)',
      'hi': '',
    },
    'xsna7765': {
      'en': 'Depth',
      'hi': '',
    },
    'yofd7vh8': {
      'en': 'BUY',
      'hi': '',
    },
    '8kkuh0fr': {
      'en': 'Delivery',
      'hi': '',
    },
    'zllip8oq': {
      'en': 'Intraday',
      'hi': '',
    },
    '8psr697m': {
      'en': 'Qty',
      'hi': '',
    },
    'txk33909': {
      'en': 'NSE',
      'hi': '',
    },
    'kjmyxmrj': {
      'en': 'Price',
      'hi': '',
    },
    'o38rwuid': {
      'en': 'Market',
      'hi': '',
    },
    'w9zy5xse': {
      'en': 'At Market',
      'hi': '',
    },
    'yxakg5nm': {
      'en': '₹2,951.15 (+0.57%)',
      'hi': '',
    },
    'ali2lwzy': {
      'en': 'Balance : ₹59,911',
      'hi': '',
    },
    'd87iiij0': {
      'en': 'Required : ₹0',
      'hi': '',
    },
    '6rcqwfba': {
      'en': 'BUY',
      'hi': '',
    },
    '8b813rab': {
      'en': 'SELL',
      'hi': '',
    },
    'amyka60m': {
      'en': 'Tab View 2',
      'hi': '',
    },
    'uabojif1': {
      'en': 'Trademirror',
      'hi': '',
    },
    'equt5g1t': {
      'en': '1',
      'hi': '',
    },
    'ba1gxo98': {
      'en': 'Copytrading',
      'hi': '',
    },
    '4bc5n0ht': {
      'en': 'Paper Trading',
      'hi': '',
    },
    '3vonfa1e': {
      'en': 'Referral programs',
      'hi': '',
    },
    'w2wohm5g': {
      'en': 'contact',
      'hi': '',
    },
    '5i1lzwvp': {
      'en': 'Create Alert',
      'hi': '',
    },
    'okbbo2qt': {
      'en': 'Watchlist',
      'hi': '',
    },
    'qfdziizw': {
      'en': 'Reliance Industries',
      'hi': '',
    },
    'hzxab25d': {
      'en': '₹163.50',
      'hi': '',
    },
    '1homi35i': {
      'en': '+16.85 (0.57%)',
      'hi': '',
    },
    'lllqltc4': {
      'en': '1D',
      'hi': '',
    },
    'r2dgw33h': {
      'en': 'Option Chain',
      'hi': '',
    },
    'rrfj8jfh': {
      'en': 'Financial Services',
      'hi': '',
    },
    'ky3yvorn': {
      'en': 'NSE',
      'hi': '',
    },
    'oy6g3cv3': {
      'en': '1D',
      'hi': '',
    },
    'at916je0': {
      'en': '1W',
      'hi': '',
    },
    'i4xlg25v': {
      'en': '1M',
      'hi': '',
    },
    'jx0xpnra': {
      'en': '1Y',
      'hi': '',
    },
    '3o3q444g': {
      'en': '5Y',
      'hi': '',
    },
    'wdpfjisk': {
      'en': 'All',
      'hi': '',
    },
    '91tzzjte': {
      'en': 'Overview',
      'hi': '',
    },
    'tcc45uh5': {
      'en': 'Performance',
      'hi': '',
    },
    '9fa8r9uw': {
      'en': 'Today’s low',
      'hi': '',
    },
    'za0rjgey': {
      'en': '₹143.50',
      'hi': '',
    },
    'lf8o6fpn': {
      'en': 'Today’s High',
      'hi': '',
    },
    '3ljhmhnj': {
      'en': '₹153.50',
      'hi': '',
    },
    '3a62r03d': {
      'en': '52W Low',
      'hi': '',
    },
    '0uwrgldm': {
      'en': '2,111.68',
      'hi': '',
    },
    'eqbjgbac': {
      'en': '52W High',
      'hi': '',
    },
    '56c45ldn': {
      'en': '3,024.90',
      'hi': '',
    },
    '36qjp701': {
      'en': 'Open',
      'hi': '',
    },
    'el3xi46o': {
      'en': '2,922.00',
      'hi': '',
    },
    'rycwwqpe': {
      'en': 'Prev. Close',
      'hi': '',
    },
    'aec5nrxo': {
      'en': '2,934.30',
      'hi': '',
    },
    '161comts': {
      'en': 'Volume',
      'hi': '',
    },
    'hg4pucq1': {
      'en': '47,51,963',
      'hi': '',
    },
    '2pxwyyyq': {
      'en': 'Open',
      'hi': '',
    },
    'tm6x2tky': {
      'en': '2,922.00',
      'hi': '',
    },
    '1r9dy7wf': {
      'en': 'Upper Circuit',
      'hi': '',
    },
    'vwet53my': {
      'en': '3,227.70',
      'hi': '',
    },
    's6xmvo6z': {
      'en': 'Lower Circuit',
      'hi': '',
    },
    'yb1hgvl5': {
      'en': '2,640.90',
      'hi': '',
    },
    'y645xa71': {
      'en': 'Market Depth',
      'hi': '',
    },
    'j0scht1w': {
      'en': 'Buy order quantity',
      'hi': '',
    },
    'ac7d7ch3': {
      'en': 'Sell order quantity',
      'hi': '',
    },
    'g2gzstn0': {
      'en': '41.87%',
      'hi': '',
    },
    'a0xxou5a': {
      'en': '58.13%',
      'hi': '',
    },
    '0wol7nk3': {
      'en': 'Bid Price',
      'hi': '',
    },
    'gvgwm9fp': {
      'en': '2,951.15',
      'hi': '',
    },
    'a05avqk3': {
      'en': '2,951.00',
      'hi': '',
    },
    'qn6tww6e': {
      'en': '2,950.95',
      'hi': '',
    },
    'docfht5u': {
      'en': '2,950.90',
      'hi': '',
    },
    'p4ncbvjb': {
      'en': '2,950.85',
      'hi': '',
    },
    'm0grqd6s': {
      'en': 'Bid Total',
      'hi': '',
    },
    'd8672qps': {
      'en': 'Qty',
      'hi': '',
    },
    'etsiy7z4': {
      'en': '96',
      'hi': '',
    },
    'fls7o0j3': {
      'en': '888',
      'hi': '',
    },
    'i8i759kq': {
      'en': '2',
      'hi': '',
    },
    'cwj2nubr': {
      'en': '77',
      'hi': '',
    },
    'u88xoww5': {
      'en': '1',
      'hi': '',
    },
    'm4e7c9mz': {
      'en': '2,20,427',
      'hi': '',
    },
    'ed4vnorq': {
      'en': 'Ask Price',
      'hi': '',
    },
    '7ba6n31x': {
      'en': '2,951.20',
      'hi': '',
    },
    'ym56husu': {
      'en': '2,951.40',
      'hi': '',
    },
    'uof3jqc5': {
      'en': '2,951.45',
      'hi': '',
    },
    'g3ryqjwx': {
      'en': '2,951.90',
      'hi': '',
    },
    '55ua1r7o': {
      'en': '2,951.95',
      'hi': '',
    },
    '3jbky3n0': {
      'en': 'Bid Total',
      'hi': '',
    },
    'zw01ognn': {
      'en': 'Qty',
      'hi': '',
    },
    '2n7cp8rf': {
      'en': '96',
      'hi': '',
    },
    '8sox1ij1': {
      'en': '250',
      'hi': '',
    },
    'ecxs4gm3': {
      'en': '14',
      'hi': '',
    },
    'pfbadlcg': {
      'en': '19',
      'hi': '',
    },
    'l1jn9b29': {
      'en': '21',
      'hi': '',
    },
    'dhrbc8rv': {
      'en': '3,06,022',
      'hi': '',
    },
    'wjxz5f6e': {
      'en': 'Analyst Estimates',
      'hi': '',
    },
    'omdxaxzx': {
      'en': '78%',
      'hi': '',
    },
    'st0m0o7o': {
      'en': 'Buy',
      'hi': '',
    },
    'eo4bn773': {
      'en': '78%',
      'hi': '',
    },
    'kwzzna54': {
      'en': 'Hold',
      'hi': '',
    },
    'g0pgw06o': {
      'en': '12%',
      'hi': '',
    },
    '27frl972': {
      'en': 'Sell',
      'hi': '',
    },
    'pgfa2t15': {
      'en': '9%',
      'hi': '',
    },
    '45xg9zvu': {
      'en': 'Aggregated by Refinitiv from 32 Analysts',
      'hi': '',
    },
    'yrl9lgd1': {
      'en': 'Market Depth',
      'hi': '',
    },
    'm5pipjte': {
      'en': 'Market Cap',
      'hi': '',
    },
    'jhxuqtzt': {
      'en': 'P/E Ratio(TTM)',
      'hi': '',
    },
    'cmwujtpi': {
      'en': 'P/B Ratio',
      'hi': '',
    },
    'ntc9ihpi': {
      'en': 'Industry P/E',
      'hi': '',
    },
    'vtcy099y': {
      'en': 'Debt to Equity',
      'hi': '',
    },
    '6eosjx3q': {
      'en': '₹19,85,797Cr',
      'hi': '',
    },
    '3y1h7fjh': {
      'en': '28.38',
      'hi': '',
    },
    'hea4dzhs': {
      'en': '2.64',
      'hi': '',
    },
    'lj4ua8xu': {
      'en': '14.43',
      'hi': '',
    },
    'kj38vyeh': {
      'en': '0.42',
      'hi': '',
    },
    'ein1z04u': {
      'en': 'Understand Fundamentals',
      'hi': '',
    },
    'ayj4kelm': {
      'en': 'ROE',
      'hi': '',
    },
    'c2w8jm1i': {
      'en': 'EPS(TTM)',
      'hi': '',
    },
    'ktypnwec': {
      'en': 'Dividend Yield',
      'hi': '',
    },
    'kuuo5abg': {
      'en': 'Book Value',
      'hi': '',
    },
    '7m6rkf7s': {
      'en': 'Face Value',
      'hi': '',
    },
    '320kgvkm': {
      'en': '9.12%',
      'hi': '',
    },
    'wbs3km80': {
      'en': '103.42',
      'hi': '',
    },
    'tcfictfr': {
      'en': '0.31%',
      'hi': '',
    },
    'dvqu6ql2': {
      'en': '1110.34',
      'hi': '',
    },
    '509hly6a': {
      'en': '10',
      'hi': '',
    },
    'xgyebxwe': {
      'en': 'Financials',
      'hi': '',
    },
    'jzd7u8j9': {
      'en': 'Revenue',
      'hi': '',
    },
    'nn8xk7py': {
      'en': 'Profit',
      'hi': '',
    },
    'wgaw0xe1': {
      'en': 'Net Worth',
      'hi': '',
    },
    '1x6w9csz': {
      'en': 'About Reliance Industries',
      'hi': '',
    },
    'e81y87uk': {
      'en':
          'Reliance Industries Limited is an India-based company, which is engaged in the activities of hydrocarbon exploration and production, petroleum refining and marketing, petrochemicals, advanced materials and composites, renewables (solar and hydrogen), retail and digital services. The Company\'s....Read More',
      'hi': '',
    },
    'uf8vjru2': {
      'en': 'Parent Organisation',
      'hi': '',
    },
    'vzoiz6r6': {
      'en': 'Managing Director',
      'hi': '',
    },
    '6ymsstoy': {
      'en': 'Reliance Industries',
      'hi': '',
    },
    's3b2bzlt': {
      'en': 'Shri. Mukesh Ambani',
      'hi': '',
    },
    'y73g22hr': {
      'en': 'NSE Symbol',
      'hi': '',
    },
    'mu28ufjy': {
      'en': 'RELIANCE',
      'hi': '',
    },
    'vbmg6pud': {
      'en': 'Shareholding Pattern',
      'hi': '',
    },
    'um8ckttl': {
      'en': 'Dec \'22',
      'hi': '',
    },
    '23lecijm': {
      'en': 'Mar \'23',
      'hi': '',
    },
    '73jvun9z': {
      'en': 'Jun \'23',
      'hi': '',
    },
    'cohvpew4': {
      'en': 'Sep \'23',
      'hi': '',
    },
    'cmii17ld': {
      'en': 'Dec \'23',
      'hi': '',
    },
    'vmospqeb': {
      'en': 'Promoters',
      'hi': '',
    },
    'srxgr3gy': {
      'en': '50.30%',
      'hi': '',
    },
    'dbkeh7h6': {
      'en': 'Foreign Institutions',
      'hi': '',
    },
    'b9oda3bk': {
      'en': '22.14%',
      'hi': '',
    },
    'gx1hvh4v': {
      'en': 'Retail And Others',
      'hi': '',
    },
    'de5tjm1z': {
      'en': '10.89%',
      'hi': '',
    },
    'gerx7fuw': {
      'en': 'See More',
      'hi': '',
    },
    'jbsgc1py': {
      'en': 'Similar Stocks',
      'hi': '',
    },
    'xwhjr9ht': {
      'en': 'COMPANY',
      'hi': '',
    },
    'aheday1d': {
      'en': '52 week',
      'hi': '',
    },
    'pz5i1yje': {
      'en': 'P/E Ratio',
      'hi': '',
    },
    '6uozo9ii': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    '87sddsll': {
      'en': '₹168.10',
      'hi': '',
    },
    'rf6j6mhq': {
      'en': '(-1.23%)',
      'hi': '',
    },
    'iqm2p09h': {
      'en': '5.13',
      'hi': '',
    },
    'bhavwii5': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    'e3fdmifb': {
      'en': '₹168.10',
      'hi': '',
    },
    'djshttrl': {
      'en': '(-1.23%)',
      'hi': '',
    },
    '7xeytth4': {
      'en': '5.13',
      'hi': '',
    },
    '43atevms': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    'o5hr9vma': {
      'en': '₹168.10',
      'hi': '',
    },
    'dp8gvir4': {
      'en': '(-1.23%)',
      'hi': '',
    },
    'tm13henj': {
      'en': '5.13',
      'hi': '',
    },
    'ueg35u7k': {
      'en': 'Indian Oil Corporation',
      'hi': '',
    },
    'troinpi6': {
      'en': '₹168.10',
      'hi': '',
    },
    '2uk3e8g1': {
      'en': '(-1.23%)',
      'hi': '',
    },
    'fpauh96z': {
      'en': '5.13',
      'hi': '',
    },
    'n0kc5njt': {
      'en': 'Recently Viewed',
      'hi': '',
    },
    'ygeicfoy': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'yorqgsno': {
      'en': '₹12.95',
      'hi': '',
    },
    '8tzlu6ay': {
      'en': '0.00',
      'hi': '',
    },
    '4dzfhrmr': {
      'en': '(0.72%)',
      'hi': '',
    },
    'w19ryopa': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'vl6vs514': {
      'en': '₹12.95',
      'hi': '',
    },
    'k1foh7co': {
      'en': '0.00',
      'hi': '',
    },
    '045lq0yz': {
      'en': '(0.72%)',
      'hi': '',
    },
    'l01e45u5': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'x7t77bnb': {
      'en': '₹12.95',
      'hi': '',
    },
    '5m65t3nn': {
      'en': '0.00',
      'hi': '',
    },
    '7sv29r9c': {
      'en': '(0.72%)',
      'hi': '',
    },
    'kdjp0lrb': {
      'en': 'Vodafone Idea',
      'hi': '',
    },
    'ub2syssi': {
      'en': '₹12.95',
      'hi': '',
    },
    '98uoqx2r': {
      'en': '0.00',
      'hi': '',
    },
    'cziz17fw': {
      'en': '(0.72%)',
      'hi': '',
    },
    'zmgnfbap': {
      'en': 'News',
      'hi': '',
    },
    'lr3c7lrq': {
      'en': 'Tab View 2',
      'hi': '',
    },
    'o2mprp1o': {
      'en': 'Events',
      'hi': '',
    },
    'b7hi9nc1': {
      'en': 'Tab View 3',
      'hi': '',
    },
    '85il0wk2': {
      'en': 'F&O',
      'hi': '',
    },
    'tr4qwjvx': {
      'en': 'Tab View 4',
      'hi': '',
    },
    'uijlyq1d': {
      'en': 'Home',
      'hi': '',
    },
  },
  // bottomInfocompany
  {
    '1ixzgmnm': {
      'en': 'Company',
      'hi': '',
    },
    '91n0rp58': {
      'en': 'About us',
      'hi': '',
    },
    'kjureup7': {
      'en': 'Awards',
      'hi': '',
    },
    '0fdklpun': {
      'en': 'Contact us',
      'hi': '',
    },
    'mylh1mvn': {
      'en': 'Media',
      'hi': '',
    },
    '3n8yy46m': {
      'en': 'Company news',
      'hi': '',
    },
    'q61jtwd0': {
      'en': 'Videos',
      'hi': '',
    },
    'yd7mpy3w': {
      'en': 'Get the App',
      'hi': '',
    },
    'vhzz4svk': {
      'en': 'Copytrading App',
      'hi': '',
    },
    'l1pszbhv': {
      'en': 'GET IT ON',
      'hi': '',
    },
    'lxp3blih': {
      'en': 'Follow us',
      'hi': '',
    },
    '7mcpj5ua': {
      'en': 'Risk disclosure',
      'hi': '',
    },
    'dgg2p4cf': {
      'en': 'Privacy policy',
      'hi': '',
    },
    'a85gfg8u': {
      'en': 'Return policy',
      'hi': '',
    },
    'ne8hjwb7': {
      'en': 'Customer Agreement',
      'hi': '',
    },
    'kowvmv15': {
      'en': 'AML policy',
      'hi': '',
    },
    's73xy7si': {
      'en':
          '© 2024 Traddingmirror Markets Incorporated, registration number: 2023-00092. Contact e-mail: support@octafx.com. Registered address: 1st Floor, Meridian Place, Choc Estate, Castries, Saint Lucia.',
      'hi': '',
    },
  },
  // bottomInfocompanyTablet
  {
    '1nnfgl5c': {
      'en': 'Company',
      'hi': '',
    },
    '5zds7nqx': {
      'en': 'About us',
      'hi': '',
    },
    '86ich3k1': {
      'en': 'Awards',
      'hi': '',
    },
    '1ex8f1py': {
      'en': 'Contact us',
      'hi': '',
    },
    'sez1vm6p': {
      'en': 'Media',
      'hi': '',
    },
    'v8ko2by4': {
      'en': 'Company news',
      'hi': '',
    },
    'vrh3vuq8': {
      'en': 'Videos',
      'hi': '',
    },
    'puxu3203': {
      'en': 'Get the App',
      'hi': '',
    },
    'xsuvb2ys': {
      'en': 'Copytrading App',
      'hi': '',
    },
    'wkwyemei': {
      'en': 'GET IT ON',
      'hi': '',
    },
    'so29s9y9': {
      'en': 'Follow us',
      'hi': '',
    },
    'wwqffr31': {
      'en': 'Risk disclosure',
      'hi': '',
    },
    '58whv3wl': {
      'en': 'Privacy policy',
      'hi': '',
    },
    '7mge3zjn': {
      'en': 'Return policy',
      'hi': '',
    },
    'jaw9ehtn': {
      'en': 'Customer Agreement',
      'hi': '',
    },
    '93g5r17f': {
      'en': 'AML policy',
      'hi': '',
    },
    '6b4hkl87': {
      'en':
          '© 2024 Traddingmirror Markets Incorporated, registration number: 2023-00092. Contact e-mail: support@octafx.com. Registered address: 1st Floor, Meridian Place, Choc Estate, Castries, Saint Lucia.',
      'hi': '',
    },
  },
  // bottomInfocompanyPhone
  {
    'jffw6jot': {
      'en': 'Company',
      'hi': '',
    },
    'wqy5xm2l': {
      'en': 'About us',
      'hi': '',
    },
    'j3a8sin0': {
      'en': 'Awards',
      'hi': '',
    },
    'ar2icty7': {
      'en': 'Contact us',
      'hi': '',
    },
    '3dhjgvsj': {
      'en': 'Media',
      'hi': '',
    },
    'gm6o2ric': {
      'en': 'Company news',
      'hi': '',
    },
    'xo1dhl6y': {
      'en': 'Videos',
      'hi': '',
    },
    'nnlijhtp': {
      'en': 'Get the App',
      'hi': '',
    },
    '7g5su8j6': {
      'en': 'Copytrading App',
      'hi': '',
    },
    'ndiy480o': {
      'en': 'GET IT ON',
      'hi': '',
    },
    'qa0y77th': {
      'en': 'Follow us',
      'hi': '',
    },
    'snf1p958': {
      'en': 'Risk disclosure',
      'hi': '',
    },
    'hoq4luis': {
      'en': 'Privacy policy',
      'hi': '',
    },
    'bkfld784': {
      'en': 'Return policy',
      'hi': '',
    },
    'c60cwr9u': {
      'en': 'Customer Agreement',
      'hi': '',
    },
    'nh7m88p8': {
      'en': 'AML policy',
      'hi': '',
    },
    'vcg0l7i6': {
      'en':
          '© 2024 Traddingmirror Markets Incorporated, registration number: 2023-00092. Contact e-mail: support@octafx.com. Registered address: 1st Floor, Meridian Place, Choc Estate, Castries, Saint Lucia.',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'vxwii94f': {
      'en': '',
      'hi': '',
    },
    '9lspphrm': {
      'en': '',
      'hi': '',
    },
    'n29n69xs': {
      'en': '',
      'hi': '',
    },
    '4aqq1yby': {
      'en': '',
      'hi': '',
    },
    'hnhx41w3': {
      'en': '',
      'hi': '',
    },
    '3tpo4faa': {
      'en': '',
      'hi': '',
    },
    'n2i49dm4': {
      'en': '',
      'hi': '',
    },
    '9t8jh3va': {
      'en': '',
      'hi': '',
    },
    'is39exgm': {
      'en': '',
      'hi': '',
    },
    '45ljqit8': {
      'en': '',
      'hi': '',
    },
    'bles472g': {
      'en': '',
      'hi': '',
    },
    'rovxkih8': {
      'en': '',
      'hi': '',
    },
    '791infgf': {
      'en': '',
      'hi': '',
    },
    'f9w3udmf': {
      'en': '',
      'hi': '',
    },
    '1gbj5qm5': {
      'en': '',
      'hi': '',
    },
    '4rqvk9jp': {
      'en': '',
      'hi': '',
    },
    'd6xdhmel': {
      'en': '',
      'hi': '',
    },
    'z5mqvfaf': {
      'en': '',
      'hi': '',
    },
    'v6qow75m': {
      'en': '',
      'hi': '',
    },
    'h9udz7c3': {
      'en': '',
      'hi': '',
    },
    'rxh9nus1': {
      'en': '',
      'hi': '',
    },
    '2qy2cq7h': {
      'en': '',
      'hi': '',
    },
    'wqb9qa75': {
      'en': '',
      'hi': '',
    },
    'd94vz9xc': {
      'en': '',
      'hi': '',
    },
    '73m6b9mw': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
