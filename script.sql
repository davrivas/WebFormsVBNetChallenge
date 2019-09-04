USE [master]
GO
/****** Object:  Database [Products]    Script Date: 9/4/2019 8:47:59 AM ******/
CREATE DATABASE [Products]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Products', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Products.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Products_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Products_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Products] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Products].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Products] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Products] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Products] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Products] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Products] SET ARITHABORT OFF 
GO
ALTER DATABASE [Products] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Products] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Products] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Products] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Products] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Products] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Products] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Products] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Products] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Products] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Products] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Products] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Products] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Products] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Products] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Products] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Products] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Products] SET RECOVERY FULL 
GO
ALTER DATABASE [Products] SET  MULTI_USER 
GO
ALTER DATABASE [Products] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Products] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Products] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Products] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Products] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Products', N'ON'
GO
ALTER DATABASE [Products] SET QUERY_STORE = OFF
GO
USE [Products]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/4/2019 8:47:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Identifier] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ProductStatus] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201906212041072_FirstMigration', N'MVCProductsChallenge.Context.Migrations.Configuration', 0x1F8B0800000000000400ED59CD6EE33610BE17E83B083AB545D672B2976D60EF227592C2E83A0EA224E82DA0A5B14394A254920A6C2CFA643DF491FA0A1DEACF1269D972D6C96E8BC2179B9CF986F34BCEF8EF3FFF1A7C5846CC79022169CC87EE71AFEF3AC08338A47C317453357FF3CEFDF0FEDB6F061761B474EE4BBAB79A0E39B91CBA8F4A25A79E2783478888EC453410B18CE7AA17C49147C2D83BE9F77FF48E8F3D400817B11C677093724523C87EE0CF51CC0348544AD8240E81C9621D77FC0CD5B92211C88404307427F7A36B118769A0E4E89130067C013D0450B054AE73C628C133F9C0E6AE43388F155178E2D33B09BE12315FF8092E1076BB4A00E9E684492834395D937755AA7FA295F2D68C2554904A15477B021EBF2DACE499ECCFB2B55B5911ED7881F6562BAD7566CBA15BD8D0754C59A72326345D8BA53307F532380AB257101C39EDC44755D86074E9CF91334A994A050C39A44A10A4B84E678C06BFC0EA36FE0DF890A78CD58F8F0AE05E630197505E0242AD6E605E28350E5DC76BF2792663C556E3C9F51D73F5F6C475AE50389931A8A2A3661B5FC5027E060E822808AF895220B8C680CCBE96744B96A69B5310A54C0C4ACC34D79990E54734997A44B393A5EB5CD22584E54A718E3B4E31319149891476893A0719089AE4D1F3C2B20AC76B29BBADB90B8A0650429C434023C25CE75AE0B7A242BD731D3F201A707FF49180CC8FE7E8BD4A087EBFC55AF48CA3665AFB181AA9AC6C8C85A767ECECC2BD224F74919DABDDAEAE73032CA3918F3469CAD1FB0F65F2A13B451CDDC4ACC95FED3FDC12B100CCFBDB780B911FA722304E3AF0D645A44B69C98F7D90F2A219FE2F319D4A4CCD627AE1F0B9BF2B5AE5E142B58CC2ADA15AC673B7504D233B50CB3C1DCB4B4616EB57C13343378D9A05E02502177D1482602BF4693DB09A9E9A40340351C6202781A24FA8D63D61292EF42DCF36E8CF9AD4C7B6817353D617CFA48C039AD9CA8EC6B5DB9B522F78E8748901ABBCE6F56582E6A2091A08DDAD8F6966F0949F0303058E56485F2023220312DA718D1A857B9DAC2AA4D6C9CC53FD6009C37A0242273461F87495E868CA955D7C280F68425807FB18BC1D4B9756BB9262EE9C43025C579D0E46E822DE7825D827A9041A8ED965AC81570B3CFB66D2BD017254915DA562D93358798ECD4291EAB228826660685C1F9455F9D665C78C08AF134426B31D260F7903AAA6FC46BC5ABDAD916EABCBA6673AA668A593A98EE5EA8E9965035A600DDF23E5864BA0F2FFBAABF4F2B6B26C3FBD96FE733021498225B6D68F162B8E9F37A3A337FEFEBD5994637881DCD0A255A7AD24E17B802CC0D845D178D24B2AA4C2072C99117D618DC2C82233A3BD250C4B694640DB8E2B03B364281F1ADB1BF32A0FEC4251005DA292912E36D9FBC7F6BCCD994D07082362C36B6B14B334E2ED656F1BF7BA456BA2ACD7BBA335BAB03A5C63A33B9E5143EB883BCAEB36CCACE56A6251F3F5BF1DA3D958D5A19A3B7B6B5ABECD36685A6ED99803CF082AEBAAB1E2D87A0B34F3629FACC98BDEA133272BFDCFCE9ECDDC2F93415607D212A5F9E62B7BCFBA144C924A7A75391897C0A028C8BB27955685CE49F438237EA2A1AECEFE4A2A887A9AA0E7FFCE468CA2BE6B8209E1740E52E52F7FF7A47F7C628C38BF9E71A32765C8BACD1C5FBDEDA6DAA83B1BEB3DE73FF6308F3F11113C12F15D4496DFD7F19E39B0FB2CBC8D43B9CC10D67B778CAFEEE5D0FD94719E3AE35F1F1ACC47CE5460309E3A7DE78FCF1BE885AF31D00BF1BB3AD8402FB3D856A067CDC5FE1B29D0326CDA236EDB8C77B851C2D7313AF8326382571C0BFCAB460076EFD4A93BDFD6DFE7773B569F598CBECEC3BDB569DDD2FDEF6AFEB7C8D9D86D7FA9F140DB38A0CB346013EFCB34FEF65B0E63ADF6DF3446BBA48B3584FEA79A43D088B28A66CCE77119F3C6894A12A37E4E4011BCAEC899C0870409146E07206536A92F06AF17D10CC2319FA62A4915AA0CD18C35FE04D049B34D7E36DD689E7930CD9E19F2102AE031A9BE71A7FCA794B2B03AF7E5868BB2054267637129695F2A7D392D5615D255CC3B0215E6AB8AC82D4409433039E53EA90DB3F738DB9D848FB020C1AA7C92B783EC7644D3EC83734A168244B2C058F3E34F8CE1305ABEFF07C936573EA2210000, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201906251330570_ModelUpdated', N'MVCProductsChallenge.Context.Migrations.Configuration', 0x1F8B0800000000000400ED59CD6EE33610BE17E83B083AB545D672B2976D60EF227592C2E83A09A2ECA2B78096C60E518A52492AB0B1E893F5D047EA2B74A83F4BA425CBDE24BB2D0A5F6C72F80D67E6E39033FEFBCFBF46EF5611731E41481AF3B17B3C18BA0EF0200E295F8EDD542D5EBD71DFBDFDF69BD14518AD9C8FA5DC6B2D872BB91CBB0F4A25A79E27830788881C443410B18C176A10C49147C2D83B190E7FF48E8F3D400817B11C67749B724523C87EE0CF49CC0348544AD82C0E81C9621C67FC0CD5B92211C884043076671F2737220ED340C9C903610CF8120608A060A55CE78C51827BF2812D5C87701E2BA270C7A71F24F84AC47CE9273840D8DD3A01945B1026A1B0E47423DED7A8E18936CADB2C2CA18254AA38DA13F0F875E125CF5C7E90AFDDCA8BE8C70BF4B75A6BAB335F8EDDC287AE63EA3A9D30A1E55A3C9D056890C151908342E0C869173EAA6883ECD29F23679232950A1873489520287193CE190D7E81F55DFC1BF0314F19AB6F1F0DC0B9C6000EA1BE04845ADFC2A2306A1ABA8ED75CE7990BAB65B535B9BD53AE5E9FB8CE152A277306153B6ABEF1552CE067E0208882F0862805826B0CC8FC6B69B77469B9050551EA4452E249739D1959BD4797A907743B59B9CE255D41588E14FBF8C0291E4C5CA4440ABB549D830C044D72F67CB62ECB27DDCA0B2668B5BBDDBB0B8A0650429C434023C25CE746E0B72265BD711D3F201A707FF489802CB0E718CE4A097EBFC3E474A8D53E72259595D331130D8C995DB857E4912EB37DB5FBD5756E816532F281264D3D7AFEBE3C8D185F1147B7316BAEAFE6EFEF8858022682BBB843C88F5311183B1D799BACD227D7E4DB7E927CA317FC9F737AE59C9AC7F4C00B24835DF4954FC7DD92969DDC2D09DE8FBB696433B73CB85379C9C872F36E3890CB69D4CC08CFC1640C5A0882AD31C875A635233583680EA224252781A28F68D647C2521C185A916DC89F35A58F6D07E7AEAC0F9E49190734F3954DCF4DD89B5A2F78E8F4E180956FF384334377D1041D84E1D6DB348FF4353F07060A1C6D90BE5126440624B4798D16857BEDACCAACD6CECC5DFD6029C30403429F70C2F0712B31D0942B3B1B511ED084B01EFE31D6F6CC65DAEC4A8B39730E09709D867A38A18F7AE3D960EFA45268046697B3465E8D78F655A5AB075C5131BB3A8A6555619D732C278AA32E8BAC681243E3FAA0ACCCB7493B2623BC5E1099CE76989CF20654CDF8AD78B57C5B13EDCACB66647A1ED1CA26D31C2BD43D4F960D688135628F925B2E812AFE9BBAD3CB0BCFB240F55A2AD4D18C2409A6D85AC55A8C387E5EAE4E5EF9FB576F518EE105724B1157EDB6D2840F04B204631655E34E2FA9900A5FB4644EF4853509234BCC647B0B0D4B6D06A1EDC095C42C17942F8FEED2BD3A0776A228802ED1C848279BEC416447DE5E99F50F082362CBF36B12B334E2ED69AF6BF5A6886BA26CC6FBA335EAB43A5C63A23F9E9143EB883BD26B1766568335B1A8590E7463342BAD3A5473666F4BCBB7D9164BCB291B73E419A4B2AE1A8BC7D65BA0792EF6393579D27BEA9393A5FE834FCFF6D5CF7382AC92A485A5F9E40B47CFBA144C914A7B75391897C0A848C8BB7B995686CE45747F237EA4A1CECEFE5A2A88065A60E0FFCE268CA2BD1B8119E1740152E52F7FF764787C623441BF9E86A42765C8FA75255FBC0EA7DAA93B2BED3D1B4276BB8F3F12113C10F15D4456DFD7F10E6CE9B5E21DDEA6CB3C613D78A7F8EC5E8DDD4FD9CA5367FAEB7D63F191732D908DA7CED0F9E3F35A7CE14BB4F842FCAE9EACC59779AC13E8A04ED97FE30CB4B49FF6216E9BF79EAE99F075340FBE4CA3E0051B03FFAA26805D3DF5AACFBB2AFCFC76C7F4338F31D639DF5BCBD68EFA7F57F9DFA1676BBDFDA51A046D0D813EFD806D6B9FA7F4B75F73C8B5DAFFD7C87649971B08FD6F3687A0C1B24A66CA1771C9796347A588914067A008DE57E44CE05382040AA70390326BDE17ADD78B680EE1945FA72A49159A0CD19C35FE17D087A64B7FD6DF68EE79749D3D34E4539880DBA4FACABDE63FA59485D5BE2FB7E4FA16087D1A8B5B49C752E9DB69B9AE90AE62DE13A8705F9544EE204A1882C96BEE935A3B7B8FBD7D90F01E962458978FF27690DD8168BA7D744EC952904816189BF5F813391C46ABB7FF00F5ACAFEAC6210000, N'6.2.0-61023')
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201907021423457_ProductNameChange', N'MVCProductsChallenge.Context.Migrations.Configuration', 0x1F8B0800000000000400ED59CD6EE33610BE17E83B083AB545D672B2976D60EF227592C2E83A09A2ECA2B78096C60E518A52492AB0B1E893F5D047EA2B74A83F4BA425CBDE24BB2D8A00814DCE7CC3F92567FCF79F7F8DDEAD22E63C829034E663F77830741DE0411C52BE1CBBA95ABC7AE3BE7BFBED37A38B305A391F4BBAD79A0E39B91CBB0F4A25A79E27830788881C443410B18C176A10C49147C2D83B190E7FF48E8F3D400817B11C67749B724523C8BEE0D749CC0348544AD82C0E81C9621D77FC0CD5B92211C884043076671F2737220ED340C9C903610CF8120608A060A55CE78C518267F2812D5C87701E2BA2F0C4A71F24F84AC47CE927B840D8DD3A01A45B1026A1D0E47443DE57A9E18956CADB309650412A551CED0978FCBAB09267B21F646BB7B222DAF102EDADD65AEBCC9663B7B0A1EB98B24E274C68BA164B670E1A647014E4A0203872DA898FAAB0C1E8D27F47CE24652A1530E6902A4190E2269D331AFC02EBBBF837E0639E32563F3E2A807B8D055C42790908B5BE8545A1D434741DAFC9E7998C155B8D27D777CAD5EB13D7B942E164CEA08A8E9A6D7C150BF8193808A220BC214A81E01A0332FB5AD22D599A6E41419432312831D35C674656EFD164EA01CD4E56AE73495710962BC5393E708A89894C4AA4B04BD439C840D0248F9ECF9665D9A45B7811095AEC6EF3EE82A2019410E710D08830D7B911F8A928596F5CC70F8806DC1F7D222073EC39BAB312829FEFB0381DAAB58FB192CACAE8588906C6CE2EDC2BF24897D9B9DAEDEA3AB7C0321AF94093A61CBD7F5F6623FA57C4D16DCC9AFCD5FEFD1D114BC04270177710F9712A02E3A4236F5355FAD49AFCD84F526F34C3FF35A757CDD1FF5FA002EC8A59F974015BC66267C09651DD2F60D3C80ED7325BA7F29291E5E6B1706000A7916CD681E7885FF45A0882ADD1CBF5F86ABA6A06D11C44198A9C048A3EA25E1F094B716168B9B6417FD6A43EB62D9CDBB2BE7826651CD0CC587645D8F8BD29F582874E9F20B0AA6C5E6666682E9AA081D0DFFA9866225FF37360A0C0D10AE97B64426440423BB051A370AF9355F5D43A9979AA1F2C61585640E8BC260C9FB4121D4DB9B26B10E5014D08EB611F83B76705D36A5752CC9D734880EBE2D3C3087DC41B8F05FB249540C331BB8C35F26A81675F50BA67408E2AB2AB542C7B092BD1B18928725D1665D10C0C8DEB83B24ADFA6EE9811E1F582C864B6C3E4216F40D594DF8A572BB835D2AEC26C7AA6678A563A99EA58AEEE995936A005D6F03D526EB9052AFF6FBA4D2F6F37CBB6D46BE94B4733922458626B7D6AB1E2F879933A79E5EFDFB345398617C82DAD5B75DA4A123E0BC8128C5D148D27BDA4422A7CC79239D137D6248C2C3233DA5BC2B0946604B4EDB832304B06FD3967EA6AD8AB3CB00B450174894A46BAD864CF20DBF336673635208C882D8FAE49CCD288B797BD2EEE4DEBD644D9ACF7476B746775B8C6467F3CA386D6117794D72ECCACF36A6251B309E8C668F65775A8E6CEDE9A968FB32D9A965B36E6C83382CABA6AAC38B6DE02CDBCD8276BF2A2F7D4999395FE83B3673BF7F36450DE88D4F9F39517F69355FE4D924A7A750D18E57E5494DEDDB34AAB16E7247A7E113FD250D7617F2D1544034D30F07F67134651DF0DC18C70BA00A9F237BE7B323C3E31869C5FCFC0D1933264FDA68E2FDE67536DD49D9DF49E031F7B9CC71F89081E88F82E22ABEFEB78078EEC5AF10E1FC36596B09EB6537C60AFC6EEA78CF3D499FE7ADF603E72AE0546E3A93374FEF8BC115EF81223BC103FAB271BE16516EB043A6812F6DFC881FA78699F686D33D9D3CD0ABE8ED9C0979903BC60DFFFAFEAF1EDE6A857FBDDD5C0E7573AD69C798CBECEE3BDB52BED68EF7775F71D72B6B6D35FAAFF6FEBF7FBB4FBDB789FA7B3B79F70186BB51FA531DA255D6E20F44FD41C824694553453BE88CB98374E5492185573068AE02545CE04BE1F48A0703B0029B3E17C3159BD88E6104EF975AA9254A1CA10CD5963D8AF93A64B7E36BE689E79749DBD2EE453A880C7A4FA9EBDE63FA59485D5B92FB7D4FA16089D8DC555A47DA9F495B45C57485731EF095498AF2A227710250CC1E435F7496D5ABDC7D93E48780F4B12ACCB97783BC86E4734CD3E3AA7642948240B8C0D3F7EC5180EA3D5DB7F00AD5D264B9B210000, N'6.2.0-61023')
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (2, N'n4ys5', N'Spark GTZ', 1, CAST(50000.00 AS Decimal(18, 2)), CAST(N'2019-07-02T10:01:44.207' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (3, N'9p8wk', N'Duplex apartment', 2, CAST(25000.00 AS Decimal(18, 2)), CAST(N'2019-07-03T08:31:29.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (4, N'w4kt2', N'Renault 4', 1, CAST(100.00 AS Decimal(18, 2)), CAST(N'2019-07-03T09:32:24.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (8, N'53561', N'Mercedes Benz 345', 1, CAST(85000.00 AS Decimal(18, 2)), CAST(N'2019-07-04T09:28:20.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (9, N'm4sii', N'Countries Club', 3, CAST(100000.00 AS Decimal(18, 2)), CAST(N'2019-07-04T09:28:58.520' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (10, N'aw738', N'Pulsar 45', 1, CAST(5000.00 AS Decimal(18, 2)), CAST(N'2019-07-04T09:30:16.510' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (11, N'vh31j', N'Spark GT2', 1, CAST(2500.00 AS Decimal(18, 2)), CAST(N'2019-07-04T09:31:04.280' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (12, N'4pm7w', N'Chevrolet 2019', 1, CAST(2019.00 AS Decimal(18, 2)), CAST(N'2019-07-08T09:16:16.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (13, N'o0ml8', N'Apartment', 2, CAST(5800.00 AS Decimal(18, 2)), CAST(N'2019-07-10T08:55:56.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (17, N'5cwwp', N'Ajiaco', 6, CAST(5.00 AS Decimal(18, 2)), CAST(N'2019-08-27T09:17:58.493' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (18, N'8vn16', N'Support', 5, CAST(100.00 AS Decimal(18, 2)), CAST(N'2019-08-27T09:20:58.220' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (19, N'p4z7z', N'Asus 450', 6, CAST(1200.00 AS Decimal(18, 2)), CAST(N'2019-08-28T08:45:44.297' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (22, N'spkch', N'desc', 1, CAST(2000.00 AS Decimal(18, 2)), CAST(N'2019-09-03T08:40:30.680' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (23, N'oikvd', N'Ajiaco', 2, CAST(8500.00 AS Decimal(18, 2)), CAST(N'2019-09-03T08:41:29.990' AS DateTime), 1)
INSERT [dbo].[Products] ([Id], [Identifier], [Description], [ProductTypeId], [Price], [CreationDate], [ProductStatus]) VALUES (24, N'8dpks', N'desc', 1, CAST(5.00 AS Decimal(18, 2)), CAST(N'2019-09-04T08:30:09.623' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (1, N'Vehicle')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (2, N'Apartment')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (3, N'Property')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (5, N'Service')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (6, N'Computer')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (7, N'Toys')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (10, N'test')
INSERT [dbo].[ProductTypes] ([Id], [Name]) VALUES (11, N'test')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
/****** Object:  Index [IX_ProductTypeId]    Script Date: 9/4/2019 8:48:00 AM ******/
CREATE NONCLUSTERED INDEX [IX_ProductTypeId] ON [dbo].[Products]
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductTypes] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.ProductTypes_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.ProductTypes_ProductTypeId]
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProduct]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from [Products].[dbo].[Products]
	where [Id] = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProductType]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProductType]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from [Products].[dbo].[ProductTypes]
	where [Id] = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductByDescriptionOrIdentifier]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductByDescriptionOrIdentifier]
	-- Add the parameters for the stored procedure here
	@Search nvarchar(max) null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @Search IS NULL
	BEGIN
	SELECT p.*, pt.[Name] as ProductTypeName
	from [Products].[dbo].[Products] as p
	inner join [Products].[dbo].[ProductTypes] as pt on p.[ProductTypeId] = pt.[Id]
	END
	ELSE
	BEGIN
	SELECT p.*, pt.[Name] as ProductTypeName
	from [Products].[dbo].[Products] as p
	inner join [Products].[dbo].[ProductTypes] as pt on p.[ProductTypeId] = pt.[Id]
	WHERE p.[Description] LIKE CONCAT('%', @Search, '%') or p.[Identifier] LIKE CONCAT('%', @Search, '%')
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductById]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductById]
	-- Add the parameters for the stored procedure here
	@ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1 p.*, pt.[Name] as ProductTypeName
	from [Products].[dbo].[Products] as p
	inner join [Products].[dbo].[ProductTypes] as pt on p.[ProductTypeId] = pt.[Id]
	where p.Id = @ProductId
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductTypeById]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductTypeById]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	from [Products].[dbo].[ProductTypes]
	where [Id] = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductTypeProductsCount]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductTypeProductsCount] 
	-- Add the parameters for the stored procedure here
	@ProductTypeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select count(*) as ProductCount from [Products].[dbo].[Products] where [ProductTypeId] = @ProductTypeId
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductTypes]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductTypes]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
from [Products].[dbo].[ProductTypes] as p
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProduct]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertProduct]
	-- Add the parameters for the stored procedure here
	@Identifier nvarchar(max),
	@Description nvarchar(max),
	@ProductTypeId int,
	@Price decimal(18,2),
	@CreationDate datetime,
	@ProductStatus int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into [Products].[dbo].[Products] values
	(@Identifier, @Description, @ProductTypeId, @Price, @CreationDate, @ProductStatus);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProductType]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertProductType]
	-- Add the parameters for the stored procedure here
	@Name nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into [Products].[dbo].[ProductTypes] values
	(@Name);
END
GO
/****** Object:  StoredProcedure [dbo].[ProductIdentifierExists]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProductIdentifierExists]
	-- Add the parameters for the stored procedure here
	@Identifier nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select count(*) as ProductCount from [Products].[dbo].[Products] where [Identifier] = @Identifier
END
GO
/****** Object:  StoredProcedure [dbo].[ProductTypeNameExists]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ProductTypeNameExists]
	-- Add the parameters for the stored procedure here
	@Name nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select count(*) as ProductTypeCount from [Products].[dbo].[ProductTypes] where [Name] = @Name
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProduct]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Description nvarchar(max),
	@ProductTypeId int,
	@Price decimal(18,2),
	@ProductStatus int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update [Products].[dbo].[Products]
	set [Description] = @Description,
	[ProductTypeId] = @ProductTypeId,
	[Price] = @Price,
	[ProductStatus] = @ProductStatus
	where [Id] = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductType]    Script Date: 9/4/2019 8:48:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProductType]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Name nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update [Products].[dbo].[ProductTypes] set [Name] = @Name
	where [Id] = @Id;
END
GO
USE [master]
GO
ALTER DATABASE [Products] SET  READ_WRITE 
GO
