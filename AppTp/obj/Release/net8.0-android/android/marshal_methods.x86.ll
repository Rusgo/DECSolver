; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [183 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [366 x i32] [
	i32 42639949, ; 0: System.Threading.Thread => 0x28aa24d => 168
	i32 66541672, ; 1: System.Diagnostics.StackTrace => 0x3f75868 => 117
	i32 67008169, ; 2: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 3: System.Security.Cryptography.Primitives => 0x410f24b => 162
	i32 72070932, ; 4: Microsoft.Maui.Graphics.dll => 0x44bb714 => 65
	i32 117431740, ; 5: System.Runtime.InteropServices => 0x6ffddbc => 155
	i32 124202100, ; 6: DevExpress.Maui.CollectionView.dll => 0x7672c74 => 40
	i32 149972175, ; 7: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 162
	i32 159306688, ; 8: System.ComponentModel.Annotations => 0x97ed3c0 => 107
	i32 165246403, ; 9: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 73
	i32 182336117, ; 10: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 91
	i32 195452805, ; 11: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 12: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 13: System.ComponentModel => 0xc38ff48 => 111
	i32 212673184, ; 14: DevExpress.Maui.Controls => 0xcad22a0 => 43
	i32 220171995, ; 15: System.Diagnostics.Debug => 0xd1f8edb => 114
	i32 231409092, ; 16: System.Linq.Parallel => 0xdcb05c4 => 130
	i32 231814094, ; 17: System.Globalization => 0xdd133ce => 123
	i32 246610117, ; 18: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 144
	i32 280992041, ; 19: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 20: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 21: Xamarin.AndroidX.Activity.dll => 0x13031348 => 69
	i32 331603304, ; 22: SixLabors.Fonts => 0x13c3dd68 => 66
	i32 336156722, ; 23: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 24: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 80
	i32 356389973, ; 25: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 364319144, ; 26: DXCollectionView.a => 0x15b711a8 => 39
	i32 374914964, ; 27: System.Transactions.Local => 0x1658bf94 => 171
	i32 379916513, ; 28: System.Threading.Thread.dll => 0x16a510e1 => 168
	i32 385762202, ; 29: System.Memory.dll => 0x16fe439a => 133
	i32 392610295, ; 30: System.Threading.ThreadPool.dll => 0x1766c1f7 => 169
	i32 395744057, ; 31: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 32: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 33: System.Collections => 0x1a61054f => 106
	i32 450948140, ; 34: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 79
	i32 456227837, ; 35: System.Web.HttpUtility.dll => 0x1b317bfd => 172
	i32 459347974, ; 36: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 159
	i32 469710990, ; 37: System.dll => 0x1bff388e => 177
	i32 498788369, ; 38: System.ObjectModel => 0x1dbae811 => 139
	i32 500358224, ; 39: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 40: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 41: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 59
	i32 530272170, ; 42: System.Linq.Queryable => 0x1f9b4faa => 131
	i32 539058512, ; 43: Microsoft.Extensions.Logging => 0x20216150 => 56
	i32 540030774, ; 44: System.IO.FileSystem.dll => 0x20303736 => 126
	i32 545304856, ; 45: System.Runtime.Extensions => 0x2080b118 => 153
	i32 560453093, ; 46: AppTp => 0x2167d5e5 => 98
	i32 592146354, ; 47: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 48: CommunityToolkit.Maui => 0x239cf51b => 36
	i32 613668793, ; 49: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 161
	i32 627609679, ; 50: Xamarin.AndroidX.CustomView => 0x2568904f => 77
	i32 627931235, ; 51: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 52: System.Collections.Concurrent => 0x2814a96c => 102
	i32 688181140, ; 53: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 54: System.Xml.Linq.dll => 0x29293ff5 => 173
	i32 699345723, ; 55: System.Reflection.Emit => 0x29af2b3b => 145
	i32 706645707, ; 56: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 57: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 58: System.Runtime.Loader.dll => 0x2b15ed29 => 156
	i32 759454413, ; 59: System.Net.Requests => 0x2d445acd => 137
	i32 775507847, ; 60: System.IO.Compression => 0x2e394f87 => 125
	i32 777317022, ; 61: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 62: Microsoft.Extensions.Options => 0x2f0980eb => 58
	i32 804715423, ; 63: System.Data.Common => 0x2ff6fb9f => 113
	i32 809851609, ; 64: System.Drawing.Common.dll => 0x30455ad9 => 67
	i32 823281589, ; 65: System.Private.Uri.dll => 0x311247b5 => 140
	i32 830298997, ; 66: System.IO.Compression.Brotli => 0x317d5b75 => 124
	i32 877678880, ; 67: System.Globalization.dll => 0x34505120 => 123
	i32 904024072, ; 68: System.ComponentModel.Primitives.dll => 0x35e25008 => 109
	i32 911108515, ; 69: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 127
	i32 926902833, ; 70: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 71: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 80
	i32 975236339, ; 72: System.Diagnostics.Tracing => 0x3a20ecf3 => 120
	i32 975874589, ; 73: System.Xml.XDocument => 0x3a2aaa1d => 175
	i32 987214855, ; 74: System.Diagnostics.Tools => 0x3ad7b407 => 118
	i32 992768348, ; 75: System.Collections.dll => 0x3b2c715c => 106
	i32 994442037, ; 76: System.IO.FileSystem => 0x3b45fb35 => 126
	i32 1004437970, ; 77: DevExpress.Maui.DataGrid.dll => 0x3bde81d2 => 47
	i32 1012816738, ; 78: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 90
	i32 1019214401, ; 79: System.Drawing => 0x3cbffa41 => 122
	i32 1028951442, ; 80: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 55
	i32 1029334545, ; 81: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 82: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 70
	i32 1036536393, ; 83: System.Drawing.Primitives.dll => 0x3dc84a49 => 121
	i32 1044663988, ; 84: System.Linq.Expressions.dll => 0x3e444eb4 => 129
	i32 1052210849, ; 85: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 82
	i32 1082857460, ; 86: System.ComponentModel.TypeConverter => 0x408b17f4 => 110
	i32 1083751839, ; 87: System.IO.Packaging => 0x4098bd9f => 68
	i32 1084122840, ; 88: Xamarin.Kotlin.StdLib => 0x409e66d8 => 95
	i32 1098259244, ; 89: System => 0x41761b2c => 177
	i32 1118262833, ; 90: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 91: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 92: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 87
	i32 1203215381, ; 93: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1208641965, ; 94: System.Diagnostics.Process => 0x480a69ad => 116
	i32 1234928153, ; 95: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1253011324, ; 96: Microsoft.Win32.Registry => 0x4aaf6f7c => 100
	i32 1260983243, ; 97: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 98: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 78
	i32 1324164729, ; 99: System.Linq => 0x4eed2679 => 132
	i32 1338318188, ; 100: ExcelNumberFormat.dll => 0x4fc51d6c => 50
	i32 1338781641, ; 101: DocumentFormat.OpenXml.dll => 0x4fcc2fc9 => 49
	i32 1353618654, ; 102: DXEditors.a => 0x50ae94de => 41
	i32 1364015309, ; 103: System.IO => 0x514d38cd => 128
	i32 1373134921, ; 104: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 105: Xamarin.AndroidX.SavedState => 0x52114ed3 => 90
	i32 1379779777, ; 106: System.Resources.ResourceManager => 0x523dc4c1 => 150
	i32 1406073936, ; 107: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 74
	i32 1408764838, ; 108: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 158
	i32 1411638395, ; 109: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 152
	i32 1430672901, ; 110: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1453312822, ; 111: System.Diagnostics.Tools.dll => 0x569fcb36 => 118
	i32 1457743152, ; 112: System.Runtime.Extensions.dll => 0x56e36530 => 153
	i32 1461004990, ; 113: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 114: System.Collections.Immutable.dll => 0x5718a9ef => 103
	i32 1462112819, ; 115: System.IO.Compression.dll => 0x57261233 => 125
	i32 1469204771, ; 116: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 71
	i32 1470490898, ; 117: Microsoft.Extensions.Primitives => 0x57a5e912 => 59
	i32 1479771757, ; 118: System.Collections.Immutable => 0x5833866d => 103
	i32 1480492111, ; 119: System.IO.Compression.Brotli.dll => 0x583e844f => 124
	i32 1487239319, ; 120: Microsoft.Win32.Primitives => 0x58a57897 => 99
	i32 1493001747, ; 121: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 122: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 123: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 166
	i32 1543355203, ; 124: System.Reflection.Emit.dll => 0x5bfdbb43 => 145
	i32 1550322496, ; 125: System.Reflection.Extensions.dll => 0x5c680b40 => 146
	i32 1551623176, ; 126: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1571983310, ; 127: DevExpress.Data.v23.2.dll => 0x5db28fce => 38
	i32 1602284021, ; 128: DevExpress.Maui.Core => 0x5f80e9f5 => 45
	i32 1615388022, ; 129: DevExpress.Maui.Core.dll => 0x6048dd76 => 45
	i32 1622152042, ; 130: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 84
	i32 1624863272, ; 131: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 93
	i32 1634654947, ; 132: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 37
	i32 1636350590, ; 133: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 76
	i32 1639515021, ; 134: System.Net.Http.dll => 0x61b9038d => 134
	i32 1639986890, ; 135: System.Text.RegularExpressions => 0x61c036ca => 166
	i32 1641389582, ; 136: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 108
	i32 1654786569, ; 137: DevExpress.Maui.DataGrid => 0x62a20a09 => 47
	i32 1657153582, ; 138: System.Runtime => 0x62c6282e => 160
	i32 1658251792, ; 139: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 94
	i32 1677501392, ; 140: System.Net.Primitives.dll => 0x63fca3d0 => 136
	i32 1679769178, ; 141: System.Security.Cryptography => 0x641f3e5a => 163
	i32 1701541528, ; 142: System.Diagnostics.Debug.dll => 0x656b7698 => 114
	i32 1726116996, ; 143: System.Reflection.dll => 0x66e27484 => 149
	i32 1729485958, ; 144: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 72
	i32 1736233607, ; 145: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 146: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1744735666, ; 147: System.Transactions.Local.dll => 0x67fe8db2 => 171
	i32 1750313021, ; 148: Microsoft.Win32.Primitives.dll => 0x6853a83d => 99
	i32 1763938596, ; 149: System.Diagnostics.TraceSource.dll => 0x69239124 => 119
	i32 1765942094, ; 150: System.Reflection.Extensions => 0x6942234e => 146
	i32 1766324549, ; 151: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 91
	i32 1770582343, ; 152: Microsoft.Extensions.Logging.dll => 0x6988f147 => 56
	i32 1780572499, ; 153: Mono.Android.Runtime.dll => 0x6a216153 => 181
	i32 1782862114, ; 154: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 155: Xamarin.AndroidX.Fragment => 0x6a96652d => 79
	i32 1793755602, ; 156: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 157: Xamarin.AndroidX.Loader => 0x6bcd3296 => 84
	i32 1813058853, ; 158: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 95
	i32 1813201214, ; 159: Xamarin.Google.Android.Material => 0x6c13413e => 94
	i32 1818569960, ; 160: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 88
	i32 1824175904, ; 161: System.Text.Encoding.Extensions => 0x6cbab720 => 165
	i32 1824722060, ; 162: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 158
	i32 1828688058, ; 163: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 57
	i32 1842015223, ; 164: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 165: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1856505197, ; 166: Irony => 0x6ea8056d => 51
	i32 1858542181, ; 167: System.Linq.Expressions => 0x6ec71a65 => 129
	i32 1870277092, ; 168: System.Reflection.Primitives => 0x6f7a29e4 => 147
	i32 1875935024, ; 169: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1900610850, ; 170: System.Resources.ResourceManager.dll => 0x71490522 => 150
	i32 1910275211, ; 171: System.Collections.NonGeneric.dll => 0x71dc7c8b => 104
	i32 1939592360, ; 172: System.Private.Xml.Linq => 0x739bd4a8 => 141
	i32 1956758971, ; 173: System.Resources.Writer => 0x74a1c5bb => 151
	i32 1968388702, ; 174: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 52
	i32 2003115576, ; 175: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 176: System.Buffers.dll => 0x77ec19b4 => 101
	i32 2019465201, ; 177: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 82
	i32 2025202353, ; 178: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 179: System.Private.Xml => 0x79eb68ee => 142
	i32 2055257422, ; 180: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 81
	i32 2066184531, ; 181: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 182: System.Diagnostics.TraceSource => 0x7b6f419e => 119
	i32 2079903147, ; 183: System.Runtime.dll => 0x7bf8cdab => 160
	i32 2090596640, ; 184: System.Numerics.Vectors => 0x7c9bf920 => 138
	i32 2127167465, ; 185: System.Console => 0x7ec9ffe9 => 112
	i32 2142473426, ; 186: System.Collections.Specialized => 0x7fb38cd2 => 105
	i32 2143790110, ; 187: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 176
	i32 2159891885, ; 188: Microsoft.Maui => 0x80bd55ad => 63
	i32 2166698602, ; 189: ClosedXML => 0x8125326a => 35
	i32 2169148018, ; 190: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 191: Microsoft.Extensions.Options.dll => 0x820d22b3 => 58
	i32 2192057212, ; 192: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 57
	i32 2193016926, ; 193: System.ObjectModel.dll => 0x82b6c85e => 139
	i32 2201107256, ; 194: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 96
	i32 2201231467, ; 195: System.Net.Http => 0x8334206b => 134
	i32 2207618523, ; 196: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2209434506, ; 197: DXNavigation.a => 0x83b14b8a => 42
	i32 2222056684, ; 198: System.Threading.Tasks.Parallel => 0x8471e4ec => 167
	i32 2237934468, ; 199: DevExpress.Maui.Editors.dll => 0x85642b84 => 48
	i32 2266799131, ; 200: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 53
	i32 2270573516, ; 201: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 202: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 89
	i32 2298471582, ; 203: System.Net.Mail => 0x88ffe49e => 135
	i32 2303942373, ; 204: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 205: System.Private.CoreLib.dll => 0x896b7878 => 179
	i32 2320631194, ; 206: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 167
	i32 2340441535, ; 207: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 154
	i32 2353062107, ; 208: System.Net.Primitives => 0x8c40e0db => 136
	i32 2368005991, ; 209: System.Xml.ReaderWriter.dll => 0x8d24e767 => 174
	i32 2371007202, ; 210: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 52
	i32 2395872292, ; 211: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 212: System.Web.HttpUtility => 0x8f24faee => 172
	i32 2427813419, ; 213: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 214: System.Console.dll => 0x912896e5 => 112
	i32 2459001652, ; 215: System.Linq.Parallel.dll => 0x92916334 => 130
	i32 2471841756, ; 216: netstandard.dll => 0x93554fdc => 178
	i32 2475788418, ; 217: Java.Interop.dll => 0x93918882 => 180
	i32 2480646305, ; 218: Microsoft.Maui.Controls => 0x93dba8a1 => 61
	i32 2483903535, ; 219: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 108
	i32 2538310050, ; 220: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 144
	i32 2538318350, ; 221: Irony.dll => 0x974baa0e => 51
	i32 2550873716, ; 222: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2585220780, ; 223: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 165
	i32 2589602615, ; 224: System.Threading.ThreadPool => 0x9a5a3337 => 169
	i32 2593496499, ; 225: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 226: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 96
	i32 2617129537, ; 227: System.Private.Xml.dll => 0x9bfe3a41 => 142
	i32 2618712057, ; 228: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 148
	i32 2620871830, ; 229: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 76
	i32 2626831493, ; 230: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 231: System.Runtime.Loader => 0x9ec4cf01 => 156
	i32 2664396074, ; 232: System.Xml.XDocument.dll => 0x9ecf752a => 175
	i32 2665622720, ; 233: System.Drawing.Primitives => 0x9ee22cc0 => 121
	i32 2676780864, ; 234: System.Data.Common.dll => 0x9f8c6f40 => 113
	i32 2693849962, ; 235: System.IO.dll => 0xa090e36a => 128
	i32 2715632697, ; 236: DXCore.a.dll => 0xa1dd4439 => 44
	i32 2724373263, ; 237: System.Runtime.Numerics.dll => 0xa262a30f => 157
	i32 2732626843, ; 238: Xamarin.AndroidX.Activity => 0xa2e0939b => 69
	i32 2737747696, ; 239: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 71
	i32 2752995522, ; 240: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 241: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 62
	i32 2764765095, ; 242: Microsoft.Maui.dll => 0xa4caf7a7 => 63
	i32 2765824710, ; 243: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 164
	i32 2778768386, ; 244: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 92
	i32 2785988530, ; 245: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 246: Microsoft.Maui.Graphics => 0xa7008e0b => 65
	i32 2806116107, ; 247: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2809327187, ; 248: AppTp.dll => 0xa772ee53 => 98
	i32 2810250172, ; 249: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 74
	i32 2831556043, ; 250: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 251: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 92
	i32 2861189240, ; 252: Microsoft.Maui.Essentials => 0xaa8a4878 => 64
	i32 2868488919, ; 253: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 37
	i32 2877542466, ; 254: ClosedXML.dll => 0xab83d042 => 35
	i32 2901442782, ; 255: System.Reflection => 0xacf080de => 149
	i32 2904610611, ; 256: XLParser => 0xad20d733 => 97
	i32 2909740682, ; 257: System.Private.CoreLib => 0xad6f1e8a => 179
	i32 2916838712, ; 258: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 93
	i32 2919462931, ; 259: System.Numerics.Vectors.dll => 0xae037813 => 138
	i32 2921159260, ; 260: DXCore.a => 0xae1d5a5c => 44
	i32 2940926066, ; 261: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 117
	i32 2956781122, ; 262: DXEditors.a.dll => 0xb03ce642 => 41
	i32 2959614098, ; 263: System.ComponentModel.dll => 0xb0682092 => 111
	i32 2972252294, ; 264: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 161
	i32 2978675010, ; 265: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 78
	i32 3038032645, ; 266: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 267: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 85
	i32 3059408633, ; 268: Mono.Android.Runtime => 0xb65adef9 => 181
	i32 3059793426, ; 269: System.ComponentModel.Primitives => 0xb660be12 => 109
	i32 3077302341, ; 270: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3118851116, ; 271: ExcelNumberFormat => 0xb9e5e42c => 50
	i32 3147165239, ; 272: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 120
	i32 3159123045, ; 273: System.Reflection.Primitives.dll => 0xbc4c6465 => 147
	i32 3160747431, ; 274: System.IO.MemoryMappedFiles => 0xbc652da7 => 127
	i32 3178803400, ; 275: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 86
	i32 3178908327, ; 276: SixLabors.Fonts.dll => 0xbd7a4aa7 => 66
	i32 3220365878, ; 277: System.Threading => 0xbff2e236 => 170
	i32 3258312781, ; 278: Xamarin.AndroidX.CardView => 0xc235e84d => 72
	i32 3265493905, ; 279: System.Linq.Queryable.dll => 0xc2a37b91 => 131
	i32 3277815716, ; 280: System.Resources.Writer.dll => 0xc35f7fa4 => 151
	i32 3279906254, ; 281: Microsoft.Win32.Registry.dll => 0xc37f65ce => 100
	i32 3280506390, ; 282: System.ComponentModel.Annotations.dll => 0xc3888e16 => 107
	i32 3305363605, ; 283: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3309582591, ; 284: DXGrid.a.dll => 0xc54438ff => 46
	i32 3316684772, ; 285: System.Net.Requests.dll => 0xc5b097e4 => 137
	i32 3317135071, ; 286: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 77
	i32 3346324047, ; 287: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 87
	i32 3357674450, ; 288: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 289: Xamarin.AndroidX.Core => 0xc86c06e3 => 75
	i32 3366347497, ; 290: Java.Interop => 0xc8a662e9 => 180
	i32 3374999561, ; 291: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 89
	i32 3381016424, ; 292: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3395150330, ; 293: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 152
	i32 3428513518, ; 294: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 54
	i32 3430777524, ; 295: netstandard => 0xcc7d82b4 => 178
	i32 3452344032, ; 296: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 60
	i32 3463511458, ; 297: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 298: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 110
	i32 3476120550, ; 299: Mono.Android => 0xcf3163e6 => 182
	i32 3479583265, ; 300: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 301: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3503731303, ; 302: DXGrid.a => 0xd0d6b267 => 46
	i32 3509114376, ; 303: System.Xml.Linq => 0xd128d608 => 173
	i32 3573573763, ; 304: DevExpress.Maui.CollectionView => 0xd5006883 => 40
	i32 3580758918, ; 305: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 306: System.Linq.dll => 0xd715a361 => 132
	i32 3624195450, ; 307: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 154
	i32 3641597786, ; 308: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 81
	i32 3643446276, ; 309: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 310: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 86
	i32 3657292374, ; 311: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 53
	i32 3672681054, ; 312: Mono.Android.dll => 0xdae8aa5e => 182
	i32 3689084180, ; 313: DXCollectionView.a.dll => 0xdbe2f514 => 39
	i32 3689375977, ; 314: System.Drawing.Common => 0xdbe768e9 => 67
	i32 3697841164, ; 315: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 316: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 85
	i32 3748608112, ; 317: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 115
	i32 3753988493, ; 318: DevExpress.Maui.Controls.dll => 0xdfc1518d => 43
	i32 3777270291, ; 319: DevExpress.Maui.Editors => 0xe1249213 => 48
	i32 3786282454, ; 320: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 73
	i32 3792276235, ; 321: System.Collections.NonGeneric => 0xe2098b0b => 104
	i32 3800979733, ; 322: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 60
	i32 3802395368, ; 323: System.Collections.Specialized.dll => 0xe2a3f2e8 => 105
	i32 3817368567, ; 324: CommunityToolkit.Maui.dll => 0xe3886bf7 => 36
	i32 3822443793, ; 325: DocumentFormat.OpenXml => 0xe3d5dd11 => 49
	i32 3823082795, ; 326: System.Security.Cryptography.dll => 0xe3df9d2b => 163
	i32 3841636137, ; 327: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 55
	i32 3844307129, ; 328: System.Net.Mail.dll => 0xe52378b9 => 135
	i32 3849253459, ; 329: System.Runtime.InteropServices.dll => 0xe56ef253 => 155
	i32 3889960447, ; 330: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3893086827, ; 331: DXNavigation.a.dll => 0xe80bca6b => 42
	i32 3896106733, ; 332: System.Collections.Concurrent.dll => 0xe839deed => 102
	i32 3896760992, ; 333: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 75
	i32 3904638161, ; 334: XLParser.dll => 0xe8bc0cd1 => 97
	i32 3928044579, ; 335: System.Xml.ReaderWriter => 0xea213423 => 174
	i32 3931092270, ; 336: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 88
	i32 3952357212, ; 337: System.IO.Packaging.dll => 0xeb942f5c => 68
	i32 3953953790, ; 338: System.Text.Encoding.CodePages => 0xebac8bfe => 164
	i32 3955647286, ; 339: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 70
	i32 3958304432, ; 340: DevExpress.Data.v23.2 => 0xebeeeeb0 => 38
	i32 3980434154, ; 341: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 342: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4003436829, ; 343: System.Diagnostics.Process.dll => 0xee9f991d => 116
	i32 4025784931, ; 344: System.Memory => 0xeff49a63 => 133
	i32 4046471985, ; 345: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 62
	i32 4054681211, ; 346: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 143
	i32 4068434129, ; 347: System.Private.Xml.Linq.dll => 0xf27f60d1 => 141
	i32 4073602200, ; 348: System.Threading.dll => 0xf2ce3c98 => 170
	i32 4094352644, ; 349: Microsoft.Maui.Essentials.dll => 0xf40add04 => 64
	i32 4099507663, ; 350: System.Drawing.dll => 0xf45985cf => 122
	i32 4100113165, ; 351: System.Private.Uri => 0xf462c30d => 140
	i32 4102112229, ; 352: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 353: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 354: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 54
	i32 4147896353, ; 355: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 143
	i32 4150914736, ; 356: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4159265925, ; 357: System.Xml.XmlSerializer => 0xf7e95c85 => 176
	i32 4161255271, ; 358: System.Reflection.TypeExtensions => 0xf807b767 => 148
	i32 4181436372, ; 359: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 159
	i32 4182413190, ; 360: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 83
	i32 4213026141, ; 361: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 115
	i32 4260525087, ; 362: System.Buffers => 0xfdf2741f => 101
	i32 4271975918, ; 363: Microsoft.Maui.Controls.dll => 0xfea12dee => 61
	i32 4274976490, ; 364: System.Runtime.Numerics => 0xfecef6ea => 157
	i32 4292120959 ; 365: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 83
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [366 x i32] [
	i32 168, ; 0
	i32 117, ; 1
	i32 33, ; 2
	i32 162, ; 3
	i32 65, ; 4
	i32 155, ; 5
	i32 40, ; 6
	i32 162, ; 7
	i32 107, ; 8
	i32 73, ; 9
	i32 91, ; 10
	i32 30, ; 11
	i32 31, ; 12
	i32 111, ; 13
	i32 43, ; 14
	i32 114, ; 15
	i32 130, ; 16
	i32 123, ; 17
	i32 144, ; 18
	i32 2, ; 19
	i32 30, ; 20
	i32 69, ; 21
	i32 66, ; 22
	i32 15, ; 23
	i32 80, ; 24
	i32 14, ; 25
	i32 39, ; 26
	i32 171, ; 27
	i32 168, ; 28
	i32 133, ; 29
	i32 169, ; 30
	i32 34, ; 31
	i32 26, ; 32
	i32 106, ; 33
	i32 79, ; 34
	i32 172, ; 35
	i32 159, ; 36
	i32 177, ; 37
	i32 139, ; 38
	i32 13, ; 39
	i32 7, ; 40
	i32 59, ; 41
	i32 131, ; 42
	i32 56, ; 43
	i32 126, ; 44
	i32 153, ; 45
	i32 98, ; 46
	i32 21, ; 47
	i32 36, ; 48
	i32 161, ; 49
	i32 77, ; 50
	i32 19, ; 51
	i32 102, ; 52
	i32 1, ; 53
	i32 173, ; 54
	i32 145, ; 55
	i32 16, ; 56
	i32 4, ; 57
	i32 156, ; 58
	i32 137, ; 59
	i32 125, ; 60
	i32 25, ; 61
	i32 58, ; 62
	i32 113, ; 63
	i32 67, ; 64
	i32 140, ; 65
	i32 124, ; 66
	i32 123, ; 67
	i32 109, ; 68
	i32 127, ; 69
	i32 28, ; 70
	i32 80, ; 71
	i32 120, ; 72
	i32 175, ; 73
	i32 118, ; 74
	i32 106, ; 75
	i32 126, ; 76
	i32 47, ; 77
	i32 90, ; 78
	i32 122, ; 79
	i32 55, ; 80
	i32 3, ; 81
	i32 70, ; 82
	i32 121, ; 83
	i32 129, ; 84
	i32 82, ; 85
	i32 110, ; 86
	i32 68, ; 87
	i32 95, ; 88
	i32 177, ; 89
	i32 16, ; 90
	i32 22, ; 91
	i32 87, ; 92
	i32 20, ; 93
	i32 116, ; 94
	i32 18, ; 95
	i32 100, ; 96
	i32 2, ; 97
	i32 78, ; 98
	i32 132, ; 99
	i32 50, ; 100
	i32 49, ; 101
	i32 41, ; 102
	i32 128, ; 103
	i32 32, ; 104
	i32 90, ; 105
	i32 150, ; 106
	i32 74, ; 107
	i32 158, ; 108
	i32 152, ; 109
	i32 0, ; 110
	i32 118, ; 111
	i32 153, ; 112
	i32 6, ; 113
	i32 103, ; 114
	i32 125, ; 115
	i32 71, ; 116
	i32 59, ; 117
	i32 103, ; 118
	i32 124, ; 119
	i32 99, ; 120
	i32 10, ; 121
	i32 5, ; 122
	i32 166, ; 123
	i32 145, ; 124
	i32 146, ; 125
	i32 25, ; 126
	i32 38, ; 127
	i32 45, ; 128
	i32 45, ; 129
	i32 84, ; 130
	i32 93, ; 131
	i32 37, ; 132
	i32 76, ; 133
	i32 134, ; 134
	i32 166, ; 135
	i32 108, ; 136
	i32 47, ; 137
	i32 160, ; 138
	i32 94, ; 139
	i32 136, ; 140
	i32 163, ; 141
	i32 114, ; 142
	i32 149, ; 143
	i32 72, ; 144
	i32 23, ; 145
	i32 1, ; 146
	i32 171, ; 147
	i32 99, ; 148
	i32 119, ; 149
	i32 146, ; 150
	i32 91, ; 151
	i32 56, ; 152
	i32 181, ; 153
	i32 17, ; 154
	i32 79, ; 155
	i32 9, ; 156
	i32 84, ; 157
	i32 95, ; 158
	i32 94, ; 159
	i32 88, ; 160
	i32 165, ; 161
	i32 158, ; 162
	i32 57, ; 163
	i32 29, ; 164
	i32 26, ; 165
	i32 51, ; 166
	i32 129, ; 167
	i32 147, ; 168
	i32 8, ; 169
	i32 150, ; 170
	i32 104, ; 171
	i32 141, ; 172
	i32 151, ; 173
	i32 52, ; 174
	i32 5, ; 175
	i32 101, ; 176
	i32 82, ; 177
	i32 0, ; 178
	i32 142, ; 179
	i32 81, ; 180
	i32 4, ; 181
	i32 119, ; 182
	i32 160, ; 183
	i32 138, ; 184
	i32 112, ; 185
	i32 105, ; 186
	i32 176, ; 187
	i32 63, ; 188
	i32 35, ; 189
	i32 12, ; 190
	i32 58, ; 191
	i32 57, ; 192
	i32 139, ; 193
	i32 96, ; 194
	i32 134, ; 195
	i32 14, ; 196
	i32 42, ; 197
	i32 167, ; 198
	i32 48, ; 199
	i32 53, ; 200
	i32 8, ; 201
	i32 89, ; 202
	i32 135, ; 203
	i32 18, ; 204
	i32 179, ; 205
	i32 167, ; 206
	i32 154, ; 207
	i32 136, ; 208
	i32 174, ; 209
	i32 52, ; 210
	i32 13, ; 211
	i32 172, ; 212
	i32 10, ; 213
	i32 112, ; 214
	i32 130, ; 215
	i32 178, ; 216
	i32 180, ; 217
	i32 61, ; 218
	i32 108, ; 219
	i32 144, ; 220
	i32 51, ; 221
	i32 11, ; 222
	i32 165, ; 223
	i32 169, ; 224
	i32 20, ; 225
	i32 96, ; 226
	i32 142, ; 227
	i32 148, ; 228
	i32 76, ; 229
	i32 15, ; 230
	i32 156, ; 231
	i32 175, ; 232
	i32 121, ; 233
	i32 113, ; 234
	i32 128, ; 235
	i32 44, ; 236
	i32 157, ; 237
	i32 69, ; 238
	i32 71, ; 239
	i32 21, ; 240
	i32 62, ; 241
	i32 63, ; 242
	i32 164, ; 243
	i32 92, ; 244
	i32 27, ; 245
	i32 65, ; 246
	i32 6, ; 247
	i32 98, ; 248
	i32 74, ; 249
	i32 19, ; 250
	i32 92, ; 251
	i32 64, ; 252
	i32 37, ; 253
	i32 35, ; 254
	i32 149, ; 255
	i32 97, ; 256
	i32 179, ; 257
	i32 93, ; 258
	i32 138, ; 259
	i32 44, ; 260
	i32 117, ; 261
	i32 41, ; 262
	i32 111, ; 263
	i32 161, ; 264
	i32 78, ; 265
	i32 34, ; 266
	i32 85, ; 267
	i32 181, ; 268
	i32 109, ; 269
	i32 12, ; 270
	i32 50, ; 271
	i32 120, ; 272
	i32 147, ; 273
	i32 127, ; 274
	i32 86, ; 275
	i32 66, ; 276
	i32 170, ; 277
	i32 72, ; 278
	i32 131, ; 279
	i32 151, ; 280
	i32 100, ; 281
	i32 107, ; 282
	i32 7, ; 283
	i32 46, ; 284
	i32 137, ; 285
	i32 77, ; 286
	i32 87, ; 287
	i32 24, ; 288
	i32 75, ; 289
	i32 180, ; 290
	i32 89, ; 291
	i32 3, ; 292
	i32 152, ; 293
	i32 54, ; 294
	i32 178, ; 295
	i32 60, ; 296
	i32 11, ; 297
	i32 110, ; 298
	i32 182, ; 299
	i32 24, ; 300
	i32 23, ; 301
	i32 46, ; 302
	i32 173, ; 303
	i32 40, ; 304
	i32 31, ; 305
	i32 132, ; 306
	i32 154, ; 307
	i32 81, ; 308
	i32 28, ; 309
	i32 86, ; 310
	i32 53, ; 311
	i32 182, ; 312
	i32 39, ; 313
	i32 67, ; 314
	i32 33, ; 315
	i32 85, ; 316
	i32 115, ; 317
	i32 43, ; 318
	i32 48, ; 319
	i32 73, ; 320
	i32 104, ; 321
	i32 60, ; 322
	i32 105, ; 323
	i32 36, ; 324
	i32 49, ; 325
	i32 163, ; 326
	i32 55, ; 327
	i32 135, ; 328
	i32 155, ; 329
	i32 32, ; 330
	i32 42, ; 331
	i32 102, ; 332
	i32 75, ; 333
	i32 97, ; 334
	i32 174, ; 335
	i32 88, ; 336
	i32 68, ; 337
	i32 164, ; 338
	i32 70, ; 339
	i32 38, ; 340
	i32 27, ; 341
	i32 9, ; 342
	i32 116, ; 343
	i32 133, ; 344
	i32 62, ; 345
	i32 143, ; 346
	i32 141, ; 347
	i32 170, ; 348
	i32 64, ; 349
	i32 122, ; 350
	i32 140, ; 351
	i32 22, ; 352
	i32 17, ; 353
	i32 54, ; 354
	i32 143, ; 355
	i32 29, ; 356
	i32 176, ; 357
	i32 148, ; 358
	i32 159, ; 359
	i32 83, ; 360
	i32 115, ; 361
	i32 101, ; 362
	i32 61, ; 363
	i32 157, ; 364
	i32 83 ; 365
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
