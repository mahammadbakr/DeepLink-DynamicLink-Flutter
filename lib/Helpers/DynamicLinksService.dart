
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Future<Uri> createDeepLink() async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://nitl.page.link',
    link: Uri.parse('https://nitl.page.link/search?text=covid'),
    androidParameters: AndroidParameters(
      packageName: 'com.nitl.test_muhammad',
      minimumVersion: 1,
    ),
    iosParameters: IosParameters(
      bundleId: 'com.nitl.testMuhammad',
      minimumVersion: '1',
      appStoreId: '',
    ),
  );
  final link = await parameters.buildUrl();
  return link;
}