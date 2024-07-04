; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [329 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [658 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 251
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 285
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 294
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 8: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 303
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 11: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 327
	i32 68219467, ; 12: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 13: Microsoft.Maui.Graphics.dll => 0x44bb714 => 205
	i32 82292897, ; 14: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 15: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 311
	i32 101534019, ; 16: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 269
	i32 117431740, ; 17: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 18: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 269
	i32 122350210, ; 19: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 124202100, ; 20: DevExpress.Maui.CollectionView.dll => 0x7672c74 => 178
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 289
	i32 136584136, ; 22: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 326
	i32 140062828, ; 23: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 319
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 225
	i32 176265551, ; 28: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 29: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 271
	i32 184328833, ; 30: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 31: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 32: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 223
	i32 212673184, ; 33: DevExpress.Maui.Controls => 0xcad22a0 => 181
	i32 220171995, ; 34: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 35: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 245
	i32 230752869, ; 36: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 37: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 38: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 39: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 228
	i32 276479776, ; 41: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 42: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 247
	i32 280482487, ; 43: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 244
	i32 291076382, ; 44: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 45: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 46: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 324
	i32 318968648, ; 47: Xamarin.AndroidX.Activity.dll => 0x13031348 => 213
	i32 321597661, ; 48: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 49: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 302
	i32 331603304, ; 50: SixLabors.Fonts => 0x13c3dd68 => 206
	i32 342366114, ; 51: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 246
	i32 360082299, ; 52: System.ServiceModel.Web => 0x15766b7b => 131
	i32 364319144, ; 53: DXCollectionView.a => 0x15b711a8 => 177
	i32 367780167, ; 54: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 55: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 56: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 57: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 58: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 59: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 60: _Microsoft.Android.Resource.Designer => 0x17969339 => 328
	i32 403441872, ; 61: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 62: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 322
	i32 441335492, ; 63: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 229
	i32 442565967, ; 64: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 65: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 242
	i32 451504562, ; 66: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 67: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 68: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 69: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 70: System.dll => 0x1bff388e => 164
	i32 476646585, ; 71: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 244
	i32 486930444, ; 72: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 257
	i32 489220957, ; 73: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 300
	i32 498788369, ; 74: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 75: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 199
	i32 526420162, ; 76: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 77: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 289
	i32 530272170, ; 78: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 79: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 321
	i32 539058512, ; 80: Microsoft.Extensions.Logging => 0x20216150 => 195
	i32 540030774, ; 81: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 82: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 83: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 84: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 85: Jsr305Binding => 0x213954e7 => 282
	i32 560453093, ; 86: AppTp => 0x2167d5e5 => 0
	i32 569601784, ; 87: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 280
	i32 577335427, ; 88: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 597488923, ; 89: CommunityToolkit.Maui => 0x239cf51b => 174
	i32 601371474, ; 90: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 91: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 92: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 93: Xamarin.AndroidX.CustomView => 0x2568904f => 234
	i32 627931235, ; 94: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 313
	i32 639843206, ; 95: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 240
	i32 643868501, ; 96: System.Net => 0x2660a755 => 81
	i32 662205335, ; 97: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 98: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 276
	i32 666292255, ; 99: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 220
	i32 672442732, ; 100: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 101: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 102: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 103: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 291
	i32 693804605, ; 104: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 105: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 106: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 286
	i32 700358131, ; 107: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 108: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 290
	i32 722857257, ; 109: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 110: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 111: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 112: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 210
	i32 759454413, ; 113: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 114: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 115: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 116: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 319
	i32 789151979, ; 117: Microsoft.Extensions.Options => 0x2f0980eb => 198
	i32 790371945, ; 118: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 235
	i32 804715423, ; 119: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 120: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 249
	i32 809851609, ; 121: System.Drawing.Common.dll => 0x30455ad9 => 207
	i32 823281589, ; 122: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 123: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 124: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 125: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 126: Xamarin.AndroidX.Print => 0x3246f6cd => 262
	i32 869139383, ; 127: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 304
	i32 873119928, ; 128: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 129: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 130: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 131: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 318
	i32 904024072, ; 132: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 133: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 134: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 315
	i32 928116545, ; 135: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 285
	i32 952186615, ; 136: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 137: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 290
	i32 961460050, ; 138: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 308
	i32 966729478, ; 139: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 283
	i32 967690846, ; 140: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 246
	i32 975236339, ; 141: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 142: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 143: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 144: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 145: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 317
	i32 992768348, ; 146: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 147: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 148: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1004437970, ; 149: DevExpress.Maui.DataGrid.dll => 0x3bde81d2 => 185
	i32 1012816738, ; 150: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 266
	i32 1019214401, ; 151: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 152: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 194
	i32 1031528504, ; 153: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 284
	i32 1035644815, ; 154: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 218
	i32 1036536393, ; 155: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 156: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 298
	i32 1044663988, ; 157: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 158: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 253
	i32 1067306892, ; 159: GoogleGson => 0x3f9dcf8c => 189
	i32 1082857460, ; 160: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1083751839, ; 161: System.IO.Packaging => 0x4098bd9f => 208
	i32 1084122840, ; 162: Xamarin.Kotlin.StdLib => 0x409e66d8 => 287
	i32 1098259244, ; 163: System => 0x41761b2c => 164
	i32 1108272742, ; 164: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 320
	i32 1117529484, ; 165: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 314
	i32 1118262833, ; 166: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 310
	i32 1121599056, ; 167: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 252
	i32 1127624469, ; 168: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 197
	i32 1149092582, ; 169: Xamarin.AndroidX.Window => 0x447dc2e6 => 279
	i32 1168523401, ; 170: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 316
	i32 1170634674, ; 171: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 172: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 275
	i32 1178241025, ; 173: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 260
	i32 1204270330, ; 174: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 220
	i32 1208641965, ; 175: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 176: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1243150071, ; 177: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 280
	i32 1253011324, ; 178: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 179: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 296
	i32 1264511973, ; 180: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 270
	i32 1267360935, ; 181: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 274
	i32 1273260888, ; 182: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 226
	i32 1275534314, ; 183: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 291
	i32 1278448581, ; 184: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 217
	i32 1293217323, ; 185: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 237
	i32 1308624726, ; 186: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 305
	i32 1309188875, ; 187: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 188: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 279
	i32 1324164729, ; 189: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 190: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 191: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 325
	i32 1338318188, ; 192: ExcelNumberFormat.dll => 0x4fc51d6c => 188
	i32 1338781641, ; 193: DocumentFormat.OpenXml.dll => 0x4fcc2fc9 => 187
	i32 1353618654, ; 194: DXEditors.a => 0x50ae94de => 179
	i32 1364015309, ; 195: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 196: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 326
	i32 1376866003, ; 197: Xamarin.AndroidX.SavedState => 0x52114ed3 => 266
	i32 1379779777, ; 198: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 199: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 200: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 230
	i32 1408764838, ; 201: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 202: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 203: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 204: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 294
	i32 1434145427, ; 205: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 206: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 283
	i32 1439761251, ; 207: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 208: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 209: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 210: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 211: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 212: es\Microsoft.Maui.Controls.resources => 0x57152abe => 300
	i32 1461234159, ; 213: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 214: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 215: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 216: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 219
	i32 1470490898, ; 217: Microsoft.Extensions.Primitives => 0x57a5e912 => 199
	i32 1479771757, ; 218: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 219: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 220: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 221: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 267
	i32 1526286932, ; 222: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 324
	i32 1536373174, ; 223: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 224: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 225: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 226: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565862583, ; 227: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 228: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1571983310, ; 229: DevExpress.Data.v23.2.dll => 0x5db28fce => 176
	i32 1573704789, ; 230: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 231: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 232: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 236
	i32 1592978981, ; 233: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 234: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 284
	i32 1601112923, ; 235: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1602284021, ; 236: DevExpress.Maui.Core => 0x5f80e9f5 => 183
	i32 1604827217, ; 237: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1615388022, ; 238: DevExpress.Maui.Core.dll => 0x6048dd76 => 183
	i32 1618516317, ; 239: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 240: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 256
	i32 1622358360, ; 241: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 242: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 278
	i32 1634654947, ; 243: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 175
	i32 1635184631, ; 244: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 240
	i32 1636350590, ; 245: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 233
	i32 1639515021, ; 246: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 247: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 248: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654786569, ; 249: DevExpress.Maui.DataGrid => 0x62a20a09 => 185
	i32 1657153582, ; 250: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 251: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 272
	i32 1658251792, ; 252: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 281
	i32 1670060433, ; 253: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 228
	i32 1675553242, ; 254: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 255: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 256: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 257: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 258: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 259: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 260: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 288
	i32 1701541528, ; 261: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 262: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 249
	i32 1726116996, ; 263: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 264: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 265: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 224
	i32 1743415430, ; 266: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 295
	i32 1744735666, ; 267: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 268: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 269: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 270: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 271: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 272: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 273: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 271
	i32 1770582343, ; 274: Microsoft.Extensions.Logging.dll => 0x6988f147 => 195
	i32 1776026572, ; 275: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 276: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 277: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 278: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 311
	i32 1788241197, ; 279: Xamarin.AndroidX.Fragment => 0x6a96652d => 242
	i32 1793755602, ; 280: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 303
	i32 1808609942, ; 281: Xamarin.AndroidX.Loader => 0x6bcd3296 => 256
	i32 1813058853, ; 282: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 287
	i32 1813201214, ; 283: Xamarin.Google.Android.Material => 0x6c13413e => 281
	i32 1815999139, ; 284: Xamarin.AndroidX.AutoFill => 0x6c3df2a3 => 222
	i32 1818569960, ; 285: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 261
	i32 1818787751, ; 286: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 287: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 288: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 289: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 196
	i32 1847515442, ; 290: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 210
	i32 1853025655, ; 291: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 320
	i32 1856505197, ; 292: Irony => 0x6ea8056d => 190
	i32 1858542181, ; 293: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 294: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 295: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 302
	i32 1879696579, ; 296: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 297: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 221
	i32 1888955245, ; 298: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 299: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 300: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 296
	i32 1898237753, ; 301: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 302: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 303: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 304: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 305: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 307
	i32 1956758971, ; 306: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 307: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 268
	i32 1968388702, ; 308: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 191
	i32 1983156543, ; 309: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 288
	i32 1985761444, ; 310: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 212
	i32 2003115576, ; 311: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 299
	i32 2011961780, ; 312: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 313: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 253
	i32 2031763787, ; 314: Xamarin.Android.Glide => 0x791a414b => 209
	i32 2045470958, ; 315: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 316: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 248
	i32 2060060697, ; 317: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 318: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 298
	i32 2070888862, ; 319: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 320: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 321: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 322: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 323: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 324: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 325: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 326: Microsoft.Maui => 0x80bd55ad => 203
	i32 2166698602, ; 327: ClosedXML => 0x8125326a => 173
	i32 2169148018, ; 328: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 306
	i32 2181898931, ; 329: Microsoft.Extensions.Options.dll => 0x820d22b3 => 198
	i32 2192057212, ; 330: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 196
	i32 2193016926, ; 331: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 332: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 292
	i32 2201231467, ; 333: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 334: it\Microsoft.Maui.Controls.resources => 0x839595db => 308
	i32 2209434506, ; 335: DXNavigation.a => 0x83b14b8a => 180
	i32 2217644978, ; 336: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 275
	i32 2222056684, ; 337: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2234734091, ; 338: Xamarin.AndroidX.AutoFill.dll => 0x8533560b => 222
	i32 2237934468, ; 339: DevExpress.Maui.Editors.dll => 0x85642b84 => 186
	i32 2244775296, ; 340: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 257
	i32 2252106437, ; 341: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 342: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 343: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 344: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 192
	i32 2267999099, ; 345: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 211
	i32 2279755925, ; 346: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 264
	i32 2293034957, ; 347: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 348: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 349: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 350: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 312
	i32 2305521784, ; 351: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 352: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 215
	i32 2320631194, ; 353: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 354: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 355: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 356: System.Net.Primitives => 0x8c40e0db => 70
	i32 2366048013, ; 357: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 306
	i32 2368005991, ; 358: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 359: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 191
	i32 2378619854, ; 360: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 361: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 362: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 307
	i32 2401565422, ; 363: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 364: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 239
	i32 2421380589, ; 365: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 366: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 226
	i32 2427813419, ; 367: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 304
	i32 2435356389, ; 368: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 369: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 370: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 371: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 372: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 373: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 229
	i32 2471841756, ; 374: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 375: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 376: Microsoft.Maui.Controls => 0x93dba8a1 => 201
	i32 2483903535, ; 377: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 378: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 379: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 380: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 381: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 310
	i32 2505896520, ; 382: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 251
	i32 2522472828, ; 383: Xamarin.Android.Glide.dll => 0x9659e17c => 209
	i32 2538310050, ; 384: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2538318350, ; 385: Irony.dll => 0x974baa0e => 190
	i32 2550873716, ; 386: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 305
	i32 2562349572, ; 387: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 388: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 389: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 309
	i32 2581783588, ; 390: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 252
	i32 2581819634, ; 391: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 274
	i32 2585220780, ; 392: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 393: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 394: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 395: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 314
	i32 2605712449, ; 396: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 292
	i32 2615233544, ; 397: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 243
	i32 2616218305, ; 398: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 197
	i32 2617129537, ; 399: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 400: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 401: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 233
	i32 2624644809, ; 402: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 238
	i32 2626831493, ; 403: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 309
	i32 2627185994, ; 404: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 405: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 406: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 247
	i32 2663391936, ; 407: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 211
	i32 2663698177, ; 408: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 409: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 410: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 411: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 412: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 413: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 414: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 272
	i32 2715334215, ; 415: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2715632697, ; 416: DXCore.a.dll => 0xa1dd4439 => 182
	i32 2717744543, ; 417: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 418: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 419: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 420: Xamarin.AndroidX.Activity => 0xa2e0939b => 213
	i32 2735172069, ; 421: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 422: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 219
	i32 2740698338, ; 423: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 295
	i32 2740948882, ; 424: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 425: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 426: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 315
	i32 2758225723, ; 427: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 202
	i32 2764765095, ; 428: Microsoft.Maui.dll => 0xa4caf7a7 => 203
	i32 2765824710, ; 429: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 430: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 286
	i32 2778768386, ; 431: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 277
	i32 2779977773, ; 432: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 265
	i32 2785988530, ; 433: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 321
	i32 2788224221, ; 434: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 243
	i32 2801831435, ; 435: Microsoft.Maui.Graphics => 0xa7008e0b => 205
	i32 2803228030, ; 436: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2809327187, ; 437: AppTp.dll => 0xa772ee53 => 0
	i32 2810250172, ; 438: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 230
	i32 2819470561, ; 439: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 440: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 441: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 265
	i32 2824502124, ; 442: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2838993487, ; 443: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 254
	i32 2849599387, ; 444: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 445: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 277
	i32 2855708567, ; 446: Xamarin.AndroidX.Transition => 0xaa36a797 => 273
	i32 2861098320, ; 447: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 448: Microsoft.Maui.Essentials => 0xaa8a4878 => 204
	i32 2868488919, ; 449: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 175
	i32 2870099610, ; 450: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 214
	i32 2875164099, ; 451: Jsr305Binding.dll => 0xab5f85c3 => 282
	i32 2875220617, ; 452: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2877542466, ; 453: ClosedXML.dll => 0xab83d042 => 173
	i32 2884993177, ; 454: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 241
	i32 2887636118, ; 455: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 456: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 457: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 458: System.Reflection => 0xacf080de => 97
	i32 2904610611, ; 459: XLParser => 0xad20d733 => 293
	i32 2905242038, ; 460: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 461: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 462: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 278
	i32 2919462931, ; 463: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 464: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 216
	i32 2921159260, ; 465: DXCore.a => 0xae1d5a5c => 182
	i32 2936416060, ; 466: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 467: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 468: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2956781122, ; 469: DXEditors.a.dll => 0xb03ce642 => 179
	i32 2959614098, ; 470: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 471: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 472: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 473: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 237
	i32 2987532451, ; 474: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 268
	i32 2996846495, ; 475: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 250
	i32 3016983068, ; 476: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 270
	i32 3023353419, ; 477: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 478: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 245
	i32 3038032645, ; 479: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 328
	i32 3053864966, ; 480: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 301
	i32 3056245963, ; 481: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 267
	i32 3057625584, ; 482: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 258
	i32 3059408633, ; 483: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 484: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 485: System.Threading.Tasks => 0xb755818f => 144
	i32 3090735792, ; 486: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 487: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 488: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 489: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3118851116, ; 490: ExcelNumberFormat => 0xb9e5e42c => 188
	i32 3121463068, ; 491: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 492: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 493: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 494: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 495: GoogleGson.dll => 0xbba64c02 => 189
	i32 3159123045, ; 496: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 497: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 498: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 259
	i32 3178908327, ; 499: SixLabors.Fonts.dll => 0xbd7a4aa7 => 206
	i32 3192346100, ; 500: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 501: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 502: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 503: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 504: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 236
	i32 3220365878, ; 505: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 506: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 507: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 508: Xamarin.AndroidX.CardView => 0xc235e84d => 224
	i32 3265493905, ; 509: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 510: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 511: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 512: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 513: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 514: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 515: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 516: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 517: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 301
	i32 3309582591, ; 518: DXGrid.a.dll => 0xc54438ff => 184
	i32 3316684772, ; 519: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 520: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 234
	i32 3317144872, ; 521: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 522: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 221
	i32 3345895724, ; 523: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 263
	i32 3346324047, ; 524: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 260
	i32 3357674450, ; 525: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 318
	i32 3358260929, ; 526: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 527: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 214
	i32 3362522851, ; 528: Xamarin.AndroidX.Core => 0xc86c06e3 => 231
	i32 3366347497, ; 529: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 530: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 264
	i32 3381016424, ; 531: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 297
	i32 3395150330, ; 532: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 533: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 534: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 235
	i32 3428513518, ; 535: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 193
	i32 3429136800, ; 536: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 537: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 538: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 238
	i32 3445260447, ; 539: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 540: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 200
	i32 3458724246, ; 541: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 316
	i32 3471940407, ; 542: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 543: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 544: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 317
	i32 3485117614, ; 545: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 546: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 547: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 227
	i32 3503731303, ; 548: DXGrid.a => 0xd0d6b267 => 184
	i32 3509114376, ; 549: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 550: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 551: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 552: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 553: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 554: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3573573763, ; 555: DevExpress.Maui.CollectionView => 0xd5006883 => 178
	i32 3580758918, ; 556: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 325
	i32 3592228221, ; 557: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 327
	i32 3597029428, ; 558: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 212
	i32 3598340787, ; 559: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 560: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 561: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 562: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 262
	i32 3633644679, ; 563: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 216
	i32 3638274909, ; 564: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 565: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 248
	i32 3643446276, ; 566: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 322
	i32 3643854240, ; 567: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 259
	i32 3645089577, ; 568: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 569: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 192
	i32 3660523487, ; 570: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 571: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 572: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 223
	i32 3684561358, ; 573: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 227
	i32 3689084180, ; 574: DXCollectionView.a.dll => 0xdbe2f514 => 177
	i32 3689375977, ; 575: System.Drawing.Common => 0xdbe768e9 => 207
	i32 3700866549, ; 576: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 577: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 232
	i32 3716563718, ; 578: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 579: Xamarin.AndroidX.Annotation => 0xdda814c6 => 215
	i32 3724971120, ; 580: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 258
	i32 3732100267, ; 581: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 582: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 583: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 584: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 585: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 297
	i32 3753988493, ; 586: DevExpress.Maui.Controls.dll => 0xdfc1518d => 181
	i32 3777270291, ; 587: DevExpress.Maui.Editors => 0xe1249213 => 186
	i32 3786282454, ; 588: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 225
	i32 3792276235, ; 589: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 590: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 200
	i32 3802395368, ; 591: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 592: CommunityToolkit.Maui.dll => 0xe3886bf7 => 174
	i32 3819260425, ; 593: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3822443793, ; 594: DocumentFormat.OpenXml => 0xe3d5dd11 => 187
	i32 3823082795, ; 595: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 596: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 597: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 194
	i32 3844307129, ; 598: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 599: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 600: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 601: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 602: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 603: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 604: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 273
	i32 3888767677, ; 605: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 263
	i32 3893086827, ; 606: DXNavigation.a.dll => 0xe80bca6b => 180
	i32 3896106733, ; 607: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 608: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 231
	i32 3901907137, ; 609: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3904638161, ; 610: XLParser.dll => 0xe8bc0cd1 => 293
	i32 3920221145, ; 611: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 313
	i32 3920810846, ; 612: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 613: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 276
	i32 3928044579, ; 614: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 615: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 616: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 261
	i32 3945713374, ; 617: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3952357212, ; 618: System.IO.Packaging.dll => 0xeb942f5c => 208
	i32 3953953790, ; 619: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 620: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 218
	i32 3958304432, ; 621: DevExpress.Data.v23.2 => 0xebeeeeb0 => 176
	i32 3959773229, ; 622: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 250
	i32 4003436829, ; 623: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 624: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 217
	i32 4025784931, ; 625: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 626: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 202
	i32 4054681211, ; 627: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 628: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 629: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 630: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 299
	i32 4094352644, ; 631: Microsoft.Maui.Essentials.dll => 0xf40add04 => 204
	i32 4099507663, ; 632: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 633: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 634: Xamarin.AndroidX.Emoji2 => 0xf479582c => 239
	i32 4103439459, ; 635: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 323
	i32 4126470640, ; 636: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 193
	i32 4127667938, ; 637: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 638: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 639: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 640: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 323
	i32 4151237749, ; 641: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 642: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 643: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 644: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 645: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 646: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 255
	i32 4185676441, ; 647: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 648: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 649: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 650: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 312
	i32 4256097574, ; 651: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 232
	i32 4258378803, ; 652: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 254
	i32 4260525087, ; 653: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 654: Microsoft.Maui.Controls.dll => 0xfea12dee => 201
	i32 4274976490, ; 655: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 656: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 255
	i32 4294763496 ; 657: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 241
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [658 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 251, ; 3
	i32 285, ; 4
	i32 48, ; 5
	i32 294, ; 6
	i32 80, ; 7
	i32 303, ; 8
	i32 145, ; 9
	i32 30, ; 10
	i32 327, ; 11
	i32 124, ; 12
	i32 205, ; 13
	i32 102, ; 14
	i32 311, ; 15
	i32 269, ; 16
	i32 107, ; 17
	i32 269, ; 18
	i32 139, ; 19
	i32 178, ; 20
	i32 289, ; 21
	i32 326, ; 22
	i32 319, ; 23
	i32 77, ; 24
	i32 124, ; 25
	i32 13, ; 26
	i32 225, ; 27
	i32 132, ; 28
	i32 271, ; 29
	i32 151, ; 30
	i32 18, ; 31
	i32 223, ; 32
	i32 181, ; 33
	i32 26, ; 34
	i32 245, ; 35
	i32 1, ; 36
	i32 59, ; 37
	i32 42, ; 38
	i32 91, ; 39
	i32 228, ; 40
	i32 147, ; 41
	i32 247, ; 42
	i32 244, ; 43
	i32 54, ; 44
	i32 69, ; 45
	i32 324, ; 46
	i32 213, ; 47
	i32 83, ; 48
	i32 302, ; 49
	i32 206, ; 50
	i32 246, ; 51
	i32 131, ; 52
	i32 177, ; 53
	i32 55, ; 54
	i32 149, ; 55
	i32 74, ; 56
	i32 145, ; 57
	i32 62, ; 58
	i32 146, ; 59
	i32 328, ; 60
	i32 165, ; 61
	i32 322, ; 62
	i32 229, ; 63
	i32 12, ; 64
	i32 242, ; 65
	i32 125, ; 66
	i32 152, ; 67
	i32 113, ; 68
	i32 166, ; 69
	i32 164, ; 70
	i32 244, ; 71
	i32 257, ; 72
	i32 300, ; 73
	i32 84, ; 74
	i32 199, ; 75
	i32 150, ; 76
	i32 289, ; 77
	i32 60, ; 78
	i32 321, ; 79
	i32 195, ; 80
	i32 51, ; 81
	i32 103, ; 82
	i32 114, ; 83
	i32 40, ; 84
	i32 282, ; 85
	i32 0, ; 86
	i32 280, ; 87
	i32 120, ; 88
	i32 174, ; 89
	i32 52, ; 90
	i32 44, ; 91
	i32 119, ; 92
	i32 234, ; 93
	i32 313, ; 94
	i32 240, ; 95
	i32 81, ; 96
	i32 136, ; 97
	i32 276, ; 98
	i32 220, ; 99
	i32 8, ; 100
	i32 73, ; 101
	i32 155, ; 102
	i32 291, ; 103
	i32 154, ; 104
	i32 92, ; 105
	i32 286, ; 106
	i32 45, ; 107
	i32 290, ; 108
	i32 109, ; 109
	i32 129, ; 110
	i32 25, ; 111
	i32 210, ; 112
	i32 72, ; 113
	i32 55, ; 114
	i32 46, ; 115
	i32 319, ; 116
	i32 198, ; 117
	i32 235, ; 118
	i32 22, ; 119
	i32 249, ; 120
	i32 207, ; 121
	i32 86, ; 122
	i32 43, ; 123
	i32 160, ; 124
	i32 71, ; 125
	i32 262, ; 126
	i32 304, ; 127
	i32 3, ; 128
	i32 42, ; 129
	i32 63, ; 130
	i32 318, ; 131
	i32 16, ; 132
	i32 53, ; 133
	i32 315, ; 134
	i32 285, ; 135
	i32 105, ; 136
	i32 290, ; 137
	i32 308, ; 138
	i32 283, ; 139
	i32 246, ; 140
	i32 34, ; 141
	i32 158, ; 142
	i32 85, ; 143
	i32 32, ; 144
	i32 317, ; 145
	i32 12, ; 146
	i32 51, ; 147
	i32 56, ; 148
	i32 185, ; 149
	i32 266, ; 150
	i32 36, ; 151
	i32 194, ; 152
	i32 284, ; 153
	i32 218, ; 154
	i32 35, ; 155
	i32 298, ; 156
	i32 58, ; 157
	i32 253, ; 158
	i32 189, ; 159
	i32 17, ; 160
	i32 208, ; 161
	i32 287, ; 162
	i32 164, ; 163
	i32 320, ; 164
	i32 314, ; 165
	i32 310, ; 166
	i32 252, ; 167
	i32 197, ; 168
	i32 279, ; 169
	i32 316, ; 170
	i32 153, ; 171
	i32 275, ; 172
	i32 260, ; 173
	i32 220, ; 174
	i32 29, ; 175
	i32 52, ; 176
	i32 280, ; 177
	i32 5, ; 178
	i32 296, ; 179
	i32 270, ; 180
	i32 274, ; 181
	i32 226, ; 182
	i32 291, ; 183
	i32 217, ; 184
	i32 237, ; 185
	i32 305, ; 186
	i32 85, ; 187
	i32 279, ; 188
	i32 61, ; 189
	i32 112, ; 190
	i32 325, ; 191
	i32 188, ; 192
	i32 187, ; 193
	i32 179, ; 194
	i32 57, ; 195
	i32 326, ; 196
	i32 266, ; 197
	i32 99, ; 198
	i32 19, ; 199
	i32 230, ; 200
	i32 111, ; 201
	i32 101, ; 202
	i32 102, ; 203
	i32 294, ; 204
	i32 104, ; 205
	i32 283, ; 206
	i32 71, ; 207
	i32 38, ; 208
	i32 32, ; 209
	i32 103, ; 210
	i32 73, ; 211
	i32 300, ; 212
	i32 9, ; 213
	i32 123, ; 214
	i32 46, ; 215
	i32 219, ; 216
	i32 199, ; 217
	i32 9, ; 218
	i32 43, ; 219
	i32 4, ; 220
	i32 267, ; 221
	i32 324, ; 222
	i32 31, ; 223
	i32 138, ; 224
	i32 92, ; 225
	i32 93, ; 226
	i32 49, ; 227
	i32 141, ; 228
	i32 176, ; 229
	i32 112, ; 230
	i32 140, ; 231
	i32 236, ; 232
	i32 115, ; 233
	i32 284, ; 234
	i32 157, ; 235
	i32 183, ; 236
	i32 76, ; 237
	i32 183, ; 238
	i32 79, ; 239
	i32 256, ; 240
	i32 37, ; 241
	i32 278, ; 242
	i32 175, ; 243
	i32 240, ; 244
	i32 233, ; 245
	i32 64, ; 246
	i32 138, ; 247
	i32 15, ; 248
	i32 185, ; 249
	i32 116, ; 250
	i32 272, ; 251
	i32 281, ; 252
	i32 228, ; 253
	i32 48, ; 254
	i32 70, ; 255
	i32 80, ; 256
	i32 126, ; 257
	i32 94, ; 258
	i32 121, ; 259
	i32 288, ; 260
	i32 26, ; 261
	i32 249, ; 262
	i32 97, ; 263
	i32 28, ; 264
	i32 224, ; 265
	i32 295, ; 266
	i32 149, ; 267
	i32 169, ; 268
	i32 4, ; 269
	i32 98, ; 270
	i32 33, ; 271
	i32 93, ; 272
	i32 271, ; 273
	i32 195, ; 274
	i32 21, ; 275
	i32 41, ; 276
	i32 170, ; 277
	i32 311, ; 278
	i32 242, ; 279
	i32 303, ; 280
	i32 256, ; 281
	i32 287, ; 282
	i32 281, ; 283
	i32 222, ; 284
	i32 261, ; 285
	i32 2, ; 286
	i32 134, ; 287
	i32 111, ; 288
	i32 196, ; 289
	i32 210, ; 290
	i32 320, ; 291
	i32 190, ; 292
	i32 58, ; 293
	i32 95, ; 294
	i32 302, ; 295
	i32 39, ; 296
	i32 221, ; 297
	i32 25, ; 298
	i32 94, ; 299
	i32 296, ; 300
	i32 89, ; 301
	i32 99, ; 302
	i32 10, ; 303
	i32 87, ; 304
	i32 307, ; 305
	i32 100, ; 306
	i32 268, ; 307
	i32 191, ; 308
	i32 288, ; 309
	i32 212, ; 310
	i32 299, ; 311
	i32 7, ; 312
	i32 253, ; 313
	i32 209, ; 314
	i32 88, ; 315
	i32 248, ; 316
	i32 154, ; 317
	i32 298, ; 318
	i32 33, ; 319
	i32 116, ; 320
	i32 82, ; 321
	i32 20, ; 322
	i32 11, ; 323
	i32 162, ; 324
	i32 3, ; 325
	i32 203, ; 326
	i32 173, ; 327
	i32 306, ; 328
	i32 198, ; 329
	i32 196, ; 330
	i32 84, ; 331
	i32 292, ; 332
	i32 64, ; 333
	i32 308, ; 334
	i32 180, ; 335
	i32 275, ; 336
	i32 143, ; 337
	i32 222, ; 338
	i32 186, ; 339
	i32 257, ; 340
	i32 157, ; 341
	i32 41, ; 342
	i32 117, ; 343
	i32 192, ; 344
	i32 211, ; 345
	i32 264, ; 346
	i32 131, ; 347
	i32 75, ; 348
	i32 66, ; 349
	i32 312, ; 350
	i32 172, ; 351
	i32 215, ; 352
	i32 143, ; 353
	i32 106, ; 354
	i32 151, ; 355
	i32 70, ; 356
	i32 306, ; 357
	i32 156, ; 358
	i32 191, ; 359
	i32 121, ; 360
	i32 127, ; 361
	i32 307, ; 362
	i32 152, ; 363
	i32 239, ; 364
	i32 141, ; 365
	i32 226, ; 366
	i32 304, ; 367
	i32 20, ; 368
	i32 14, ; 369
	i32 135, ; 370
	i32 75, ; 371
	i32 59, ; 372
	i32 229, ; 373
	i32 167, ; 374
	i32 168, ; 375
	i32 201, ; 376
	i32 15, ; 377
	i32 74, ; 378
	i32 6, ; 379
	i32 23, ; 380
	i32 310, ; 381
	i32 251, ; 382
	i32 209, ; 383
	i32 91, ; 384
	i32 190, ; 385
	i32 305, ; 386
	i32 1, ; 387
	i32 136, ; 388
	i32 309, ; 389
	i32 252, ; 390
	i32 274, ; 391
	i32 134, ; 392
	i32 69, ; 393
	i32 146, ; 394
	i32 314, ; 395
	i32 292, ; 396
	i32 243, ; 397
	i32 197, ; 398
	i32 88, ; 399
	i32 96, ; 400
	i32 233, ; 401
	i32 238, ; 402
	i32 309, ; 403
	i32 31, ; 404
	i32 45, ; 405
	i32 247, ; 406
	i32 211, ; 407
	i32 109, ; 408
	i32 158, ; 409
	i32 35, ; 410
	i32 22, ; 411
	i32 114, ; 412
	i32 57, ; 413
	i32 272, ; 414
	i32 144, ; 415
	i32 182, ; 416
	i32 118, ; 417
	i32 120, ; 418
	i32 110, ; 419
	i32 213, ; 420
	i32 139, ; 421
	i32 219, ; 422
	i32 295, ; 423
	i32 54, ; 424
	i32 105, ; 425
	i32 315, ; 426
	i32 202, ; 427
	i32 203, ; 428
	i32 133, ; 429
	i32 286, ; 430
	i32 277, ; 431
	i32 265, ; 432
	i32 321, ; 433
	i32 243, ; 434
	i32 205, ; 435
	i32 159, ; 436
	i32 0, ; 437
	i32 230, ; 438
	i32 163, ; 439
	i32 132, ; 440
	i32 265, ; 441
	i32 161, ; 442
	i32 254, ; 443
	i32 140, ; 444
	i32 277, ; 445
	i32 273, ; 446
	i32 169, ; 447
	i32 204, ; 448
	i32 175, ; 449
	i32 214, ; 450
	i32 282, ; 451
	i32 40, ; 452
	i32 173, ; 453
	i32 241, ; 454
	i32 81, ; 455
	i32 56, ; 456
	i32 37, ; 457
	i32 97, ; 458
	i32 293, ; 459
	i32 166, ; 460
	i32 172, ; 461
	i32 278, ; 462
	i32 82, ; 463
	i32 216, ; 464
	i32 182, ; 465
	i32 98, ; 466
	i32 30, ; 467
	i32 159, ; 468
	i32 179, ; 469
	i32 18, ; 470
	i32 127, ; 471
	i32 119, ; 472
	i32 237, ; 473
	i32 268, ; 474
	i32 250, ; 475
	i32 270, ; 476
	i32 165, ; 477
	i32 245, ; 478
	i32 328, ; 479
	i32 301, ; 480
	i32 267, ; 481
	i32 258, ; 482
	i32 170, ; 483
	i32 16, ; 484
	i32 144, ; 485
	i32 125, ; 486
	i32 118, ; 487
	i32 38, ; 488
	i32 115, ; 489
	i32 188, ; 490
	i32 47, ; 491
	i32 142, ; 492
	i32 117, ; 493
	i32 34, ; 494
	i32 189, ; 495
	i32 95, ; 496
	i32 53, ; 497
	i32 259, ; 498
	i32 206, ; 499
	i32 129, ; 500
	i32 153, ; 501
	i32 24, ; 502
	i32 161, ; 503
	i32 236, ; 504
	i32 148, ; 505
	i32 104, ; 506
	i32 89, ; 507
	i32 224, ; 508
	i32 60, ; 509
	i32 142, ; 510
	i32 100, ; 511
	i32 5, ; 512
	i32 13, ; 513
	i32 122, ; 514
	i32 135, ; 515
	i32 28, ; 516
	i32 301, ; 517
	i32 184, ; 518
	i32 72, ; 519
	i32 234, ; 520
	i32 24, ; 521
	i32 221, ; 522
	i32 263, ; 523
	i32 260, ; 524
	i32 318, ; 525
	i32 137, ; 526
	i32 214, ; 527
	i32 231, ; 528
	i32 168, ; 529
	i32 264, ; 530
	i32 297, ; 531
	i32 101, ; 532
	i32 123, ; 533
	i32 235, ; 534
	i32 193, ; 535
	i32 163, ; 536
	i32 167, ; 537
	i32 238, ; 538
	i32 39, ; 539
	i32 200, ; 540
	i32 316, ; 541
	i32 17, ; 542
	i32 171, ; 543
	i32 317, ; 544
	i32 137, ; 545
	i32 150, ; 546
	i32 227, ; 547
	i32 184, ; 548
	i32 155, ; 549
	i32 130, ; 550
	i32 19, ; 551
	i32 65, ; 552
	i32 147, ; 553
	i32 47, ; 554
	i32 178, ; 555
	i32 325, ; 556
	i32 327, ; 557
	i32 212, ; 558
	i32 79, ; 559
	i32 61, ; 560
	i32 106, ; 561
	i32 262, ; 562
	i32 216, ; 563
	i32 49, ; 564
	i32 248, ; 565
	i32 322, ; 566
	i32 259, ; 567
	i32 14, ; 568
	i32 192, ; 569
	i32 68, ; 570
	i32 171, ; 571
	i32 223, ; 572
	i32 227, ; 573
	i32 177, ; 574
	i32 207, ; 575
	i32 78, ; 576
	i32 232, ; 577
	i32 108, ; 578
	i32 215, ; 579
	i32 258, ; 580
	i32 67, ; 581
	i32 63, ; 582
	i32 27, ; 583
	i32 160, ; 584
	i32 297, ; 585
	i32 181, ; 586
	i32 186, ; 587
	i32 225, ; 588
	i32 10, ; 589
	i32 200, ; 590
	i32 11, ; 591
	i32 174, ; 592
	i32 78, ; 593
	i32 187, ; 594
	i32 126, ; 595
	i32 83, ; 596
	i32 194, ; 597
	i32 66, ; 598
	i32 107, ; 599
	i32 65, ; 600
	i32 128, ; 601
	i32 122, ; 602
	i32 77, ; 603
	i32 273, ; 604
	i32 263, ; 605
	i32 180, ; 606
	i32 8, ; 607
	i32 231, ; 608
	i32 2, ; 609
	i32 293, ; 610
	i32 313, ; 611
	i32 44, ; 612
	i32 276, ; 613
	i32 156, ; 614
	i32 128, ; 615
	i32 261, ; 616
	i32 23, ; 617
	i32 208, ; 618
	i32 133, ; 619
	i32 218, ; 620
	i32 176, ; 621
	i32 250, ; 622
	i32 29, ; 623
	i32 217, ; 624
	i32 62, ; 625
	i32 202, ; 626
	i32 90, ; 627
	i32 87, ; 628
	i32 148, ; 629
	i32 299, ; 630
	i32 204, ; 631
	i32 36, ; 632
	i32 86, ; 633
	i32 239, ; 634
	i32 323, ; 635
	i32 193, ; 636
	i32 50, ; 637
	i32 6, ; 638
	i32 90, ; 639
	i32 323, ; 640
	i32 21, ; 641
	i32 162, ; 642
	i32 96, ; 643
	i32 50, ; 644
	i32 113, ; 645
	i32 255, ; 646
	i32 130, ; 647
	i32 76, ; 648
	i32 27, ; 649
	i32 312, ; 650
	i32 232, ; 651
	i32 254, ; 652
	i32 7, ; 653
	i32 201, ; 654
	i32 110, ; 655
	i32 255, ; 656
	i32 241 ; 657
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
