'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "8320891a75318b513913a076caefce61",
"/": "8320891a75318b513913a076caefce61",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"main.dart.js": "800ed0b0bd9913df72018ee692338ad3",
"flutter_bootstrap.js": "e728f2a5dd5c82cc958885cb94879fc5",
"loader.css": "3ed0540af717cd56f01a37a08f714759",
"icons/android-icon-48x48.png": "b4f2a35e39ae52497613b0f64eda710d",
"icons/apple-icon-180x180.png": "5df36248cec25e44c7adf6501e8fc51f",
"icons/apple-icon-152x152.png": "4c608631c165cf64f67c71e1de2ad56c",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/android-icon-192x192.png": "017499f42b1152146d8c86810c48617c",
"icons/ms-icon-310x310.png": "11daa10b3f524e177acb5d8c72e6424a",
"icons/apple-icon-76x76.png": "37226a4aad4e5125a1ec0fd5f3b2d6e2",
"icons/apple-icon-precomposed.png": "9709d10e42b947aed488e57f28312386",
"icons/android-icon-144x144.png": "43a85ca7a9ba9776dd277d1ae0df1559",
"icons/ms-icon-150x150.png": "475ae1da73aefbec3c6b1a7d6000c3dd",
"icons/favicon.ico": "496daaf0aa5bca9a7ab28c42458202e8",
"icons/apple-icon-120x120.png": "8a44405b9c612069d11861c1087b7285",
"icons/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"icons/android-icon-96x96.png": "9f31ef5e786977771f892adb90f81828",
"icons/favicon-32x32.png": "89e5e2aad092c9fa5f42f27047757f1e",
"icons/apple-icon.png": "9709d10e42b947aed488e57f28312386",
"icons/apple-icon-57x57.png": "927ae48c56772fa93b102af43136441e",
"icons/ms-icon-144x144.png": "43a85ca7a9ba9776dd277d1ae0df1559",
"icons/apple-icon-114x114.png": "3ed8be7bfdc08800c3b1d58954a5d4f7",
"icons/apple-icon-60x60.png": "9d90bb842ba043d6dfb7dab45c0b4816",
"icons/favicon-96x96.png": "9f31ef5e786977771f892adb90f81828",
"icons/favicon-16x16.png": "8b6228794536962c47ef1a35e0ee4bb0",
"icons/apple-icon-144x144.png": "43a85ca7a9ba9776dd277d1ae0df1559",
"icons/ms-icon-70x70.png": "e5177dc449517337063255dbd431d083",
"icons/android-icon-36x36.png": "305a4082117081b4120fa5ef5cf58e3b",
"icons/apple-icon-72x72.png": "2ac00ea5887f12d2dcb64036a8cce176",
"icons/android-icon-72x72.png": "2ac00ea5887f12d2dcb64036a8cce176",
"manifest.json": "642675a94759415efb82802e3176dd85",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b93248a553f9e8bc17f1065929d5934b",
"assets/packages/iconsax/lib/assets/fonts/iconsax.ttf": "071d77779414a409552e0584dcbfd03d",
"assets/FontManifest.json": "3c6f2aec284ba6e927fd5e00fb6c4257",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/NOTICES": "236339ee1047cd87740bc8357819c0f8",
"assets/assets/icons/Figma.svg": "b09f3491d8787a7dcb4444f1fe39f84a",
"assets/assets/icons/Python.svg": "44e283fb59f24ff4bff06354d634c433",
"assets/assets/icons/Vite.svg": "2bb82f281234b7d5d799e2ec7d42d643",
"assets/assets/icons/Next.svg": "9c969b734f17536baff682e7ead20c97",
"assets/assets/icons/Flutter.svg": "29e4d321e6516e156e939f2c8b4ec587",
"assets/assets/icons/React.svg": "3e1041591c3f0e34edbb708e3e7e75e3",
"assets/assets/icons/Firebase.svg": "5369d1650450400914ca2a9921c68840",
"assets/assets/icons/Javascript.svg": "5f5efaa26e595d5742d27a5317821173",
"assets/assets/icons/Git.svg": "4a2ece93b07809767932461b4ce2458d",
"assets/assets/icons/Android-native.svg": "823ed65bbe12df861dd95a11a3c80e98",
"assets/assets/lottie/lottie_1.json": "58f395525a52ab9704ad13af485e8994",
"assets/assets/lottie/lottie_2.json": "bb70e9210a5e0cad0af8533ee349014b",
"assets/assets/lottie/lottie_3.json": "ce031b72130f752af8dbd01a905b2f30",
"assets/assets/images/Designer-Illustration.jpg": "18e39382af0ca0a1771e78f560ffcd65",
"assets/assets/images/tibebu.jpeg": "a4bc95961ffb64fd0407cf81569004b7",
"assets/assets/images/whatsapp.png": "426617ad28567da23a2346566d84b5a6",
"assets/assets/images/write.png": "dc4f0d3df06d5fc9b13b9168b88e2560",
"assets/assets/images/plan.png": "6aaec412d8837ac9a83f03f453877606",
"assets/assets/images/Mockup-Illustration.svg": "55f43554a8fc48ed5fbf09a60798bf7f",
"assets/assets/images/jeno.jpg": "f24ffdb8cc48af8823511653aec7160c",
"assets/assets/images/develop.png": "471c2c94d5d04112086eba9fd78c6809",
"assets/assets/images/mappin.png": "9cc090022ae31337336d2024160714b8",
"assets/assets/images/phone.png": "45903a1ffa9ede882171aca9f71c4c29",
"assets/assets/images/telegram.png": "092672824e667c742a147e2786fc022e",
"assets/assets/images/pixel_profile.png": "a06fe76231ce9e0f6d536058f3274c11",
"assets/assets/images/quote.png": "1a0aa9a06293ac5689bc32012e0e13e6",
"assets/assets/images/plus.png": "339e9c8ad846eb0967c3fbd41c4d5ee8",
"assets/assets/images/Mockup-Illustration.png": "f192730d8b580ee4ea52f31304201fa4",
"assets/assets/images/email.png": "5eb3c4b86aafbee72b8c471b29413a50",
"assets/assets/images/ios.png": "49f79e21da11e96b8cf0e3b8bef6616c",
"assets/assets/images/laptop.png": "fb49e3c0c36437239db5f8c114b03062",
"assets/assets/images/design.png": "2bd8adcad79a4ebb80888d1a0583b3c4",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.bin": "263ae86894f160c1f9b7aa6dc04b2908",
"assets/AssetManifest.json": "00cee42b499707600b2d934d9e59eddb",
"assets/AssetManifest.bin.json": "da0b070e6e6e393391a5cf7277b403cc",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"version.json": "bd341ba74d38c530da636604a427deda"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
