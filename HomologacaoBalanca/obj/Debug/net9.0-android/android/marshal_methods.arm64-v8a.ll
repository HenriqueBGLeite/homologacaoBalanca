; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [450 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [1350 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 42
	i64 u0x0024d0f62dee05bd, ; 1: Xamarin.KotlinX.Coroutines.Core.dll => 315
	i64 u0x004a42d4140c22ce, ; 2: lib-ru-Microsoft.VisualStudio.Validation.resources.dll.so => 428
	i64 u0x0071cf2d27b7d61e, ; 3: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 295
	i64 u0x00c647f9c08e36a8, ; 4: Microsoft.VisualStudio.Utilities.Internal.dll => 205
	i64 u0x01025689905ca5b7, ; 5: cs/Microsoft.VisualStudio.Composition.resources.dll => 379
	i64 u0x01109b0e4d99e61f, ; 6: System.ComponentModel.Annotations.dll => 13
	i64 u0x018911cc9c51637a, ; 7: zh-Hant/Microsoft.VisualStudio.Validation.resources.dll => 431
	i64 u0x02123411c4e01926, ; 8: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 284
	i64 u0x022e81ea9c46e03a, ; 9: lib_CommunityToolkit.Maui.Core.dll.so => 175
	i64 u0x026b90f435b65556, ; 10: lib_MessagePack.Annotations.dll.so => 181
	i64 u0x02759786e6a2f016, ; 11: ja/Microsoft.ServiceHub.Resources.dll => 371
	i64 u0x0284512fad379f7e, ; 12: System.Runtime.Handles => 105
	i64 u0x02abedc11addc1ed, ; 13: lib_Mono.Android.Runtime.dll.so => 171
	i64 u0x02e64ca49dce8932, ; 14: lib-es-Microsoft.VisualStudio.Composition.resources.dll.so => 381
	i64 u0x02f55bf70672f5c8, ; 15: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i64 u0x032267b2a94db371, ; 16: lib_Xamarin.AndroidX.AppCompat.dll.so => 238
	i64 u0x03621c804933a890, ; 17: System.Buffers => 7
	i64 u0x0399610510a38a38, ; 18: lib_System.Private.DataContractSerialization.dll.so => 86
	i64 u0x043032f1d071fae0, ; 19: ru/Microsoft.Maui.Controls.resources => 343
	i64 u0x044440a55165631e, ; 20: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 321
	i64 u0x046eb1581a80c6b0, ; 21: vi/Microsoft.Maui.Controls.resources => 349
	i64 u0x047408741db2431a, ; 22: Xamarin.AndroidX.DynamicAnimation => 258
	i64 u0x0517ef04e06e9f76, ; 23: System.Net.Primitives => 71
	i64 u0x0565d18c6da3de38, ; 24: Xamarin.AndroidX.RecyclerView => 288
	i64 u0x0581db89237110e9, ; 25: lib_System.Collections.dll.so => 12
	i64 u0x05989cb940b225a9, ; 26: Microsoft.Maui.dll => 193
	i64 u0x05a1c25e78e22d87, ; 27: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 102
	i64 u0x06076b5d2b581f08, ; 28: zh-HK/Microsoft.Maui.Controls.resources => 350
	i64 u0x06388ffe9f6c161a, ; 29: System.Xml.Linq.dll => 156
	i64 u0x06600c4c124cb358, ; 30: System.Configuration.dll => 19
	i64 u0x067f95c5ddab55b3, ; 31: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 263
	i64 u0x0680a433c781bb3d, ; 32: Xamarin.AndroidX.Collection.Jvm => 245
	i64 u0x069fff96ec92a91d, ; 33: System.Xml.XPath.dll => 161
	i64 u0x06d3029eadd18721, ; 34: it/StreamJsonRpc.resources.dll => 436
	i64 u0x0708a571804cb86b, ; 35: ja/Microsoft.VisualStudio.Composition.resources.dll => 384
	i64 u0x070b0847e18dab68, ; 36: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 260
	i64 u0x0721ca5ac95a885f, ; 37: it/Microsoft.VisualStudio.Threading.resources => 396
	i64 u0x0739448d84d3b016, ; 38: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 298
	i64 u0x07469f2eecce9e85, ; 39: mscorlib.dll => 167
	i64 u0x07c57877c7ba78ad, ; 40: ru/Microsoft.Maui.Controls.resources.dll => 343
	i64 u0x07dcdc7460a0c5e4, ; 41: System.Collections.NonGeneric => 10
	i64 u0x08122e52765333c8, ; 42: lib_Microsoft.Extensions.Logging.Debug.dll.so => 188
	i64 u0x0862024e5db21191, ; 43: System.Private.Windows.Core.dll => 222
	i64 u0x088610fc2509f69e, ; 44: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 299
	i64 u0x08a7c865576bbde7, ; 45: System.Reflection.Primitives => 96
	i64 u0x08c9d051a4a817e5, ; 46: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 255
	i64 u0x08f38f607dec4daf, ; 47: lib-it-Microsoft.ServiceHub.Resources.dll.so => 370
	i64 u0x08f3c9788ee2153c, ; 48: Xamarin.AndroidX.DrawerLayout => 257
	i64 u0x09138715c92dba90, ; 49: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 50: lib_Microsoft.Extensions.Options.dll.so => 189
	i64 u0x092266563089ae3e, ; 51: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x09d144a7e214d457, ; 52: System.Security.Cryptography => 127
	i64 u0x09e2b9f743db21a8, ; 53: lib_System.Reflection.Metadata.dll.so => 95
	i64 u0x09e71cd530cab938, ; 54: es/Microsoft.VisualStudio.Validation.resources => 421
	i64 u0x0abb3e2b271edc45, ; 55: System.Threading.Channels.dll => 140
	i64 u0x0b06b1feab070143, ; 56: System.Formats.Tar => 39
	i64 u0x0b3b632c3bbee20c, ; 57: sk/Microsoft.Maui.Controls.resources => 344
	i64 u0x0b69d0f023fc48f6, ; 58: de/Microsoft.ServiceHub.Framework.resources => 354
	i64 u0x0b6aff547b84fbe9, ; 59: Xamarin.KotlinX.Serialization.Core.Jvm => 318
	i64 u0x0b8dd46f0bf23c70, ; 60: tr/Microsoft.VisualStudio.Validation.resources.dll => 429
	i64 u0x0be2e1f8ce4064ed, ; 61: Xamarin.AndroidX.ViewPager => 301
	i64 u0x0c279376b1ae96ae, ; 62: lib_System.CodeDom.dll.so => 211
	i64 u0x0c3ca6cc978e2aae, ; 63: pt-BR/Microsoft.Maui.Controls.resources => 340
	i64 u0x0c59ad9fbbd43abe, ; 64: Mono.Android => 172
	i64 u0x0c65741e86371ee3, ; 65: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 232
	i64 u0x0c74af560004e816, ; 66: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c7790f60165fc06, ; 67: lib_Microsoft.Maui.Essentials.dll.so => 194
	i64 u0x0c83c82812e96127, ; 68: lib_System.Net.Mail.dll.so => 67
	i64 u0x0cce4bce83380b7f, ; 69: Xamarin.AndroidX.Security.SecurityCrypto => 292
	i64 u0x0d13cd7cce4284e4, ; 70: System.Security.SecureString => 130
	i64 u0x0d63f4f73521c24f, ; 71: lib_Xamarin.AndroidX.SavedState.SavedState.Ktx.dll.so => 291
	i64 u0x0e04e702012f8463, ; 72: Xamarin.AndroidX.Emoji2 => 259
	i64 u0x0e14e73a54dda68e, ; 73: lib_System.Net.NameResolution.dll.so => 68
	i64 u0x0e8674dd8e30d120, ; 74: cs/Microsoft.VisualStudio.Utilities.resources => 405
	i64 u0x0f37dd7a62ae99af, ; 75: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 246
	i64 u0x0f4c2a5f96c15d01, ; 76: lib-fr-Microsoft.VisualStudio.Composition.resources.dll.so => 382
	i64 u0x0f5e7abaa7cf470a, ; 77: System.Net.HttpListener => 66
	i64 u0x1001f97bbe242e64, ; 78: System.IO.UnmanagedMemoryStream => 57
	i64 u0x101050fb275ef6dd, ; 79: pl/Microsoft.VisualStudio.Utilities.resources => 413
	i64 u0x102a31b45304b1da, ; 80: Xamarin.AndroidX.CustomView => 254
	i64 u0x1065c4cb554c3d75, ; 81: System.IO.IsolatedStorage.dll => 52
	i64 u0x10f6cfcbcf801616, ; 82: System.IO.Compression.Brotli => 43
	i64 u0x114443cdcf2091f1, ; 83: System.Security.Cryptography.Primitives => 125
	i64 u0x11760fd51cac0e28, ; 84: lib_StreamJsonRpc.dll.so => 210
	i64 u0x119b078be0b10e02, ; 85: zh-Hans/Microsoft.VisualStudio.Threading.resources.dll => 403
	i64 u0x11a603952763e1d4, ; 86: System.Net.Mail => 67
	i64 u0x11a70d0e1009fb11, ; 87: System.Net.WebSockets.dll => 81
	i64 u0x11f26371eee0d3c1, ; 88: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 274
	i64 u0x11fbe62d469cc1c8, ; 89: Microsoft.VisualStudio.DesignTools.TapContract.dll => 447
	i64 u0x12128b3f59302d47, ; 90: lib_System.Xml.Serialization.dll.so => 158
	i64 u0x123639456fb056da, ; 91: System.Reflection.Emit.Lightweight.dll => 92
	i64 u0x12521e9764603eaa, ; 92: lib_System.Resources.Reader.dll.so => 99
	i64 u0x125b7f94acb989db, ; 93: Xamarin.AndroidX.RecyclerView.dll => 288
	i64 u0x125bb60aecbc4d66, ; 94: zh-Hant/Microsoft.VisualStudio.Threading.resources => 404
	i64 u0x1293973a09337b0e, ; 95: tr/Microsoft.VisualStudio.Threading.resources.dll => 402
	i64 u0x129c0079795f6162, ; 96: de/Microsoft.VisualStudio.Utilities.resources.dll => 406
	i64 u0x12d3b63863d4ab0b, ; 97: lib_System.Threading.Overlapped.dll.so => 141
	i64 u0x12d84dd9d1a7750e, ; 98: pt-BR/Microsoft.VisualStudio.Utilities.resources => 414
	i64 u0x134eab1061c395ee, ; 99: System.Transactions => 151
	i64 u0x137b34d6751da129, ; 100: System.Drawing.Common => 221
	i64 u0x138567fa954faa55, ; 101: Xamarin.AndroidX.Browser => 242
	i64 u0x1387191e087e92b9, ; 102: ru/Microsoft.ServiceHub.Framework.resources => 362
	i64 u0x13a01de0cbc3f06c, ; 103: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 327
	i64 u0x13b5370d31a7ae4d, ; 104: de/Microsoft.VisualStudio.Composition.resources.dll => 380
	i64 u0x13beedefb0e28a45, ; 105: lib_System.Xml.XmlDocument.dll.so => 162
	i64 u0x13f1e5e209e91af4, ; 106: lib_Java.Interop.dll.so => 169
	i64 u0x13f1e880c25d96d1, ; 107: he/Microsoft.Maui.Controls.resources => 328
	i64 u0x143d8ea60a6a4011, ; 108: Microsoft.Extensions.DependencyInjection.Abstractions => 185
	i64 u0x1497051b917530bd, ; 109: lib_System.Net.WebSockets.dll.so => 81
	i64 u0x14b78ce3adce0011, ; 110: Microsoft.VisualStudio.DesignTools.TapContract => 447
	i64 u0x14e68447938213b7, ; 111: Xamarin.AndroidX.Collection.Ktx.dll => 246
	i64 u0x152a448bd1e745a7, ; 112: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 113: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x157efe9bf26cbf31, ; 114: lib-ja-Microsoft.VisualStudio.Utilities.resources.dll.so => 411
	i64 u0x159cc6c81072f00e, ; 115: lib_System.Diagnostics.EventLog.dll.so => 219
	i64 u0x15bdc156ed462f2f, ; 116: lib_System.IO.FileSystem.dll.so => 51
	i64 u0x15e300c2c1668655, ; 117: System.Resources.Writer.dll => 101
	i64 u0x16bf2a22df043a09, ; 118: System.IO.Pipes.dll => 56
	i64 u0x16cd3d2537f17bb9, ; 119: lib-zh-Hant-Microsoft.VisualStudio.Utilities.resources.dll.so => 418
	i64 u0x16ea2b318ad2d830, ; 120: System.Security.Cryptography.Algorithms => 120
	i64 u0x16eeae54c7ebcc08, ; 121: System.Reflection.dll => 98
	i64 u0x17125c9a85b4929f, ; 122: lib_netstandard.dll.so => 168
	i64 u0x1716866f7416792e, ; 123: lib_System.Security.AccessControl.dll.so => 118
	i64 u0x174f71c46216e44a, ; 124: Xamarin.KotlinX.Coroutines.Core => 315
	i64 u0x1752c12f1e1fc00c, ; 125: System.Core => 21
	i64 u0x177173152b093b71, ; 126: lib-pl-Microsoft.VisualStudio.Threading.resources.dll.so => 399
	i64 u0x17b56e25558a5d36, ; 127: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 331
	i64 u0x17f9358913beb16a, ; 128: System.Text.Encodings.Web => 137
	i64 u0x1809fb23f29ba44a, ; 129: lib_System.Reflection.TypeExtensions.dll.so => 97
	i64 u0x18402a709e357f3b, ; 130: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 318
	i64 u0x1854f929977e6be2, ; 131: lib-es-Microsoft.VisualStudio.Validation.resources.dll.so => 421
	i64 u0x186c0a100fdc9cc7, ; 132: es/Microsoft.ServiceHub.Resources => 368
	i64 u0x18a9befae51bb361, ; 133: System.Net.WebClient => 77
	i64 u0x18f0ce884e87d89a, ; 134: nb/Microsoft.Maui.Controls.resources.dll => 337
	i64 u0x1928f2deb8814165, ; 135: zh-Hans/StreamJsonRpc.resources.dll => 443
	i64 u0x193d7a04b7eda8bc, ; 136: lib_Xamarin.AndroidX.Print.dll.so => 286
	i64 u0x19777fba3c41b398, ; 137: Xamarin.AndroidX.Startup.StartupRuntime.dll => 294
	i64 u0x19a4c090f14ebb66, ; 138: System.Security.Claims => 119
	i64 u0x19a9b52bd6478c08, ; 139: lib-pl-Microsoft.VisualStudio.Utilities.resources.dll.so => 413
	i64 u0x19e539418397ab1c, ; 140: ja/StreamJsonRpc.resources => 437
	i64 u0x19e64b02b32da708, ; 141: zh-Hans/Microsoft.ServiceHub.Framework.resources.dll => 364
	i64 u0x1a0c20aec218e1eb, ; 142: es/Microsoft.VisualStudio.Threading.resources => 394
	i64 u0x1a91866a319e9259, ; 143: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1a9cfddc7e7c9fcd, ; 144: ru/StreamJsonRpc.resources => 441
	i64 u0x1aac34d1917ba5d3, ; 145: lib_System.dll.so => 165
	i64 u0x1aad60783ffa3e5b, ; 146: lib-th-Microsoft.Maui.Controls.resources.dll.so => 346
	i64 u0x1aea8f1c3b282172, ; 147: lib_System.Net.Ping.dll.so => 70
	i64 u0x1aff23d441ef1115, ; 148: ja/Microsoft.VisualStudio.Validation.resources.dll => 424
	i64 u0x1b4b7a1d0d265fa2, ; 149: Xamarin.Android.Glide.DiskLruCache => 231
	i64 u0x1bb6b53fc3c8c678, ; 150: fr/Microsoft.VisualStudio.Threading.resources => 395
	i64 u0x1bbdb16cfa73e785, ; 151: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 275
	i64 u0x1bc766e07b2b4241, ; 152: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 289
	i64 u0x1c5d4583f370f085, ; 153: lib-zh-Hans-Microsoft.VisualStudio.Composition.resources.dll.so => 390
	i64 u0x1c753b5ff15bce1b, ; 154: Mono.Android.Runtime.dll => 171
	i64 u0x1cd47467799d8250, ; 155: System.Threading.Tasks.dll => 145
	i64 u0x1d23eafdc6dc346c, ; 156: System.Globalization.Calendars.dll => 40
	i64 u0x1d5327d49a214f9d, ; 157: ru/Microsoft.VisualStudio.Utilities.resources.dll => 415
	i64 u0x1da4110562816681, ; 158: Xamarin.AndroidX.Security.SecurityCrypto.dll => 292
	i64 u0x1db6820994506bf5, ; 159: System.IO.FileSystem.AccessControl.dll => 47
	i64 u0x1dbb0c2c6a999acb, ; 160: System.Diagnostics.StackTrace => 30
	i64 u0x1e3d87657e9659bc, ; 161: Xamarin.AndroidX.Navigation.UI => 285
	i64 u0x1e71143913d56c10, ; 162: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 335
	i64 u0x1e7c31185e2fb266, ; 163: lib_System.Threading.Tasks.Parallel.dll.so => 144
	i64 u0x1ed8fcce5e9b50a0, ; 164: Microsoft.Extensions.Options.dll => 189
	i64 u0x1efe9c859e2d66e4, ; 165: pl/Microsoft.ServiceHub.Resources => 373
	i64 u0x1f055d15d807e1b2, ; 166: System.Xml.XmlSerializer => 163
	i64 u0x1f1ed22c1085f044, ; 167: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i64 u0x1f61df9c5b94d2c1, ; 168: lib_System.Numerics.dll.so => 84
	i64 u0x1f750bb5421397de, ; 169: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 296
	i64 u0x20237ea48006d7a8, ; 170: lib_System.Net.WebClient.dll.so => 77
	i64 u0x207416569bad3de3, ; 171: MessagePack => 180
	i64 u0x209375905fcc1bad, ; 172: lib_System.IO.Compression.Brotli.dll.so => 43
	i64 u0x20edad43b59fbd8e, ; 173: System.Security.Permissions.dll => 226
	i64 u0x20fab3cf2dfbc8df, ; 174: lib_System.Diagnostics.Process.dll.so => 29
	i64 u0x2110167c128cba15, ; 175: System.Globalization => 42
	i64 u0x21419508838f7547, ; 176: System.Runtime.CompilerServices.VisualC => 103
	i64 u0x2174319c0d835bc9, ; 177: System.Runtime => 117
	i64 u0x21932b8119aa3ce4, ; 178: pl/Microsoft.ServiceHub.Framework.resources => 360
	i64 u0x2198e5bc8b7153fa, ; 179: Xamarin.AndroidX.Annotation.Experimental.dll => 236
	i64 u0x219ea1b751a4dee4, ; 180: lib_System.IO.Compression.ZipFile.dll.so => 45
	i64 u0x21a81968dba59dae, ; 181: pl/Microsoft.VisualStudio.Validation.resources.dll => 426
	i64 u0x21cc7e445dcd5469, ; 182: System.Reflection.Emit.ILGeneration => 91
	i64 u0x220fd4f2e7c48170, ; 183: th/Microsoft.Maui.Controls.resources => 346
	i64 u0x224538d85ed15a82, ; 184: System.IO.Pipes => 56
	i64 u0x22908438c6bed1af, ; 185: lib_System.Threading.Timer.dll.so => 148
	i64 u0x22fbc14e981e3b45, ; 186: lib_Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll.so => 446
	i64 u0x237be844f1f812c7, ; 187: System.Threading.Thread.dll => 146
	i64 u0x23852b3bdc9f7096, ; 188: System.Resources.ResourceManager => 100
	i64 u0x23986dd7e5d4fc01, ; 189: System.IO.FileSystem.Primitives.dll => 49
	i64 u0x2407aef2bbe8fadf, ; 190: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 191: Xamarin.AndroidX.Core.dll => 251
	i64 u0x247619fe4413f8bf, ; 192: System.Runtime.Serialization.Primitives.dll => 114
	i64 u0x24de8d301281575e, ; 193: Xamarin.Android.Glide => 229
	i64 u0x252073cc3caa62c2, ; 194: fr/Microsoft.Maui.Controls.resources.dll => 327
	i64 u0x256b8d41255f01b1, ; 195: Xamarin.Google.Crypto.Tink.Android => 307
	i64 u0x25b1f14d76a18d6f, ; 196: lib-it-StreamJsonRpc.resources.dll.so => 436
	i64 u0x25d4963b50ca411f, ; 197: Microsoft.ServiceHub.Resources => 198
	i64 u0x26408e09f899af11, ; 198: lib_Microsoft.VisualStudio.RpcContracts.dll.so => 201
	i64 u0x2662c629b96b0b30, ; 199: lib_Xamarin.Kotlin.StdLib.dll.so => 311
	i64 u0x268c1439f13bcc29, ; 200: lib_Microsoft.Extensions.Primitives.dll.so => 190
	i64 u0x26a670e154a9c54b, ; 201: System.Reflection.Extensions.dll => 94
	i64 u0x26d077d9678fe34f, ; 202: System.IO.dll => 58
	i64 u0x26e03dc66a07fa60, ; 203: lib-ru-Microsoft.VisualStudio.Threading.resources.dll.so => 401
	i64 u0x271ce9da83536a25, ; 204: lib-zh-Hant-StreamJsonRpc.resources.dll.so => 444
	i64 u0x273f3515de5faf0d, ; 205: id/Microsoft.Maui.Controls.resources.dll => 332
	i64 u0x2742545f9094896d, ; 206: hr/Microsoft.Maui.Controls.resources => 330
	i64 u0x2759af78ab94d39b, ; 207: System.Net.WebSockets => 81
	i64 u0x27b2b16f3e9de038, ; 208: Xamarin.Google.Crypto.Tink.Android.dll => 307
	i64 u0x27b410442fad6cf1, ; 209: Java.Interop.dll => 169
	i64 u0x27b97e0d52c3034a, ; 210: System.Diagnostics.Debug => 26
	i64 u0x2801845a2c71fbfb, ; 211: System.Net.Primitives.dll => 71
	i64 u0x286835e259162700, ; 212: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 287
	i64 u0x2949f3617a02c6b2, ; 213: Xamarin.AndroidX.ExifInterface => 261
	i64 u0x29f947844fb7fc11, ; 214: Microsoft.Maui.Controls.HotReload.Forms => 445
	i64 u0x2a128783efe70ba0, ; 215: uk/Microsoft.Maui.Controls.resources.dll => 348
	i64 u0x2a3b095612184159, ; 216: lib_System.Net.NetworkInformation.dll.so => 69
	i64 u0x2a6507a5ffabdf28, ; 217: System.Diagnostics.TraceSource.dll => 33
	i64 u0x2a938a1f2b97797b, ; 218: es/Microsoft.VisualStudio.Composition.resources => 381
	i64 u0x2ac82b8d1ecafc7c, ; 219: lib_System.Windows.Extensions.dll.so => 228
	i64 u0x2acd52e21fb3e7c9, ; 220: lib-en-Microsoft.VisualStudio.Utilities.resources.dll.so => 407
	i64 u0x2ad156c8e1354139, ; 221: fi/Microsoft.Maui.Controls.resources => 326
	i64 u0x2ad5d6b13b7a3e04, ; 222: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2af298f63581d886, ; 223: System.Text.RegularExpressions.dll => 139
	i64 u0x2afc1c4f898552ee, ; 224: lib_System.Formats.Asn1.dll.so => 38
	i64 u0x2b148910ed40fbf9, ; 225: zh-Hant/Microsoft.Maui.Controls.resources.dll => 352
	i64 u0x2b2c19b70aba6940, ; 226: pt-BR/Microsoft.ServiceHub.Framework.resources => 361
	i64 u0x2b6989d78cba9a15, ; 227: Xamarin.AndroidX.Concurrent.Futures.dll => 247
	i64 u0x2c8bd14bb93a7d82, ; 228: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 339
	i64 u0x2cbd9262ca785540, ; 229: lib_System.Text.Encoding.CodePages.dll.so => 134
	i64 u0x2cc9e1fed6257257, ; 230: lib_System.Reflection.Emit.Lightweight.dll.so => 92
	i64 u0x2cd723e9fe623c7c, ; 231: lib_System.Private.Xml.Linq.dll.so => 88
	i64 u0x2d169d318a968379, ; 232: System.Threading.dll => 149
	i64 u0x2d47774b7d993f59, ; 233: sv/Microsoft.Maui.Controls.resources.dll => 345
	i64 u0x2d5ffcae1ad0aaca, ; 234: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 235: System.Text.Json.dll => 138
	i64 u0x2dcaa0bb15a4117a, ; 236: System.IO.UnmanagedMemoryStream.dll => 57
	i64 u0x2e11cc038698595f, ; 237: lib-de-StreamJsonRpc.resources.dll.so => 433
	i64 u0x2e2ced2c3c6a1edc, ; 238: lib_System.Threading.AccessControl.dll.so => 227
	i64 u0x2e5a40c319acb800, ; 239: System.IO.FileSystem => 51
	i64 u0x2e6f1f226821322a, ; 240: el/Microsoft.Maui.Controls.resources.dll => 324
	i64 u0x2ed0fe4d9ceb6e99, ; 241: zh-Hans/Microsoft.VisualStudio.Composition.resources.dll => 390
	i64 u0x2f02f94df3200fe5, ; 242: System.Diagnostics.Process => 29
	i64 u0x2f052de36706543c, ; 243: it/Microsoft.ServiceHub.Resources.dll => 370
	i64 u0x2f2e98e1c89b1aff, ; 244: System.Xml.ReaderWriter => 157
	i64 u0x2f5911d9ba814e4e, ; 245: System.Diagnostics.Tracing => 34
	i64 u0x2f785b3689eae619, ; 246: lib-zh-Hant-Microsoft.ServiceHub.Framework.resources.dll.so => 365
	i64 u0x2f84070a459bc31f, ; 247: lib_System.Xml.dll.so => 164
	i64 u0x2f885d4c41e2924b, ; 248: lib-de-Microsoft.VisualStudio.Validation.resources.dll.so => 420
	i64 u0x309ee9eeec09a71e, ; 249: lib_Xamarin.AndroidX.Fragment.dll.so => 262
	i64 u0x30c6dda129408828, ; 250: System.IO.IsolatedStorage => 52
	i64 u0x30dbbc02831164d7, ; 251: ru/Microsoft.VisualStudio.Validation.resources.dll => 428
	i64 u0x31195fef5d8fb552, ; 252: _Microsoft.Android.Resource.Designer.dll => 449
	i64 u0x312c8ed623cbfc8d, ; 253: Xamarin.AndroidX.Window.dll => 303
	i64 u0x31496b779ed0663d, ; 254: lib_System.Reflection.DispatchProxy.dll.so => 90
	i64 u0x315b31fc7085202d, ; 255: zh-Hant/Microsoft.VisualStudio.Composition.resources => 391
	i64 u0x321222767dff925c, ; 256: tr/Microsoft.VisualStudio.Validation.resources => 429
	i64 u0x32243413e774362a, ; 257: Xamarin.AndroidX.CardView.dll => 243
	i64 u0x32341cddd84f24db, ; 258: zh-Hant/Microsoft.ServiceHub.Resources.dll => 378
	i64 u0x3235427f8d12dae1, ; 259: lib_System.Drawing.Primitives.dll.so => 35
	i64 u0x323f008ff19f5368, ; 260: pl/StreamJsonRpc.resources.dll => 439
	i64 u0x329753a17a517811, ; 261: fr/Microsoft.Maui.Controls.resources => 327
	i64 u0x32aa989ff07a84ff, ; 262: lib_System.Xml.ReaderWriter.dll.so => 157
	i64 u0x3305db2d01b4b34b, ; 263: MessagePack.dll => 180
	i64 u0x330a42e1820d5df4, ; 264: lib-ko-StreamJsonRpc.resources.dll.so => 438
	i64 u0x33829542f112d59b, ; 265: System.Collections.Immutable => 9
	i64 u0x33a31443733849fe, ; 266: lib-es-Microsoft.Maui.Controls.resources.dll.so => 325
	i64 u0x341abc357fbb4ebf, ; 267: lib_System.Net.Sockets.dll.so => 76
	i64 u0x3496c1e2dcaf5ecc, ; 268: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i64 u0x34b2bc8bc64a1107, ; 269: System.Diagnostics.PerformanceCounter.dll => 220
	i64 u0x34dfd74fe2afcf37, ; 270: Microsoft.Maui => 193
	i64 u0x34e292762d9615df, ; 271: cs/Microsoft.Maui.Controls.resources.dll => 321
	i64 u0x3508234247f48404, ; 272: Microsoft.Maui.Controls => 191
	i64 u0x353590da528c9d22, ; 273: System.ComponentModel.Annotations => 13
	i64 u0x3549870798b4cd30, ; 274: lib_Xamarin.AndroidX.ViewPager2.dll.so => 302
	i64 u0x355282fc1c909694, ; 275: Microsoft.Extensions.Configuration => 182
	i64 u0x3552fc5d578f0fbf, ; 276: Xamarin.AndroidX.Arch.Core.Common => 240
	i64 u0x355c649948d55d97, ; 277: lib_System.Runtime.Intrinsics.dll.so => 109
	i64 u0x3578e808421be788, ; 278: zh-Hant/Microsoft.ServiceHub.Framework.resources.dll => 365
	i64 u0x3588d1a059376ce7, ; 279: ko/Microsoft.VisualStudio.Utilities.resources => 412
	i64 u0x35ea9d1c6834bc8c, ; 280: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 278
	i64 u0x3628ab68db23a01a, ; 281: lib_System.Diagnostics.Tools.dll.so => 32
	i64 u0x3673b042508f5b6b, ; 282: lib_System.Runtime.Extensions.dll.so => 104
	i64 u0x36740f1a8ecdc6c4, ; 283: System.Numerics => 84
	i64 u0x36b2b50fdf589ae2, ; 284: System.Reflection.Emit.Lightweight => 92
	i64 u0x36cada77dc79928b, ; 285: System.IO.MemoryMappedFiles => 53
	i64 u0x36d29958a49964eb, ; 286: Microsoft.VisualStudio.RemoteControl.dll => 200
	i64 u0x3721ed1b456c413b, ; 287: zh-Hans/Microsoft.VisualStudio.Utilities.resources => 417
	i64 u0x374ef46b06791af6, ; 288: System.Reflection.Primitives.dll => 96
	i64 u0x376bf93e521a5417, ; 289: lib_Xamarin.Jetbrains.Annotations.dll.so => 310
	i64 u0x37ae3815c78520a2, ; 290: es/Microsoft.VisualStudio.Utilities.resources.dll => 408
	i64 u0x37bc29f3183003b6, ; 291: lib_System.IO.dll.so => 58
	i64 u0x37fb359e4985caa0, ; 292: lib-ko-Microsoft.VisualStudio.Threading.resources.dll.so => 398
	i64 u0x380134e03b1e160a, ; 293: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 294: System.Runtime.CompilerServices.Unsafe => 102
	i64 u0x38143d85e217351a, ; 295: System.Composition.Hosting => 215
	i64 u0x385c17636bb6fe6e, ; 296: Xamarin.AndroidX.CustomView.dll => 254
	i64 u0x38869c811d74050e, ; 297: System.Net.NameResolution.dll => 68
	i64 u0x39251dccb84bdcaa, ; 298: lib_System.Configuration.ConfigurationManager.dll.so => 218
	i64 u0x393c226616977fdb, ; 299: lib_Xamarin.AndroidX.ViewPager.dll.so => 301
	i64 u0x39579d6c018f0671, ; 300: lib-pt-BR-Microsoft.VisualStudio.Validation.resources.dll.so => 427
	i64 u0x395e37c3334cf82a, ; 301: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 320
	i64 u0x395fac44164621b3, ; 302: it/Microsoft.VisualStudio.Utilities.resources.dll => 410
	i64 u0x39aa39fda111d9d3, ; 303: Newtonsoft.Json => 209
	i64 u0x3a5e80f61b57438b, ; 304: InTheHand.AndroidActivity => 178
	i64 u0x3ab5859054645f72, ; 305: System.Security.Cryptography.Primitives.dll => 125
	i64 u0x3ad75090c3fac0e9, ; 306: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 289
	i64 u0x3ae44ac43a1fbdbb, ; 307: System.Runtime.Serialization => 116
	i64 u0x3b860f9932505633, ; 308: lib_System.Text.Encoding.Extensions.dll.so => 135
	i64 u0x3bee2a0164ff78fa, ; 309: ru/Microsoft.VisualStudio.Validation.resources => 428
	i64 u0x3c3aafb6b3a00bf6, ; 310: lib_System.Security.Cryptography.X509Certificates.dll.so => 126
	i64 u0x3c4049146b59aa90, ; 311: System.Runtime.InteropServices.JavaScript => 106
	i64 u0x3c7c495f58ac5ee9, ; 312: Xamarin.Kotlin.StdLib => 311
	i64 u0x3c7e5ed3d5db71bb, ; 313: System.Security => 131
	i64 u0x3cd9d281d402eb9b, ; 314: Xamarin.AndroidX.Browser.dll => 242
	i64 u0x3d1c50cc001a991e, ; 315: Xamarin.Google.Guava.ListenableFuture.dll => 309
	i64 u0x3d2b1913edfc08d7, ; 316: lib_System.Threading.ThreadPool.dll.so => 147
	i64 u0x3d3b7b1b825c88ef, ; 317: pl/Microsoft.VisualStudio.Validation.resources => 426
	i64 u0x3d46f0b995082740, ; 318: System.Xml.Linq => 156
	i64 u0x3d8a8f400514a790, ; 319: Xamarin.AndroidX.Fragment.Ktx.dll => 263
	i64 u0x3d9c2a242b040a50, ; 320: lib_Xamarin.AndroidX.Core.dll.so => 251
	i64 u0x3dbb6b9f5ab90fa7, ; 321: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 258
	i64 u0x3e5441657549b213, ; 322: Xamarin.AndroidX.ResourceInspection.Annotation => 289
	i64 u0x3e57d4d195c53c2e, ; 323: System.Reflection.TypeExtensions => 97
	i64 u0x3e5c6dbb8fcda0bc, ; 324: pl/StreamJsonRpc.resources => 439
	i64 u0x3e616ab4ed1f3f15, ; 325: lib_System.Data.dll.so => 24
	i64 u0x3f1d226e6e06db7e, ; 326: Xamarin.AndroidX.SlidingPaneLayout.dll => 293
	i64 u0x3f510adf788828dd, ; 327: System.Threading.Tasks.Extensions => 143
	i64 u0x407740ff2e914d86, ; 328: Xamarin.AndroidX.Print.dll => 286
	i64 u0x407a10bb4bf95829, ; 329: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 282
	i64 u0x407a8d1779c33f16, ; 330: System.Diagnostics.PerformanceCounter => 220
	i64 u0x40c98b6bd77346d4, ; 331: Microsoft.VisualBasic.dll => 3
	i64 u0x415e36f6b13ff6f3, ; 332: System.Configuration.ConfigurationManager.dll => 218
	i64 u0x41833cf766d27d96, ; 333: mscorlib => 167
	i64 u0x41cab042be111c34, ; 334: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 239
	i64 u0x41e12a9d47a35c03, ; 335: es/Microsoft.ServiceHub.Framework.resources => 355
	i64 u0x423a9ecc4d905a88, ; 336: lib_System.Resources.ResourceManager.dll.so => 100
	i64 u0x423bf51ae7def810, ; 337: System.Xml.XPath => 161
	i64 u0x42462ff15ddba223, ; 338: System.Resources.Reader.dll => 99
	i64 u0x42a31b86e6ccc3f0, ; 339: System.Diagnostics.Contracts => 25
	i64 u0x42d3cd7add035099, ; 340: System.Management.dll => 224
	i64 u0x43053245becd3669, ; 341: ru/Microsoft.VisualStudio.Utilities.resources => 415
	i64 u0x430e95b891249788, ; 342: lib_System.Reflection.Emit.dll.so => 93
	i64 u0x431fefbf374bfceb, ; 343: lib_Microsoft.ServiceHub.Framework.dll.so => 197
	i64 u0x43375950ec7c1b6a, ; 344: netstandard.dll => 168
	i64 u0x434c4e1d9284cdae, ; 345: Mono.Android.dll => 172
	i64 u0x43505013578652a0, ; 346: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 234
	i64 u0x437d06c381ed575a, ; 347: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x43950f84de7cc79a, ; 348: pl/Microsoft.Maui.Controls.resources.dll => 339
	i64 u0x43e8ca5bc927ff37, ; 349: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 260
	i64 u0x43ed69fa9a0f5e79, ; 350: lib-de-Microsoft.VisualStudio.Utilities.resources.dll.so => 406
	i64 u0x448bd33429269b19, ; 351: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 352: lib_System.Runtime.Serialization.Primitives.dll.so => 114
	i64 u0x44baf2e713294eb7, ; 353: lib-de-Microsoft.VisualStudio.Composition.resources.dll.so => 380
	i64 u0x4515080865a951a5, ; 354: Xamarin.Kotlin.StdLib.dll => 311
	i64 u0x4545802489b736b9, ; 355: Xamarin.AndroidX.Fragment.Ktx => 263
	i64 u0x454b4d1e66bb783c, ; 356: Xamarin.AndroidX.Lifecycle.Process => 271
	i64 u0x455459f623107542, ; 357: lib_System.IO.Ports.dll.so => 223
	i64 u0x45c40276a42e283e, ; 358: System.Diagnostics.TraceSource => 33
	i64 u0x45d443f2a29adc37, ; 359: System.AppContext.dll => 6
	i64 u0x4641907841fa0798, ; 360: HomologacaoBalanca.dll => 0
	i64 u0x469e835b54a3a6eb, ; 361: es/Microsoft.VisualStudio.Threading.resources.dll => 394
	i64 u0x46a4213bc97fe5ae, ; 362: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 343
	i64 u0x46bb0d0e5068d574, ; 363: Microsoft.VisualStudio.Threading => 203
	i64 u0x46bed6328dfe648d, ; 364: it/Microsoft.VisualStudio.Utilities.resources => 410
	i64 u0x46cc78674aaa0f50, ; 365: pt-BR/StreamJsonRpc.resources.dll => 440
	i64 u0x46ce523b37217417, ; 366: lib_Microsoft.VisualStudio.Utilities.Internal.dll.so => 205
	i64 u0x46ddcd1751a0c6f5, ; 367: Microsoft.VisualStudio.Composition => 199
	i64 u0x4706503a2a3ecc4c, ; 368: fr/Microsoft.VisualStudio.Threading.resources.dll => 395
	i64 u0x47358bd471172e1d, ; 369: lib_System.Xml.Linq.dll.so => 156
	i64 u0x47daf4e1afbada10, ; 370: pt/Microsoft.Maui.Controls.resources => 341
	i64 u0x480c0a47dd42dd81, ; 371: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i64 u0x488d293220a4fe37, ; 372: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 265
	i64 u0x4897920d784a6bfe, ; 373: lib-ja-Microsoft.ServiceHub.Resources.dll.so => 371
	i64 u0x48c3e4c9695979aa, ; 374: zh-Hant/Microsoft.VisualStudio.Validation.resources => 431
	i64 u0x494eac4f2d35b490, ; 375: lib-zh-Hans-StreamJsonRpc.resources.dll.so => 443
	i64 u0x4953c088b9debf0a, ; 376: lib_System.Security.Permissions.dll.so => 226
	i64 u0x49cc5354dfc1c1b0, ; 377: cs/StreamJsonRpc.resources.dll => 432
	i64 u0x49d1a16962a11c5e, ; 378: lib-it-Microsoft.VisualStudio.Utilities.resources.dll.so => 410
	i64 u0x49e952f19a4e2022, ; 379: System.ObjectModel => 85
	i64 u0x49f9e6948a8131e4, ; 380: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 300
	i64 u0x4a4f1047df83044b, ; 381: lib_System.Composition.AttributedModel.dll.so => 213
	i64 u0x4a5667b2462a664b, ; 382: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 285
	i64 u0x4a7a18981dbd56bc, ; 383: System.IO.Compression.FileSystem.dll => 44
	i64 u0x4aa5c60350917c06, ; 384: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 270
	i64 u0x4b07a0ed0ab33ff4, ; 385: System.Runtime.Extensions.dll => 104
	i64 u0x4b576d47ac054f3c, ; 386: System.IO.FileSystem.AccessControl => 47
	i64 u0x4b7b6532ded934b7, ; 387: System.Text.Json => 138
	i64 u0x4c5d7909d49690e3, ; 388: MessagePack.Annotations => 181
	i64 u0x4c7755cf07ad2d5f, ; 389: System.Net.Http.Json.dll => 64
	i64 u0x4cc5f15266470798, ; 390: lib_Xamarin.AndroidX.Loader.dll.so => 280
	i64 u0x4cf6f67dc77aacd2, ; 391: System.Net.NetworkInformation.dll => 69
	i64 u0x4d3183dd245425d4, ; 392: System.Net.WebSockets.Client.dll => 80
	i64 u0x4d479f968a05e504, ; 393: System.Linq.Expressions.dll => 59
	i64 u0x4d55a010ffc4faff, ; 394: System.Private.Xml => 89
	i64 u0x4d5cbe77561c5b2e, ; 395: System.Web.dll => 154
	i64 u0x4d77512dbd86ee4c, ; 396: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 240
	i64 u0x4d7793536e79c309, ; 397: System.ServiceProcess => 133
	i64 u0x4d95fccc1f67c7ca, ; 398: System.Runtime.Loader.dll => 110
	i64 u0x4d98ad8887c504b3, ; 399: lib-pt-BR-Microsoft.VisualStudio.Utilities.resources.dll.so => 414
	i64 u0x4dcf44c3c9b076a2, ; 400: it/Microsoft.Maui.Controls.resources.dll => 333
	i64 u0x4dd9247f1d2c3235, ; 401: Xamarin.AndroidX.Loader.dll => 280
	i64 u0x4e147fe58cdfbcc5, ; 402: pt-BR/Microsoft.ServiceHub.Resources => 374
	i64 u0x4e2aeee78e2c4a87, ; 403: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 287
	i64 u0x4e32f00cb0937401, ; 404: Mono.Android.Runtime => 171
	i64 u0x4e5eea4668ac2b18, ; 405: System.Text.Encoding.CodePages => 134
	i64 u0x4e8f60c54ff7595b, ; 406: lib-ja-Microsoft.VisualStudio.Threading.resources.dll.so => 397
	i64 u0x4e946d8db8680cbf, ; 407: zh-Hans/StreamJsonRpc.resources => 443
	i64 u0x4ebd0c4b82c5eefc, ; 408: lib_System.Threading.Channels.dll.so => 140
	i64 u0x4ee8eaa9c9c1151a, ; 409: System.Globalization.Calendars => 40
	i64 u0x4f21ee6ef9eb527e, ; 410: ca/Microsoft.Maui.Controls.resources => 320
	i64 u0x4f30f77d9fc625fd, ; 411: lib-tr-StreamJsonRpc.resources.dll.so => 442
	i64 u0x4fd13fd298b8d57b, ; 412: ru/Microsoft.VisualStudio.Threading.resources.dll => 401
	i64 u0x5037f0be3c28c7a3, ; 413: lib_Microsoft.Maui.Controls.dll.so => 191
	i64 u0x50c3a29b21050d45, ; 414: System.Linq.Parallel.dll => 60
	i64 u0x5112ed116d87baf8, ; 415: CommunityToolkit.Mvvm => 176
	i64 u0x512275a56a60d7df, ; 416: es/Microsoft.ServiceHub.Framework.resources.dll => 355
	i64 u0x5131bbe80989093f, ; 417: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 277
	i64 u0x516324a5050a7e3c, ; 418: System.Net.WebProxy => 79
	i64 u0x516d6f0b21a303de, ; 419: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x5189925b1a7e72a1, ; 420: lib-de-Microsoft.ServiceHub.Resources.dll.so => 367
	i64 u0x51bb8a2afe774e32, ; 421: System.Drawing => 36
	i64 u0x51f43453dd033104, ; 422: System.Private.Windows.Core => 222
	i64 u0x5247c5c32a4140f0, ; 423: System.Resources.Reader => 99
	i64 u0x526bb15e3c386364, ; 424: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 274
	i64 u0x526ce79eb8e90527, ; 425: lib_System.Net.Primitives.dll.so => 71
	i64 u0x52829f00b4467c38, ; 426: lib_System.Data.Common.dll.so => 22
	i64 u0x529ffe06f39ab8db, ; 427: Xamarin.AndroidX.Core => 251
	i64 u0x52ff996554dbf352, ; 428: Microsoft.Maui.Graphics => 195
	i64 u0x535f7e40e8fef8af, ; 429: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 344
	i64 u0x53604e12f0d92ae5, ; 430: tr/Microsoft.VisualStudio.Utilities.resources.dll => 416
	i64 u0x538cc12d6e5d6434, ; 431: it/Microsoft.ServiceHub.Resources => 370
	i64 u0x53978aac584c666e, ; 432: lib_System.Security.Cryptography.Cng.dll.so => 121
	i64 u0x53a96d5c86c9e194, ; 433: System.Net.NetworkInformation => 69
	i64 u0x53be1038a61e8d44, ; 434: System.Runtime.InteropServices.RuntimeInformation.dll => 107
	i64 u0x53c3014b9437e684, ; 435: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 350
	i64 u0x53e450ebd586f842, ; 436: lib_Xamarin.AndroidX.LocalBroadcastManager.dll.so => 281
	i64 u0x5435e6f049e9bc37, ; 437: System.Security.Claims.dll => 119
	i64 u0x54795225dd1587af, ; 438: lib_System.Runtime.dll.so => 117
	i64 u0x547a34f14e5f6210, ; 439: Xamarin.AndroidX.Lifecycle.Common.dll => 266
	i64 u0x5513607c9ad6ac54, ; 440: zh-Hant/Microsoft.VisualStudio.Threading.resources.dll => 404
	i64 u0x556e8b63b660ab8b, ; 441: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 267
	i64 u0x5588627c9a108ec9, ; 442: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 443: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 444: lib_System.Security.Cryptography.OpenSsl.dll.so => 124
	i64 u0x56442b99bc64bb47, ; 445: System.Runtime.Serialization.Xml.dll => 115
	i64 u0x56a8b26e1aeae27b, ; 446: System.Threading.Tasks.Dataflow => 142
	i64 u0x56f932d61e93c07f, ; 447: System.Globalization.Extensions => 41
	i64 u0x571c5cfbec5ae8e2, ; 448: System.Private.Uri => 87
	i64 u0x576499c9f52fea31, ; 449: Xamarin.AndroidX.Annotation => 235
	i64 u0x579a06fed6eec900, ; 450: System.Private.CoreLib.dll => 173
	i64 u0x57c542c14049b66d, ; 451: System.Diagnostics.DiagnosticSource => 27
	i64 u0x581a8bd5cfda563e, ; 452: System.Threading.Timer => 148
	i64 u0x58601b2dda4a27b9, ; 453: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 334
	i64 u0x58688d9af496b168, ; 454: Microsoft.Extensions.DependencyInjection.dll => 184
	i64 u0x588c167a79db6bfb, ; 455: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 308
	i64 u0x58f7e92114b07233, ; 456: lib-tr-Microsoft.VisualStudio.Composition.resources.dll.so => 389
	i64 u0x5906028ae5151104, ; 457: Xamarin.AndroidX.Activity.Ktx => 234
	i64 u0x595a356d23e8da9a, ; 458: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x597d58a5c4373cea, ; 459: System.Composition.Runtime.dll => 216
	i64 u0x59e7d10199564e8b, ; 460: ko/Microsoft.VisualStudio.Threading.resources.dll => 398
	i64 u0x59f9e60b9475085f, ; 461: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 236
	i64 u0x5a745f5101a75527, ; 462: lib_System.IO.Compression.FileSystem.dll.so => 44
	i64 u0x5a89a886ae30258d, ; 463: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 250
	i64 u0x5a8a45594054ac89, ; 464: Microsoft.ServiceHub.Resources.dll => 198
	i64 u0x5a8f6699f4a1caa9, ; 465: lib_System.Threading.dll.so => 149
	i64 u0x5ab869a43ba38bc5, ; 466: pl/Microsoft.ServiceHub.Resources.dll => 373
	i64 u0x5ac138b93f2e004d, ; 467: it/Microsoft.VisualStudio.Validation.resources.dll => 423
	i64 u0x5ae8e4f3eae4d547, ; 468: Xamarin.AndroidX.Legacy.Support.Core.Utils => 265
	i64 u0x5ae9cd33b15841bf, ; 469: System.ComponentModel => 18
	i64 u0x5b54391bdc6fcfe6, ; 470: System.Private.DataContractSerialization => 86
	i64 u0x5b5f0e240a06a2a2, ; 471: da/Microsoft.Maui.Controls.resources.dll => 322
	i64 u0x5b8109e8e14c5e3e, ; 472: System.Globalization.Extensions.dll => 41
	i64 u0x5bddd04d72a9e350, ; 473: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 270
	i64 u0x5bdf16b09da116ab, ; 474: Xamarin.AndroidX.Collection => 244
	i64 u0x5c019d5266093159, ; 475: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 275
	i64 u0x5c30a4a35f9cc8c4, ; 476: lib_System.Reflection.Extensions.dll.so => 94
	i64 u0x5c393624b8176517, ; 477: lib_Microsoft.Extensions.Logging.dll.so => 186
	i64 u0x5c53c29f5073b0c9, ; 478: System.Diagnostics.FileVersionInfo => 28
	i64 u0x5c54bb65f6990041, ; 479: it/StreamJsonRpc.resources => 436
	i64 u0x5c87463c575c7616, ; 480: lib_System.Globalization.Extensions.dll.so => 41
	i64 u0x5d0a4a29b02d9d3c, ; 481: System.Net.WebHeaderCollection.dll => 78
	i64 u0x5d40c9b15181641f, ; 482: lib_Xamarin.AndroidX.Emoji2.dll.so => 259
	i64 u0x5d6ca10d35e9485b, ; 483: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 247
	i64 u0x5d7ec76c1c703055, ; 484: System.Threading.Tasks.Parallel => 144
	i64 u0x5db0cbbd1028510e, ; 485: lib_System.Runtime.InteropServices.dll.so => 108
	i64 u0x5db30905d3e5013b, ; 486: Xamarin.AndroidX.Collection.Jvm.dll => 245
	i64 u0x5e0b57876293e3b2, ; 487: lib-it-Microsoft.VisualStudio.Composition.resources.dll.so => 383
	i64 u0x5e242c8294e6d482, ; 488: es/Microsoft.VisualStudio.Composition.resources.dll => 381
	i64 u0x5e467bc8f09ad026, ; 489: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 490: System.Runtime.Handles.dll => 105
	i64 u0x5ea92fdb19ec8c4c, ; 491: System.Text.Encodings.Web.dll => 137
	i64 u0x5ead2b4c002906c3, ; 492: ko/Microsoft.VisualStudio.Utilities.resources.dll => 412
	i64 u0x5eb8046dd40e9ac3, ; 493: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 494: System.Security.Cryptography.Csp.dll => 122
	i64 u0x5eee1376d94c7f5e, ; 495: System.Net.HttpListener.dll => 66
	i64 u0x5f36ccf5c6a57e24, ; 496: System.Xml.ReaderWriter.dll => 157
	i64 u0x5f38d6db51d518ff, ; 497: InTheHand.BluetoothLE => 179
	i64 u0x5f4294b9b63cb842, ; 498: System.Data.Common => 22
	i64 u0x5f9a2d823f664957, ; 499: lib-el-Microsoft.Maui.Controls.resources.dll.so => 324
	i64 u0x5fa6da9c3cd8142a, ; 500: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 317
	i64 u0x5fac98e0b37a5b9d, ; 501: System.Runtime.CompilerServices.Unsafe.dll => 102
	i64 u0x609f4b7b63d802d4, ; 502: lib_Microsoft.Extensions.DependencyInjection.dll.so => 184
	i64 u0x60cd4e33d7e60134, ; 503: Xamarin.KotlinX.Coroutines.Core.Jvm => 316
	i64 u0x60f62d786afcf130, ; 504: System.Memory => 63
	i64 u0x6194211366f0e8ee, ; 505: zh-Hant/Microsoft.VisualStudio.Composition.resources.dll => 391
	i64 u0x61bb78c89f867353, ; 506: System.IO => 58
	i64 u0x61be8d1299194243, ; 507: Microsoft.Maui.Controls.Xaml => 192
	i64 u0x61d2cba29557038f, ; 508: de/Microsoft.Maui.Controls.resources => 323
	i64 u0x61d88f399afb2f45, ; 509: lib_System.Runtime.Loader.dll.so => 110
	i64 u0x622eef6f9e59068d, ; 510: System.Private.CoreLib => 173
	i64 u0x625f093841297819, ; 511: cs/Microsoft.VisualStudio.Composition.resources => 379
	i64 u0x62f84441f4de37bb, ; 512: es/StreamJsonRpc.resources => 434
	i64 u0x62fd94aa35fd7528, ; 513: Microsoft.NET.StringTools => 196
	i64 u0x63cdbd66ac39bb46, ; 514: lib_Microsoft.VisualStudio.DesignTools.XamlTapContract.dll.so => 448
	i64 u0x63d5e3aa4ef9b931, ; 515: Xamarin.KotlinX.Coroutines.Android.dll => 314
	i64 u0x63f1f6883c1e23c2, ; 516: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x6400f68068c1e9f1, ; 517: Xamarin.Google.Android.Material.dll => 305
	i64 u0x640e3b14dbd325c2, ; 518: System.Security.Cryptography.Algorithms.dll => 120
	i64 u0x643b1a32e2ec7cb4, ; 519: de/Microsoft.VisualStudio.Validation.resources => 420
	i64 u0x64587004560099b9, ; 520: System.Reflection => 98
	i64 u0x64b1529a438a3c45, ; 521: lib_System.Runtime.Handles.dll.so => 105
	i64 u0x6565fba2cd8f235b, ; 522: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 278
	i64 u0x658f524e4aba7dad, ; 523: CommunityToolkit.Maui.dll => 174
	i64 u0x65ecac39144dd3cc, ; 524: Microsoft.Maui.Controls.dll => 191
	i64 u0x65ece51227bfa724, ; 525: lib_System.Runtime.Numerics.dll.so => 111
	i64 u0x661722438787b57f, ; 526: Xamarin.AndroidX.Annotation.Jvm.dll => 237
	i64 u0x66735e5e9d36fab5, ; 527: ru/Microsoft.VisualStudio.Composition.resources.dll => 388
	i64 u0x6679b2337ee6b22a, ; 528: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i64 u0x6692e924eade1b29, ; 529: lib_System.Console.dll.so => 20
	i64 u0x66a4e5c6a3fb0bae, ; 530: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 277
	i64 u0x66ad21286ac74b9d, ; 531: lib_System.Drawing.Common.dll.so => 221
	i64 u0x66ba3b18a9af9bbc, ; 532: ru/Microsoft.ServiceHub.Framework.resources.dll => 362
	i64 u0x66d13304ce1a3efa, ; 533: Xamarin.AndroidX.CursorAdapter => 253
	i64 u0x671bc6e9019de530, ; 534: StreamJsonRpc => 210
	i64 u0x6735be5cfcf0e6c2, ; 535: pl/Microsoft.VisualStudio.Utilities.resources.dll => 413
	i64 u0x674303f65d8fad6f, ; 536: lib_System.Net.Quic.dll.so => 72
	i64 u0x6756ca4cad62e9d6, ; 537: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 249
	i64 u0x67c0802770244408, ; 538: System.Windows.dll => 155
	i64 u0x67c0d6eb5a84aa5a, ; 539: lib_System.Diagnostics.PerformanceCounter.dll.so => 220
	i64 u0x68100b69286e27cd, ; 540: lib_System.Formats.Tar.dll.so => 39
	i64 u0x68105242c6020f1d, ; 541: System.ComponentModel.Composition => 212
	i64 u0x68558ec653afa616, ; 542: lib-da-Microsoft.Maui.Controls.resources.dll.so => 322
	i64 u0x6872ec7a2e36b1ac, ; 543: System.Drawing.Primitives.dll => 35
	i64 u0x68bb2c417aa9b61c, ; 544: Xamarin.KotlinX.AtomicFU.dll => 312
	i64 u0x68fbbbe2eb455198, ; 545: System.Formats.Asn1 => 38
	i64 u0x69063fc0ba8e6bdd, ; 546: he/Microsoft.Maui.Controls.resources.dll => 328
	i64 u0x691a495d6cf24d1c, ; 547: ru/Microsoft.ServiceHub.Resources => 375
	i64 u0x6937071e500efca0, ; 548: cs/Microsoft.VisualStudio.Utilities.resources.dll => 405
	i64 u0x695bc7b274a71abf, ; 549: System.Composition.Runtime => 216
	i64 u0x69728c42e7e52418, ; 550: ko/Microsoft.VisualStudio.Composition.resources.dll => 385
	i64 u0x69a3e26c76f6eec4, ; 551: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 304
	i64 u0x6a4d7577b2317255, ; 552: System.Runtime.InteropServices.dll => 108
	i64 u0x6ace3b74b15ee4a4, ; 553: nb/Microsoft.Maui.Controls.resources => 337
	i64 u0x6afcedb171067e2b, ; 554: System.Core.dll => 21
	i64 u0x6b14abce336bb290, ; 555: de/StreamJsonRpc.resources.dll => 433
	i64 u0x6b7c3ddd7ec3218e, ; 556: pl/Microsoft.VisualStudio.Composition.resources => 386
	i64 u0x6bb115c4c70f9cbb, ; 557: lib-ko-Microsoft.VisualStudio.Composition.resources.dll.so => 385
	i64 u0x6bef98e124147c24, ; 558: Xamarin.Jetbrains.Annotations => 310
	i64 u0x6c035ddab3d082a2, ; 559: lib-pt-BR-Microsoft.ServiceHub.Resources.dll.so => 374
	i64 u0x6c2de8161da69101, ; 560: lib_Nerdbank.Streams.dll.so => 208
	i64 u0x6c2eed38d43dd725, ; 561: lib-zh-Hans-Microsoft.VisualStudio.Validation.resources.dll.so => 430
	i64 u0x6ce874bff138ce2b, ; 562: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 276
	i64 u0x6d0a12b2adba20d8, ; 563: System.Security.Cryptography.ProtectedData.dll => 225
	i64 u0x6d1056219bf88cf7, ; 564: ja/Microsoft.VisualStudio.Threading.resources => 397
	i64 u0x6d12bfaa99c72b1f, ; 565: lib_Microsoft.Maui.Graphics.dll.so => 195
	i64 u0x6d70755158ca866e, ; 566: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 567: Microsoft.Extensions.Primitives => 190
	i64 u0x6d7eeca99577fc8b, ; 568: lib_System.Net.WebProxy.dll.so => 79
	i64 u0x6d8515b19946b6a2, ; 569: System.Net.WebProxy.dll => 79
	i64 u0x6d86d56b84c8eb71, ; 570: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 253
	i64 u0x6d9bea6b3e895cf7, ; 571: Microsoft.Extensions.Primitives.dll => 190
	i64 u0x6daf7a399dc61771, ; 572: tr/StreamJsonRpc.resources.dll => 442
	i64 u0x6dd9bf4083de3f6a, ; 573: Xamarin.AndroidX.DocumentFile.dll => 256
	i64 u0x6e21d3967913d956, ; 574: it/Microsoft.VisualStudio.Composition.resources.dll => 383
	i64 u0x6e25a02c3833319a, ; 575: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 283
	i64 u0x6e79c6bd8627412a, ; 576: Xamarin.AndroidX.SavedState.SavedState.Ktx => 291
	i64 u0x6e81d15cef1dfc37, ; 577: ru/Microsoft.VisualStudio.Composition.resources => 388
	i64 u0x6e838d9a2a6f6c9e, ; 578: lib_System.ValueTuple.dll.so => 152
	i64 u0x6e9965ce1095e60a, ; 579: lib_System.Core.dll.so => 21
	i64 u0x6f2f193d5ef3fd8d, ; 580: pt-BR/StreamJsonRpc.resources => 440
	i64 u0x6fd2265da78b93a4, ; 581: lib_Microsoft.Maui.dll.so => 193
	i64 u0x6fdfc7de82c33008, ; 582: cs/Microsoft.Maui.Controls.resources => 321
	i64 u0x6ffc4967cc47ba57, ; 583: System.IO.FileSystem.Watcher.dll => 50
	i64 u0x7005e5f4e1ceccc4, ; 584: de/Microsoft.VisualStudio.Threading.resources.dll => 393
	i64 u0x700cf1e5ed1972e8, ; 585: fr/Microsoft.ServiceHub.Framework.resources.dll => 356
	i64 u0x701cd46a1c25a5fe, ; 586: System.IO.FileSystem.dll => 51
	i64 u0x70431eb0787c1989, ; 587: lib-it-Microsoft.VisualStudio.Threading.resources.dll.so => 396
	i64 u0x70da56e8e432b0e0, ; 588: es/Microsoft.ServiceHub.Resources.dll => 368
	i64 u0x70e99f48c05cb921, ; 589: tr/Microsoft.Maui.Controls.resources.dll => 347
	i64 u0x70fd3deda22442d2, ; 590: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 337
	i64 u0x71485e7ffdb4b958, ; 591: System.Reflection.Extensions => 94
	i64 u0x7162a2fce67a945f, ; 592: lib_Xamarin.Android.Glide.Annotations.dll.so => 230
	i64 u0x717d8d68e61abc59, ; 593: lib_Microsoft.VisualStudio.Validation.dll.so => 206
	i64 u0x71a495ea3761dde8, ; 594: lib-it-Microsoft.Maui.Controls.resources.dll.so => 333
	i64 u0x71ad672adbe48f35, ; 595: System.ComponentModel.Primitives.dll => 16
	i64 u0x725238b82e797fd5, ; 596: ko/Microsoft.VisualStudio.Threading.resources => 398
	i64 u0x725f5a9e82a45c81, ; 597: System.Security.Cryptography.Encoding => 123
	i64 u0x72b1fb4109e08d7b, ; 598: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 330
	i64 u0x72e0300099accce1, ; 599: System.Xml.XPath.XDocument => 160
	i64 u0x72e9cdd8fe6b650d, ; 600: lib_Microsoft.VisualStudio.Composition.dll.so => 199
	i64 u0x7303a2fff542e666, ; 601: fr/Microsoft.VisualStudio.Utilities.resources.dll => 409
	i64 u0x730bfb248998f67a, ; 602: System.IO.Compression.ZipFile => 45
	i64 u0x732ad41db0a0b223, ; 603: lib_InTheHand.BluetoothLE.dll.so => 179
	i64 u0x732b2d67b9e5c47b, ; 604: Xamarin.Google.ErrorProne.Annotations.dll => 308
	i64 u0x734b76fdc0dc05bb, ; 605: lib_GoogleGson.dll.so => 177
	i64 u0x73a6be34e822f9d1, ; 606: lib_System.Runtime.Serialization.dll.so => 116
	i64 u0x73e4ce94e2eb6ffc, ; 607: lib_System.Memory.dll.so => 63
	i64 u0x743a1eccf080489a, ; 608: WindowsBase.dll => 166
	i64 u0x74d87a02678343f8, ; 609: lib-pl-Microsoft.VisualStudio.Composition.resources.dll.so => 386
	i64 u0x755a91767330b3d4, ; 610: lib_Microsoft.Extensions.Configuration.dll.so => 182
	i64 u0x755e8eec81d0b352, ; 611: lib-ko-Microsoft.ServiceHub.Resources.dll.so => 372
	i64 u0x7561c7ea08477a3c, ; 612: cs/Microsoft.VisualStudio.Validation.resources.dll => 419
	i64 u0x759386c803b32a0e, ; 613: zh-Hans/Microsoft.VisualStudio.Validation.resources => 430
	i64 u0x75c326eb821b85c4, ; 614: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 615: lib_Xamarin.AndroidX.SavedState.dll.so => 290
	i64 u0x76ca07b878f44da0, ; 616: System.Runtime.Numerics.dll => 111
	i64 u0x771fee67aa159ee5, ; 617: de/Microsoft.ServiceHub.Framework.resources.dll => 354
	i64 u0x7736c8a96e51a061, ; 618: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 237
	i64 u0x778a805e625329ef, ; 619: System.Linq.Parallel => 60
	i64 u0x779290cc2b801eb7, ; 620: Xamarin.KotlinX.AtomicFU.Jvm => 313
	i64 u0x779c4d1e861d0950, ; 621: zh-Hans/Microsoft.ServiceHub.Framework.resources => 364
	i64 u0x77f69db7b6be8671, ; 622: lib-ko-Microsoft.VisualStudio.Utilities.resources.dll.so => 412
	i64 u0x77f8a4acc2fdc449, ; 623: System.Security.Cryptography.Cng.dll => 121
	i64 u0x780bc73597a503a9, ; 624: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 336
	i64 u0x782c5d8eb99ff201, ; 625: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x783606d1e53e7a1a, ; 626: th/Microsoft.Maui.Controls.resources.dll => 346
	i64 u0x7841c47b741b9f64, ; 627: System.Security.Permissions => 226
	i64 u0x78a45e51311409b6, ; 628: Xamarin.AndroidX.Fragment.dll => 262
	i64 u0x78ed4ab8f9d800a1, ; 629: Xamarin.AndroidX.Lifecycle.ViewModel => 276
	i64 u0x79f2a1023f4320f2, ; 630: Microsoft.Win32.SystemEvents => 207
	i64 u0x7a1a5277e534fa6f, ; 631: lib-es-Microsoft.ServiceHub.Framework.resources.dll.so => 355
	i64 u0x7a39601d6f0bb831, ; 632: lib_Xamarin.KotlinX.AtomicFU.dll.so => 312
	i64 u0x7a6dec6554c87069, ; 633: lib-cs-Microsoft.VisualStudio.Composition.resources.dll.so => 379
	i64 u0x7a7e7eddf79c5d26, ; 634: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 276
	i64 u0x7a9a57d43b0845fa, ; 635: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 636: Xamarin.AndroidX.Collection.dll => 244
	i64 u0x7adb8da2ac89b647, ; 637: fi/Microsoft.Maui.Controls.resources.dll => 326
	i64 u0x7b13d9eaa944ade8, ; 638: Xamarin.AndroidX.DynamicAnimation.dll => 258
	i64 u0x7b16b2e58540cd98, ; 639: de/Microsoft.VisualStudio.Threading.resources => 393
	i64 u0x7b25ea550d9a27e6, ; 640: cs/Microsoft.VisualStudio.Threading.resources => 392
	i64 u0x7be065298eec972f, ; 641: lib-ru-Microsoft.ServiceHub.Framework.resources.dll.so => 362
	i64 u0x7bef86a4335c4870, ; 642: System.ComponentModel.TypeConverter => 17
	i64 u0x7c0820144cd34d6a, ; 643: sk/Microsoft.Maui.Controls.resources.dll => 344
	i64 u0x7c2a0bd1e0f988fc, ; 644: lib-de-Microsoft.Maui.Controls.resources.dll.so => 323
	i64 u0x7c41d387501568ba, ; 645: System.Net.WebClient.dll => 77
	i64 u0x7c482cd79bd24b13, ; 646: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 248
	i64 u0x7cc637f941f716d0, ; 647: CommunityToolkit.Maui.Core => 175
	i64 u0x7cd2ec8eaf5241cd, ; 648: System.Security.dll => 131
	i64 u0x7cf0d31350c1cfac, ; 649: tr/Microsoft.VisualStudio.Utilities.resources => 416
	i64 u0x7cf9ae50dd350622, ; 650: Xamarin.Jetbrains.Annotations.dll => 310
	i64 u0x7d649b75d580bb42, ; 651: ms/Microsoft.Maui.Controls.resources.dll => 336
	i64 u0x7d8ee2bdc8e3aad1, ; 652: System.Numerics.Vectors => 83
	i64 u0x7d90b610aa1e3b89, ; 653: lib-fr-Microsoft.ServiceHub.Framework.resources.dll.so => 356
	i64 u0x7da33684563f2eeb, ; 654: cs/Microsoft.ServiceHub.Framework.resources.dll => 353
	i64 u0x7df5df8db8eaa6ac, ; 655: Microsoft.Extensions.Logging.Debug => 188
	i64 u0x7dfc3d6d9d8d7b70, ; 656: System.Collections => 12
	i64 u0x7e2e564fa2f76c65, ; 657: lib_System.Diagnostics.Tracing.dll.so => 34
	i64 u0x7e302e110e1e1346, ; 658: lib_System.Security.Claims.dll.so => 119
	i64 u0x7e33c3f4027529b8, ; 659: lib-it-Microsoft.VisualStudio.Validation.resources.dll.so => 423
	i64 u0x7e4465b3f78ad8d0, ; 660: Xamarin.KotlinX.Serialization.Core.dll => 317
	i64 u0x7e571cad5915e6c3, ; 661: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 271
	i64 u0x7e6b1ca712437d7d, ; 662: Xamarin.AndroidX.Emoji2.ViewsHelper => 260
	i64 u0x7e946809d6008ef2, ; 663: lib_System.ObjectModel.dll.so => 85
	i64 u0x7ea0272c1b4a9635, ; 664: lib_Xamarin.Android.Glide.dll.so => 229
	i64 u0x7ecc13347c8fd849, ; 665: lib_System.ComponentModel.dll.so => 18
	i64 u0x7f00ddd9b9ca5a13, ; 666: Xamarin.AndroidX.ViewPager.dll => 301
	i64 u0x7f07154a8aea84d9, ; 667: lib-zh-Hans-Microsoft.VisualStudio.Utilities.resources.dll.so => 417
	i64 u0x7f0dfde31af577ab, ; 668: de/Microsoft.ServiceHub.Resources => 367
	i64 u0x7f9351cd44b1273f, ; 669: Microsoft.Extensions.Configuration.Abstractions => 183
	i64 u0x7fbd557c99b3ce6f, ; 670: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 269
	i64 u0x8042b494c00b6124, ; 671: Microsoft.VisualStudio.Composition.dll => 199
	i64 u0x8076a9a44a2ca331, ; 672: System.Net.Quic => 72
	i64 u0x80b7e726b0280681, ; 673: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 446
	i64 u0x80da183a87731838, ; 674: System.Reflection.Metadata => 95
	i64 u0x812c069d5cdecc17, ; 675: System.dll => 165
	i64 u0x81381be520a60adb, ; 676: Xamarin.AndroidX.Interpolator.dll => 264
	i64 u0x81657cec2b31e8aa, ; 677: System.Net => 82
	i64 u0x81ab745f6c0f5ce6, ; 678: zh-Hant/Microsoft.Maui.Controls.resources => 352
	i64 u0x81b32d5c0d8f2516, ; 679: zh-Hans/Microsoft.ServiceHub.Resources => 377
	i64 u0x82428125a21a12b6, ; 680: zh-Hans/Microsoft.ServiceHub.Resources.dll => 377
	i64 u0x825c2d1b76853f8b, ; 681: Microsoft.VisualStudio.Telemetry.dll => 202
	i64 u0x8277f2be6b5ce05f, ; 682: Xamarin.AndroidX.AppCompat => 238
	i64 u0x8281b9abf7e455e0, ; 683: zh-Hant/StreamJsonRpc.resources => 444
	i64 u0x828f06563b30bc50, ; 684: lib_Xamarin.AndroidX.CardView.dll.so => 243
	i64 u0x82920a8d9194a019, ; 685: Xamarin.KotlinX.AtomicFU.Jvm.dll => 313
	i64 u0x82b2f125ed906d27, ; 686: fr/Microsoft.VisualStudio.Composition.resources.dll => 382
	i64 u0x82b399cb01b531c4, ; 687: lib_System.Web.dll.so => 154
	i64 u0x82d3be9e0bb6a10b, ; 688: InTheHand.AndroidActivity.dll => 178
	i64 u0x82d69872447d7e53, ; 689: lib_MessagePack.dll.so => 180
	i64 u0x82df8f5532a10c59, ; 690: lib_System.Drawing.dll.so => 36
	i64 u0x82f0b6e911d13535, ; 691: lib_System.Transactions.dll.so => 151
	i64 u0x82f6403342e12049, ; 692: uk/Microsoft.Maui.Controls.resources => 348
	i64 u0x83030a0289884d0d, ; 693: lib-fr-Microsoft.ServiceHub.Resources.dll.so => 369
	i64 u0x83c14ba66c8e2b8c, ; 694: zh-Hans/Microsoft.Maui.Controls.resources => 351
	i64 u0x83f6faa404ef1e6b, ; 695: lib-pt-BR-Microsoft.VisualStudio.Composition.resources.dll.so => 387
	i64 u0x846ce984efea52c7, ; 696: System.Threading.Tasks.Parallel.dll => 144
	i64 u0x847c02dc8c38b10e, ; 697: lib_Microsoft.NET.StringTools.dll.so => 196
	i64 u0x84ae73148a4557d2, ; 698: lib_System.IO.Pipes.dll.so => 56
	i64 u0x84b01102c12a9232, ; 699: System.Runtime.Serialization.Json.dll => 113
	i64 u0x850c5ba0b57ce8e7, ; 700: lib_Xamarin.AndroidX.Collection.dll.so => 244
	i64 u0x851d02edd334b044, ; 701: Xamarin.AndroidX.VectorDrawable => 298
	i64 u0x855713009ceaac4f, ; 702: System.Composition.TypedParts => 217
	i64 u0x85c919db62150978, ; 703: Xamarin.AndroidX.Transition.dll => 297
	i64 u0x8662aaeb94fef37f, ; 704: lib_System.Dynamic.Runtime.dll.so => 37
	i64 u0x86a909228dc7657b, ; 705: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 352
	i64 u0x86b3e00c36b84509, ; 706: Microsoft.Extensions.Configuration.dll => 182
	i64 u0x86b62cb077ec4fd7, ; 707: System.Runtime.Serialization.Xml => 115
	i64 u0x8706ffb12bf3f53d, ; 708: Xamarin.AndroidX.Annotation.Experimental => 236
	i64 u0x872a5b14c18d328c, ; 709: System.ComponentModel.DataAnnotations => 14
	i64 u0x872fb9615bc2dff0, ; 710: Xamarin.Android.Glide.Annotations.dll => 230
	i64 u0x87c69b87d9283884, ; 711: lib_System.Threading.Thread.dll.so => 146
	i64 u0x87f6569b25707834, ; 712: System.IO.Compression.Brotli.dll => 43
	i64 u0x8842b3a5d2d3fb36, ; 713: Microsoft.Maui.Essentials => 194
	i64 u0x8872fbfd97cf8678, ; 714: Microsoft.ServiceHub.Framework => 197
	i64 u0x88926583efe7ee86, ; 715: Xamarin.AndroidX.Activity.Ktx.dll => 234
	i64 u0x88ba6bc4f7762b03, ; 716: lib_System.Reflection.dll.so => 98
	i64 u0x88bda98e0cffb7a9, ; 717: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 316
	i64 u0x8930322c7bd8f768, ; 718: netstandard => 168
	i64 u0x897a606c9e39c75f, ; 719: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x89911a22005b92b7, ; 720: System.IO.FileSystem.DriveInfo.dll => 48
	i64 u0x89c5188089ec2cd5, ; 721: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 107
	i64 u0x8a19e3dc71b34b2c, ; 722: System.Reflection.TypeExtensions.dll => 97
	i64 u0x8a2a9a95631ea52b, ; 723: de/StreamJsonRpc.resources => 433
	i64 u0x8a59a3c58098a20f, ; 724: fr/Microsoft.ServiceHub.Resources => 369
	i64 u0x8a77ac71525f2920, ; 725: ja/Microsoft.VisualStudio.Utilities.resources => 411
	i64 u0x8a943e4aaac1c83b, ; 726: lib_HomologacaoBalanca.dll.so => 0
	i64 u0x8ad229ea26432ee2, ; 727: Xamarin.AndroidX.Loader => 280
	i64 u0x8add1d48b4b80c30, ; 728: cs/Microsoft.VisualStudio.Validation.resources => 419
	i64 u0x8b4ff5d0fdd5faa1, ; 729: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i64 u0x8b541d476eb3774c, ; 730: System.Security.Principal.Windows => 128
	i64 u0x8b8d01333a96d0b5, ; 731: System.Diagnostics.Process.dll => 29
	i64 u0x8b9ceca7acae3451, ; 732: lib-he-Microsoft.Maui.Controls.resources.dll.so => 328
	i64 u0x8ba96f31f69ece34, ; 733: Microsoft.Win32.SystemEvents.dll => 207
	i64 u0x8c19dc6dc00f9c16, ; 734: tr/Microsoft.ServiceHub.Framework.resources.dll => 363
	i64 u0x8cb8f612b633affb, ; 735: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 291
	i64 u0x8cdfdb4ce85fb925, ; 736: lib_System.Security.Principal.Windows.dll.so => 128
	i64 u0x8cdfe7b8f4caa426, ; 737: System.IO.Compression.FileSystem => 44
	i64 u0x8d0f420977c2c1c7, ; 738: Xamarin.AndroidX.CursorAdapter.dll => 253
	i64 u0x8d1b6df6b2e6b40a, ; 739: lib-pl-Microsoft.ServiceHub.Resources.dll.so => 373
	i64 u0x8d52f7ea2796c531, ; 740: Xamarin.AndroidX.Emoji2.dll => 259
	i64 u0x8d7b8ab4b3310ead, ; 741: System.Threading => 149
	i64 u0x8da188285aadfe8e, ; 742: System.Collections.Concurrent => 8
	i64 u0x8db4cefc72d8bf2c, ; 743: zh-Hant/StreamJsonRpc.resources.dll => 444
	i64 u0x8eae71f0bd2b79b4, ; 744: lib-pl-Microsoft.ServiceHub.Framework.resources.dll.so => 360
	i64 u0x8ec6e06a61c1baeb, ; 745: lib_Newtonsoft.Json.dll.so => 209
	i64 u0x8ed3cdd722b4d782, ; 746: System.Diagnostics.EventLog => 219
	i64 u0x8ed807bfe9858dfc, ; 747: Xamarin.AndroidX.Navigation.Common => 282
	i64 u0x8ee08b8194a30f48, ; 748: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 329
	i64 u0x8ef7601039857a44, ; 749: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 342
	i64 u0x8f32c6f611f6ffab, ; 750: pt/Microsoft.Maui.Controls.resources.dll => 341
	i64 u0x8f44b45eb046bbd1, ; 751: System.ServiceModel.Web.dll => 132
	i64 u0x8f8829d21c8985a4, ; 752: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 340
	i64 u0x8fbf5b0114c6dcef, ; 753: System.Globalization.dll => 42
	i64 u0x8fcc8c2a81f3d9e7, ; 754: Xamarin.KotlinX.Serialization.Core => 317
	i64 u0x90263f8448b8f572, ; 755: lib_System.Diagnostics.TraceSource.dll.so => 33
	i64 u0x903101b46fb73a04, ; 756: _Microsoft.Android.Resource.Designer => 449
	i64 u0x90393bd4865292f3, ; 757: lib_System.IO.Compression.dll.so => 46
	i64 u0x905e2b8e7ae91ae6, ; 758: System.Threading.Tasks.Extensions.dll => 143
	i64 u0x9061a21718dccdec, ; 759: lib-tr-Microsoft.VisualStudio.Utilities.resources.dll.so => 416
	i64 u0x90634f86c5ebe2b5, ; 760: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 277
	i64 u0x9067acd336d51e6f, ; 761: lib-tr-Microsoft.ServiceHub.Framework.resources.dll.so => 363
	i64 u0x906abef7d797c715, ; 762: fr/Microsoft.VisualStudio.Composition.resources => 382
	i64 u0x907b636704ad79ef, ; 763: lib_Microsoft.Maui.Controls.Xaml.dll.so => 192
	i64 u0x90e9efbfd68593e0, ; 764: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 268
	i64 u0x91418dc638b29e68, ; 765: lib_Xamarin.AndroidX.CustomView.dll.so => 254
	i64 u0x9157bd523cd7ed36, ; 766: lib_System.Text.Json.dll.so => 138
	i64 u0x918ab5f34d5e5596, ; 767: lib-pl-StreamJsonRpc.resources.dll.so => 439
	i64 u0x919f279f8fade210, ; 768: lib-zh-Hans-Microsoft.ServiceHub.Resources.dll.so => 377
	i64 u0x91a74f07b30d37e2, ; 769: System.Linq.dll => 62
	i64 u0x91cb86ea3b17111d, ; 770: System.ServiceModel.Web => 132
	i64 u0x91fa41a87223399f, ; 771: ca/Microsoft.Maui.Controls.resources.dll => 320
	i64 u0x92054e486c0c7ea7, ; 772: System.IO.FileSystem.DriveInfo => 48
	i64 u0x928614058c40c4cd, ; 773: lib_System.Xml.XPath.XDocument.dll.so => 160
	i64 u0x92b138fffca2b01e, ; 774: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 241
	i64 u0x92dfc2bfc6c6a888, ; 775: Xamarin.AndroidX.Lifecycle.LiveData => 268
	i64 u0x933da2c779423d68, ; 776: Xamarin.Android.Glide.Annotations => 230
	i64 u0x9345f876516fb48b, ; 777: fr/Microsoft.VisualStudio.Utilities.resources => 409
	i64 u0x9388aad9b7ae40ce, ; 778: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 266
	i64 u0x93cfa73ab28d6e35, ; 779: ms/Microsoft.Maui.Controls.resources => 336
	i64 u0x93d81d2510832c93, ; 780: it/Microsoft.ServiceHub.Framework.resources.dll => 357
	i64 u0x941c00d21e5c0679, ; 781: lib_Xamarin.AndroidX.Transition.dll.so => 297
	i64 u0x944077d8ca3c6580, ; 782: System.IO.Compression.dll => 46
	i64 u0x948cffedc8ed7960, ; 783: System.Xml => 164
	i64 u0x94c74046ddf1c248, ; 784: lib-ko-Microsoft.ServiceHub.Framework.resources.dll.so => 359
	i64 u0x94c8990839c4bdb1, ; 785: lib_Xamarin.AndroidX.Interpolator.dll.so => 264
	i64 u0x9529c833f545aadd, ; 786: HomologacaoBalanca => 0
	i64 u0x967fc325e09bfa8c, ; 787: es/Microsoft.Maui.Controls.resources => 325
	i64 u0x9686161486d34b81, ; 788: lib_Xamarin.AndroidX.ExifInterface.dll.so => 261
	i64 u0x96b06fcccf972278, ; 789: lib_Microsoft.VisualStudio.Utilities.dll.so => 204
	i64 u0x96f01cc18829cc2a, ; 790: System.Composition.Hosting.dll => 215
	i64 u0x9715d393cfb6723f, ; 791: tr/Microsoft.VisualStudio.Composition.resources.dll => 389
	i64 u0x972ed051a51f2824, ; 792: Microsoft.VisualStudio.RemoteControl => 200
	i64 u0x9732d8dbddea3d9a, ; 793: id/Microsoft.Maui.Controls.resources => 332
	i64 u0x978be80e5210d31b, ; 794: Microsoft.Maui.Graphics.dll => 195
	i64 u0x97a4f1f96dd29910, ; 795: pl/Microsoft.VisualStudio.Threading.resources.dll => 399
	i64 u0x97b191f7f99239ab, ; 796: lib-pt-BR-Microsoft.ServiceHub.Framework.resources.dll.so => 361
	i64 u0x97b8c771ea3e4220, ; 797: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 798: System.Collections.Concurrent.dll => 8
	i64 u0x984184e3c70d4419, ; 799: GoogleGson => 177
	i64 u0x9843944103683dd3, ; 800: Xamarin.AndroidX.Core.Core.Ktx => 252
	i64 u0x9847ec02cc4fe084, ; 801: pt-BR/Microsoft.ServiceHub.Framework.resources.dll => 361
	i64 u0x98d720cc4597562c, ; 802: System.Security.Cryptography.OpenSsl => 124
	i64 u0x991d510397f92d9d, ; 803: System.Linq.Expressions => 59
	i64 u0x9948690642261359, ; 804: lib-pl-Microsoft.VisualStudio.Validation.resources.dll.so => 426
	i64 u0x996ceeb8a3da3d67, ; 805: System.Threading.Overlapped.dll => 141
	i64 u0x999cb19e1a04ffd3, ; 806: CommunityToolkit.Mvvm.dll => 176
	i64 u0x99a00ca5270c6878, ; 807: Xamarin.AndroidX.Navigation.Runtime => 284
	i64 u0x99ba65efb8570b5d, ; 808: ja/Microsoft.ServiceHub.Framework.resources => 358
	i64 u0x99cdc6d1f2d3a72f, ; 809: ko/Microsoft.Maui.Controls.resources.dll => 335
	i64 u0x99e36b41f468e4e5, ; 810: it/Microsoft.VisualStudio.Composition.resources => 383
	i64 u0x9a01b1da98b6ee10, ; 811: Xamarin.AndroidX.Lifecycle.Runtime.dll => 272
	i64 u0x9a5ccc274fd6e6ee, ; 812: Jsr305Binding.dll => 306
	i64 u0x9ae6940b11c02876, ; 813: lib_Xamarin.AndroidX.Window.dll.so => 303
	i64 u0x9b211a749105beac, ; 814: System.Transactions.Local => 150
	i64 u0x9b8734714671022d, ; 815: System.Threading.Tasks.Dataflow.dll => 142
	i64 u0x9b99fafe7f6a620a, ; 816: ko/Microsoft.ServiceHub.Resources.dll => 372
	i64 u0x9bc6aea27fbf034f, ; 817: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 315
	i64 u0x9bd8cc74558ad4c7, ; 818: Xamarin.KotlinX.AtomicFU => 312
	i64 u0x9c244ac7cda32d26, ; 819: System.Security.Cryptography.X509Certificates.dll => 126
	i64 u0x9c465f280cf43733, ; 820: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 314
	i64 u0x9c8f6872beab6408, ; 821: System.Xml.XPath.XDocument.dll => 160
	i64 u0x9cba24e937dd054e, ; 822: System.IO.Ports => 223
	i64 u0x9ce01cf91101ae23, ; 823: System.Xml.XmlDocument => 162
	i64 u0x9d128180c81d7ce6, ; 824: Xamarin.AndroidX.CustomView.PoolingContainer => 255
	i64 u0x9d324f8563b2e2e7, ; 825: it/Microsoft.VisualStudio.Validation.resources => 423
	i64 u0x9d5dbcf5a48583fe, ; 826: lib_Xamarin.AndroidX.Activity.dll.so => 233
	i64 u0x9d74dee1a7725f34, ; 827: Microsoft.Extensions.Configuration.Abstractions.dll => 183
	i64 u0x9dc16865bee9deaa, ; 828: pt-BR/Microsoft.VisualStudio.Utilities.resources.dll => 414
	i64 u0x9e4534b6adaf6e84, ; 829: nl/Microsoft.Maui.Controls.resources => 338
	i64 u0x9e4b95dec42769f7, ; 830: System.Diagnostics.Debug.dll => 26
	i64 u0x9eaf1efdf6f7267e, ; 831: Xamarin.AndroidX.Navigation.Common.dll => 282
	i64 u0x9ece8c78d7b404de, ; 832: pt-BR/Microsoft.VisualStudio.Validation.resources => 427
	i64 u0x9eefc52f20891742, ; 833: ja/Microsoft.ServiceHub.Resources => 371
	i64 u0x9ef542cf1f78c506, ; 834: Xamarin.AndroidX.Lifecycle.LiveData.Core => 269
	i64 u0xa00832eb975f56a8, ; 835: lib_System.Net.dll.so => 82
	i64 u0xa03e7cf4d831a138, ; 836: ko/Microsoft.VisualStudio.Validation.resources => 425
	i64 u0xa083f38ade100d34, ; 837: zh-Hans/Microsoft.VisualStudio.Threading.resources => 403
	i64 u0xa0ad78236b7b267f, ; 838: Xamarin.AndroidX.Window => 303
	i64 u0xa0ae8a475a95f30b, ; 839: de/Microsoft.ServiceHub.Resources.dll => 367
	i64 u0xa0d8259f4cc284ec, ; 840: lib_System.Security.Cryptography.dll.so => 127
	i64 u0xa0e17ca50c77a225, ; 841: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 307
	i64 u0xa0f421f8f643c099, ; 842: lib-it-Microsoft.ServiceHub.Framework.resources.dll.so => 357
	i64 u0xa0ff9b3e34d92f11, ; 843: lib_System.Resources.Writer.dll.so => 101
	i64 u0xa129e48fa707b8ac, ; 844: lib-fr-Microsoft.VisualStudio.Validation.resources.dll.so => 422
	i64 u0xa12fbfb4da97d9f3, ; 845: System.Threading.Timer.dll => 148
	i64 u0xa1440773ee9d341e, ; 846: Xamarin.Google.Android.Material => 305
	i64 u0xa1b9d7c27f47219f, ; 847: Xamarin.AndroidX.Navigation.UI.dll => 285
	i64 u0xa2572680829d2c7c, ; 848: System.IO.Pipelines.dll => 54
	i64 u0xa26597e57ee9c7f6, ; 849: System.Xml.XmlDocument.dll => 162
	i64 u0xa308401900e5bed3, ; 850: lib_mscorlib.dll.so => 167
	i64 u0xa395572e7da6c99d, ; 851: lib_System.Security.dll.so => 131
	i64 u0xa3acfd9429ff9d46, ; 852: System.IO.Ports.dll => 223
	i64 u0xa3e683f24b43af6f, ; 853: System.Dynamic.Runtime.dll => 37
	i64 u0xa3feada57671ecd2, ; 854: fr/Microsoft.ServiceHub.Framework.resources => 356
	i64 u0xa4145becdee3dc4f, ; 855: Xamarin.AndroidX.VectorDrawable.Animated => 299
	i64 u0xa464012f78d66725, ; 856: lib-ko-Microsoft.VisualStudio.Validation.resources.dll.so => 425
	i64 u0xa46aa1eaa214539b, ; 857: ko/Microsoft.Maui.Controls.resources => 335
	i64 u0xa4807d1657335b0a, ; 858: pt-BR/Microsoft.VisualStudio.Threading.resources => 400
	i64 u0xa4d20d2ff0563d26, ; 859: lib_CommunityToolkit.Mvvm.dll.so => 176
	i64 u0xa4edc8f2ceae241a, ; 860: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 861: System.Runtime.Serialization.Formatters.dll => 112
	i64 u0xa54b74df83dce92b, ; 862: System.Reflection.DispatchProxy => 90
	i64 u0xa579ed010d7e5215, ; 863: Xamarin.AndroidX.DocumentFile => 256
	i64 u0xa5b7152421ed6d98, ; 864: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i64 u0xa5c3844f17b822db, ; 865: lib_System.Linq.Parallel.dll.so => 60
	i64 u0xa5ce5c755bde8cb8, ; 866: lib_System.Security.Cryptography.Csp.dll.so => 122
	i64 u0xa5e599d1e0524750, ; 867: System.Numerics.Vectors.dll => 83
	i64 u0xa5f1ba49b85dd355, ; 868: System.Security.Cryptography.dll => 127
	i64 u0xa61975a5a37873ea, ; 869: lib_System.Xml.XmlSerializer.dll.so => 163
	i64 u0xa6593e21584384d2, ; 870: lib_Jsr305Binding.dll.so => 306
	i64 u0xa66cbee0130865f7, ; 871: lib_WindowsBase.dll.so => 166
	i64 u0xa67dbee13e1df9ca, ; 872: Xamarin.AndroidX.SavedState.dll => 290
	i64 u0xa684b098dd27b296, ; 873: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 292
	i64 u0xa68a420042bb9b1f, ; 874: Xamarin.AndroidX.DrawerLayout.dll => 257
	i64 u0xa6d26156d1cacc7c, ; 875: Xamarin.Android.Glide.dll => 229
	i64 u0xa75386b5cb9595aa, ; 876: Xamarin.AndroidX.Lifecycle.Runtime.Android => 273
	i64 u0xa763fbb98df8d9fb, ; 877: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa766482ca51cfb22, ; 878: lib-ja-StreamJsonRpc.resources.dll.so => 437
	i64 u0xa78ce3745383236a, ; 879: Xamarin.AndroidX.Lifecycle.Common.Jvm => 267
	i64 u0xa7c31b56b4dc7b33, ; 880: hu/Microsoft.Maui.Controls.resources => 331
	i64 u0xa7eab29ed44b4e7a, ; 881: Mono.Android.Export => 170
	i64 u0xa8195217cbf017b7, ; 882: Microsoft.VisualBasic.Core => 2
	i64 u0xa84d9fc71d45b69f, ; 883: Nerdbank.Streams.dll => 208
	i64 u0xa859a95830f367ff, ; 884: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 278
	i64 u0xa8b52f21e0dbe690, ; 885: System.Runtime.Serialization.dll => 116
	i64 u0xa8c84ce526c2b4bd, ; 886: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 448
	i64 u0xa8ee4ed7de2efaee, ; 887: Xamarin.AndroidX.Annotation.dll => 235
	i64 u0xa95590e7c57438a4, ; 888: System.Configuration => 19
	i64 u0xa964304b5631e28a, ; 889: CommunityToolkit.Maui.Core.dll => 175
	i64 u0xaa2219c8e3449ff5, ; 890: Microsoft.Extensions.Logging.Abstractions => 187
	i64 u0xaa443ac34067eeef, ; 891: System.Private.Xml.dll => 89
	i64 u0xaa52de307ef5d1dd, ; 892: System.Net.Http => 65
	i64 u0xaa8448d5c2540403, ; 893: System.Windows.Extensions => 228
	i64 u0xaa9a7b0214a5cc5c, ; 894: System.Diagnostics.StackTrace.dll => 30
	i64 u0xaaaf86367285a918, ; 895: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 185
	i64 u0xaaf84bb3f052a265, ; 896: el/Microsoft.Maui.Controls.resources => 324
	i64 u0xab9af77b5b67a0b8, ; 897: Xamarin.AndroidX.ConstraintLayout.Core => 249
	i64 u0xab9c1b2687d86b0b, ; 898: lib_System.Linq.Expressions.dll.so => 59
	i64 u0xabecc1804046388c, ; 899: Microsoft.VisualStudio.Utilities => 204
	i64 u0xac2af3fa195a15ce, ; 900: System.Runtime.Numerics => 111
	i64 u0xac31e92cb75fdab4, ; 901: lib_Microsoft.VisualStudio.Telemetry.dll.so => 202
	i64 u0xac5376a2a538dc10, ; 902: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 269
	i64 u0xac5acae88f60357e, ; 903: System.Diagnostics.Tools.dll => 32
	i64 u0xac79c7e46047ad98, ; 904: System.Security.Principal.Windows.dll => 128
	i64 u0xac978e0f57718b15, ; 905: es/StreamJsonRpc.resources.dll => 434
	i64 u0xac986837dcdb20d7, ; 906: Microsoft.VisualStudio.Validation => 206
	i64 u0xac98d31068e24591, ; 907: System.Xml.XDocument => 159
	i64 u0xacd46e002c3ccb97, ; 908: ro/Microsoft.Maui.Controls.resources => 342
	i64 u0xacdc68cc7dcbd28a, ; 909: lib-ru-Microsoft.ServiceHub.Resources.dll.so => 375
	i64 u0xacdd9e4180d56dda, ; 910: Xamarin.AndroidX.Concurrent.Futures => 247
	i64 u0xacf42eea7ef9cd12, ; 911: System.Threading.Channels => 140
	i64 u0xad7e82ed3b0f16d0, ; 912: lib_Xamarin.AndroidX.DocumentFile.dll.so => 256
	i64 u0xad89c07347f1bad6, ; 913: nl/Microsoft.Maui.Controls.resources.dll => 338
	i64 u0xadbb53caf78a79d2, ; 914: System.Web.HttpUtility => 153
	i64 u0xadc90ab061a9e6e4, ; 915: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadca1b9030b9317e, ; 916: Xamarin.AndroidX.Collection.Ktx => 246
	i64 u0xadd8eda2edf396ad, ; 917: Xamarin.Android.Glide.GifDecoder => 232
	i64 u0xadeb9b7075265710, ; 918: pt-BR/Microsoft.VisualStudio.Threading.resources.dll => 400
	i64 u0xadf4cf30debbeb9a, ; 919: System.Net.ServicePoint.dll => 75
	i64 u0xadf511667bef3595, ; 920: System.Net.Security => 74
	i64 u0xae0aaa94fdcfce0f, ; 921: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 922: Java.Interop => 169
	i64 u0xae53579c90db1107, ; 923: System.ObjectModel.dll => 85
	i64 u0xaec7c0c7e2ed4575, ; 924: lib_Xamarin.KotlinX.AtomicFU.Jvm.dll.so => 313
	i64 u0xaf732d0b2193b8f5, ; 925: System.Security.Cryptography.OpenSsl.dll => 124
	i64 u0xafdb94dbccd9d11c, ; 926: Xamarin.AndroidX.Lifecycle.LiveData.dll => 268
	i64 u0xafe29f45095518e7, ; 927: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 279
	i64 u0xb00ce8c185dca659, ; 928: Microsoft.VisualStudio.Utilities.Internal => 205
	i64 u0xb03ae931fb25607e, ; 929: Xamarin.AndroidX.ConstraintLayout => 248
	i64 u0xb05cc42cd94c6d9d, ; 930: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 345
	i64 u0xb0891d2790de3f2f, ; 931: Microsoft.VisualStudio.RpcContracts.dll => 201
	i64 u0xb0ac21bec8f428c5, ; 932: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 275
	i64 u0xb0bb43dc52ea59f9, ; 933: System.Diagnostics.Tracing.dll => 34
	i64 u0xb1dd05401aa8ee63, ; 934: System.Security.AccessControl => 118
	i64 u0xb220631954820169, ; 935: System.Text.RegularExpressions => 139
	i64 u0xb2376e1dbf8b4ed7, ; 936: System.Security.Cryptography.Csp => 122
	i64 u0xb286b27cefb07f53, ; 937: fr/Microsoft.ServiceHub.Resources.dll => 369
	i64 u0xb2a1959fe95c5402, ; 938: lib_System.Runtime.InteropServices.JavaScript.dll.so => 106
	i64 u0xb2a3f67f3bf29fce, ; 939: da/Microsoft.Maui.Controls.resources => 322
	i64 u0xb3011a0a57f7ffb2, ; 940: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 446
	i64 u0xb3874072ee0ecf8c, ; 941: Xamarin.AndroidX.VectorDrawable.Animated.dll => 299
	i64 u0xb398860d6ed7ba2f, ; 942: System.Security.Cryptography.ProtectedData => 225
	i64 u0xb3f0a0fcda8d3ebc, ; 943: Xamarin.AndroidX.CardView => 243
	i64 u0xb44683ebb32a5450, ; 944: ja/Microsoft.VisualStudio.Validation.resources => 424
	i64 u0xb469b383e467a694, ; 945: lib-pt-BR-Microsoft.VisualStudio.Threading.resources.dll.so => 400
	i64 u0xb46be1aa6d4fff93, ; 946: hi/Microsoft.Maui.Controls.resources => 329
	i64 u0xb477491be13109d8, ; 947: ar/Microsoft.Maui.Controls.resources => 319
	i64 u0xb4b0db2bd0f4bf10, ; 948: de/Microsoft.VisualStudio.Utilities.resources => 406
	i64 u0xb4bd7015ecee9d86, ; 949: System.IO.Pipelines => 54
	i64 u0xb4c53d9749c5f226, ; 950: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i64 u0xb4ff710863453fda, ; 951: System.Diagnostics.FileVersionInfo.dll => 28
	i64 u0xb54092076b15e062, ; 952: System.Threading.AccessControl => 227
	i64 u0xb5c38bf497a4cfe2, ; 953: lib_System.Threading.Tasks.dll.so => 145
	i64 u0xb5c7fcdafbc67ee4, ; 954: Microsoft.Extensions.Logging.Abstractions.dll => 187
	i64 u0xb5ea31d5244c6626, ; 955: System.Threading.ThreadPool.dll => 147
	i64 u0xb6f92eaf47db4cab, ; 956: lib_System.Private.Windows.Core.dll.so => 222
	i64 u0xb7212c4683a94afe, ; 957: System.Drawing.Primitives => 35
	i64 u0xb73a388e9f5a9358, ; 958: ko/Microsoft.ServiceHub.Framework.resources.dll => 359
	i64 u0xb746bc13038bbc97, ; 959: lib-pt-BR-StreamJsonRpc.resources.dll.so => 440
	i64 u0xb753debe5861ea74, ; 960: lib-de-Microsoft.ServiceHub.Framework.resources.dll.so => 354
	i64 u0xb7b7753d1f319409, ; 961: sv/Microsoft.Maui.Controls.resources => 345
	i64 u0xb7dcb97998efa177, ; 962: en/Microsoft.VisualStudio.Utilities.resources.dll => 407
	i64 u0xb81a2c6e0aee50fe, ; 963: lib_System.Private.CoreLib.dll.so => 173
	i64 u0xb898d1802c1a108c, ; 964: lib_System.Management.dll.so => 224
	i64 u0xb8b0a9b3dfbc5cb7, ; 965: Xamarin.AndroidX.Window.Extensions.Core.Core => 304
	i64 u0xb8c60af47c08d4da, ; 966: System.Net.ServicePoint => 75
	i64 u0xb8e68d20aad91196, ; 967: lib_System.Xml.XPath.dll.so => 161
	i64 u0xb8fae4caf6347658, ; 968: lib-cs-Microsoft.VisualStudio.Threading.resources.dll.so => 392
	i64 u0xb9185c33a1643eed, ; 969: Microsoft.CSharp.dll => 1
	i64 u0xb98661d015e6162f, ; 970: es/Microsoft.VisualStudio.Validation.resources.dll => 421
	i64 u0xb9b8001adf4ed7cc, ; 971: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 293
	i64 u0xb9f64d3b230def68, ; 972: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 341
	i64 u0xb9fc3c8a556e3691, ; 973: ja/Microsoft.Maui.Controls.resources => 334
	i64 u0xba4670aa94a2b3c6, ; 974: lib_System.Xml.XDocument.dll.so => 159
	i64 u0xba48785529705af9, ; 975: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 976: lib_System.Windows.dll.so => 155
	i64 u0xbab274eefb8ab998, ; 977: ru/Microsoft.VisualStudio.Threading.resources => 401
	i64 u0xbb286883bc35db36, ; 978: System.Transactions.dll => 151
	i64 u0xbb65706fde942ce3, ; 979: System.Net.Sockets => 76
	i64 u0xbba28979413cad9e, ; 980: lib_System.Runtime.CompilerServices.VisualC.dll.so => 103
	i64 u0xbbd180354b67271a, ; 981: System.Runtime.Serialization.Formatters => 112
	i64 u0xbc1e7c29c6ebcf25, ; 982: StreamJsonRpc.dll => 210
	i64 u0xbc260cdba33291a3, ; 983: Xamarin.AndroidX.Arch.Core.Common.dll => 240
	i64 u0xbd0e2c0d55246576, ; 984: System.Net.Http.dll => 65
	i64 u0xbd3fbd85b9e1cb29, ; 985: lib_System.Net.HttpListener.dll.so => 66
	i64 u0xbd437a2cdb333d0d, ; 986: Xamarin.AndroidX.ViewPager2 => 302
	i64 u0xbd4f572d2bd0a789, ; 987: System.IO.Compression.ZipFile.dll => 45
	i64 u0xbd5d0b88d3d647a5, ; 988: lib_Xamarin.AndroidX.Browser.dll.so => 242
	i64 u0xbd877b14d0b56392, ; 989: System.Runtime.Intrinsics.dll => 109
	i64 u0xbda126cb01512fd5, ; 990: lib-ru-Microsoft.VisualStudio.Utilities.resources.dll.so => 415
	i64 u0xbe1205c20d5683a9, ; 991: ja/Microsoft.ServiceHub.Framework.resources.dll => 358
	i64 u0xbe65a49036345cf4, ; 992: lib_System.Buffers.dll.so => 7
	i64 u0xbe7bc6227b54596c, ; 993: ja/Microsoft.VisualStudio.Threading.resources.dll => 397
	i64 u0xbee1b395605474f1, ; 994: System.Drawing.Common.dll => 221
	i64 u0xbee38d4a88835966, ; 995: Xamarin.AndroidX.AppCompat.AppCompatResources => 239
	i64 u0xbef9919db45b4ca7, ; 996: System.IO.Pipes.AccessControl => 55
	i64 u0xbf0fa68611139208, ; 997: lib_Xamarin.AndroidX.Annotation.dll.so => 235
	i64 u0xbf4d7352d131c22b, ; 998: en/Microsoft.VisualStudio.Utilities.resources => 407
	i64 u0xbfc1e1fb3095f2b3, ; 999: lib_System.Net.Http.Json.dll.so => 64
	i64 u0xc040a4ab55817f58, ; 1000: ar/Microsoft.Maui.Controls.resources.dll => 319
	i64 u0xc061aee144421e80, ; 1001: tr/StreamJsonRpc.resources => 442
	i64 u0xc07cadab29efeba0, ; 1002: Xamarin.AndroidX.Core.Core.Ktx.dll => 252
	i64 u0xc0b1800a2e6bb02c, ; 1003: System.Composition.AttributedModel.dll => 213
	i64 u0xc0cffb9ba29a4cce, ; 1004: tr/Microsoft.ServiceHub.Framework.resources => 363
	i64 u0xc0d928351ab5ca77, ; 1005: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 1006: System.Runtime.Intrinsics => 109
	i64 u0xc111030af54d7191, ; 1007: System.Resources.Writer => 101
	i64 u0xc12b8b3afa48329c, ; 1008: lib_System.Linq.dll.so => 62
	i64 u0xc183ca0b74453aa9, ; 1009: lib_System.Threading.Tasks.Dataflow.dll.so => 142
	i64 u0xc1ff9ae3cdb6e1e6, ; 1010: Xamarin.AndroidX.Activity.dll => 233
	i64 u0xc21375e6809679c9, ; 1011: lib-fr-StreamJsonRpc.resources.dll.so => 435
	i64 u0xc24053ea5d236bef, ; 1012: zh-Hans/Microsoft.VisualStudio.Utilities.resources.dll => 417
	i64 u0xc25869b46e036572, ; 1013: System.ComponentModel.Composition.dll => 212
	i64 u0xc26c064effb1dea9, ; 1014: System.Buffers.dll => 7
	i64 u0xc28c50f32f81cc73, ; 1015: ja/Microsoft.Maui.Controls.resources.dll => 334
	i64 u0xc2902f6cf5452577, ; 1016: lib_Mono.Android.Export.dll.so => 170
	i64 u0xc2a3bca55b573141, ; 1017: System.IO.FileSystem.Watcher => 50
	i64 u0xc2bcfec99f69365e, ; 1018: Xamarin.AndroidX.ViewPager2.dll => 302
	i64 u0xc30b52815b58ac2c, ; 1019: lib_System.Runtime.Serialization.Xml.dll.so => 115
	i64 u0xc34144f1d2475347, ; 1020: lib-zh-Hant-Microsoft.VisualStudio.Threading.resources.dll.so => 404
	i64 u0xc36d7d89c652f455, ; 1021: System.Threading.Overlapped => 141
	i64 u0xc396b285e59e5493, ; 1022: GoogleGson.dll => 177
	i64 u0xc3c86c1e5e12f03d, ; 1023: WindowsBase => 166
	i64 u0xc417a7250be7393e, ; 1024: System.Composition.TypedParts.dll => 217
	i64 u0xc421b61fd853169d, ; 1025: lib_System.Net.WebSockets.Client.dll.so => 80
	i64 u0xc463e077917aa21d, ; 1026: System.Runtime.Serialization.Json => 113
	i64 u0xc49d4ffecfff2acf, ; 1027: lib-ja-Microsoft.ServiceHub.Framework.resources.dll.so => 358
	i64 u0xc4d3858ed4d08512, ; 1028: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 279
	i64 u0xc50fded0ded1418c, ; 1029: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 1030: lib_System.Net.Requests.dll.so => 73
	i64 u0xc5293b19e4dc230e, ; 1031: Xamarin.AndroidX.Navigation.Fragment => 283
	i64 u0xc5325b2fcb37446f, ; 1032: lib_System.Private.Xml.dll.so => 89
	i64 u0xc535cb9a21385d9b, ; 1033: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 231
	i64 u0xc5819af2f6a82006, ; 1034: pt-BR/Microsoft.VisualStudio.Composition.resources => 387
	i64 u0xc5a0f4b95a699af7, ; 1035: lib_System.Private.Uri.dll.so => 87
	i64 u0xc5cdcd5b6277579e, ; 1036: lib_System.Security.Cryptography.Algorithms.dll.so => 120
	i64 u0xc5ec286825cb0bf4, ; 1037: Xamarin.AndroidX.Tracing.Tracing => 296
	i64 u0xc6706bc8aa7fe265, ; 1038: Xamarin.AndroidX.Annotation.Jvm => 237
	i64 u0xc787bb5268851663, ; 1039: lib-zh-Hans-Microsoft.ServiceHub.Framework.resources.dll.so => 364
	i64 u0xc7c01e7d7c93a110, ; 1040: System.Text.Encoding.Extensions.dll => 135
	i64 u0xc7ce851898a4548e, ; 1041: lib_System.Web.HttpUtility.dll.so => 153
	i64 u0xc809d4089d2556b2, ; 1042: System.Runtime.InteropServices.JavaScript.dll => 106
	i64 u0xc858a28d9ee5a6c5, ; 1043: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc88babdca8451f22, ; 1044: ko/Microsoft.VisualStudio.Validation.resources.dll => 425
	i64 u0xc89402e6bdf9e2cf, ; 1045: lib-es-Microsoft.VisualStudio.Threading.resources.dll.so => 394
	i64 u0xc89e3df5b12855fd, ; 1046: lib-es-Microsoft.ServiceHub.Resources.dll.so => 368
	i64 u0xc8ac7c6bf1c2ec51, ; 1047: System.Reflection.DispatchProxy.dll => 90
	i64 u0xc9c599433078fc53, ; 1048: it/Microsoft.VisualStudio.Threading.resources.dll => 396
	i64 u0xc9c62c8f354ac568, ; 1049: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i64 u0xc9e54b32fc19baf3, ; 1050: lib_CommunityToolkit.Maui.dll.so => 174
	i64 u0xca3a723e7342c5b6, ; 1051: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 347
	i64 u0xca5801070d9fccfb, ; 1052: System.Text.Encoding => 136
	i64 u0xca6569aa2a07cd24, ; 1053: ko/Microsoft.ServiceHub.Framework.resources => 359
	i64 u0xcab0fb68cfb6a800, ; 1054: lib-zh-Hant-Microsoft.VisualStudio.Validation.resources.dll.so => 431
	i64 u0xcab3493c70141c2d, ; 1055: pl/Microsoft.Maui.Controls.resources => 339
	i64 u0xcac867b63b78a0fc, ; 1056: lib-cs-Microsoft.ServiceHub.Framework.resources.dll.so => 353
	i64 u0xcacfddc9f7c6de76, ; 1057: ro/Microsoft.Maui.Controls.resources.dll => 342
	i64 u0xcadbc92899a777f0, ; 1058: Xamarin.AndroidX.Startup.StartupRuntime => 294
	i64 u0xcae564c0e7343a08, ; 1059: zh-Hans/Microsoft.VisualStudio.Validation.resources.dll => 430
	i64 u0xcb7b9d9630a08680, ; 1060: cs/Microsoft.ServiceHub.Resources.dll => 366
	i64 u0xcba1cb79f45292b5, ; 1061: Xamarin.Android.Glide.GifDecoder.dll => 232
	i64 u0xcbb5f80c7293e696, ; 1062: lib_System.Globalization.Calendars.dll.so => 40
	i64 u0xcbd4fdd9cef4a294, ; 1063: lib__Microsoft.Android.Resource.Designer.dll.so => 449
	i64 u0xcc15da1e07bbd994, ; 1064: Xamarin.AndroidX.SlidingPaneLayout => 293
	i64 u0xcc2876b32ef2794c, ; 1065: lib_System.Text.RegularExpressions.dll.so => 139
	i64 u0xcc5b7d2494d4ae79, ; 1066: tr/Microsoft.ServiceHub.Resources.dll => 376
	i64 u0xcc5c3bb714c4561e, ; 1067: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 316
	i64 u0xcc76886e09b88260, ; 1068: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 318
	i64 u0xcc9fa2923aa1c9ef, ; 1069: System.Diagnostics.Contracts.dll => 25
	i64 u0xcce0a65dce0980f3, ; 1070: lib-ja-Microsoft.VisualStudio.Validation.resources.dll.so => 424
	i64 u0xccf25c4b634ccd3a, ; 1071: zh-Hans/Microsoft.Maui.Controls.resources.dll => 351
	i64 u0xcd10a42808629144, ; 1072: System.Net.Requests => 73
	i64 u0xcd23adc5162baa47, ; 1073: ko/Microsoft.VisualStudio.Composition.resources => 385
	i64 u0xcd38d7c7317d3ee0, ; 1074: lib-ru-StreamJsonRpc.resources.dll.so => 441
	i64 u0xcdb9324fd037ad4b, ; 1075: lib-tr-Microsoft.ServiceHub.Resources.dll.so => 376
	i64 u0xcdca1b920e9f53ba, ; 1076: Xamarin.AndroidX.Interpolator => 264
	i64 u0xcdd0c48b6937b21c, ; 1077: Xamarin.AndroidX.SwipeRefreshLayout => 295
	i64 u0xcde1fa22dc303670, ; 1078: Microsoft.VisualStudio.DesignTools.XamlTapContract => 448
	i64 u0xcdfcfc9c23605d8b, ; 1079: ko/Microsoft.ServiceHub.Resources => 372
	i64 u0xcec2172ff3084855, ; 1080: fr/Microsoft.VisualStudio.Validation.resources.dll => 422
	i64 u0xcee5216e90006d26, ; 1081: tr/Microsoft.VisualStudio.Composition.resources => 389
	i64 u0xcf0ca26d9b16a6f1, ; 1082: lib-zh-Hant-Microsoft.ServiceHub.Resources.dll.so => 378
	i64 u0xcf23d8093f3ceadf, ; 1083: System.Diagnostics.DiagnosticSource.dll => 27
	i64 u0xcf5ff6b6b2c4c382, ; 1084: System.Net.Mail.dll => 67
	i64 u0xcf8fc898f98b0d34, ; 1085: System.Private.Xml.Linq => 88
	i64 u0xcfff42884d4375a2, ; 1086: ko/StreamJsonRpc.resources => 438
	i64 u0xd04b5f59ed596e31, ; 1087: System.Reflection.Metadata.dll => 95
	i64 u0xd063299fcfc0c93f, ; 1088: lib_System.Runtime.Serialization.Json.dll.so => 113
	i64 u0xd0de8a113e976700, ; 1089: System.Diagnostics.TextWriterTraceListener => 31
	i64 u0xd0fc33d5ae5d4cb8, ; 1090: System.Runtime.Extensions => 104
	i64 u0xd1194e1d8a8de83c, ; 1091: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 267
	i64 u0xd12beacdfc14f696, ; 1092: System.Dynamic.Runtime => 37
	i64 u0xd198e7ce1b6a8344, ; 1093: System.Net.Quic.dll => 72
	i64 u0xd22a0c4630f2fe66, ; 1094: lib_System.Security.Cryptography.ProtectedData.dll.so => 225
	i64 u0xd3144156a3727ebe, ; 1095: Xamarin.Google.Guava.ListenableFuture => 309
	i64 u0xd333d0af9e423810, ; 1096: System.Runtime.InteropServices => 108
	i64 u0xd33a415cb4278969, ; 1097: System.Security.Cryptography.Encoding.dll => 123
	i64 u0xd3426d966bb704f5, ; 1098: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 239
	i64 u0xd3651b6fc3125825, ; 1099: System.Private.Uri.dll => 87
	i64 u0xd373685349b1fe8b, ; 1100: Microsoft.Extensions.Logging.dll => 186
	i64 u0xd3801faafafb7698, ; 1101: System.Private.DataContractSerialization.dll => 86
	i64 u0xd38cbd2e90bfe728, ; 1102: Microsoft.VisualStudio.Utilities.dll => 204
	i64 u0xd3e4c8d6a2d5d470, ; 1103: it/Microsoft.Maui.Controls.resources => 333
	i64 u0xd3edcc1f25459a50, ; 1104: System.Reflection.Emit => 93
	i64 u0xd4477e25aa7e7be2, ; 1105: InTheHand.BluetoothLE.dll => 179
	i64 u0xd4645626dffec99d, ; 1106: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 185
	i64 u0xd4fa0abb79079ea9, ; 1107: System.Security.Principal.dll => 129
	i64 u0xd5456f1e1776e28e, ; 1108: zh-Hans/Microsoft.VisualStudio.Composition.resources => 390
	i64 u0xd5507e11a2b2839f, ; 1109: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 279
	i64 u0xd57f185e14918654, ; 1110: ko/StreamJsonRpc.resources.dll => 438
	i64 u0xd5d04bef8478ea19, ; 1111: Xamarin.AndroidX.Tracing.Tracing.dll => 296
	i64 u0xd60815f26a12e140, ; 1112: Microsoft.Extensions.Logging.Debug.dll => 188
	i64 u0xd65786d27a4ad960, ; 1113: lib_Microsoft.Maui.Controls.HotReload.Forms.dll.so => 445
	i64 u0xd6694f8359737e4e, ; 1114: Xamarin.AndroidX.SavedState => 290
	i64 u0xd6949e129339eae5, ; 1115: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 252
	i64 u0xd6d21782156bc35b, ; 1116: Xamarin.AndroidX.SwipeRefreshLayout.dll => 295
	i64 u0xd6de019f6af72435, ; 1117: Xamarin.AndroidX.ConstraintLayout.Core.dll => 249
	i64 u0xd70956d1e6deefb9, ; 1118: Jsr305Binding => 306
	i64 u0xd72329819cbbbc44, ; 1119: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 183
	i64 u0xd7269d13f4e18073, ; 1120: Microsoft.VisualStudio.Validation.dll => 206
	i64 u0xd72c760af136e863, ; 1121: System.Xml.XmlSerializer.dll => 163
	i64 u0xd753f071e44c2a03, ; 1122: lib_System.Security.SecureString.dll.so => 130
	i64 u0xd76377b92cbd63b8, ; 1123: Microsoft.NET.StringTools.dll => 196
	i64 u0xd7b3764ada9d341d, ; 1124: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 187
	i64 u0xd7f0088bc5ad71f2, ; 1125: Xamarin.AndroidX.VersionedParcelable => 300
	i64 u0xd8113d9a7e8ad136, ; 1126: System.CodeDom => 211
	i64 u0xd861d1abb9e700d7, ; 1127: lib_Microsoft.VisualStudio.Threading.dll.so => 203
	i64 u0xd8eb7c27f86b76ec, ; 1128: System.Composition.AttributedModel => 213
	i64 u0xd8f1772a0e2aa0ef, ; 1129: tr/Microsoft.ServiceHub.Resources => 376
	i64 u0xd8fb25e28ae30a12, ; 1130: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 287
	i64 u0xd9caee2cc3456f6d, ; 1131: zh-Hant/Microsoft.VisualStudio.Utilities.resources => 418
	i64 u0xd9d55047b066d4af, ; 1132: lib_System.Composition.TypedParts.dll.so => 217
	i64 u0xda098605b62722c2, ; 1133: lib-tr-Microsoft.VisualStudio.Validation.resources.dll.so => 429
	i64 u0xda1dfa4c534a9251, ; 1134: Microsoft.Extensions.DependencyInjection => 184
	i64 u0xda2d2265212ce6e2, ; 1135: lib-ru-Microsoft.VisualStudio.Composition.resources.dll.so => 388
	i64 u0xdad05a11827959a3, ; 1136: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 1137: System.IO.FileSystem.Primitives => 49
	i64 u0xdb123b550eeaa66a, ; 1138: Microsoft.VisualStudio.Telemetry => 202
	i64 u0xdb5383ab5865c007, ; 1139: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 349
	i64 u0xdb58816721c02a59, ; 1140: lib_System.Reflection.Emit.ILGeneration.dll.so => 91
	i64 u0xdbeda89f832aa805, ; 1141: vi/Microsoft.Maui.Controls.resources.dll => 349
	i64 u0xdbf2a779fbc3ac31, ; 1142: System.Transactions.Local.dll => 150
	i64 u0xdbf49b5803c9e394, ; 1143: cs/Microsoft.ServiceHub.Framework.resources => 353
	i64 u0xdbf9607a441b4505, ; 1144: System.Linq => 62
	i64 u0xdbfc90157a0de9b0, ; 1145: lib_System.Text.Encoding.dll.so => 136
	i64 u0xdc75032002d1a212, ; 1146: lib_System.Transactions.Local.dll.so => 150
	i64 u0xdca8be7403f92d4f, ; 1147: lib_System.Linq.Queryable.dll.so => 61
	i64 u0xdce2c53525640bf3, ; 1148: Microsoft.Extensions.Logging => 186
	i64 u0xdcf375de36e09f7c, ; 1149: Nerdbank.Streams => 208
	i64 u0xdd2b722d78ef5f43, ; 1150: System.Runtime.dll => 117
	i64 u0xdd67031857c72f96, ; 1151: lib_System.Text.Encodings.Web.dll.so => 137
	i64 u0xdd92e229ad292030, ; 1152: System.Numerics.dll => 84
	i64 u0xddacf05c03bdd69d, ; 1153: lib-fr-Microsoft.VisualStudio.Threading.resources.dll.so => 395
	i64 u0xdddcdd701e911af1, ; 1154: lib_Xamarin.AndroidX.Legacy.Support.Core.Utils.dll.so => 265
	i64 u0xdde30e6b77aa6f6c, ; 1155: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 351
	i64 u0xdde50bb591567d20, ; 1156: lib-cs-Microsoft.VisualStudio.Validation.resources.dll.so => 419
	i64 u0xde110ae80fa7c2e2, ; 1157: System.Xml.XDocument.dll => 159
	i64 u0xde4726fcdf63a198, ; 1158: Xamarin.AndroidX.Transition => 297
	i64 u0xde572c2b2fb32f93, ; 1159: lib_System.Threading.Tasks.Extensions.dll.so => 143
	i64 u0xde5931ef0126466a, ; 1160: lib-tr-Microsoft.VisualStudio.Threading.resources.dll.so => 402
	i64 u0xde8769ebda7d8647, ; 1161: hr/Microsoft.Maui.Controls.resources.dll => 330
	i64 u0xdee075f3477ef6be, ; 1162: Xamarin.AndroidX.ExifInterface.dll => 261
	i64 u0xdf4b773de8fb1540, ; 1163: System.Net.dll => 82
	i64 u0xdfa254ebb4346068, ; 1164: System.Net.Ping => 70
	i64 u0xe0142572c095a480, ; 1165: Xamarin.AndroidX.AppCompat.dll => 238
	i64 u0xe01f875441530db1, ; 1166: zh-Hant/Microsoft.VisualStudio.Utilities.resources.dll => 418
	i64 u0xe021eaa401792a05, ; 1167: System.Text.Encoding.dll => 136
	i64 u0xe02f89350ec78051, ; 1168: Xamarin.AndroidX.CoordinatorLayout.dll => 250
	i64 u0xe0496b9d65ef5474, ; 1169: Xamarin.Android.Glide.DiskLruCache.dll => 231
	i64 u0xe09024c89408cd17, ; 1170: es/Microsoft.VisualStudio.Utilities.resources => 408
	i64 u0xe09371289d467988, ; 1171: fr/StreamJsonRpc.resources => 435
	i64 u0xe10410504c0f2002, ; 1172: Microsoft.VisualStudio.Threading.dll => 203
	i64 u0xe10b760bb1462e7a, ; 1173: lib_System.Security.Cryptography.Primitives.dll.so => 125
	i64 u0xe1566bbdb759c5af, ; 1174: Microsoft.Maui.Controls.HotReload.Forms.dll => 445
	i64 u0xe192a588d4410686, ; 1175: lib_System.IO.Pipelines.dll.so => 54
	i64 u0xe1a08bd3fa539e0d, ; 1176: System.Runtime.Loader => 110
	i64 u0xe1a77eb8831f7741, ; 1177: System.Security.SecureString.dll => 130
	i64 u0xe1b52f9f816c70ef, ; 1178: System.Private.Xml.Linq.dll => 88
	i64 u0xe1e199c8ab02e356, ; 1179: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 1180: System.Net.Security.dll => 74
	i64 u0xe1f511859d5ee247, ; 1181: ja/StreamJsonRpc.resources.dll => 437
	i64 u0xe221a087f605216d, ; 1182: lib_Microsoft.ServiceHub.Resources.dll.so => 198
	i64 u0xe2252a80fe853de4, ; 1183: lib_System.Security.Principal.dll.so => 129
	i64 u0xe22fa4c9c645db62, ; 1184: System.Diagnostics.TextWriterTraceListener.dll => 31
	i64 u0xe2420585aeceb728, ; 1185: System.Net.Requests.dll => 73
	i64 u0xe26692647e6bcb62, ; 1186: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 274
	i64 u0xe299c6f2ee50d202, ; 1187: pt-BR/Microsoft.VisualStudio.Composition.resources.dll => 387
	i64 u0xe29b73bc11392966, ; 1188: lib-id-Microsoft.Maui.Controls.resources.dll.so => 332
	i64 u0xe2ad448dee50fbdf, ; 1189: System.Xml.Serialization => 158
	i64 u0xe2d920f978f5d85c, ; 1190: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 1191: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe2ed6f27c03ed2d2, ; 1192: Microsoft.VisualStudio.RpcContracts => 201
	i64 u0xe332bacb3eb4a806, ; 1193: Mono.Android.Export.dll => 170
	i64 u0xe3811d68d4fe8463, ; 1194: pt-BR/Microsoft.Maui.Controls.resources.dll => 340
	i64 u0xe3b7cbae5ad66c75, ; 1195: lib_System.Security.Cryptography.Encoding.dll.so => 123
	i64 u0xe3d07a952212ea00, ; 1196: lib_Microsoft.VisualStudio.RemoteControl.dll.so => 200
	i64 u0xe465443a82f45e93, ; 1197: lib-ja-Microsoft.VisualStudio.Composition.resources.dll.so => 384
	i64 u0xe494f7ced4ecd10a, ; 1198: hu/Microsoft.Maui.Controls.resources.dll => 331
	i64 u0xe4a9b1e40d1e8917, ; 1199: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 326
	i64 u0xe4b69811365ffe40, ; 1200: lib-cs-Microsoft.VisualStudio.Utilities.resources.dll.so => 405
	i64 u0xe4c3fea7167f08c2, ; 1201: cs/Microsoft.ServiceHub.Resources => 366
	i64 u0xe4f74a0b5bf9703f, ; 1202: System.Runtime.Serialization.Primitives => 114
	i64 u0xe5434e8a119ceb69, ; 1203: lib_Mono.Android.dll.so => 172
	i64 u0xe55703b9ce5c038a, ; 1204: System.Diagnostics.Tools => 32
	i64 u0xe57013c8afc270b5, ; 1205: Microsoft.VisualBasic => 3
	i64 u0xe57d22ca4aeb4900, ; 1206: System.Configuration.ConfigurationManager => 218
	i64 u0xe60f959ef8e11330, ; 1207: lib-zh-Hant-Microsoft.VisualStudio.Composition.resources.dll.so => 391
	i64 u0xe62913cc36bc07ec, ; 1208: System.Xml.dll => 164
	i64 u0xe634225e568dbf8d, ; 1209: cs/StreamJsonRpc.resources => 432
	i64 u0xe6ec7d8d48d24437, ; 1210: pl/Microsoft.ServiceHub.Framework.resources.dll => 360
	i64 u0xe7bea09c4900a191, ; 1211: Xamarin.AndroidX.VectorDrawable.dll => 298
	i64 u0xe7e03cc18dcdeb49, ; 1212: lib_System.Diagnostics.StackTrace.dll.so => 30
	i64 u0xe7e147ff99a7a380, ; 1213: lib_System.Configuration.dll.so => 19
	i64 u0xe86b0df4ba9e5db8, ; 1214: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 273
	i64 u0xe86f942323d329bd, ; 1215: zh-Hant/Microsoft.ServiceHub.Resources => 378
	i64 u0xe896622fe0902957, ; 1216: System.Reflection.Emit.dll => 93
	i64 u0xe89a2a9ef110899b, ; 1217: System.Drawing.dll => 36
	i64 u0xe8c5f8c100b5934b, ; 1218: Microsoft.Win32.Registry => 5
	i64 u0xe901486a5c561f62, ; 1219: lib_System.Composition.Runtime.dll.so => 216
	i64 u0xe912b82a211c3a0c, ; 1220: System.Composition.Convention => 214
	i64 u0xe9179f1637fde3e4, ; 1221: lib-de-Microsoft.VisualStudio.Threading.resources.dll.so => 393
	i64 u0xe957c3976986ab72, ; 1222: lib_Xamarin.AndroidX.Window.Extensions.Core.Core.dll.so => 304
	i64 u0xe98163eb702ae5c5, ; 1223: Xamarin.AndroidX.Arch.Core.Runtime => 241
	i64 u0xe994f23ba4c143e5, ; 1224: Xamarin.KotlinX.Coroutines.Android => 314
	i64 u0xe9b9c8c0458fd92a, ; 1225: System.Windows => 155
	i64 u0xe9c5d42dcf01a5a3, ; 1226: lib-zh-Hans-Microsoft.VisualStudio.Threading.resources.dll.so => 403
	i64 u0xe9d166d87a7f2bdb, ; 1227: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 294
	i64 u0xea5a4efc2ad81d1b, ; 1228: Xamarin.Google.ErrorProne.Annotations => 308
	i64 u0xeaf8e9970fc2fe69, ; 1229: System.Management => 224
	i64 u0xeb2313fe9d65b785, ; 1230: Xamarin.AndroidX.ConstraintLayout.dll => 248
	i64 u0xeb6e275e78cb8d42, ; 1231: Xamarin.AndroidX.LocalBroadcastManager.dll => 281
	i64 u0xeb9e30ac32aac03e, ; 1232: lib_Microsoft.Win32.SystemEvents.dll.so => 207
	i64 u0xebc05bf326a78ad3, ; 1233: System.Windows.Extensions.dll => 228
	i64 u0xec0166481ea62f83, ; 1234: lib_System.ComponentModel.Composition.dll.so => 212
	i64 u0xec1a9d46eef73c70, ; 1235: MessagePack.Annotations.dll => 181
	i64 u0xec7e519580d6c2f2, ; 1236: lib-fr-Microsoft.VisualStudio.Utilities.resources.dll.so => 409
	i64 u0xed19c616b3fcb7eb, ; 1237: Xamarin.AndroidX.VersionedParcelable.dll => 300
	i64 u0xed60c6fa891c051a, ; 1238: lib_Microsoft.VisualStudio.DesignTools.TapContract.dll.so => 447
	i64 u0xed6ef763c6fb395f, ; 1239: System.Diagnostics.EventLog.dll => 219
	i64 u0xedc4817167106c23, ; 1240: System.Net.Sockets.dll => 76
	i64 u0xedc632067fb20ff3, ; 1241: System.Memory.dll => 63
	i64 u0xedc8e4ca71a02a8b, ; 1242: Xamarin.AndroidX.Navigation.Runtime.dll => 284
	i64 u0xee81f5b3f1c4f83b, ; 1243: System.Threading.ThreadPool => 147
	i64 u0xeeb7ebb80150501b, ; 1244: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 245
	i64 u0xeefc635595ef57f0, ; 1245: System.Security.Cryptography.Cng => 121
	i64 u0xef03b1b5a04e9709, ; 1246: System.Text.Encoding.CodePages.dll => 134
	i64 u0xef432781d5667f61, ; 1247: Xamarin.AndroidX.Print => 286
	i64 u0xef602c523fe2e87a, ; 1248: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 309
	i64 u0xef72742e1bcca27a, ; 1249: Microsoft.Maui.Essentials.dll => 194
	i64 u0xef733309f0bad176, ; 1250: ru/Microsoft.ServiceHub.Resources.dll => 375
	i64 u0xef8dfd4390412143, ; 1251: fr/Microsoft.VisualStudio.Validation.resources => 422
	i64 u0xefc053a0fcd90491, ; 1252: lib_InTheHand.AndroidActivity.dll.so => 178
	i64 u0xefcb2173456e507a, ; 1253: fr/StreamJsonRpc.resources.dll => 435
	i64 u0xefcca934f6950ba5, ; 1254: lib-cs-StreamJsonRpc.resources.dll.so => 432
	i64 u0xefd1e0c4e5c9b371, ; 1255: System.Resources.ResourceManager.dll => 100
	i64 u0xefe81324f7a420d0, ; 1256: de/Microsoft.VisualStudio.Validation.resources.dll => 420
	i64 u0xefe8f8d5ed3c72ea, ; 1257: System.Formats.Tar.dll => 39
	i64 u0xefec0b7fdc57ec42, ; 1258: Xamarin.AndroidX.Activity => 233
	i64 u0xeff59cbde4363ec3, ; 1259: System.Threading.AccessControl.dll => 227
	i64 u0xf001f0e0ddc794eb, ; 1260: pl/Microsoft.VisualStudio.Composition.resources.dll => 386
	i64 u0xf008bcd238ede2c8, ; 1261: System.CodeDom.dll => 211
	i64 u0xf00c29406ea45e19, ; 1262: es/Microsoft.Maui.Controls.resources.dll => 325
	i64 u0xf017a06a4015fe38, ; 1263: System.Composition.Convention.dll => 214
	i64 u0xf09e47b6ae914f6e, ; 1264: System.Net.NameResolution => 68
	i64 u0xf0ac2b489fed2e35, ; 1265: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 1266: lib_System.Net.ServicePoint.dll.so => 75
	i64 u0xf0de2537ee19c6ca, ; 1267: lib_System.Net.WebHeaderCollection.dll.so => 78
	i64 u0xf1138779fa181c68, ; 1268: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 272
	i64 u0xf11b621fc87b983f, ; 1269: Microsoft.Maui.Controls.Xaml.dll => 192
	i64 u0xf161f4f3c3b7e62c, ; 1270: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 1271: System.ValueTuple => 152
	i64 u0xf17f5235dad7397a, ; 1272: pt-BR/Microsoft.ServiceHub.Resources.dll => 374
	i64 u0xf1c4b4005493d871, ; 1273: System.Formats.Asn1.dll => 38
	i64 u0xf238bd79489d3a96, ; 1274: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 338
	i64 u0xf2685ffcdd0e6d2f, ; 1275: Microsoft.ServiceHub.Framework.dll => 197
	i64 u0xf2feea356ba760af, ; 1276: Xamarin.AndroidX.Arch.Core.Runtime.dll => 241
	i64 u0xf300e085f8acd238, ; 1277: lib_System.ServiceProcess.dll.so => 133
	i64 u0xf34e52b26e7e059d, ; 1278: System.Runtime.CompilerServices.VisualC.dll => 103
	i64 u0xf37221fda4ef8830, ; 1279: lib_Xamarin.Google.Android.Material.dll.so => 305
	i64 u0xf3ad9b8fb3eefd12, ; 1280: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i64 u0xf3ddfe05336abf29, ; 1281: System => 165
	i64 u0xf3e691ca9f00f3af, ; 1282: pl/Microsoft.VisualStudio.Threading.resources => 399
	i64 u0xf3eabc5419cb0e06, ; 1283: ja/Microsoft.VisualStudio.Composition.resources => 384
	i64 u0xf408654b2a135055, ; 1284: System.Reflection.Emit.ILGeneration.dll => 91
	i64 u0xf4103170a1de5bd0, ; 1285: System.Linq.Queryable.dll => 61
	i64 u0xf42d20c23173d77c, ; 1286: lib_System.ServiceModel.Web.dll.so => 132
	i64 u0xf4c1dd70a5496a17, ; 1287: System.IO.Compression => 46
	i64 u0xf4d8549f44ddc6a4, ; 1288: lib_System.Composition.Convention.dll.so => 214
	i64 u0xf4ecf4b9afc64781, ; 1289: System.ServiceProcess.dll => 133
	i64 u0xf4eeeaa566e9b970, ; 1290: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 255
	i64 u0xf518f63ead11fcd1, ; 1291: System.Threading.Tasks => 145
	i64 u0xf5fc7602fe27b333, ; 1292: System.Net.WebHeaderCollection => 78
	i64 u0xf6077741019d7428, ; 1293: Xamarin.AndroidX.CoordinatorLayout => 250
	i64 u0xf60bd0b24d05fc93, ; 1294: tr/Microsoft.VisualStudio.Threading.resources => 402
	i64 u0xf63db4e5a72af778, ; 1295: zh-Hant/Microsoft.ServiceHub.Framework.resources => 365
	i64 u0xf652efa755415ca4, ; 1296: cs/Microsoft.VisualStudio.Threading.resources.dll => 392
	i64 u0xf661e4426a495aa6, ; 1297: lib-es-StreamJsonRpc.resources.dll.so => 434
	i64 u0xf66fc6d6e3a33c60, ; 1298: lib-cs-Microsoft.ServiceHub.Resources.dll.so => 366
	i64 u0xf6742cbf457c450b, ; 1299: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 273
	i64 u0xf6dc5b5e5e7e03d3, ; 1300: ja/Microsoft.VisualStudio.Utilities.resources.dll => 411
	i64 u0xf70c0a7bf8ccf5af, ; 1301: System.Web => 154
	i64 u0xf77b20923f07c667, ; 1302: de/Microsoft.Maui.Controls.resources.dll => 323
	i64 u0xf7b21661953e0716, ; 1303: it/Microsoft.ServiceHub.Framework.resources => 357
	i64 u0xf7e2cac4c45067b3, ; 1304: lib_System.Numerics.Vectors.dll.so => 83
	i64 u0xf7e74930e0e3d214, ; 1305: zh-HK/Microsoft.Maui.Controls.resources.dll => 350
	i64 u0xf7fa0bf77fe677cc, ; 1306: Newtonsoft.Json.dll => 209
	i64 u0xf84773b5c81e3cef, ; 1307: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 348
	i64 u0xf8aac5ea82de1348, ; 1308: System.Linq.Queryable => 61
	i64 u0xf8b77539b362d3ba, ; 1309: lib_System.Reflection.Primitives.dll.so => 96
	i64 u0xf8e045dc345b2ea3, ; 1310: lib_Xamarin.AndroidX.RecyclerView.dll.so => 288
	i64 u0xf915dc29808193a1, ; 1311: System.Web.HttpUtility.dll => 153
	i64 u0xf96c777a2a0686f4, ; 1312: hi/Microsoft.Maui.Controls.resources.dll => 329
	i64 u0xf9be54c8bcf8ff3b, ; 1313: System.Security.AccessControl.dll => 118
	i64 u0xf9eec5bb3a6aedc6, ; 1314: Microsoft.Extensions.Options => 189
	i64 u0xfa0e82300e67f913, ; 1315: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 1316: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 1317: lib_System.Net.Security.dll.so => 74
	i64 u0xfa5ed7226d978949, ; 1318: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 319
	i64 u0xfa645d91e9fc4cba, ; 1319: System.Threading.Thread => 146
	i64 u0xfa72c187a9b70a63, ; 1320: lib_System.Composition.Hosting.dll.so => 215
	i64 u0xfa883d229dfe2806, ; 1321: de/Microsoft.VisualStudio.Composition.resources => 380
	i64 u0xfab3c497e59e7627, ; 1322: pt-BR/Microsoft.VisualStudio.Validation.resources.dll => 427
	i64 u0xfad4d2c770e827f9, ; 1323: lib_System.IO.IsolatedStorage.dll.so => 52
	i64 u0xfb06dd2338e6f7c4, ; 1324: System.Net.Ping.dll => 70
	i64 u0xfb087abe5365e3b7, ; 1325: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb4d33c02d1a705f, ; 1326: lib-es-Microsoft.VisualStudio.Utilities.resources.dll.so => 408
	i64 u0xfb846e949baff5ea, ; 1327: System.Xml.Serialization.dll => 158
	i64 u0xfbad3e4ce4b98145, ; 1328: System.Security.Cryptography.X509Certificates => 126
	i64 u0xfbf0a31c9fc34bc4, ; 1329: lib_System.Net.Http.dll.so => 65
	i64 u0xfc61ddcf78dd1f54, ; 1330: Xamarin.AndroidX.LocalBroadcastManager => 281
	i64 u0xfc6b7527cc280b3f, ; 1331: lib_System.Runtime.Serialization.Formatters.dll.so => 112
	i64 u0xfc719aec26adf9d9, ; 1332: Xamarin.AndroidX.Navigation.Fragment.dll => 283
	i64 u0xfc82690c2fe2735c, ; 1333: Xamarin.AndroidX.Lifecycle.Process.dll => 271
	i64 u0xfc93fc307d279893, ; 1334: System.IO.Pipes.AccessControl.dll => 55
	i64 u0xfcd302092ada6328, ; 1335: System.IO.MemoryMappedFiles.dll => 53
	i64 u0xfd22f00870e40ae0, ; 1336: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 257
	i64 u0xfd462f213ca5a810, ; 1337: ru/StreamJsonRpc.resources.dll => 441
	i64 u0xfd49b3c1a76e2748, ; 1338: System.Runtime.InteropServices.RuntimeInformation => 107
	i64 u0xfd536c702f64dc47, ; 1339: System.Text.Encoding.Extensions => 135
	i64 u0xfd583f7657b6a1cb, ; 1340: Xamarin.AndroidX.Fragment => 262
	i64 u0xfd8dd91a2c26bd5d, ; 1341: Xamarin.AndroidX.Lifecycle.Runtime => 272
	i64 u0xfda36abccf05cf5c, ; 1342: System.Net.WebSockets.Client => 80
	i64 u0xfdbe4710aa9beeff, ; 1343: CommunityToolkit.Maui => 174
	i64 u0xfddbe9695626a7f5, ; 1344: Xamarin.AndroidX.Lifecycle.Common => 266
	i64 u0xfeae9952cf03b8cb, ; 1345: tr/Microsoft.Maui.Controls.resources => 347
	i64 u0xfebe1950717515f9, ; 1346: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 270
	i64 u0xff270a55858bac8d, ; 1347: System.Security.Principal => 129
	i64 u0xff9b54613e0d2cc8, ; 1348: System.Net.Http.Json => 64
	i64 u0xffdb7a971be4ec73 ; 1349: System.ValueTuple.dll => 152
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [1350 x i32] [
	i32 42, i32 315, i32 428, i32 295, i32 205, i32 379, i32 13, i32 431,
	i32 284, i32 175, i32 181, i32 371, i32 105, i32 171, i32 381, i32 48,
	i32 238, i32 7, i32 86, i32 343, i32 321, i32 349, i32 258, i32 71,
	i32 288, i32 12, i32 193, i32 102, i32 350, i32 156, i32 19, i32 263,
	i32 245, i32 161, i32 436, i32 384, i32 260, i32 396, i32 298, i32 167,
	i32 343, i32 10, i32 188, i32 222, i32 299, i32 96, i32 255, i32 370,
	i32 257, i32 13, i32 189, i32 10, i32 127, i32 95, i32 421, i32 140,
	i32 39, i32 344, i32 354, i32 318, i32 429, i32 301, i32 211, i32 340,
	i32 172, i32 232, i32 5, i32 194, i32 67, i32 292, i32 130, i32 291,
	i32 259, i32 68, i32 405, i32 246, i32 382, i32 66, i32 57, i32 413,
	i32 254, i32 52, i32 43, i32 125, i32 210, i32 403, i32 67, i32 81,
	i32 274, i32 447, i32 158, i32 92, i32 99, i32 288, i32 404, i32 402,
	i32 406, i32 141, i32 414, i32 151, i32 221, i32 242, i32 362, i32 327,
	i32 380, i32 162, i32 169, i32 328, i32 185, i32 81, i32 447, i32 246,
	i32 4, i32 5, i32 411, i32 219, i32 51, i32 101, i32 56, i32 418,
	i32 120, i32 98, i32 168, i32 118, i32 315, i32 21, i32 399, i32 331,
	i32 137, i32 97, i32 318, i32 421, i32 368, i32 77, i32 337, i32 443,
	i32 286, i32 294, i32 119, i32 413, i32 437, i32 364, i32 394, i32 8,
	i32 441, i32 165, i32 346, i32 70, i32 424, i32 231, i32 395, i32 275,
	i32 289, i32 390, i32 171, i32 145, i32 40, i32 415, i32 292, i32 47,
	i32 30, i32 285, i32 335, i32 144, i32 189, i32 373, i32 163, i32 28,
	i32 84, i32 296, i32 77, i32 180, i32 43, i32 226, i32 29, i32 42,
	i32 103, i32 117, i32 360, i32 236, i32 45, i32 426, i32 91, i32 346,
	i32 56, i32 148, i32 446, i32 146, i32 100, i32 49, i32 20, i32 251,
	i32 114, i32 229, i32 327, i32 307, i32 436, i32 198, i32 201, i32 311,
	i32 190, i32 94, i32 58, i32 401, i32 444, i32 332, i32 330, i32 81,
	i32 307, i32 169, i32 26, i32 71, i32 287, i32 261, i32 445, i32 348,
	i32 69, i32 33, i32 381, i32 228, i32 407, i32 326, i32 14, i32 139,
	i32 38, i32 352, i32 361, i32 247, i32 339, i32 134, i32 92, i32 88,
	i32 149, i32 345, i32 24, i32 138, i32 57, i32 433, i32 227, i32 51,
	i32 324, i32 390, i32 29, i32 370, i32 157, i32 34, i32 365, i32 164,
	i32 420, i32 262, i32 52, i32 428, i32 449, i32 303, i32 90, i32 391,
	i32 429, i32 243, i32 378, i32 35, i32 439, i32 327, i32 157, i32 180,
	i32 438, i32 9, i32 325, i32 76, i32 55, i32 220, i32 193, i32 321,
	i32 191, i32 13, i32 302, i32 182, i32 240, i32 109, i32 365, i32 412,
	i32 278, i32 32, i32 104, i32 84, i32 92, i32 53, i32 200, i32 417,
	i32 96, i32 310, i32 408, i32 58, i32 398, i32 9, i32 102, i32 215,
	i32 254, i32 68, i32 218, i32 301, i32 427, i32 320, i32 410, i32 209,
	i32 178, i32 125, i32 289, i32 116, i32 135, i32 428, i32 126, i32 106,
	i32 311, i32 131, i32 242, i32 309, i32 147, i32 426, i32 156, i32 263,
	i32 251, i32 258, i32 289, i32 97, i32 439, i32 24, i32 293, i32 143,
	i32 286, i32 282, i32 220, i32 3, i32 218, i32 167, i32 239, i32 355,
	i32 100, i32 161, i32 99, i32 25, i32 224, i32 415, i32 93, i32 197,
	i32 168, i32 172, i32 234, i32 3, i32 339, i32 260, i32 406, i32 1,
	i32 114, i32 380, i32 311, i32 263, i32 271, i32 223, i32 33, i32 6,
	i32 0, i32 394, i32 343, i32 203, i32 410, i32 440, i32 205, i32 199,
	i32 395, i32 156, i32 341, i32 53, i32 265, i32 371, i32 431, i32 443,
	i32 226, i32 432, i32 410, i32 85, i32 300, i32 213, i32 285, i32 44,
	i32 270, i32 104, i32 47, i32 138, i32 181, i32 64, i32 280, i32 69,
	i32 80, i32 59, i32 89, i32 154, i32 240, i32 133, i32 110, i32 414,
	i32 333, i32 280, i32 374, i32 287, i32 171, i32 134, i32 397, i32 443,
	i32 140, i32 40, i32 320, i32 442, i32 401, i32 191, i32 60, i32 176,
	i32 355, i32 277, i32 79, i32 25, i32 367, i32 36, i32 222, i32 99,
	i32 274, i32 71, i32 22, i32 251, i32 195, i32 344, i32 416, i32 370,
	i32 121, i32 69, i32 107, i32 350, i32 281, i32 119, i32 117, i32 266,
	i32 404, i32 267, i32 11, i32 2, i32 124, i32 115, i32 142, i32 41,
	i32 87, i32 235, i32 173, i32 27, i32 148, i32 334, i32 184, i32 308,
	i32 389, i32 234, i32 1, i32 216, i32 398, i32 236, i32 44, i32 250,
	i32 198, i32 149, i32 373, i32 423, i32 265, i32 18, i32 86, i32 322,
	i32 41, i32 270, i32 244, i32 275, i32 94, i32 186, i32 28, i32 436,
	i32 41, i32 78, i32 259, i32 247, i32 144, i32 108, i32 245, i32 383,
	i32 381, i32 11, i32 105, i32 137, i32 412, i32 16, i32 122, i32 66,
	i32 157, i32 179, i32 22, i32 324, i32 317, i32 102, i32 184, i32 316,
	i32 63, i32 391, i32 58, i32 192, i32 323, i32 110, i32 173, i32 379,
	i32 434, i32 196, i32 448, i32 314, i32 9, i32 305, i32 120, i32 420,
	i32 98, i32 105, i32 278, i32 174, i32 191, i32 111, i32 237, i32 388,
	i32 49, i32 20, i32 277, i32 221, i32 362, i32 253, i32 210, i32 413,
	i32 72, i32 249, i32 155, i32 220, i32 39, i32 212, i32 322, i32 35,
	i32 312, i32 38, i32 328, i32 375, i32 405, i32 216, i32 385, i32 304,
	i32 108, i32 337, i32 21, i32 433, i32 386, i32 385, i32 310, i32 374,
	i32 208, i32 430, i32 276, i32 225, i32 397, i32 195, i32 15, i32 190,
	i32 79, i32 79, i32 253, i32 190, i32 442, i32 256, i32 383, i32 283,
	i32 291, i32 388, i32 152, i32 21, i32 440, i32 193, i32 321, i32 50,
	i32 393, i32 356, i32 51, i32 396, i32 368, i32 347, i32 337, i32 94,
	i32 230, i32 206, i32 333, i32 16, i32 398, i32 123, i32 330, i32 160,
	i32 199, i32 409, i32 45, i32 179, i32 308, i32 177, i32 116, i32 63,
	i32 166, i32 386, i32 182, i32 372, i32 419, i32 430, i32 14, i32 290,
	i32 111, i32 354, i32 237, i32 60, i32 313, i32 364, i32 412, i32 121,
	i32 336, i32 2, i32 346, i32 226, i32 262, i32 276, i32 207, i32 355,
	i32 312, i32 379, i32 276, i32 6, i32 244, i32 326, i32 258, i32 393,
	i32 392, i32 362, i32 17, i32 344, i32 323, i32 77, i32 248, i32 175,
	i32 131, i32 416, i32 310, i32 336, i32 83, i32 356, i32 353, i32 188,
	i32 12, i32 34, i32 119, i32 423, i32 317, i32 271, i32 260, i32 85,
	i32 229, i32 18, i32 301, i32 417, i32 367, i32 183, i32 269, i32 199,
	i32 72, i32 446, i32 95, i32 165, i32 264, i32 82, i32 352, i32 377,
	i32 377, i32 202, i32 238, i32 444, i32 243, i32 313, i32 382, i32 154,
	i32 178, i32 180, i32 36, i32 151, i32 348, i32 369, i32 351, i32 387,
	i32 144, i32 196, i32 56, i32 113, i32 244, i32 298, i32 217, i32 297,
	i32 37, i32 352, i32 182, i32 115, i32 236, i32 14, i32 230, i32 146,
	i32 43, i32 194, i32 197, i32 234, i32 98, i32 316, i32 168, i32 16,
	i32 48, i32 107, i32 97, i32 433, i32 369, i32 411, i32 0, i32 280,
	i32 419, i32 27, i32 128, i32 29, i32 328, i32 207, i32 363, i32 291,
	i32 128, i32 44, i32 253, i32 373, i32 259, i32 149, i32 8, i32 444,
	i32 360, i32 209, i32 219, i32 282, i32 329, i32 342, i32 341, i32 132,
	i32 340, i32 42, i32 317, i32 33, i32 449, i32 46, i32 143, i32 416,
	i32 277, i32 363, i32 382, i32 192, i32 268, i32 254, i32 138, i32 439,
	i32 377, i32 62, i32 132, i32 320, i32 48, i32 160, i32 241, i32 268,
	i32 230, i32 409, i32 266, i32 336, i32 357, i32 297, i32 46, i32 164,
	i32 359, i32 264, i32 0, i32 325, i32 261, i32 204, i32 215, i32 389,
	i32 200, i32 332, i32 195, i32 399, i32 361, i32 18, i32 8, i32 177,
	i32 252, i32 361, i32 124, i32 59, i32 426, i32 141, i32 176, i32 284,
	i32 358, i32 335, i32 383, i32 272, i32 306, i32 303, i32 150, i32 142,
	i32 372, i32 315, i32 312, i32 126, i32 314, i32 160, i32 223, i32 162,
	i32 255, i32 423, i32 233, i32 183, i32 414, i32 338, i32 26, i32 282,
	i32 427, i32 371, i32 269, i32 82, i32 425, i32 403, i32 303, i32 367,
	i32 127, i32 307, i32 357, i32 101, i32 422, i32 148, i32 305, i32 285,
	i32 54, i32 162, i32 167, i32 131, i32 223, i32 37, i32 356, i32 299,
	i32 425, i32 335, i32 400, i32 176, i32 22, i32 112, i32 90, i32 256,
	i32 50, i32 60, i32 122, i32 83, i32 127, i32 163, i32 306, i32 166,
	i32 290, i32 292, i32 257, i32 229, i32 273, i32 4, i32 437, i32 267,
	i32 331, i32 170, i32 2, i32 208, i32 278, i32 116, i32 448, i32 235,
	i32 19, i32 175, i32 187, i32 89, i32 65, i32 228, i32 30, i32 185,
	i32 324, i32 249, i32 59, i32 204, i32 111, i32 202, i32 269, i32 32,
	i32 128, i32 434, i32 206, i32 159, i32 342, i32 375, i32 247, i32 140,
	i32 256, i32 338, i32 153, i32 17, i32 246, i32 232, i32 400, i32 75,
	i32 74, i32 15, i32 169, i32 85, i32 313, i32 124, i32 268, i32 279,
	i32 205, i32 248, i32 345, i32 201, i32 275, i32 34, i32 118, i32 139,
	i32 122, i32 369, i32 106, i32 322, i32 446, i32 299, i32 225, i32 243,
	i32 424, i32 400, i32 329, i32 319, i32 406, i32 54, i32 47, i32 28,
	i32 227, i32 145, i32 187, i32 147, i32 222, i32 35, i32 359, i32 440,
	i32 354, i32 345, i32 407, i32 173, i32 224, i32 304, i32 75, i32 161,
	i32 392, i32 1, i32 421, i32 293, i32 341, i32 334, i32 159, i32 12,
	i32 155, i32 401, i32 151, i32 76, i32 103, i32 112, i32 210, i32 240,
	i32 65, i32 66, i32 302, i32 45, i32 242, i32 109, i32 415, i32 358,
	i32 7, i32 397, i32 221, i32 239, i32 55, i32 235, i32 407, i32 64,
	i32 319, i32 442, i32 252, i32 213, i32 363, i32 20, i32 109, i32 101,
	i32 62, i32 142, i32 233, i32 435, i32 417, i32 212, i32 7, i32 334,
	i32 170, i32 50, i32 302, i32 115, i32 404, i32 141, i32 177, i32 166,
	i32 217, i32 80, i32 113, i32 358, i32 279, i32 17, i32 73, i32 283,
	i32 89, i32 231, i32 387, i32 87, i32 120, i32 296, i32 237, i32 364,
	i32 135, i32 153, i32 106, i32 11, i32 425, i32 394, i32 368, i32 90,
	i32 396, i32 31, i32 174, i32 347, i32 136, i32 359, i32 431, i32 339,
	i32 353, i32 342, i32 294, i32 430, i32 366, i32 232, i32 40, i32 449,
	i32 293, i32 139, i32 376, i32 316, i32 318, i32 25, i32 424, i32 351,
	i32 73, i32 385, i32 441, i32 376, i32 264, i32 295, i32 448, i32 372,
	i32 422, i32 389, i32 378, i32 27, i32 67, i32 88, i32 438, i32 95,
	i32 113, i32 31, i32 104, i32 267, i32 37, i32 72, i32 225, i32 309,
	i32 108, i32 123, i32 239, i32 87, i32 186, i32 86, i32 204, i32 333,
	i32 93, i32 179, i32 185, i32 129, i32 390, i32 279, i32 438, i32 296,
	i32 188, i32 445, i32 290, i32 252, i32 295, i32 249, i32 306, i32 183,
	i32 206, i32 163, i32 130, i32 196, i32 187, i32 300, i32 211, i32 203,
	i32 213, i32 376, i32 287, i32 418, i32 217, i32 429, i32 184, i32 388,
	i32 10, i32 49, i32 202, i32 349, i32 91, i32 349, i32 150, i32 353,
	i32 62, i32 136, i32 150, i32 61, i32 186, i32 208, i32 117, i32 137,
	i32 84, i32 395, i32 265, i32 351, i32 419, i32 159, i32 297, i32 143,
	i32 402, i32 330, i32 261, i32 82, i32 70, i32 238, i32 418, i32 136,
	i32 250, i32 231, i32 408, i32 435, i32 203, i32 125, i32 445, i32 54,
	i32 110, i32 130, i32 88, i32 23, i32 74, i32 437, i32 198, i32 129,
	i32 31, i32 73, i32 274, i32 387, i32 332, i32 158, i32 23, i32 4,
	i32 201, i32 170, i32 340, i32 123, i32 200, i32 384, i32 331, i32 326,
	i32 405, i32 366, i32 114, i32 172, i32 32, i32 3, i32 218, i32 391,
	i32 164, i32 432, i32 360, i32 298, i32 30, i32 19, i32 273, i32 378,
	i32 93, i32 36, i32 5, i32 216, i32 214, i32 393, i32 304, i32 241,
	i32 314, i32 155, i32 403, i32 294, i32 308, i32 224, i32 248, i32 281,
	i32 207, i32 228, i32 212, i32 181, i32 409, i32 300, i32 447, i32 219,
	i32 76, i32 63, i32 284, i32 147, i32 245, i32 121, i32 134, i32 286,
	i32 309, i32 194, i32 375, i32 422, i32 178, i32 435, i32 432, i32 100,
	i32 420, i32 39, i32 233, i32 227, i32 386, i32 211, i32 325, i32 214,
	i32 68, i32 26, i32 75, i32 78, i32 272, i32 192, i32 24, i32 152,
	i32 374, i32 38, i32 338, i32 197, i32 241, i32 133, i32 103, i32 305,
	i32 57, i32 165, i32 399, i32 384, i32 91, i32 61, i32 132, i32 46,
	i32 214, i32 133, i32 255, i32 145, i32 78, i32 250, i32 402, i32 365,
	i32 392, i32 434, i32 366, i32 273, i32 411, i32 154, i32 323, i32 357,
	i32 83, i32 350, i32 209, i32 348, i32 61, i32 96, i32 288, i32 153,
	i32 329, i32 118, i32 189, i32 6, i32 15, i32 74, i32 319, i32 146,
	i32 215, i32 380, i32 427, i32 52, i32 70, i32 23, i32 408, i32 158,
	i32 126, i32 65, i32 281, i32 112, i32 283, i32 271, i32 55, i32 53,
	i32 257, i32 441, i32 107, i32 135, i32 262, i32 272, i32 80, i32 174,
	i32 266, i32 347, i32 270, i32 129, i32 64, i32 152
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ e7876a4f92d894b40c191a24c2b74f06d4bf4573"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
