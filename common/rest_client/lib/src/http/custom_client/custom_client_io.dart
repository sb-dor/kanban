import 'package:cronet_http/cronet_http.dart' show CronetClient;
import 'package:cupertino_http/cupertino_http.dart' show CupertinoClient;
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform;
import 'package:http/http.dart' as http;

http.Client createCustomClient() {
  return switch (defaultTargetPlatform) {
    TargetPlatform.android => CronetClient.defaultCronetEngine(),
    TargetPlatform.iOS || TargetPlatform.macOS => CupertinoClient.defaultSessionConfiguration(),
    _ => http.Client(),
  };
}