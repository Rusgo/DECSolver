; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [183 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [366 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 59
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 182
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 64
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 129
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 73
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 90
	i64 545109961164950392, ; 6: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 558811379087732614, ; 7: DXEditors.a.dll => 0x7c14bfd12f86f86 => 41
	i64 560278790331054453, ; 8: System.Reflection.Primitives => 0x7c6829760de3975 => 147
	i64 702024105029695270, ; 9: System.Drawing.Common => 0x9be17343c0e7726 => 67
	i64 710500338161506772, ; 10: SixLabors.Fonts.dll => 0x9dc344b0ce959d4 => 66
	i64 727816129158616361, ; 11: DevExpress.Data.v23.2 => 0xa19b8e9d04c9529 => 38
	i64 750875890346172408, ; 12: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 168
	i64 799765834175365804, ; 13: System.ComponentModel.dll => 0xb1956c9f18442ac => 111
	i64 849051935479314978, ; 14: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 15: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 78
	i64 1010599046655515943, ; 16: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 147
	i64 1120440138749646132, ; 17: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 94
	i64 1121665720830085036, ; 18: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1244917166771784164, ; 19: DevExpress.Maui.Editors => 0x1146d5913c37c9e4 => 48
	i64 1268860745194512059, ; 20: System.Drawing.dll => 0x119be62002c19ebb => 122
	i64 1348139812537487829, ; 21: DXEditors.a => 0x12b58e0449dbd1d5 => 41
	i64 1369545283391376210, ; 22: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 86
	i64 1476839205573959279, ; 23: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 136
	i64 1486715745332614827, ; 24: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 61
	i64 1513467482682125403, ; 25: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 181
	i64 1537168428375924959, ; 26: System.Threading.Thread.dll => 0x15551e8a954ae0df => 168
	i64 1556147632182429976, ; 27: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 28: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 71
	i64 1628611045998245443, ; 29: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 83
	i64 1735388228521408345, ; 30: System.Net.Mail.dll => 0x181556663c69b759 => 135
	i64 1743969030606105336, ; 31: System.Memory.dll => 0x1833d297e88f2af8 => 133
	i64 1767386781656293639, ; 32: System.Private.Uri.dll => 0x188704e9f5582107 => 140
	i64 1795316252682057001, ; 33: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 70
	i64 1825687700144851180, ; 34: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 154
	i64 1835311033149317475, ; 35: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 36: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 90
	i64 1875417405349196092, ; 37: System.Drawing.Primitives => 0x1a06d2319b6c713c => 121
	i64 1881198190668717030, ; 38: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 39: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 62
	i64 1959996714666907089, ; 40: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1972385128188460614, ; 41: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 161
	i64 1981742497975770890, ; 42: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 82
	i64 1983698669889758782, ; 43: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 44: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2080945842184875448, ; 45: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 127
	i64 2102659300918482391, ; 46: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 121
	i64 2207662933261301575, ; 47: DocumentFormat.OpenXml => 0x1ea331bdb8d63747 => 49
	i64 2210058262765462106, ; 48: DevExpress.Maui.Controls => 0x1eabb447d50d625a => 43
	i64 2262844636196693701, ; 49: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 78
	i64 2287834202362508563, ; 50: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 102
	i64 2302323944321350744, ; 51: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2315304989185124968, ; 52: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 126
	i64 2329709569556905518, ; 53: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 81
	i64 2337758774805907496, ; 54: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 152
	i64 2470498323731680442, ; 55: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 74
	i64 2497223385847772520, ; 56: System.Runtime => 0x22a7eb7046413568 => 160
	i64 2547086958574651984, ; 57: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 69
	i64 2602673633151553063, ; 58: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 59: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 54
	i64 2662981627730767622, ; 60: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2783046991838674048, ; 61: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 152
	i64 2870618300109509804, ; 62: DXCollectionView.a => 0x27d67c227fc354ac => 39
	i64 2895129759130297543, ; 63: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 64: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 94
	i64 3289520064315143713, ; 65: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 80
	i64 3311221304742556517, ; 66: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 138
	i64 3325875462027654285, ; 67: System.Runtime.Numerics => 0x2e27e21c8958b48d => 157
	i64 3344514922410554693, ; 68: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 96
	i64 3429672777697402584, ; 69: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 64
	i64 3437845325506641314, ; 70: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 127
	i64 3494946837667399002, ; 71: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 52
	i64 3522470458906976663, ; 72: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 91
	i64 3551103847008531295, ; 73: System.Private.CoreLib.dll => 0x31480e226177735f => 179
	i64 3567343442040498961, ; 74: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 75: System.Runtime.dll => 0x319037675df7e556 => 160
	i64 3638003163729360188, ; 76: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 53
	i64 3647754201059316852, ; 77: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 174
	i64 3655542548057982301, ; 78: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 52
	i64 3716579019761409177, ; 79: netstandard.dll => 0x3393f0ed5c8c5c99 => 178
	i64 3727469159507183293, ; 80: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 89
	i64 3869221888984012293, ; 81: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 56
	i64 3869649043256705283, ; 82: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 118
	i64 3890352374528606784, ; 83: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 62
	i64 3933965368022646939, ; 84: System.Net.Requests => 0x369840a8bfadc09b => 137
	i64 3966267475168208030, ; 85: System.Memory => 0x370b03412596249e => 133
	i64 4009997192427317104, ; 86: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 159
	i64 4073500526318903918, ; 87: System.Private.Xml.dll => 0x3887fb25779ae26e => 142
	i64 4073631083018132676, ; 88: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 60
	i64 4120493066591692148, ; 89: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4127427327551562508, ; 90: DevExpress.Maui.Core => 0x394791494ef3630c => 45
	i64 4154383907710350974, ; 91: System.ComponentModel => 0x39a7562737acb67e => 111
	i64 4167269041631776580, ; 92: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 169
	i64 4187479170553454871, ; 93: System.Linq.Expressions => 0x3a1cea1e912fa117 => 129
	i64 4205801962323029395, ; 94: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 110
	i64 4282138915307457788, ; 95: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 145
	i64 4356591372459378815, ; 96: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4367142137090651694, ; 97: DXCore.a.dll => 0x3c9b34a2b4edb62e => 44
	i64 4376937205476565312, ; 98: ExcelNumberFormat.dll => 0x3cbe0132c89f2140 => 50
	i64 4384334752651165692, ; 99: DevExpress.Maui.CollectionView.dll => 0x3cd8493a742c3ffc => 40
	i64 4401076402506455931, ; 100: DXGrid.a => 0x3d13c3ab90c05b7b => 46
	i64 4477672992252076438, ; 101: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 172
	i64 4533124835995628778, ; 102: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 145
	i64 4679594760078841447, ; 103: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4716677666592453464, ; 104: System.Xml.XmlSerializer => 0x417501590542f358 => 176
	i64 4743821336939966868, ; 105: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 107
	i64 4794310189461587505, ; 106: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 69
	i64 4795410492532947900, ; 107: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 91
	i64 4809057822547766521, ; 108: System.Drawing => 0x42bd349c3145ecf9 => 122
	i64 4853321196694829351, ; 109: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 156
	i64 5081566143765835342, ; 110: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 150
	i64 5099468265966638712, ; 111: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 150
	i64 5103417709280584325, ; 112: System.Collections.Specialized => 0x46d2fb5e161b6285 => 105
	i64 5182934613077526976, ; 113: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 105
	i64 5290786973231294105, ; 114: System.Runtime.Loader => 0x496ca6b869b72699 => 156
	i64 5423376490970181369, ; 115: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 154
	i64 5446034149219586269, ; 116: System.Diagnostics.Debug => 0x4b94333452e150dd => 114
	i64 5471532531798518949, ; 117: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 118: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 119: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 124
	i64 5573260873512690141, ; 120: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 163
	i64 5591791169662171124, ; 121: System.Linq.Parallel => 0x4d9a087135e137f4 => 130
	i64 5650097808083101034, ; 122: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 161
	i64 5692067934154308417, ; 123: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 93
	i64 5796442605724717762, ; 124: ExcelNumberFormat => 0x507119d6cb2952c2 => 50
	i64 5984759512290286505, ; 125: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 162
	i64 6068057819846744445, ; 126: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6200764641006662125, ; 127: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6251069312384999852, ; 128: System.Transactions.Local => 0x56c0426b870da1ac => 171
	i64 6284145129771520194, ; 129: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 143
	i64 6357457916754632952, ; 130: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 131: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 81
	i64 6478287442656530074, ; 132: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 133: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 77
	i64 6560151584539558821, ; 134: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 58
	i64 6617685658146568858, ; 135: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 164
	i64 6713440830605852118, ; 136: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 148
	i64 6743165466166707109, ; 137: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 138: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 139: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 119
	i64 6814185388980153342, ; 140: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 175
	i64 6876862101832370452, ; 141: System.Xml.Linq => 0x5f6f85a57d108914 => 173
	i64 6894844156784520562, ; 142: System.Numerics.Vectors => 0x5faf683aead1ad72 => 138
	i64 7060896174307865760, ; 143: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 167
	i64 7083547580668757502, ; 144: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 141
	i64 7112547816752919026, ; 145: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 126
	i64 7142976273706224655, ; 146: DXNavigation.a.dll => 0x6320f313694d8c0f => 42
	i64 7220009545223068405, ; 147: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7229955455499660495, ; 148: DXCollectionView.a.dll => 0x6455f62e4af46ccf => 39
	i64 7270811800166795866, ; 149: System.Linq => 0x64e71ccf51a90a5a => 132
	i64 7316205155833392065, ; 150: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 99
	i64 7338192458477945005, ; 151: System.Reflection => 0x65d67f295d0740ad => 149
	i64 7377312882064240630, ; 152: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 110
	i64 7488575175965059935, ; 153: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 173
	i64 7489048572193775167, ; 154: System.ObjectModel => 0x67ee71ff6b419e3f => 139
	i64 7592577537120840276, ; 155: System.Diagnostics.Process => 0x695e410af5b2aa54 => 116
	i64 7654504624184590948, ; 156: System.Net.Http => 0x6a3a4366801b8264 => 134
	i64 7694700312542370399, ; 157: System.Net.Mail => 0x6ac9112a7e2cda5f => 135
	i64 7708790323521193081, ; 158: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 159: System.Private.CoreLib => 0x6b0ff375198b9c17 => 179
	i64 7735352534559001595, ; 160: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 95
	i64 7789592736793255292, ; 161: DevExpress.Maui.Controls.dll => 0x6c1a3152b5865d7c => 43
	i64 7836164640616011524, ; 162: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 71
	i64 8012566953210257060, ; 163: ClosedXML.dll => 0x6f325b3109219ea4 => 35
	i64 8064050204834738623, ; 164: System.Collections.dll => 0x6fe942efa61731bf => 106
	i64 8083354569033831015, ; 165: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 80
	i64 8087206902342787202, ; 166: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 115
	i64 8113615946733131500, ; 167: System.Reflection.Extensions => 0x70995ab73cf916ec => 146
	i64 8167236081217502503, ; 168: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 180
	i64 8185542183669246576, ; 169: System.Collections => 0x7198e33f4794aa70 => 106
	i64 8246048515196606205, ; 170: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 65
	i64 8264926008854159966, ; 171: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 116
	i64 8290740647658429042, ; 172: System.Runtime.Extensions => 0x730ea0b15c929a72 => 153
	i64 8368701292315763008, ; 173: System.Security.Cryptography => 0x7423997c6fd56140 => 163
	i64 8400357532724379117, ; 174: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 88
	i64 8410671156615598628, ; 175: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 144
	i64 8518412311883997971, ; 176: System.Collections.Immutable => 0x76377add7c28e313 => 103
	i64 8563666267364444763, ; 177: System.Private.Uri => 0x76d841191140ca5b => 140
	i64 8599632406834268464, ; 178: CommunityToolkit.Maui => 0x7758081c784b4930 => 36
	i64 8614108721271900878, ; 179: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 180: Java.Interop => 0x77b654e585b55834 => 180
	i64 8639588376636138208, ; 181: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 87
	i64 8648495978913578441, ; 182: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 100
	i64 8677882282824630478, ; 183: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 184: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 115
	i64 8941376889969657626, ; 185: System.Xml.XDocument => 0x7c1626e87187471a => 175
	i64 9045785047181495996, ; 186: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9152195110146177084, ; 187: XLParser => 0x7f0320f65754783c => 97
	i64 9312692141327339315, ; 188: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 93
	i64 9324707631942237306, ; 189: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 70
	i64 9552911931735491231, ; 190: DXNavigation.a => 0x8492c2c9d5af429f => 42
	i64 9584643793929893533, ; 191: System.IO.dll => 0x85037ebfbbd7f69d => 128
	i64 9659729154652888475, ; 192: System.Text.RegularExpressions => 0x860e407c9991dd9b => 166
	i64 9667360217193089419, ; 193: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 117
	i64 9678050649315576968, ; 194: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 74
	i64 9702891218465930390, ; 195: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 104
	i64 9808709177481450983, ; 196: Mono.Android.dll => 0x881f890734e555e7 => 182
	i64 9933555792566666578, ; 197: System.Linq.Queryable.dll => 0x89db145cf475c552 => 131
	i64 9956195530459977388, ; 198: Microsoft.Maui => 0x8a2b8315b36616ac => 63
	i64 9991543690424095600, ; 199: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 200: System.Net.Http.dll => 0x8b50e941206af13b => 134
	i64 10051358222726253779, ; 201: System.Private.Xml => 0x8b7d990c97ccccd3 => 142
	i64 10080807920783533798, ; 202: DXGrid.a.dll => 0x8be63964bf3f26e6 => 46
	i64 10092835686693276772, ; 203: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 61
	i64 10105485790837105934, ; 204: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 167
	i64 10143853363526200146, ; 205: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 206: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 77
	i64 10245369515835430794, ; 207: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 144
	i64 10364469296367737616, ; 208: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 143
	i64 10406448008575299332, ; 209: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 96
	i64 10430153318873392755, ; 210: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 75
	i64 10454871586088267783, ; 211: DevExpress.Maui.DataGrid => 0x91172a50b51db007 => 47
	i64 10506226065143327199, ; 212: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10566960649245365243, ; 213: System.Globalization.dll => 0x92a562b96dcd13fb => 123
	i64 10650478070646097812, ; 214: System.IO.Packaging => 0x93ce196068f2c794 => 68
	i64 10670374202010151210, ; 215: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 99
	i64 10678444886965028446, ; 216: DevExpress.Maui.Editors.dll => 0x9431750c4123065e => 48
	i64 10714184849103829812, ; 217: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 153
	i64 10785150219063592792, ; 218: System.Net.Primitives => 0x95ac8cfb68830758 => 136
	i64 10822644899632537592, ; 219: System.Linq.Queryable => 0x9631c23204ca5ff8 => 131
	i64 10880838204485145808, ; 220: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 36
	i64 10964653383833615866, ; 221: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 120
	i64 11002576679268595294, ; 222: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 57
	i64 11009005086950030778, ; 223: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 63
	i64 11089314871468410253, ; 224: DevExpress.Maui.CollectionView => 0x99e5291f3454c58d => 40
	i64 11103970607964515343, ; 225: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 226: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 92
	i64 11220793807500858938, ; 227: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 228: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 58
	i64 11340910727871153756, ; 229: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 76
	i64 11347436699239206956, ; 230: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 176
	i64 11485890710487134646, ; 231: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 155
	i64 11518296021396496455, ; 232: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 233: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 92
	i64 11530571088791430846, ; 234: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 56
	i64 11597940890313164233, ; 235: netstandard => 0xa0f429ca8d1805c9 => 178
	i64 11705530742807338875, ; 236: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11707554492040141440, ; 237: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 130
	i64 12102847907131387746, ; 238: System.Buffers => 0xa7f5f40c43256f62 => 101
	i64 12123043025855404482, ; 239: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 146
	i64 12201331334810686224, ; 240: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 159
	i64 12269460666702402136, ; 241: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 103
	i64 12341818387765915815, ; 242: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 37
	i64 12451044538927396471, ; 243: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 79
	i64 12466513435562512481, ; 244: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 84
	i64 12475113361194491050, ; 245: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12508989635011189811, ; 246: DevExpress.Data.v23.2.dll => 0xad98dbcc2de29c33 => 38
	i64 12517810545449516888, ; 247: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 119
	i64 12538491095302438457, ; 248: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 72
	i64 12550732019250633519, ; 249: System.IO.Compression => 0xae2d28465e8e1b2f => 125
	i64 12681088699309157496, ; 250: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12699999919562409296, ; 251: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 117
	i64 12700543734426720211, ; 252: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 73
	i64 12708238894395270091, ; 253: System.IO => 0xb05cbbf17d3ba3cb => 128
	i64 12708922737231849740, ; 254: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 165
	i64 12719814519482886281, ; 255: Irony => 0xb085dbe9baa22889 => 51
	i64 12823819093633476069, ; 256: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 257: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 59
	i64 12963446364377008305, ; 258: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 67
	i64 13068258254871114833, ; 259: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 158
	i64 13109727801987935684, ; 260: SixLabors.Fonts => 0xb5ef1bfa438dadc4 => 66
	i64 13221551921002590604, ; 261: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 262: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13315587268572539134, ; 263: DevExpress.Maui.DataGrid.dll => 0xb8ca78125efae8fe => 47
	i64 13343850469010654401, ; 264: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 181
	i64 13381594904270902445, ; 265: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 266: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 95
	i64 13467053111158216594, ; 267: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 268: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 269: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 270: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 89
	i64 13702626353344114072, ; 271: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 118
	i64 13717397318615465333, ; 272: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 109
	i64 13755568601956062840, ; 273: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 274: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 275: System.Console.dll => 0xc0a5f3cade5c6774 => 112
	i64 13959074834287824816, ; 276: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 79
	i64 14100563506285742564, ; 277: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 278: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 72
	i64 14125464355221830302, ; 279: System.Threading.dll => 0xc407bafdbc707a9e => 170
	i64 14148919944076435199, ; 280: DocumentFormat.OpenXml.dll => 0xc45b0fb9961d9eff => 49
	i64 14232023429000439693, ; 281: System.Resources.Writer.dll => 0xc5824de7789ba78d => 151
	i64 14254574811015963973, ; 282: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 165
	i64 14327695147300244862, ; 283: System.Reflection.dll => 0xc6d632d338eb4d7e => 149
	i64 14461014870687870182, ; 284: System.Net.Requests.dll => 0xc8afd8683afdece6 => 137
	i64 14461976080970138192, ; 285: XLParser.dll => 0xc8b3429f706bc250 => 97
	i64 14464374589798375073, ; 286: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 287: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14556034074661724008, ; 288: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 37
	i64 14561513370130550166, ; 289: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 162
	i64 14622043554576106986, ; 290: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 158
	i64 14653669531502871807, ; 291: DevExpress.Maui.Core.dll => 0xcb5c4acce93184ff => 45
	i64 14669215534098758659, ; 292: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 54
	i64 14690985099581930927, ; 293: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 172
	i64 14705122255218365489, ; 294: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 295: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 296: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 76
	i64 14892012299694389861, ; 297: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 298: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14935719434541007538, ; 299: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 164
	i64 14954917835170835695, ; 300: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 55
	i64 14987728460634540364, ; 301: System.IO.Compression.dll => 0xcfff1ba06622494c => 125
	i64 15076659072870671916, ; 302: System.ObjectModel.dll => 0xd13b0d8c1620662c => 139
	i64 15111608613780139878, ; 303: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 304: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 124
	i64 15133485256822086103, ; 305: System.Linq.dll => 0xd204f0a9127dd9d7 => 132
	i64 15227001540531775957, ; 306: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 53
	i64 15370334346939861994, ; 307: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 75
	i64 15391712275433856905, ; 308: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 55
	i64 15527772828719725935, ; 309: System.Console => 0xd77dbb1e38cd3d6f => 112
	i64 15536481058354060254, ; 310: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 311: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 83
	i64 15609085926864131306, ; 312: System.dll => 0xd89e9cf3334914ea => 177
	i64 15661133872274321916, ; 313: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 174
	i64 15664356999916475676, ; 314: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15710114879900314733, ; 315: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 100
	i64 15743187114543869802, ; 316: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 317: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15885744048853936810, ; 318: System.Resources.Writer => 0xdc75800bd0b6eaaa => 151
	i64 15928521404965645318, ; 319: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 60
	i64 16125434397870879068, ; 320: Irony.dll => 0xdfc90d260df5715c => 51
	i64 16154507427712707110, ; 321: System => 0xe03056ea4e39aa26 => 177
	i64 16288847719894691167, ; 322: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16290414536175900568, ; 323: AppTp => 0xe2132db5d89fd798 => 98
	i64 16321164108206115771, ; 324: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 57
	i64 16649148416072044166, ; 325: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 65
	i64 16677317093839702854, ; 326: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 88
	i64 16762783179241323229, ; 327: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 148
	i64 16795178957077639253, ; 328: DXCore.a => 0xe9147646dbba7055 => 44
	i64 16856067890322379635, ; 329: System.Data.Common.dll => 0xe9ecc87060889373 => 113
	i64 16890310621557459193, ; 330: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 166
	i64 16942731696432749159, ; 331: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 332: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 86
	i64 17008137082415910100, ; 333: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 104
	i64 17031351772568316411, ; 334: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 85
	i64 17062143951396181894, ; 335: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 109
	i64 17089008752050867324, ; 336: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17187273293601214786, ; 337: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 107
	i64 17201328579425343169, ; 338: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 108
	i64 17230721278011714856, ; 339: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 141
	i64 17234219099804750107, ; 340: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 171
	i64 17260702271250283638, ; 341: System.Data.Common => 0xef8a5543bba6bc76 => 113
	i64 17272529741349494537, ; 342: ClosedXML => 0xefb45a4935819f09 => 35
	i64 17329854757383952723, ; 343: AppTp.dll => 0xf080031596fbd953 => 98
	i64 17333249706306540043, ; 344: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 120
	i64 17342750010158924305, ; 345: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 346: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 347: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 348: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17627500474728259406, ; 349: System.Globalization => 0xf4a176498a351f4e => 123
	i64 17685921127322830888, ; 350: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 114
	i64 17702523067201099846, ; 351: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 352: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 84
	i64 17710060891934109755, ; 353: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 82
	i64 17712670374920797664, ; 354: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 155
	i64 17777860260071588075, ; 355: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 157
	i64 17838668724098252521, ; 356: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 101
	i64 18025913125965088385, ; 357: System.Threading => 0xfa28e87b91334681 => 170
	i64 18099568558057551825, ; 358: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 359: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 85
	i64 18146811631844267958, ; 360: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 108
	i64 18225059387460068507, ; 361: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 169
	i64 18245806341561545090, ; 362: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 102
	i64 18284618658670613420, ; 363: System.IO.Packaging.dll => 0xfdc003cb438a93ac => 68
	i64 18305135509493619199, ; 364: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 87
	i64 18324163916253801303 ; 365: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [366 x i32] [
	i32 59, ; 0
	i32 182, ; 1
	i32 64, ; 2
	i32 129, ; 3
	i32 73, ; 4
	i32 90, ; 5
	i32 7, ; 6
	i32 41, ; 7
	i32 147, ; 8
	i32 67, ; 9
	i32 66, ; 10
	i32 38, ; 11
	i32 168, ; 12
	i32 111, ; 13
	i32 10, ; 14
	i32 78, ; 15
	i32 147, ; 16
	i32 94, ; 17
	i32 18, ; 18
	i32 48, ; 19
	i32 122, ; 20
	i32 41, ; 21
	i32 86, ; 22
	i32 136, ; 23
	i32 61, ; 24
	i32 181, ; 25
	i32 168, ; 26
	i32 16, ; 27
	i32 71, ; 28
	i32 83, ; 29
	i32 135, ; 30
	i32 133, ; 31
	i32 140, ; 32
	i32 70, ; 33
	i32 154, ; 34
	i32 6, ; 35
	i32 90, ; 36
	i32 121, ; 37
	i32 28, ; 38
	i32 62, ; 39
	i32 28, ; 40
	i32 161, ; 41
	i32 82, ; 42
	i32 2, ; 43
	i32 20, ; 44
	i32 127, ; 45
	i32 121, ; 46
	i32 49, ; 47
	i32 43, ; 48
	i32 78, ; 49
	i32 102, ; 50
	i32 24, ; 51
	i32 126, ; 52
	i32 81, ; 53
	i32 152, ; 54
	i32 74, ; 55
	i32 160, ; 56
	i32 69, ; 57
	i32 27, ; 58
	i32 54, ; 59
	i32 2, ; 60
	i32 152, ; 61
	i32 39, ; 62
	i32 7, ; 63
	i32 94, ; 64
	i32 80, ; 65
	i32 138, ; 66
	i32 157, ; 67
	i32 96, ; 68
	i32 64, ; 69
	i32 127, ; 70
	i32 52, ; 71
	i32 91, ; 72
	i32 179, ; 73
	i32 22, ; 74
	i32 160, ; 75
	i32 53, ; 76
	i32 174, ; 77
	i32 52, ; 78
	i32 178, ; 79
	i32 89, ; 80
	i32 56, ; 81
	i32 118, ; 82
	i32 62, ; 83
	i32 137, ; 84
	i32 133, ; 85
	i32 159, ; 86
	i32 142, ; 87
	i32 60, ; 88
	i32 33, ; 89
	i32 45, ; 90
	i32 111, ; 91
	i32 169, ; 92
	i32 129, ; 93
	i32 110, ; 94
	i32 145, ; 95
	i32 30, ; 96
	i32 44, ; 97
	i32 50, ; 98
	i32 40, ; 99
	i32 46, ; 100
	i32 172, ; 101
	i32 145, ; 102
	i32 0, ; 103
	i32 176, ; 104
	i32 107, ; 105
	i32 69, ; 106
	i32 91, ; 107
	i32 122, ; 108
	i32 156, ; 109
	i32 150, ; 110
	i32 150, ; 111
	i32 105, ; 112
	i32 105, ; 113
	i32 156, ; 114
	i32 154, ; 115
	i32 114, ; 116
	i32 26, ; 117
	i32 29, ; 118
	i32 124, ; 119
	i32 163, ; 120
	i32 130, ; 121
	i32 161, ; 122
	i32 93, ; 123
	i32 50, ; 124
	i32 162, ; 125
	i32 23, ; 126
	i32 23, ; 127
	i32 171, ; 128
	i32 143, ; 129
	i32 34, ; 130
	i32 81, ; 131
	i32 11, ; 132
	i32 77, ; 133
	i32 58, ; 134
	i32 164, ; 135
	i32 148, ; 136
	i32 19, ; 137
	i32 22, ; 138
	i32 119, ; 139
	i32 175, ; 140
	i32 173, ; 141
	i32 138, ; 142
	i32 167, ; 143
	i32 141, ; 144
	i32 126, ; 145
	i32 42, ; 146
	i32 26, ; 147
	i32 39, ; 148
	i32 132, ; 149
	i32 99, ; 150
	i32 149, ; 151
	i32 110, ; 152
	i32 173, ; 153
	i32 139, ; 154
	i32 116, ; 155
	i32 134, ; 156
	i32 135, ; 157
	i32 17, ; 158
	i32 179, ; 159
	i32 95, ; 160
	i32 43, ; 161
	i32 71, ; 162
	i32 35, ; 163
	i32 106, ; 164
	i32 80, ; 165
	i32 115, ; 166
	i32 146, ; 167
	i32 180, ; 168
	i32 106, ; 169
	i32 65, ; 170
	i32 116, ; 171
	i32 153, ; 172
	i32 163, ; 173
	i32 88, ; 174
	i32 144, ; 175
	i32 103, ; 176
	i32 140, ; 177
	i32 36, ; 178
	i32 21, ; 179
	i32 180, ; 180
	i32 87, ; 181
	i32 100, ; 182
	i32 21, ; 183
	i32 115, ; 184
	i32 175, ; 185
	i32 31, ; 186
	i32 97, ; 187
	i32 93, ; 188
	i32 70, ; 189
	i32 42, ; 190
	i32 128, ; 191
	i32 166, ; 192
	i32 117, ; 193
	i32 74, ; 194
	i32 104, ; 195
	i32 182, ; 196
	i32 131, ; 197
	i32 63, ; 198
	i32 6, ; 199
	i32 134, ; 200
	i32 142, ; 201
	i32 46, ; 202
	i32 61, ; 203
	i32 167, ; 204
	i32 3, ; 205
	i32 77, ; 206
	i32 144, ; 207
	i32 143, ; 208
	i32 96, ; 209
	i32 75, ; 210
	i32 47, ; 211
	i32 1, ; 212
	i32 123, ; 213
	i32 68, ; 214
	i32 99, ; 215
	i32 48, ; 216
	i32 153, ; 217
	i32 136, ; 218
	i32 131, ; 219
	i32 36, ; 220
	i32 120, ; 221
	i32 57, ; 222
	i32 63, ; 223
	i32 40, ; 224
	i32 12, ; 225
	i32 92, ; 226
	i32 15, ; 227
	i32 58, ; 228
	i32 76, ; 229
	i32 176, ; 230
	i32 155, ; 231
	i32 13, ; 232
	i32 92, ; 233
	i32 56, ; 234
	i32 178, ; 235
	i32 9, ; 236
	i32 130, ; 237
	i32 101, ; 238
	i32 146, ; 239
	i32 159, ; 240
	i32 103, ; 241
	i32 37, ; 242
	i32 79, ; 243
	i32 84, ; 244
	i32 34, ; 245
	i32 38, ; 246
	i32 119, ; 247
	i32 72, ; 248
	i32 125, ; 249
	i32 14, ; 250
	i32 117, ; 251
	i32 73, ; 252
	i32 128, ; 253
	i32 165, ; 254
	i32 51, ; 255
	i32 27, ; 256
	i32 59, ; 257
	i32 67, ; 258
	i32 158, ; 259
	i32 66, ; 260
	i32 1, ; 261
	i32 15, ; 262
	i32 47, ; 263
	i32 181, ; 264
	i32 9, ; 265
	i32 95, ; 266
	i32 29, ; 267
	i32 30, ; 268
	i32 13, ; 269
	i32 89, ; 270
	i32 118, ; 271
	i32 109, ; 272
	i32 8, ; 273
	i32 11, ; 274
	i32 112, ; 275
	i32 79, ; 276
	i32 3, ; 277
	i32 72, ; 278
	i32 170, ; 279
	i32 49, ; 280
	i32 151, ; 281
	i32 165, ; 282
	i32 149, ; 283
	i32 137, ; 284
	i32 97, ; 285
	i32 24, ; 286
	i32 5, ; 287
	i32 37, ; 288
	i32 162, ; 289
	i32 158, ; 290
	i32 45, ; 291
	i32 54, ; 292
	i32 172, ; 293
	i32 16, ; 294
	i32 32, ; 295
	i32 76, ; 296
	i32 33, ; 297
	i32 0, ; 298
	i32 164, ; 299
	i32 55, ; 300
	i32 125, ; 301
	i32 139, ; 302
	i32 17, ; 303
	i32 124, ; 304
	i32 132, ; 305
	i32 53, ; 306
	i32 75, ; 307
	i32 55, ; 308
	i32 112, ; 309
	i32 4, ; 310
	i32 83, ; 311
	i32 177, ; 312
	i32 174, ; 313
	i32 4, ; 314
	i32 100, ; 315
	i32 12, ; 316
	i32 5, ; 317
	i32 151, ; 318
	i32 60, ; 319
	i32 51, ; 320
	i32 177, ; 321
	i32 18, ; 322
	i32 98, ; 323
	i32 57, ; 324
	i32 65, ; 325
	i32 88, ; 326
	i32 148, ; 327
	i32 44, ; 328
	i32 113, ; 329
	i32 166, ; 330
	i32 25, ; 331
	i32 86, ; 332
	i32 104, ; 333
	i32 85, ; 334
	i32 109, ; 335
	i32 32, ; 336
	i32 107, ; 337
	i32 108, ; 338
	i32 141, ; 339
	i32 171, ; 340
	i32 113, ; 341
	i32 35, ; 342
	i32 98, ; 343
	i32 120, ; 344
	i32 10, ; 345
	i32 25, ; 346
	i32 8, ; 347
	i32 20, ; 348
	i32 123, ; 349
	i32 114, ; 350
	i32 31, ; 351
	i32 84, ; 352
	i32 82, ; 353
	i32 155, ; 354
	i32 157, ; 355
	i32 101, ; 356
	i32 170, ; 357
	i32 19, ; 358
	i32 85, ; 359
	i32 108, ; 360
	i32 169, ; 361
	i32 102, ; 362
	i32 68, ; 363
	i32 87, ; 364
	i32 14 ; 365
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 0d97e20b84d8e87c3502469ee395805907905fe3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
