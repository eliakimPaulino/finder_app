'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "1e295fe0642788543e84d5c879e411a6",
"assets/AssetManifest.bin.json": "f942949ea83371663c07464e765e22b6",
"assets/AssetManifest.json": "22e2c32fe07c5905db601759267f7e50",
"assets/assets/data/components/components.json": "953e5c49e6501a2e32b45091221113d8",
"assets/assets/data/pep/pep_440_rev6.json": "361daeb1bc1b862eeff7115fd6239614",
"assets/assets/images/components/DTR0000028814.png": "5cffb049a0042d6d1ef4c87c6719eb42",
"assets/assets/images/components/DTR0000029087.png": "6b7c61da8ecfd60d30fa6b5896109e83",
"assets/assets/images/components/DTR0000030129.png": "0f1164feef8793d13f4c2fc68d8c89e8",
"assets/assets/images/components/DTR0000056452.png": "54f113f2046f3c92244191a545da4a50",
"assets/assets/images/components/DTR0000068378.png": "999ea7cf062961969d82bcf8645e36e3",
"assets/assets/images/components/DTR0000069162.png": "6ed9f205b14f30cfc56bd6d01c39dfd9",
"assets/assets/images/components/DTR0000072072.png": "c729690cee3ba5bddd3d268c71b18e17",
"assets/assets/images/components/DTR0000099072.png": "c729690cee3ba5bddd3d268c71b18e17",
"assets/assets/images/components/DTR0000120107.png": "6ed9f205b14f30cfc56bd6d01c39dfd9",
"assets/assets/images/components/DTR0000120152.png": "e8889d8846db8697eeaa9472fcc11c02",
"assets/assets/images/components/DTR0000139523.png": "6684fa9bef4a6e865c2222e1e6e6e05c",
"assets/assets/images/components/DTR0000139529.png": "d37a900ea2567310e46fc04258fc40d6",
"assets/assets/images/components/DTR0000139538.png": "7e4309625cc47eec4b8babce00fdc26e",
"assets/assets/images/components/DTR0000139541.png": "6684fa9bef4a6e865c2222e1e6e6e05c",
"assets/assets/images/components/DTR0000139774.png": "0f1164feef8793d13f4c2fc68d8c89e8",
"assets/assets/images/components/DTR0000204336.png": "999ea7cf062961969d82bcf8645e36e3",
"assets/assets/images/components/DTR0000243578.png": "0bc0fc1d44b37849bd96e768bca5d655",
"assets/assets/images/components/DTR0000263810.png": "3f28edc099a24012f71e532fb854d7d3",
"assets/assets/images/components/DTR0000312514.png": "6365774e6469103b84bb847a448ad5b0",
"assets/assets/images/components/DTR0000354451.png": "6418abd2ce49da7604c36284146c3428",
"assets/assets/images/components/DTR0000354452.png": "f1c37c61aaa241b289f4a9e399188836",
"assets/assets/images/components/DTR0000481308.png": "999ea7cf062961969d82bcf8645e36e3",
"assets/assets/images/components/DTR0000587526.png": "999ea7cf062961969d82bcf8645e36e3",
"assets/assets/images/components/DTR0009479469.png": "02e3b7cfec674a34ff84e417c954a624",
"assets/assets/images/components/DTR0009905704.png": "2349f6b19ad80c051887e2a958a0b070",
"assets/assets/images/components/DTR0025139CF0.png": "c729690cee3ba5bddd3d268c71b18e17",
"assets/assets/images/components/DTR0025139CF1.png": "c729690cee3ba5bddd3d268c71b18e17",
"assets/assets/images/components/DTR00252179AC.png": "d69dad935b30ba91f73234643cd901aa",
"assets/assets/images/components/FICT0000000486.png": "2eb5bdb4a4c73ba654c550c1132825ee",
"assets/assets/images/components/n_a.png": "0108272f5b250df8b6d10bc95f79234d",
"assets/assets/images/decapador_ideal_45_092.png": "109d9cf00d0a6a698f062b313b47872b",
"assets/assets/images/decapador_ideal_45_163.png": "98d6fe96c7945cb3338898e730b4e779",
"assets/assets/images/decapador_ideal_45_164.png": "0558f58de664559ccce19616838111e7",
"assets/assets/images/decapador_weidmuller_am25.png": "ea9e50c807652ba4a4f123c51e2518cf",
"assets/assets/images/decapador_weidmuller_am35.png": "55ef55fd05168e4568da6c9091fae634",
"assets/assets/images/decapador_weidmuller_stripax.png": "557b3d8f6ac1518016ce5412e2440a25",
"assets/assets/images/profile/me.jpeg": "2b36287b2070a15d3960a2e08cd2b4d1",
"assets/assets/images/tools/082_104_04_saib.png": "52fc38bb0615cbfc8a9cac8e7e137304",
"assets/assets/images/tools/09_99_000_0110_harting.png": "82223d34aa86e6dc96de58090d2aa173",
"assets/assets/images/tools/09_99_000_0191_harting.png": "1b41183a560200218df9259afe6921a9",
"assets/assets/images/tools/09_99_000_0196_harting.png": "479c0be0880c72a26a8a34de0a5448f9",
"assets/assets/images/tools/09_99_000_0377_harting.png": "c172ca0df87ae4888030acb5a19f8bbc",
"assets/assets/images/tools/09_99_000_0501_harting.png": "76e1bab5f604729c7aba93978f116869",
"assets/assets/images/tools/09_99_000_0509_harting.png": "1d20086e3fe53e1fa47bb0ee0332955f",
"assets/assets/images/tools/09_99_000_0620_harting.png": "d74707ee97c6ce4b436076a08afc9177",
"assets/assets/images/tools/09_99_000_0851_harting.png": "02830440cee5e02235f2ae0f6c459e57",
"assets/assets/images/tools/09_99_000_0888_harting.png": "30bb5f71017c426e8ba9c1a49e94c119",
"assets/assets/images/tools/354940_1_tyco.png": "56c9b4ba5d3d134fc12cf7eda5c5c497",
"assets/assets/images/tools/91560_1_tyco.png": "54d6659e36e44274daf5cc6912e78578",
"assets/assets/images/tools/AFM8_dmc.png": "2b28ea34b04d82f5e2d0876e78914a03",
"assets/assets/images/tools/AT201_mecatraction.png": "467a1592c188f23b9f7bfa3035602748",
"assets/assets/images/tools/ESU137_mecatraction.png": "04ba37c1ab7ff1e8bf4f5ef38f7de667",
"assets/assets/images/tools/FT8_dmc.png": "1c81bde5e14fccba3ece85eb438f9a1b",
"assets/assets/images/tools/harting_0110.png": "3ad3e343fa2f37dc57acfccd25190d19",
"assets/assets/images/tools/HZ248_inotec.jpeg": "db0c839a04b36053dab46e63f0560bb4",
"assets/assets/images/tools/HZ248_inotec.png": "58f2ed855aaea1ea1937d231eafbd7f6",
"assets/assets/images/tools/K507_klauke.png": "52c8216825f04e17e6d8f8b72d0ba147",
"assets/assets/images/tools/M309_dmc.png": "07c6182da4c129cb0eacdc42a3781747",
"assets/assets/images/tools/M317_dmc.png": "8e523f9a4070a72f8c78839be66b8b56",
"assets/assets/images/tools/mecatraction_esu.png": "27fd84c2c41888070ea10e15b16aca78",
"assets/assets/images/tools/mecatraction_th1.png": "2657241ccf3bd1045fcf48930cd49830",
"assets/assets/images/tools/mecatraction_th2.png": "c7c73b25746432b9cc802bd049cbba01",
"assets/assets/images/tools/mecatraction_th3.png": "e69bb19b81af2441809cb0132e34730c",
"assets/assets/images/tools/mecatraction_vf210k.png": "ff15c099dd4eb91431b1312ef2da54ce",
"assets/assets/images/tools/MH860_dmc.png": "38b7b67260d9151490891e934b0f4b46",
"assets/assets/images/tools/n_a.png": "0108272f5b250df8b6d10bc95f79234d",
"assets/assets/images/tools/PATG3102NB_enerpac.png": "8db51f1fd184aaa866865af3bf565155",
"assets/assets/images/tools/PMM1_mecatraction.png": "ac6918915124c2986843fd24edd82c5e",
"assets/assets/images/tools/posicionador/09_99_000_0525_dmc.png": "cb17f44f33b9220514530802ec6ef1f8",
"assets/assets/images/tools/posicionador/09_99_000_0531_dmc.png": "78f3ffe23912d4a6dde0d1904e125a1c",
"assets/assets/images/tools/posicionador/09_99_000_0623_harting.png": "ef74f0f84535a0180643f9c4b8cefe1d",
"assets/assets/images/tools/posicionador/09_99_000_0852_harting.png": "e9c73b1e0ef54a13f9bd22ffcd4e551d",
"assets/assets/images/tools/posicionador/09_99_000_0853_harting.png": "e9c73b1e0ef54a13f9bd22ffcd4e551d",
"assets/assets/images/tools/posicionador/09_99_000_0854_harting.png": "e9c73b1e0ef54a13f9bd22ffcd4e551d",
"assets/assets/images/tools/posicionador/09_99_000_0855_harting.png": "e9c73b1e0ef54a13f9bd22ffcd4e551d",
"assets/assets/images/tools/posicionador/09_99_000_0856_harting.png": "e9c73b1e0ef54a13f9bd22ffcd4e551d",
"assets/assets/images/tools/posicionador/09_99_000_0857_harting.png": "e9c73b1e0ef54a13f9bd22ffcd4e551d",
"assets/assets/images/tools/posicionador/09_99_000_0888_harting_positioner.png": "8955d49f780594d2c5c53b3890ec1ea6",
"assets/assets/images/tools/posicionador/09_99_000_0897_dmc.png": "92ee626802a1f9f79412b6ecdd4f4dd9",
"assets/assets/images/tools/posicionador/09_99_000_0963_harting.png": "f5521e6002da9d3613d44a5345b4f349",
"assets/assets/images/tools/posicionador/58423_1_te.png": "493d6bed27307011dbc594953d041bc3",
"assets/assets/images/tools/posicionador/61_03_600_0023_harting.png": "a9f4fb90d3beb616f916dc5d39d9e1b4",
"assets/assets/images/tools/posicionador/86_2_dmc.png": "de5edf241f8e820dbc267f36cfd6fbb4",
"assets/assets/images/tools/posicionador/C12_TN120_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/C12_TN150_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/C12_TN185_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/C12_TN240_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/C12_TN25_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/C12_TN35_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/C12_TN50_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/C12_TN70_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/ELP460_mecatraction.png": "17f953a8f5f0e4de4c3a81dbc4b8003f",
"assets/assets/images/tools/posicionador/ELS460_mecatraction.png": "685b2ff45652cfe71e5e671bee1e4aaf",
"assets/assets/images/tools/posicionador/FLS460_mecatraction.png": "685b2ff45652cfe71e5e671bee1e4aaf",
"assets/assets/images/tools/posicionador/FLS_mecatraction.png": "a015ee250a4d89a153ea9dce5788b2e9",
"assets/assets/images/tools/posicionador/HAN_D_harting.png": "cdac42b264c28061eaa91d6fbf6c4847",
"assets/assets/images/tools/posicionador/HAN_E_harting.png": "cdac42b264c28061eaa91d6fbf6c4847",
"assets/assets/images/tools/posicionador/K13_1_dmc.png": "9976dc533a0d272c09ddc32a9e8f7fbd",
"assets/assets/images/tools/posicionador/K1451_1_dmc.png": "6dfdfbf3db71fa419966a3d0204193d5",
"assets/assets/images/tools/posicionador/K41_dmc.png": "7ec7a7e5f3bfe1281a20bff8f62bc49f",
"assets/assets/images/tools/posicionador/K42_dmc.png": "b3c1c93204f15c1939b629fabb4562c5",
"assets/assets/images/tools/posicionador/MH86_164G_dmc.png": "b2c6057ed752a426a521f80cb9dd3493",
"assets/assets/images/tools/posicionador/n_a.png": "0108272f5b250df8b6d10bc95f79234d",
"assets/assets/images/tools/posicionador/S20SCM20_souriau.png": "e582cd96bd8cd1ba6703d09338d4e97d",
"assets/assets/images/tools/posicionador/SH463_dmc_amarelo.png": "b1c220db69cb499b16759dc6c096872e",
"assets/assets/images/tools/posicionador/SH463_dmc_azul.png": "b1c220db69cb499b16759dc6c096872e",
"assets/assets/images/tools/posicionador/SH463_dmc_vermelho.png": "b1c220db69cb499b16759dc6c096872e",
"assets/assets/images/tools/posicionador/SK_2_universal_positioner.png": "c1857a629c71279b01eb89caf363a52d",
"assets/assets/images/tools/posicionador/TH1A_dmc_azul.png": "3d866d2fc1a151474fa9ca86a91d7bf9",
"assets/assets/images/tools/posicionador/TH1A_dmc_vermelho.png": "3d866d2fc1a151474fa9ca86a91d7bf9",
"assets/assets/images/tools/posicionador/TH_163_dmc_azul.png": "3d866d2fc1a151474fa9ca86a91d7bf9",
"assets/assets/images/tools/posicionador/TH_163_dmc_vermelho.png": "3d866d2fc1a151474fa9ca86a91d7bf9",
"assets/assets/images/tools/posicionador/TH_493_1_dmc_azul.png": "3d866d2fc1a151474fa9ca86a91d7bf9",
"assets/assets/images/tools/posicionador/TH_493_1_dmc_vermelho.png": "3d866d2fc1a151474fa9ca86a91d7bf9",
"assets/assets/images/tools/posicionador/TH_531_dmc_azul.png": "3d866d2fc1a151474fa9ca86a91d7bf9",
"assets/assets/images/tools/posicionador/TH_531_dmc_vermelho.png": "3d866d2fc1a151474fa9ca86a91d7bf9",
"assets/assets/images/tools/posicionador/TN120_V20_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TN150_V20_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TN185_V20_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TN240_V20_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TN25_V20_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TN35_V20_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TN50_V20_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TN95_V20_mecatraction.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TP1142_dmc.png": "8930d1ea317442e92a5946feeb553668",
"assets/assets/images/tools/posicionador/TP957_dmc.png": "29cfdcae297622bca4771b7fa20102dd",
"assets/assets/images/tools/posicionador/TP974_dmc.png": "8e4ddf40f398c4955b46028ed00024fa",
"assets/assets/images/tools/posicionador/TZ10_enerpac.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TZ16_enerpac.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TZ25_enerpac.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/TZ26_enerpac.png": "7e56e56e23c7196a042ad25ea7b070e4",
"assets/assets/images/tools/posicionador/UH2_5.png": "6dfb195d722ac04afa6254a2f3f8d155",
"assets/assets/images/tools/PZ_3_weidmuller.png": "39cdf3e139f5c850aabb951577b3141e",
"assets/assets/images/tools/PZ_6_weidmuller.png": "3561e3faebdbc1ab6a27304d5555fcba",
"assets/assets/images/tools/R0085_01B_vmi.png": "a56d25b5072e9e86a38caef26c1fa241",
"assets/assets/images/tools/SHANDLES_souriau.png": "39def36be176ecdf7e60c212890618eb",
"assets/assets/images/tools/SU210K_mecatraction.png": "9a50590c43a00a1ebcd4e1a1bc2bc78c",
"assets/assets/images/tools/TR1461_mecatraction.png": "2babac434bcb58b6f54829630ca4f92c",
"assets/assets/images/tools/TR1462_mecatraction.png": "b4cc8d5ac7b5671db9ed01a83b2d5405",
"assets/assets/images/tools/VF210K_mecatraction.png": "c76ffc07168169a52b3d32f464c4c2b2",
"assets/assets/images/tools/WA27E_dmc.png": "d112288073bb26a97ac390e674994fee",
"assets/assets/images/tools/weidmuller_pz3.png": "5e1145a21dd666f80de356c5a858d9a7",
"assets/assets/images/tools/XZC_0701_XZC_0704_hirschmann.png": "db21b82f05372103945dfd6655492ca4",
"assets/assets/logos/dark_finder_app_icon.png": "d2ea2df75c1f9524cedd6463ee0a08e8",
"assets/assets/logos/facebook-icon.png": "be0423f843fc36586991cbf92c059422",
"assets/assets/logos/google-icon.png": "b95e5615716a3ae4b62f14a430bb1253",
"assets/assets/logos/light_finder_app_icon.png": "c34824aab13ecf1cab2a7f29d20ddae3",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "a4fd4e8726d2bd0fc81c5aceccd2186c",
"assets/NOTICES": "f1b5029a275e8d69c7a7b825d7258784",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "825e75415ebd366b740bb49659d7a5c6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "c3dcedc0390deeaa0b39cf5f644115e0",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "342a0034f2b9e29b0f4eeb4e9e6b4806",
"/": "342a0034f2b9e29b0f4eeb4e9e6b4806",
"main.dart.js": "5e7583e1a2c9cef288e1900101d1a5d8",
"manifest.json": "afe8114ba3143c95924d97de0f41119a",
"version.json": "47e509a1bd196540e94889afee52c6ac"};
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
