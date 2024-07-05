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
	i32 38948123, ; 0: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 1: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 2: System.Threading.Thread => 0x28aa24d => 168
	i32 66541672, ; 3: System.Diagnostics.StackTrace => 0x3f75868 => 117
	i32 67008169, ; 4: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 68219467, ; 5: System.Security.Cryptography.Primitives => 0x410f24b => 162
	i32 72070932, ; 6: Microsoft.Maui.Graphics.dll => 0x44bb714 => 65
	i32 83839681, ; 7: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 8: System.Runtime.InteropServices => 0x6ffddbc => 155
	i32 124202100, ; 9: DevExpress.Maui.CollectionView.dll => 0x7672c74 => 40
	i32 136584136, ; 10: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 11: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 149972175, ; 12: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 162
	i32 159306688, ; 13: System.ComponentModel.Annotations => 0x97ed3c0 => 107
	i32 165246403, ; 14: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 73
	i32 182336117, ; 15: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 91
	i32 205061960, ; 16: System.ComponentModel => 0xc38ff48 => 111
	i32 212673184, ; 17: DevExpress.Maui.Controls => 0xcad22a0 => 43
	i32 220171995, ; 18: System.Diagnostics.Debug => 0xd1f8edb => 114
	i32 231409092, ; 19: System.Linq.Parallel => 0xdcb05c4 => 130
	i32 231814094, ; 20: System.Globalization => 0xdd133ce => 123
	i32 246610117, ; 21: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 144
	i32 317674968, ; 22: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 23: Xamarin.AndroidX.Activity.dll => 0x13031348 => 69
	i32 321963286, ; 24: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 331603304, ; 25: SixLabors.Fonts => 0x13c3dd68 => 66
	i32 342366114, ; 26: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 80
	i32 364319144, ; 27: DXCollectionView.a => 0x15b711a8 => 39
	i32 374914964, ; 28: System.Transactions.Local => 0x1658bf94 => 171
	i32 379916513, ; 29: System.Threading.Thread.dll => 0x16a510e1 => 168
	i32 385762202, ; 30: System.Memory.dll => 0x16fe439a => 133
	i32 392610295, ; 31: System.Threading.ThreadPool.dll => 0x1766c1f7 => 169
	i32 395744057, ; 32: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 33: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 34: System.Collections => 0x1a61054f => 106
	i32 450948140, ; 35: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 79
	i32 456227837, ; 36: System.Web.HttpUtility.dll => 0x1b317bfd => 172
	i32 459347974, ; 37: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 159
	i32 469710990, ; 38: System.dll => 0x1bff388e => 177
	i32 489220957, ; 39: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 40: System.ObjectModel => 0x1dbae811 => 139
	i32 513247710, ; 41: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 59
	i32 530272170, ; 42: System.Linq.Queryable => 0x1f9b4faa => 131
	i32 538707440, ; 43: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 44: Microsoft.Extensions.Logging => 0x20216150 => 56
	i32 540030774, ; 45: System.IO.FileSystem.dll => 0x20303736 => 126
	i32 545304856, ; 46: System.Runtime.Extensions => 0x2080b118 => 153
	i32 560453093, ; 47: AppTp => 0x2167d5e5 => 98
	i32 597488923, ; 48: CommunityToolkit.Maui => 0x239cf51b => 36
	i32 613668793, ; 49: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 161
	i32 627609679, ; 50: Xamarin.AndroidX.CustomView => 0x2568904f => 77
	i32 627931235, ; 51: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 52: System.Collections.Concurrent => 0x2814a96c => 102
	i32 690569205, ; 53: System.Xml.Linq.dll => 0x29293ff5 => 173
	i32 699345723, ; 54: System.Reflection.Emit => 0x29af2b3b => 145
	i32 722857257, ; 55: System.Runtime.Loader.dll => 0x2b15ed29 => 156
	i32 759454413, ; 56: System.Net.Requests => 0x2d445acd => 137
	i32 775507847, ; 57: System.IO.Compression => 0x2e394f87 => 125
	i32 777317022, ; 58: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 59: Microsoft.Extensions.Options => 0x2f0980eb => 58
	i32 804715423, ; 60: System.Data.Common => 0x2ff6fb9f => 113
	i32 809851609, ; 61: System.Drawing.Common.dll => 0x30455ad9 => 67
	i32 823281589, ; 62: System.Private.Uri.dll => 0x311247b5 => 140
	i32 830298997, ; 63: System.IO.Compression.Brotli => 0x317d5b75 => 124
	i32 869139383, ; 64: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 877678880, ; 65: System.Globalization.dll => 0x34505120 => 123
	i32 880668424, ; 66: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 67: System.ComponentModel.Primitives.dll => 0x35e25008 => 109
	i32 911108515, ; 68: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 127
	i32 918734561, ; 69: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 70: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 71: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 80
	i32 975236339, ; 72: System.Diagnostics.Tracing => 0x3a20ecf3 => 120
	i32 975874589, ; 73: System.Xml.XDocument => 0x3a2aaa1d => 175
	i32 987214855, ; 74: System.Diagnostics.Tools => 0x3ad7b407 => 118
	i32 990727110, ; 75: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 76: System.Collections.dll => 0x3b2c715c => 106
	i32 994442037, ; 77: System.IO.FileSystem => 0x3b45fb35 => 126
	i32 1004437970, ; 78: DevExpress.Maui.DataGrid.dll => 0x3bde81d2 => 47
	i32 1012816738, ; 79: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 90
	i32 1019214401, ; 80: System.Drawing => 0x3cbffa41 => 122
	i32 1028951442, ; 81: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 55
	i32 1035644815, ; 82: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 70
	i32 1036536393, ; 83: System.Drawing.Primitives.dll => 0x3dc84a49 => 121
	i32 1043950537, ; 84: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 85: System.Linq.Expressions.dll => 0x3e444eb4 => 129
	i32 1052210849, ; 86: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 82
	i32 1082857460, ; 87: System.ComponentModel.TypeConverter => 0x408b17f4 => 110
	i32 1083751839, ; 88: System.IO.Packaging => 0x4098bd9f => 68
	i32 1084122840, ; 89: Xamarin.Kotlin.StdLib => 0x409e66d8 => 95
	i32 1098259244, ; 90: System => 0x41761b2c => 177
	i32 1108272742, ; 91: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 92: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 93: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 94: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 95: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 87
	i32 1208641965, ; 96: System.Diagnostics.Process => 0x480a69ad => 116
	i32 1253011324, ; 97: Microsoft.Win32.Registry => 0x4aaf6f7c => 100
	i32 1260983243, ; 98: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 99: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 78
	i32 1308624726, ; 100: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 101: System.Linq => 0x4eed2679 => 132
	i32 1336711579, ; 102: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1338318188, ; 103: ExcelNumberFormat.dll => 0x4fc51d6c => 50
	i32 1338781641, ; 104: DocumentFormat.OpenXml.dll => 0x4fcc2fc9 => 49
	i32 1353618654, ; 105: DXEditors.a => 0x50ae94de => 41
	i32 1364015309, ; 106: System.IO => 0x514d38cd => 128
	i32 1373134921, ; 107: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 108: Xamarin.AndroidX.SavedState => 0x52114ed3 => 90
	i32 1379779777, ; 109: System.Resources.ResourceManager => 0x523dc4c1 => 150
	i32 1406073936, ; 110: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 74
	i32 1408764838, ; 111: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 158
	i32 1411638395, ; 112: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 152
	i32 1430672901, ; 113: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1453312822, ; 114: System.Diagnostics.Tools.dll => 0x569fcb36 => 118
	i32 1457743152, ; 115: System.Runtime.Extensions.dll => 0x56e36530 => 153
	i32 1461004990, ; 116: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 117: System.Collections.Immutable.dll => 0x5718a9ef => 103
	i32 1462112819, ; 118: System.IO.Compression.dll => 0x57261233 => 125
	i32 1469204771, ; 119: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 71
	i32 1470490898, ; 120: Microsoft.Extensions.Primitives => 0x57a5e912 => 59
	i32 1479771757, ; 121: System.Collections.Immutable => 0x5833866d => 103
	i32 1480492111, ; 122: System.IO.Compression.Brotli.dll => 0x583e844f => 124
	i32 1487239319, ; 123: Microsoft.Win32.Primitives => 0x58a57897 => 99
	i32 1526286932, ; 124: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 125: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 166
	i32 1543355203, ; 126: System.Reflection.Emit.dll => 0x5bfdbb43 => 145
	i32 1550322496, ; 127: System.Reflection.Extensions.dll => 0x5c680b40 => 146
	i32 1571983310, ; 128: DevExpress.Data.v23.2.dll => 0x5db28fce => 38
	i32 1602284021, ; 129: DevExpress.Maui.Core => 0x5f80e9f5 => 45
	i32 1615388022, ; 130: DevExpress.Maui.Core.dll => 0x6048dd76 => 45
	i32 1622152042, ; 131: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 84
	i32 1624863272, ; 132: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 93
	i32 1634654947, ; 133: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 37
	i32 1636350590, ; 134: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 76
	i32 1639515021, ; 135: System.Net.Http.dll => 0x61b9038d => 134
	i32 1639986890, ; 136: System.Text.RegularExpressions => 0x61c036ca => 166
	i32 1641389582, ; 137: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 108
	i32 1654786569, ; 138: DevExpress.Maui.DataGrid => 0x62a20a09 => 47
	i32 1657153582, ; 139: System.Runtime => 0x62c6282e => 160
	i32 1658251792, ; 140: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 94
	i32 1677501392, ; 141: System.Net.Primitives.dll => 0x63fca3d0 => 136
	i32 1679769178, ; 142: System.Security.Cryptography => 0x641f3e5a => 163
	i32 1701541528, ; 143: System.Diagnostics.Debug.dll => 0x656b7698 => 114
	i32 1726116996, ; 144: System.Reflection.dll => 0x66e27484 => 149
	i32 1729485958, ; 145: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 72
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
	i32 1853025655, ; 164: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1856505197, ; 165: Irony => 0x6ea8056d => 51
	i32 1858542181, ; 166: System.Linq.Expressions => 0x6ec71a65 => 129
	i32 1870277092, ; 167: System.Reflection.Primitives => 0x6f7a29e4 => 147
	i32 1875935024, ; 168: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 169: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1900610850, ; 170: System.Resources.ResourceManager.dll => 0x71490522 => 150
	i32 1910275211, ; 171: System.Collections.NonGeneric.dll => 0x71dc7c8b => 104
	i32 1939592360, ; 172: System.Private.Xml.Linq => 0x739bd4a8 => 141
	i32 1953182387, ; 173: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1956758971, ; 174: System.Resources.Writer => 0x74a1c5bb => 151
	i32 1968388702, ; 175: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 52
	i32 2003115576, ; 176: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2011961780, ; 177: System.Buffers.dll => 0x77ec19b4 => 101
	i32 2019465201, ; 178: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 82
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
	i32 2279755925, ; 201: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 89
	i32 2298471582, ; 202: System.Net.Mail => 0x88ffe49e => 135
	i32 2303942373, ; 203: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 204: System.Private.CoreLib.dll => 0x896b7878 => 179
	i32 2320631194, ; 205: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 167
	i32 2340441535, ; 206: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 154
	i32 2353062107, ; 207: System.Net.Primitives => 0x8c40e0db => 136
	i32 2366048013, ; 208: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
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
	i32 2503351294, ; 220: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2538310050, ; 221: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 144
	i32 2538318350, ; 222: Irony.dll => 0x974baa0e => 51
	i32 2550873716, ; 223: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2576534780, ; 224: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2585220780, ; 225: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 165
	i32 2589602615, ; 226: System.Threading.ThreadPool => 0x9a5a3337 => 169
	i32 2593496499, ; 227: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 228: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 96
	i32 2617129537, ; 229: System.Private.Xml.dll => 0x9bfe3a41 => 142
	i32 2618712057, ; 230: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 148
	i32 2620871830, ; 231: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 76
	i32 2626831493, ; 232: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 233: System.Runtime.Loader => 0x9ec4cf01 => 156
	i32 2664396074, ; 234: System.Xml.XDocument.dll => 0x9ecf752a => 175
	i32 2665622720, ; 235: System.Drawing.Primitives => 0x9ee22cc0 => 121
	i32 2676780864, ; 236: System.Data.Common.dll => 0x9f8c6f40 => 113
	i32 2693849962, ; 237: System.IO.dll => 0xa090e36a => 128
	i32 2715632697, ; 238: DXCore.a.dll => 0xa1dd4439 => 44
	i32 2724373263, ; 239: System.Runtime.Numerics.dll => 0xa262a30f => 157
	i32 2732626843, ; 240: Xamarin.AndroidX.Activity => 0xa2e0939b => 69
	i32 2737747696, ; 241: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 71
	i32 2740698338, ; 242: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 243: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 244: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 62
	i32 2764765095, ; 245: Microsoft.Maui.dll => 0xa4caf7a7 => 63
	i32 2765824710, ; 246: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 164
	i32 2778768386, ; 247: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 92
	i32 2785988530, ; 248: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 249: Microsoft.Maui.Graphics => 0xa7008e0b => 65
	i32 2809327187, ; 250: AppTp.dll => 0xa772ee53 => 98
	i32 2810250172, ; 251: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 74
	i32 2853208004, ; 252: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 92
	i32 2861189240, ; 253: Microsoft.Maui.Essentials => 0xaa8a4878 => 64
	i32 2868488919, ; 254: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 37
	i32 2877542466, ; 255: ClosedXML.dll => 0xab83d042 => 35
	i32 2901442782, ; 256: System.Reflection => 0xacf080de => 149
	i32 2904610611, ; 257: XLParser => 0xad20d733 => 97
	i32 2909740682, ; 258: System.Private.CoreLib => 0xad6f1e8a => 179
	i32 2916838712, ; 259: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 93
	i32 2919462931, ; 260: System.Numerics.Vectors.dll => 0xae037813 => 138
	i32 2921159260, ; 261: DXCore.a => 0xae1d5a5c => 44
	i32 2940926066, ; 262: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 117
	i32 2956781122, ; 263: DXEditors.a.dll => 0xb03ce642 => 41
	i32 2959614098, ; 264: System.ComponentModel.dll => 0xb0682092 => 111
	i32 2972252294, ; 265: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 161
	i32 2978675010, ; 266: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 78
	i32 3038032645, ; 267: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 268: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 269: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 85
	i32 3059408633, ; 270: Mono.Android.Runtime => 0xb65adef9 => 181
	i32 3059793426, ; 271: System.ComponentModel.Primitives => 0xb660be12 => 109
	i32 3118851116, ; 272: ExcelNumberFormat => 0xb9e5e42c => 50
	i32 3147165239, ; 273: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 120
	i32 3159123045, ; 274: System.Reflection.Primitives.dll => 0xbc4c6465 => 147
	i32 3160747431, ; 275: System.IO.MemoryMappedFiles => 0xbc652da7 => 127
	i32 3178803400, ; 276: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 86
	i32 3178908327, ; 277: SixLabors.Fonts.dll => 0xbd7a4aa7 => 66
	i32 3220365878, ; 278: System.Threading => 0xbff2e236 => 170
	i32 3258312781, ; 279: Xamarin.AndroidX.CardView => 0xc235e84d => 72
	i32 3265493905, ; 280: System.Linq.Queryable.dll => 0xc2a37b91 => 131
	i32 3277815716, ; 281: System.Resources.Writer.dll => 0xc35f7fa4 => 151
	i32 3279906254, ; 282: Microsoft.Win32.Registry.dll => 0xc37f65ce => 100
	i32 3280506390, ; 283: System.ComponentModel.Annotations.dll => 0xc3888e16 => 107
	i32 3305363605, ; 284: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3309582591, ; 285: DXGrid.a.dll => 0xc54438ff => 46
	i32 3316684772, ; 286: System.Net.Requests.dll => 0xc5b097e4 => 137
	i32 3317135071, ; 287: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 77
	i32 3346324047, ; 288: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 87
	i32 3357674450, ; 289: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 290: Xamarin.AndroidX.Core => 0xc86c06e3 => 75
	i32 3366347497, ; 291: Java.Interop => 0xc8a662e9 => 180
	i32 3374999561, ; 292: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 89
	i32 3381016424, ; 293: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3395150330, ; 294: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 152
	i32 3428513518, ; 295: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 54
	i32 3430777524, ; 296: netstandard => 0xcc7d82b4 => 178
	i32 3452344032, ; 297: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 60
	i32 3458724246, ; 298: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 299: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 110
	i32 3476120550, ; 300: Mono.Android => 0xcf3163e6 => 182
	i32 3484440000, ; 301: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3503731303, ; 302: DXGrid.a => 0xd0d6b267 => 46
	i32 3509114376, ; 303: System.Xml.Linq => 0xd128d608 => 173
	i32 3573573763, ; 304: DevExpress.Maui.CollectionView => 0xd5006883 => 40
	i32 3580758918, ; 305: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 306: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 307: System.Linq.dll => 0xd715a361 => 132
	i32 3624195450, ; 308: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 154
	i32 3641597786, ; 309: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 81
	i32 3643446276, ; 310: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 311: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 86
	i32 3657292374, ; 312: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 53
	i32 3672681054, ; 313: Mono.Android.dll => 0xdae8aa5e => 182
	i32 3689084180, ; 314: DXCollectionView.a.dll => 0xdbe2f514 => 39
	i32 3689375977, ; 315: System.Drawing.Common => 0xdbe768e9 => 67
	i32 3724971120, ; 316: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 85
	i32 3748608112, ; 317: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 115
	i32 3751619990, ; 318: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3753988493, ; 319: DevExpress.Maui.Controls.dll => 0xdfc1518d => 43
	i32 3777270291, ; 320: DevExpress.Maui.Editors => 0xe1249213 => 48
	i32 3786282454, ; 321: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 73
	i32 3792276235, ; 322: System.Collections.NonGeneric => 0xe2098b0b => 104
	i32 3800979733, ; 323: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 60
	i32 3802395368, ; 324: System.Collections.Specialized.dll => 0xe2a3f2e8 => 105
	i32 3817368567, ; 325: CommunityToolkit.Maui.dll => 0xe3886bf7 => 36
	i32 3822443793, ; 326: DocumentFormat.OpenXml => 0xe3d5dd11 => 49
	i32 3823082795, ; 327: System.Security.Cryptography.dll => 0xe3df9d2b => 163
	i32 3841636137, ; 328: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 55
	i32 3844307129, ; 329: System.Net.Mail.dll => 0xe52378b9 => 135
	i32 3849253459, ; 330: System.Runtime.InteropServices.dll => 0xe56ef253 => 155
	i32 3893086827, ; 331: DXNavigation.a.dll => 0xe80bca6b => 42
	i32 3896106733, ; 332: System.Collections.Concurrent.dll => 0xe839deed => 102
	i32 3896760992, ; 333: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 75
	i32 3904638161, ; 334: XLParser.dll => 0xe8bc0cd1 => 97
	i32 3920221145, ; 335: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 336: System.Xml.ReaderWriter => 0xea213423 => 174
	i32 3931092270, ; 337: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 88
	i32 3952357212, ; 338: System.IO.Packaging.dll => 0xeb942f5c => 68
	i32 3953953790, ; 339: System.Text.Encoding.CodePages => 0xebac8bfe => 164
	i32 3955647286, ; 340: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 70
	i32 3958304432, ; 341: DevExpress.Data.v23.2 => 0xebeeeeb0 => 38
	i32 4003436829, ; 342: System.Diagnostics.Process.dll => 0xee9f991d => 116
	i32 4025784931, ; 343: System.Memory => 0xeff49a63 => 133
	i32 4046471985, ; 344: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 62
	i32 4054681211, ; 345: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 143
	i32 4068434129, ; 346: System.Private.Xml.Linq.dll => 0xf27f60d1 => 141
	i32 4073602200, ; 347: System.Threading.dll => 0xf2ce3c98 => 170
	i32 4091086043, ; 348: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 349: Microsoft.Maui.Essentials.dll => 0xf40add04 => 64
	i32 4099507663, ; 350: System.Drawing.dll => 0xf45985cf => 122
	i32 4100113165, ; 351: System.Private.Uri => 0xf462c30d => 140
	i32 4103439459, ; 352: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 353: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 54
	i32 4147896353, ; 354: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 143
	i32 4150914736, ; 355: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4159265925, ; 356: System.Xml.XmlSerializer => 0xf7e95c85 => 176
	i32 4161255271, ; 357: System.Reflection.TypeExtensions => 0xf807b767 => 148
	i32 4181436372, ; 358: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 159
	i32 4182413190, ; 359: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 83
	i32 4213026141, ; 360: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 115
	i32 4249188766, ; 361: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4260525087, ; 362: System.Buffers => 0xfdf2741f => 101
	i32 4271975918, ; 363: Microsoft.Maui.Controls.dll => 0xfea12dee => 61
	i32 4274976490, ; 364: System.Runtime.Numerics => 0xfecef6ea => 157
	i32 4292120959 ; 365: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 83
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [366 x i32] [
	i32 0, ; 0
	i32 9, ; 1
	i32 168, ; 2
	i32 117, ; 3
	i32 33, ; 4
	i32 162, ; 5
	i32 65, ; 6
	i32 17, ; 7
	i32 155, ; 8
	i32 40, ; 9
	i32 32, ; 10
	i32 25, ; 11
	i32 162, ; 12
	i32 107, ; 13
	i32 73, ; 14
	i32 91, ; 15
	i32 111, ; 16
	i32 43, ; 17
	i32 114, ; 18
	i32 130, ; 19
	i32 123, ; 20
	i32 144, ; 21
	i32 30, ; 22
	i32 69, ; 23
	i32 8, ; 24
	i32 66, ; 25
	i32 80, ; 26
	i32 39, ; 27
	i32 171, ; 28
	i32 168, ; 29
	i32 133, ; 30
	i32 169, ; 31
	i32 34, ; 32
	i32 28, ; 33
	i32 106, ; 34
	i32 79, ; 35
	i32 172, ; 36
	i32 159, ; 37
	i32 177, ; 38
	i32 6, ; 39
	i32 139, ; 40
	i32 59, ; 41
	i32 131, ; 42
	i32 27, ; 43
	i32 56, ; 44
	i32 126, ; 45
	i32 153, ; 46
	i32 98, ; 47
	i32 36, ; 48
	i32 161, ; 49
	i32 77, ; 50
	i32 19, ; 51
	i32 102, ; 52
	i32 173, ; 53
	i32 145, ; 54
	i32 156, ; 55
	i32 137, ; 56
	i32 125, ; 57
	i32 25, ; 58
	i32 58, ; 59
	i32 113, ; 60
	i32 67, ; 61
	i32 140, ; 62
	i32 124, ; 63
	i32 10, ; 64
	i32 123, ; 65
	i32 24, ; 66
	i32 109, ; 67
	i32 127, ; 68
	i32 21, ; 69
	i32 14, ; 70
	i32 80, ; 71
	i32 120, ; 72
	i32 175, ; 73
	i32 118, ; 74
	i32 23, ; 75
	i32 106, ; 76
	i32 126, ; 77
	i32 47, ; 78
	i32 90, ; 79
	i32 122, ; 80
	i32 55, ; 81
	i32 70, ; 82
	i32 121, ; 83
	i32 4, ; 84
	i32 129, ; 85
	i32 82, ; 86
	i32 110, ; 87
	i32 68, ; 88
	i32 95, ; 89
	i32 177, ; 90
	i32 26, ; 91
	i32 20, ; 92
	i32 16, ; 93
	i32 22, ; 94
	i32 87, ; 95
	i32 116, ; 96
	i32 100, ; 97
	i32 2, ; 98
	i32 78, ; 99
	i32 11, ; 100
	i32 132, ; 101
	i32 31, ; 102
	i32 50, ; 103
	i32 49, ; 104
	i32 41, ; 105
	i32 128, ; 106
	i32 32, ; 107
	i32 90, ; 108
	i32 150, ; 109
	i32 74, ; 110
	i32 158, ; 111
	i32 152, ; 112
	i32 0, ; 113
	i32 118, ; 114
	i32 153, ; 115
	i32 6, ; 116
	i32 103, ; 117
	i32 125, ; 118
	i32 71, ; 119
	i32 59, ; 120
	i32 103, ; 121
	i32 124, ; 122
	i32 99, ; 123
	i32 30, ; 124
	i32 166, ; 125
	i32 145, ; 126
	i32 146, ; 127
	i32 38, ; 128
	i32 45, ; 129
	i32 45, ; 130
	i32 84, ; 131
	i32 93, ; 132
	i32 37, ; 133
	i32 76, ; 134
	i32 134, ; 135
	i32 166, ; 136
	i32 108, ; 137
	i32 47, ; 138
	i32 160, ; 139
	i32 94, ; 140
	i32 136, ; 141
	i32 163, ; 142
	i32 114, ; 143
	i32 149, ; 144
	i32 72, ; 145
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
	i32 26, ; 164
	i32 51, ; 165
	i32 129, ; 166
	i32 147, ; 167
	i32 8, ; 168
	i32 2, ; 169
	i32 150, ; 170
	i32 104, ; 171
	i32 141, ; 172
	i32 13, ; 173
	i32 151, ; 174
	i32 52, ; 175
	i32 5, ; 176
	i32 101, ; 177
	i32 82, ; 178
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
	i32 89, ; 201
	i32 135, ; 202
	i32 18, ; 203
	i32 179, ; 204
	i32 167, ; 205
	i32 154, ; 206
	i32 136, ; 207
	i32 12, ; 208
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
	i32 16, ; 220
	i32 144, ; 221
	i32 51, ; 222
	i32 11, ; 223
	i32 15, ; 224
	i32 165, ; 225
	i32 169, ; 226
	i32 20, ; 227
	i32 96, ; 228
	i32 142, ; 229
	i32 148, ; 230
	i32 76, ; 231
	i32 15, ; 232
	i32 156, ; 233
	i32 175, ; 234
	i32 121, ; 235
	i32 113, ; 236
	i32 128, ; 237
	i32 44, ; 238
	i32 157, ; 239
	i32 69, ; 240
	i32 71, ; 241
	i32 1, ; 242
	i32 21, ; 243
	i32 62, ; 244
	i32 63, ; 245
	i32 164, ; 246
	i32 92, ; 247
	i32 27, ; 248
	i32 65, ; 249
	i32 98, ; 250
	i32 74, ; 251
	i32 92, ; 252
	i32 64, ; 253
	i32 37, ; 254
	i32 35, ; 255
	i32 149, ; 256
	i32 97, ; 257
	i32 179, ; 258
	i32 93, ; 259
	i32 138, ; 260
	i32 44, ; 261
	i32 117, ; 262
	i32 41, ; 263
	i32 111, ; 264
	i32 161, ; 265
	i32 78, ; 266
	i32 34, ; 267
	i32 7, ; 268
	i32 85, ; 269
	i32 181, ; 270
	i32 109, ; 271
	i32 50, ; 272
	i32 120, ; 273
	i32 147, ; 274
	i32 127, ; 275
	i32 86, ; 276
	i32 66, ; 277
	i32 170, ; 278
	i32 72, ; 279
	i32 131, ; 280
	i32 151, ; 281
	i32 100, ; 282
	i32 107, ; 283
	i32 7, ; 284
	i32 46, ; 285
	i32 137, ; 286
	i32 77, ; 287
	i32 87, ; 288
	i32 24, ; 289
	i32 75, ; 290
	i32 180, ; 291
	i32 89, ; 292
	i32 3, ; 293
	i32 152, ; 294
	i32 54, ; 295
	i32 178, ; 296
	i32 60, ; 297
	i32 22, ; 298
	i32 110, ; 299
	i32 182, ; 300
	i32 23, ; 301
	i32 46, ; 302
	i32 173, ; 303
	i32 40, ; 304
	i32 31, ; 305
	i32 33, ; 306
	i32 132, ; 307
	i32 154, ; 308
	i32 81, ; 309
	i32 28, ; 310
	i32 86, ; 311
	i32 53, ; 312
	i32 182, ; 313
	i32 39, ; 314
	i32 67, ; 315
	i32 85, ; 316
	i32 115, ; 317
	i32 3, ; 318
	i32 43, ; 319
	i32 48, ; 320
	i32 73, ; 321
	i32 104, ; 322
	i32 60, ; 323
	i32 105, ; 324
	i32 36, ; 325
	i32 49, ; 326
	i32 163, ; 327
	i32 55, ; 328
	i32 135, ; 329
	i32 155, ; 330
	i32 42, ; 331
	i32 102, ; 332
	i32 75, ; 333
	i32 97, ; 334
	i32 19, ; 335
	i32 174, ; 336
	i32 88, ; 337
	i32 68, ; 338
	i32 164, ; 339
	i32 70, ; 340
	i32 38, ; 341
	i32 116, ; 342
	i32 133, ; 343
	i32 62, ; 344
	i32 143, ; 345
	i32 141, ; 346
	i32 170, ; 347
	i32 5, ; 348
	i32 64, ; 349
	i32 122, ; 350
	i32 140, ; 351
	i32 29, ; 352
	i32 54, ; 353
	i32 143, ; 354
	i32 29, ; 355
	i32 176, ; 356
	i32 148, ; 357
	i32 159, ; 358
	i32 83, ; 359
	i32 115, ; 360
	i32 18, ; 361
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
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
