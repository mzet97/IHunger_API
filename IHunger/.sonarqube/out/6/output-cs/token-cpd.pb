ì6
ZD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Configuration\ApiConfig.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
Configuration &
{ 
public 

static 
class 
	ApiConfig !
{ 
public 
static 
IServiceCollection (
AddApiConfig) 5
(5 6
this6 :
IServiceCollection; M
servicesN V
)V W
{ 	
services 
. 
AddMemoryCache #
(# $
)$ %
;% &
services 
. 
AddMiniProfiler $
($ %
options% ,
=>- /
{ 
options 
. 
RouteBasePath %
=& '
$str( 3
;3 4
options 
. 
PopupRenderPosition +
=, -
StackExchange. ;
.; <
	Profiling< E
.E F
RenderPositionF T
.T U

BottomLeftU _
;_ `
options 
. %
PopupShowTimeWithChildren 1
=2 3
true4 8
;8 9
} 
) 
. 
AddEntityFramework !
(! "
)" #
;# $
services 
. 
AddControllers #
(# $
)$ %
;% &
services 
. 
AddApiVersioning %
(% &
options& -
=>. 0
{ 
options   
.   /
#AssumeDefaultVersionWhenUnspecified   ;
=  < =
true  > B
;  B C
options!! 
.!! 
DefaultApiVersion!! )
=!!* +
new!!, /

ApiVersion!!0 :
(!!: ;
$num!!; <
,!!< =
$num!!> ?
)!!? @
;!!@ A
options"" 
."" 
ReportApiVersions"" )
=""* +
true"", 0
;""0 1
}## 
)## 
;## 
services%% 
.%% #
AddVersionedApiExplorer%% ,
(%%, -
options%%- 4
=>%%5 7
{&& 
options'' 
.'' 
GroupNameFormat'' '
=''( )
$str''* 2
;''2 3
options(( 
.(( %
SubstituteApiVersionInUrl(( 1
=((2 3
true((4 8
;((8 9
})) 
))) 
;)) 
services++ 
.++ 
	Configure++ 
<++ 
ApiBehaviorOptions++ 1
>++1 2
(++2 3
options++3 :
=>++; =
{,, 
options-- 
.-- +
SuppressModelStateInvalidFilter-- 7
=--8 9
true--: >
;--> ?
}.. 
).. 
;.. 
services00 
.00 
AddCors00 
(00 
options00 $
=>00% '
{11 
options22 
.22 
	AddPolicy22 !
(22! "
$str22" /
,22/ 0
builder33 
=>33 
builder44 
.55 
AllowAnyOrigin55 '
(55' (
)55( )
.66 
AllowAnyMethod66 '
(66' (
)66( )
.77 
AllowAnyHeader77 '
(77' (
)77( )
)77) *
;77* +
options:: 
.:: 
	AddPolicy:: !
(::! "
$str::" .
,::. /
builder;; 
=>;; 
builder<< 
.== 
WithMethods== (
(==( )
$str==) .
)==. /
.>> 
WithOrigins>> (
(>>( )
$str>>) =
)>>= >
.?? 7
+SetIsOriginAllowedToAllowWildcardSubdomains?? H
(??H I
)??I J
.AA 
AllowAnyHeaderAA +
(AA+ ,
)AA, -
)AA- .
;AA. /
}BB 
)BB 
;BB 
servicesDD 
.DD 
AddControllersDD #
(DD# $
)DD$ %
.EE 
AddNewtonsoftJsonEE "
(EE" #
optionsEE# *
=>EE+ -
optionsEE. 5
.EE5 6
SerializerSettingsEE6 H
.EEH I!
ReferenceLoopHandlingEEI ^
=EE_ `

NewtonsoftEEa k
.EEk l
JsonEEl p
.EEp q"
ReferenceLoopHandling	EEq Ü
.
EEÜ á
Ignore
EEá ç
)
EEç é
;
EEé è
returnGG 
servicesGG 
;GG 
}HH 	
publicJJ 
staticJJ 
IApplicationBuilderJJ )
UseApiConfigJJ* 6
(JJ6 7
thisJJ7 ;
IApplicationBuilderJJ< O
appJJP S
,JJS T
IWebHostEnvironmentJJU h
envJJi l
,JJl m
IServiceProviderJJn ~
serviceProvider	JJ é
)
JJé è
{KK 	
appLL 
.LL 
UseHttpLoggingLL 
(LL 
)LL  
;LL  !
appNN 
.NN 
UseMiniProfilerNN 
(NN  
)NN  !
;NN! "
ifPP 
(PP 
envPP 
.PP 
IsDevelopmentPP !
(PP! "
)PP" #
)PP# $
{QQ 
appRR 
.RR 
UseCorsRR 
(RR 
$strRR )
)RR) *
;RR* +
appSS 
.SS %
UseDeveloperExceptionPageSS -
(SS- .
)SS. /
;SS/ 0
}TT 
elseUU 
{VV 
appWW 
.WW 
UseCorsWW 
(WW 
$strWW (
)WW( )
;WW) *
appXX 
.XX 
UseHstsXX 
(XX 
)XX 
;XX 
}YY 
app[[ 
.[[ 
UseMiddleware[[ 
<[[ 
ExceptionMiddleware[[ 1
>[[1 2
([[2 3
)[[3 4
;[[4 5
app]] 
.]] 
UseHttpsRedirection]] #
(]]# $
)]]$ %
;]]% &
app__ 
.__ 

UseRouting__ 
(__ 
)__ 
;__ 
app`` 
.`` 
UseAuthentication`` !
(``! "
)``" #
;``# $
appaa 
.aa 
UseAuthorizationaa  
(aa  !
)aa! "
;aa" #
appcc 
.cc 
UseStaticFilescc 
(cc 
)cc  
;cc  !
appee 
.ee 
UseEndpointsee 
(ee 
	endpointsee &
=>ee' )
{ff 
	endpointsgg 
.gg 
MapControllersgg (
(gg( )
)gg) *
;gg* +
}hh 
)hh 
;hh 
returnjj 
appjj 
;jj 
}kk 	
}ll 
}mm Ï\
aD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Configuration\AutoMapperConfig.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
Configuration &
{ 
public 

class 
AutoMapperConfig !
:" #
Profile$ +
{ 
public 
AutoMapperConfig 
(  
)  !
{ 	
	CreateMap 
< 
CategoryProduct %
,% &$
CategoryProductViewModel' ?
>? @
(@ A
)A B
;B C
	CreateMap 
< +
CategoryProductCreatedViewModel 5
,5 6
CategoryProduct7 F
>F G
(G H
)H I
;I J
	CreateMap 
< $
CategoryProductViewModel .
,. /
CategoryProduct0 ?
>? @
(@ A
)A B
;B C
	CreateMap 
< 
CategoryRestaurant (
,( )'
CategoryRestaurantViewModel* E
>E F
(F G
)G H
;H I
	CreateMap 
< .
"CategoryRestaurantCreatedViewModel 8
,8 9
CategoryRestaurant: L
>L M
(M N
)N O
;O P
	CreateMap 
< '
CategoryRestaurantViewModel 1
,1 2
CategoryRestaurant3 E
>E F
(F G
)G H
;H I
	CreateMap 
< 
AddressUser !
,! " 
AddressUserViewModel# 7
>7 8
(8 9
)9 :
;: ;
	CreateMap 
< '
AddressUserCreatedViewModel 1
,1 2
AddressUser3 >
>> ?
(? @
)@ A
;A B
	CreateMap 
<  
AddressUserViewModel *
,* +
AddressUser, 7
>7 8
(8 9
)9 :
;: ;
	CreateMap   
<   
AddressRestaurant   '
,  ' (&
AddressRestaurantViewModel  ) C
>  C D
(  D E
)  E F
;  F G
	CreateMap!! 
<!! -
!AddressRestaurantCreatedViewModel!! 7
,!!7 8
AddressRestaurant!!9 J
>!!J K
(!!K L
)!!L M
;!!M N
	CreateMap"" 
<"" &
AddressRestaurantViewModel"" 0
,""0 1
AddressRestaurant""2 C
>""C D
(""D E
)""E F
;""F G
	CreateMap$$ 
<$$ 

Restaurant$$  
,$$  !
RestaurantViewModel$$" 5
>$$5 6
($$6 7
)$$7 8
.%% 
	ForMember%% 
(%% 
dest%% 
=>%%  "
dest%%# '
.%%' (
AddressRestaurant%%( 9
,%%9 :
opt%%; >
=>%%? A
opt%%B E
.%%E F
MapFrom%%F M
(%%M N
src%%N Q
=>%%R T
src%%U X
.%%X Y
AddressRestaurant%%Y j
)%%j k
)%%k l
.&& 
	ForMember&& 
(&& 
dest&& 
=>&&  "
dest&&# '
.&&' (
CategoryRestaurant&&( :
,&&: ;
opt&&< ?
=>&&@ B
opt&&C F
.&&F G
MapFrom&&G N
(&&N O
src&&O R
=>&&S U
src&&V Y
.&&Y Z
CategoryRestaurant&&Z l
)&&l m
)&&m n
.'' 
	ForMember'' 
('' 
dest'' 
=>''  "
dest''# '
.''' (
Comments''( 0
,''0 1
opt''2 5
=>''6 8
opt''9 <
.''< =
MapFrom''= D
(''D E
src''E H
=>''I K
src''L O
.''O P
Comments''P X
)''X Y
)''Y Z
.(( 

ReverseMap(( 
((( 
)(( 
;(( 
	CreateMap** 
<** &
RestaurantCreatedViewModel** 0
,**0 1

Restaurant**2 <
>**< =
(**= >
)**> ?
;**? @
	CreateMap,, 
<,, 
RestaurantViewModel,, )
,,,) *

Restaurant,,+ 5
>,,5 6
(,,6 7
),,7 8
.-- 
	ForMember-- 
(-- 
dest-- 
=>--  "
dest--# '
.--' (
AddressRestaurant--( 9
,--9 :
opt--; >
=>--? A
opt--B E
.--E F
MapFrom--F M
(--M N
src--N Q
=>--R T
src--U X
.--X Y
AddressRestaurant--Y j
)--j k
)--k l
... 
	ForMember.. 
(.. 
dest.. 
=>..  "
dest..# '
...' (
CategoryRestaurant..( :
,..: ;
opt..< ?
=>..@ B
opt..C F
...F G
MapFrom..G N
(..N O
src..O R
=>..S U
src..V Y
...Y Z
CategoryRestaurant..Z l
)..l m
)..m n
;..n o
	CreateMap00 
<00 &
RestaurantCreatedViewModel00 0
,000 1

Restaurant002 <
>00< =
(00= >
)00> ?
.11 
	ForMember11 
(11 
dest11 
=>11  "
dest11# '
.11' (
AddressRestaurant11( 9
,119 :
opt11; >
=>11? A
opt11B E
.11E F
MapFrom11F M
(11M N
src11N Q
=>11R T
src11U X
.11X Y
Address11Y `
)11` a
)11a b
;11b c
	CreateMap33 
<33 
Comment33 
,33 
CommentViewModel33 /
>33/ 0
(330 1
)331 2
.44 

ReverseMap44 
(44 
)44 
;44 
	CreateMap66 
<66 #
CommentCreatedViewModel66 -
,66- .
Comment66/ 6
>666 7
(667 8
)668 9
.77 
	ForMember77 
(77 
dest77 
=>77  "
dest77# '
.77' (
Text77( ,
,77, -
opt77. 1
=>772 4
opt775 8
.778 9
MapFrom779 @
(77@ A
src77A D
=>77E G
src77H K
.77K L
Text77L P
)77P Q
)77Q R
.88 
	ForMember88 
(88 
dest88 
=>88  "
dest88# '
.88' (
Starts88( .
,88. /
opt880 3
=>884 6
opt887 :
.88: ;
MapFrom88; B
(88B C
src88C F
=>88G I
src88J M
.88M N
Starts88N T
)88T U
)88U V
;88V W
	CreateMap:: 
<:: 
Product:: 
,:: 
ProductViewModel:: /
>::/ 0
(::0 1
)::1 2
.;; 
	ForMember;; 
(;; 
dest;; 
=>;;  "
dest;;# '
.;;' (
CategoryProduct;;( 7
,;;7 8
opt;;9 <
=>;;= ?
opt;;@ C
.;;C D
MapFrom;;D K
(;;K L
src;;L O
=>;;P R
src;;S V
.;;V W
CategoryProduct;;W f
);;f g
);;g h
.<< 
	ForMember<< 
(<< 
dest<< 
=><<  "
dest<<# '
.<<' (

Restaurant<<( 2
,<<2 3
opt<<4 7
=><<8 :
opt<<; >
.<<> ?
MapFrom<<? F
(<<F G
src<<G J
=><<K M
src<<N Q
.<<Q R

Restaurant<<R \
)<<\ ]
)<<] ^
.== 

ReverseMap== 
(== 
)== 
;== 
	CreateMap?? 
<?? #
ProductCreatedViewModel?? -
,??- .
Product??/ 6
>??6 7
(??7 8
)??8 9
.@@ 
	ForMember@@ 
(@@ 
dest@@ 
=>@@  "
dest@@# '
.@@' (
IdRestaurant@@( 4
,@@4 5
opt@@6 9
=>@@: <
opt@@= @
.@@@ A
MapFrom@@A H
(@@H I
src@@I L
=>@@M O
src@@P S
.@@S T
IdRestaurant@@T `
)@@` a
)@@a b
.AA 
	ForMemberAA 
(AA 
destAA 
=>AA  "
destAA# '
.AA' (
IdCategoryProductAA( 9
,AA9 :
optAA; >
=>AA? A
optAAB E
.AAE F
MapFromAAF M
(AAM N
srcAAN Q
=>AAR T
srcAAU X
.AAX Y
IdCategoryProductAAY j
)AAj k
)AAk l
;AAl m
	CreateMapCC 
<CC 
CouponCC 
,CC 
CouponViewModelCC -
>CC- .
(CC. /
)CC/ 0
.DD 

ReverseMapDD 
(DD 
)DD 
;DD 
	CreateMapFF 
<FF 
CouponFF 
,FF "
CouponCreatedViewModelFF 4
>FF4 5
(FF5 6
)FF6 7
.GG 

ReverseMapGG 
(GG 
)GG 
;GG 
	CreateMapII 
<II "
CouponCreatedViewModelII ,
,II, -
CouponII. 4
>II4 5
(II5 6
)II6 7
.JJ 

ReverseMapJJ 
(JJ 
)JJ 
;JJ 
	CreateMapLL 
<LL 
CouponViewModelLL %
,LL% &
CouponLL' -
>LL- .
(LL. /
)LL/ 0
.LL0 1
	ForMemberMM 
(MM 
xMM 
=>MM 
xMM  
.MM  !
OrdersMM! '
,MM' (
optMM) ,
=>MM- /
optMM0 3
.MM3 4
IgnoreMM4 :
(MM: ;
)MM; <
)MM< =
;MM= >
	CreateMapOO 
<OO 
OrderStatusOO !
,OO! " 
OrderStatusViewModelOO# 7
>OO7 8
(OO8 9
)OO9 :
.PP 

ReverseMapPP 
(PP 
)PP 
;PP 
	CreateMapRR 
<RR  
OrderStatusViewModelRR *
,RR* +
OrderStatusRR, 7
>RR7 8
(RR8 9
)RR9 :
.SS 

ReverseMapSS 
(SS 
)SS 
;SS 
	CreateMapUU 
<UU 
ItemUU 
,UU 
ItemViewModelUU )
>UU) *
(UU* +
)UU+ ,
.VV 

ReverseMapVV 
(VV 
)VV 
;VV 
	CreateMapXX 
<XX 
ItemViewModelXX #
,XX# $
ItemXX% )
>XX) *
(XX* +
)XX+ ,
.YY 

ReverseMapYY 
(YY 
)YY 
;YY 
	CreateMap[[ 
<[[ 
Order[[ 
,[[ 
OrderViewModel[[ +
>[[+ ,
([[, -
)[[- .
.\\ 

ReverseMap\\ 
(\\ 
)\\ 
;\\ 
	CreateMap^^ 
<^^ 
OrderViewModel^^ $
,^^$ %
Order^^& +
>^^+ ,
(^^, -
)^^- .
.__ 

ReverseMap__ 
(__ 
)__ 
;__ 
	CreateMapaa 
<aa 
Orderaa 
,aa !
OrderCreatedViewModelaa 2
>aa2 3
(aa3 4
)aa4 5
.bb 

ReverseMapbb 
(bb 
)bb 
;bb 
	CreateMapdd 
<dd !
OrderCreatedViewModeldd +
,dd+ ,
Orderdd- 2
>dd2 3
(dd3 4
)dd4 5
.ee 

ReverseMapee 
(ee 
)ee 
;ee 
}gg 	
}hh 
}ii È<
jD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Configuration\DependencyInjectionConfig.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
Configuration &
{ 
public 

static 
class %
DependencyInjectionConfig 1
{ 
public 
static 
IServiceCollection (
ResolveDependencies) <
(< =
this= A
IServiceCollectionB T
servicesU ]
)] ^
{ 	
services 
. 
	AddScoped 
< !
DataIdentityDbContext 4
>4 5
(5 6
)6 7
;7 8
services 
. 
	AddScoped 
< 
	INotifier (
,( )
Notifier* 2
>2 3
(3 4
)4 5
;5 6
services 
. 
AddSingleton !
<! " 
IHttpContextAccessor" 6
,6 7
HttpContextAccessor8 K
>K L
(L M
)M N
;N O
services 
. 
	AddScoped 
< 
IUser $
,$ %

AspNetUser& 0
>0 1
(1 2
)2 3
;3 4
services 
. 
	AddScoped 
< 
RoleManager *
<* +
IdentityRole+ 7
<7 8
Guid8 <
>< =
>= >
>> ?
(? @
)@ A
;A B
services   
.   
	AddScoped   
<   
UserManager   *
<  * +
User  + /
>  / 0
>  0 1
(  1 2
)  2 3
;  3 4
services"" 
."" 
AddTransient"" !
<""! "
IConfigureOptions""" 3
<""3 4
SwaggerGenOptions""4 E
>""E F
,""F G#
ConfigureSwaggerOptions""H _
>""_ `
(""` a
)""a b
;""b c
services$$ 
.$$ 
	AddScoped$$ 
<$$ 
IUnitOfWork$$ *
,$$* +

UnitOfWork$$, 6
>$$6 7
($$7 8
)$$8 9
;$$9 :
services'' 
.'' 
	AddScoped'' 
<'' (
IAddressRestaurantRepository'' ;
,''; <'
AddressRestaurantRepository''= X
>''X Y
(''Y Z
)''Z [
;''[ \
services(( 
.(( 
	AddScoped(( 
<(( "
IAddressUserRepository(( 5
,((5 6!
AddressUserRepository((7 L
>((L M
(((M N
)((N O
;((O P
services)) 
.)) 
	AddScoped)) 
<)) &
ICategoryProductRepository)) 9
,))9 :%
CategoryProductRepository)); T
>))T U
())U V
)))V W
;))W X
services** 
.** 
	AddScoped** 
<** )
ICategoryRestaurantRepository** <
,**< =(
CategoryRestaurantRepository**> Z
>**Z [
(**[ \
)**\ ]
;**] ^
services++ 
.++ 
	AddScoped++ 
<++ 
ICommentRepository++ 1
,++1 2
CommentRepository++3 D
>++D E
(++E F
)++F G
;++G H
services,, 
.,, 
	AddScoped,, 
<,, 
ICouponRepository,, 0
,,,0 1
CouponRepository,,2 B
>,,B C
(,,C D
),,D E
;,,E F
services-- 
.-- 
	AddScoped-- 
<-- 
IItemRepository-- .
,--. /
ItemRepository--0 >
>--> ?
(--? @
)--@ A
;--A B
services.. 
... 
	AddScoped.. 
<.. 
IOrderRepository.. /
,../ 0
OrderRepository..1 @
>..@ A
(..A B
)..B C
;..C D
services// 
.// 
	AddScoped// 
<// "
IOrderStatusRepository// 5
,//5 6!
OrderStatusRepository//7 L
>//L M
(//M N
)//N O
;//O P
services00 
.00 
	AddScoped00 
<00 
IProductRepository00 1
,001 2
ProductRepository003 D
>00D E
(00E F
)00F G
;00G H
services11 
.11 
	AddScoped11 
<11 !
IRestaurantRepository11 4
,114 5 
RestaurantRepository116 J
>11J K
(11K L
)11L M
;11M N
services22 
.22 
	AddScoped22 
<22 "
IProfileUserRepository22 5
,225 6!
ProfileUserRepository227 L
>22L M
(22M N
)22N O
;22O P
services77 
.77 
	AddScoped77 
<77 %
IAddressRestaurantService77 8
,778 9$
AddressRestaurantService77: R
>77R S
(77S T
)77T U
;77U V
services88 
.88 
	AddScoped88 
<88 
IAddressUserService88 2
,882 3
AddressUserService884 F
>88F G
(88G H
)88H I
;88I J
services99 
.99 
	AddScoped99 
<99 #
ICategoryProductService99 6
,996 7"
CategoryProductService998 N
>99N O
(99O P
)99P Q
;99Q R
services:: 
.:: 
	AddScoped:: 
<:: &
ICategoryRestaurantService:: 9
,::9 :%
CategoryRestaurantService::; T
>::T U
(::U V
)::V W
;::W X
services;; 
.;; 
	AddScoped;; 
<;; 
ICommentService;; .
,;;. /
CommentService;;0 >
>;;> ?
(;;? @
);;@ A
;;;A B
services<< 
.<< 
	AddScoped<< 
<<< 
ICouponService<< -
,<<- .
CouponService<</ <
><<< =
(<<= >
)<<> ?
;<<? @
services== 
.== 
	AddScoped== 
<== 
IItemService== +
,==+ ,
ItemService==- 8
>==8 9
(==9 :
)==: ;
;==; <
services>> 
.>> 
	AddScoped>> 
<>> 
IOrderService>> ,
,>>, -
OrderService>>. :
>>>: ;
(>>; <
)>>< =
;>>= >
services?? 
.?? 
	AddScoped?? 
<?? 
IOrderStatusService?? 2
,??2 3
OrderStatusService??4 F
>??F G
(??G H
)??H I
;??I J
services@@ 
.@@ 
	AddScoped@@ 
<@@ 
IProductService@@ .
,@@. /
ProductService@@0 >
>@@> ?
(@@? @
)@@@ A
;@@A B
servicesAA 
.AA 
	AddScopedAA 
<AA 
IRestaurantServiceAA 1
,AA1 2
RestaurantServiceAA3 D
>AAD E
(AAE F
)AAF G
;AAG H
servicesBB 
.BB 
	AddScopedBB 
<BB 
IUserServiceBB +
,BB+ ,
UserServiceBB- 8
>BB8 9
(BB9 :
)BB: ;
;BB; <
servicesCC 
.CC 
	AddScopedCC 
<CC 
IAuthServiceCC +
,CC+ ,
AuthServiceCC- 8
>CC8 9
(CC9 :
)CC: ;
;CC; <
returnGG 
servicesGG 
;GG 
}HH 	
}II 
}JJ µ3
_D:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Configuration\IdentityConfig.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
Configuration &
{ 
public 

static 
class 
IdentityConfig &
{ 
public 
static 
IServiceCollection (
AddIdentityConfig) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
,[ \
IConfiguration 
configuration '
)' (
{ 	
services 
. 

AddLogging 
(  
loggingBuilder  .
=>/ 1
{ 
loggingBuilder 
. 

AddConsole )
() *
)* +
. 
	AddFilter 
( 
DbLoggerCategory /
./ 0
Database0 8
.8 9
Command9 @
.@ A
NameA E
,E F
LogLevelG O
.O P
InformationP [
)[ \
;\ ]
loggingBuilder 
. 
AddDebug '
(' (
)( )
;) *
} 
) 
; 
services!! 
.!! 
AddDbContext!! !
<!!! "!
DataIdentityDbContext!!" 7
>!!7 8
(!!8 9
options!!9 @
=>!!A C
{"" 
options$$ 
.$$ 
	UseNpgsql$$ !
($$! "
configuration$$" /
.$$/ 0
GetConnectionString$$0 C
($$C D
$str$$D W
)$$W X
)$$X Y
;$$Y Z
options%% 
.%% &
EnableSensitiveDataLogging%% 2
(%%2 3
true%%3 7
)%%7 8
;%%8 9
}&& 
)&& 
;&& 
services(( 
.(( 
AddDefaultIdentity(( '
<((' (
User((( ,
>((, -
(((- .
options((. 5
=>((6 8
{)) 
options** 
.** 
Password**  
.**  !
RequireDigit**! -
=**. /
true**0 4
;**4 5
options++ 
.++ 
Password++  
.++  !
RequireLowercase++! 1
=++2 3
true++4 8
;++8 9
options,, 
.,, 
Password,,  
.,,  !"
RequireNonAlphanumeric,,! 7
=,,8 9
true,,: >
;,,> ?
options-- 
.-- 
Password--  
.--  !
RequireUppercase--! 1
=--2 3
true--4 8
;--8 9
options.. 
... 
Password..  
...  !
RequiredLength..! /
=..0 1
$num..2 3
;..3 4
options// 
.// 
Password//  
.//  !
RequiredUniqueChars//! 4
=//5 6
$num//7 8
;//8 9
options00 
.00 
SignIn00 
.00 #
RequireConfirmedAccount00 6
=007 8
true009 =
;00= >
options22 
.22 
User22 
.22 %
AllowedUserNameCharacters22 6
=227 8
$str33 ^
;33^ _
options44 
.44 
User44 
.44 
RequireUniqueEmail44 /
=440 1
true442 6
;446 7
}55 
)55 
.66 
AddRoles66 
<66 
IdentityRole66 &
<66& '
Guid66' +
>66+ ,
>66, -
(66- .
)66. /
.77 $
AddEntityFrameworkStores77 )
<77) *!
DataIdentityDbContext77* ?
>77? @
(77@ A
)77A B
.88 $
AddDefaultTokenProviders88 )
(88) *
)88* +
;88+ ,
var;; 
appSettingsSection;; "
=;;# $
configuration;;% 2
.;;2 3

GetSection;;3 =
(;;= >
$str;;> K
);;K L
;;;L M
services<< 
.<< 
	Configure<< 
<<< 
AppSettings<< *
><<* +
(<<+ ,
appSettingsSection<<, >
)<<> ?
;<<? @
var>> 
appSettings>> 
=>> 
appSettingsSection>> 0
.>>0 1
Get>>1 4
<>>4 5
AppSettings>>5 @
>>>@ A
(>>A B
)>>B C
;>>C D
var?? 
key?? 
=?? 
Encoding?? 
.?? 
ASCII?? $
.??$ %
GetBytes??% -
(??- .
appSettings??. 9
.??9 :
Secret??: @
)??@ A
;??A B
servicesAA 
.AA 
AddAuthenticationAA &
(AA& '
optionsAA' .
=>AA/ 1
{BB 
optionsCC 
.CC %
DefaultAuthenticateSchemeCC 1
=CC2 3
JwtBearerDefaultsCC4 E
.CCE F 
AuthenticationSchemeCCF Z
;CCZ [
optionsDD 
.DD "
DefaultChallengeSchemeDD .
=DD/ 0
JwtBearerDefaultsDD1 B
.DDB C 
AuthenticationSchemeDDC W
;DDW X
}EE 
)EE 
.EE 
AddJwtBearerEE 
(EE 
optionsEE #
=>EE$ &
{FF 
optionsGG 
.GG  
RequireHttpsMetadataGG ,
=GG- .
trueGG/ 3
;GG3 4
optionsHH 
.HH 
	SaveTokenHH !
=HH" #
trueHH$ (
;HH( )
optionsII 
.II %
TokenValidationParametersII 1
=II2 3
newII4 7%
TokenValidationParametersII8 Q
{JJ $
ValidateIssuerSigningKeyKK ,
=KK- .
trueKK/ 3
,KK3 4
IssuerSigningKeyLL $
=LL% &
newLL' * 
SymmetricSecurityKeyLL+ ?
(LL? @
keyLL@ C
)LLC D
,LLD E
ValidateIssuerMM "
=MM# $
trueMM% )
,MM) *
ValidateAudienceNN $
=NN% &
trueNN' +
,NN+ ,
ValidAudienceOO !
=OO" #
appSettingsOO$ /
.OO/ 0
ValidOnOO0 7
,OO7 8
ValidIssuerPP 
=PP  !
appSettingsPP" -
.PP- .
IssuerPP. 4
}QQ 
;QQ 
}RR 
)RR 
;RR 
returnTT 
servicesTT 
;TT 
}UU 	
}VV 
}WW ãW
^D:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Configuration\SwaggerConfig.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
Configuration &
{ 
public 

static 
class 
SwaggerConfig %
{ 
public 
static 
IServiceCollection (
AddSwaggerConfig) 9
(9 :
this: >
IServiceCollection? Q
servicesR Z
)Z [
{ 	
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
c 
. 
OperationFilter !
<! " 
SwaggerDefaultValues" 6
>6 7
(7 8
)8 9
;9 :
c 
. !
AddSecurityDefinition '
(' (
$str( 2
,2 3
new4 7!
OpenApiSecurityScheme8 M
{ 
Description 
=  !
$str" X
,X Y
Name 
= 
$str *
,* +
Scheme 
= 
$str %
,% &
BearerFormat  
=! "
$str# (
,( )
In 
= 
ParameterLocation *
.* +
Header+ 1
,1 2
Type 
= 
SecuritySchemeType -
.- .
Http. 2
,2 3
}   
)   
;   
c"" 
."" "
AddSecurityRequirement"" (
(""( )
new"") ,&
OpenApiSecurityRequirement""- G
{## 
{$$ 
new%% !
OpenApiSecurityScheme%% 1
{&& 
	Reference'' %
=''& '
new''( +
OpenApiReference'', <
{(( 
Type))  $
=))% &
ReferenceType))' 4
.))4 5
SecurityScheme))5 C
,))C D
Id**  "
=**# $
$str**% /
}++ 
},, 
,,, 
new-- 
string-- "
[--" #
]--# $
{--% &
}--& '
}.. 
}// 
)// 
;// 
}00 
)00 
;00 
return22 
services22 
;22 
}33 	
public55 
static55 
IApplicationBuilder55 )
UseSwaggerConfig55* :
(55: ;
this55; ?
IApplicationBuilder55@ S
app55T W
,55W X*
IApiVersionDescriptionProvider55Y w
provider	55x Ä
)
55Ä Å
{66 	
app88 
.88 

UseSwagger88 
(88 
)88 
;88 
app99 
.99 
UseSwaggerUI99 
(99 
options:: 
=>:: 
{;; 
foreach<< 
(<< 
var<<  
description<<! ,
in<<- /
provider<<0 8
.<<8 9"
ApiVersionDescriptions<<9 O
)<<O P
{== 
options>> 
.>>  
SwaggerEndpoint>>  /
(>>/ 0
$">>0 2
$str>>2 ;
{>>; <
description>>< G
.>>G H
	GroupName>>H Q
}>>Q R
$str>>R _
">>_ `
,>>` a
description>>b m
.>>m n
	GroupName>>n w
.>>w x
ToUpperInvariant	>>x à
(
>>à â
)
>>â ä
)
>>ä ã
;
>>ã å
}?? 
}@@ 
)@@ 
;@@ 
returnAA 
appAA 
;AA 
}BB 	
}CC 
publicDD 

classDD #
ConfigureSwaggerOptionsDD (
:DD) *
IConfigureOptionsDD+ <
<DD< =
SwaggerGenOptionsDD= N
>DDN O
{EE 
readonlyFF *
IApiVersionDescriptionProviderFF /
providerFF0 8
;FF8 9
publicHH #
ConfigureSwaggerOptionsHH &
(HH& '*
IApiVersionDescriptionProviderHH' E
providerHHF N
)HHN O
=>HHP R
thisHHS W
.HHW X
providerHHX `
=HHa b
providerHHc k
;HHk l
publicJJ 
voidJJ 
	ConfigureJJ 
(JJ 
SwaggerGenOptionsJJ /
optionsJJ0 7
)JJ7 8
{KK 	
foreachLL 
(LL 
varLL 
descriptionLL $
inLL% '
providerLL( 0
.LL0 1"
ApiVersionDescriptionsLL1 G
)LLG H
{MM 
optionsNN 
.NN 

SwaggerDocNN "
(NN" #
descriptionNN# .
.NN. /
	GroupNameNN/ 8
,NN8 9#
CreateInfoForApiVersionNN: Q
(NNQ R
descriptionNNR ]
)NN] ^
)NN^ _
;NN_ `
}OO 
}PP 	
staticRR 
OpenApiInfoRR #
CreateInfoForApiVersionRR 2
(RR2 3!
ApiVersionDescriptionRR3 H
descriptionRRI T
)RRT U
{SS 	
varTT 
infoTT 
=TT 
newTT 
OpenApiInfoTT &
(TT& '
)TT' (
{UU 
TitleVV 
=VV 
$strVV %
,VV% &
VersionWW 
=WW 
descriptionWW %
.WW% &

ApiVersionWW& 0
.WW0 1
ToStringWW1 9
(WW9 :
)WW: ;
,WW; <
DescriptionXX 
=XX 
$strXX 1
,XX1 2
ContactYY 
=YY 
newYY 
OpenApiContactYY ,
(YY, -
)YY- .
{YY/ 0
NameYY1 5
=YY6 7
$strYY8 I
,YYI J
EmailYYK P
=YYQ R
$strYYS x
}YYy z
,YYz {
LicenseZZ 
=ZZ 
newZZ 
OpenApiLicenseZZ ,
(ZZ, -
)ZZ- .
{ZZ/ 0
NameZZ1 5
=ZZ6 7
$strZZ8 =
,ZZ= >
UrlZZ? B
=ZZC D
newZZE H
UriZZI L
(ZZL M
$strZZM r
)ZZr s
}ZZt u
}[[ 
;[[ 
if]] 
(]] 
description]] 
.]] 
IsDeprecated]] (
)]]( )
{^^ 
info__ 
.__ 
Description__  
+=__! #
$str__$ @
;__@ A
}`` 
returnbb 
infobb 
;bb 
}cc 	
}dd 
publicff 

classff  
SwaggerDefaultValuesff %
:ff& '
IOperationFilterff( 8
{gg 
publichh 
voidhh 
Applyhh 
(hh 
OpenApiOperationhh *
	operationhh+ 4
,hh4 5"
OperationFilterContexthh6 L
contexthhM T
)hhT U
{ii 	
ifjj 
(jj 
	operationjj 
.jj 

Parametersjj $
==jj% '
nulljj( ,
)jj, -
{kk 
returnll 
;ll 
}mm 
foreachoo 
(oo 
varoo 
	parameteroo "
inoo# %
	operationoo& /
.oo/ 0

Parametersoo0 :
)oo: ;
{pp 
varqq 
descriptionqq 
=qq  !
contextqq" )
.qq) *
ApiDescriptionqq* 8
.rr !
ParameterDescriptionsrr *
.ss 
Firstss 
(ss 
pss 
=>ss 
pss  !
.ss! "
Namess" &
==ss' )
	parameterss* 3
.ss3 4
Namess4 8
)ss8 9
;ss9 :
varuu 
	routeInfouu 
=uu 
descriptionuu  +
.uu+ ,
	RouteInfouu, 5
;uu5 6
	operationww 
.ww 

Deprecatedww $
=ww% &
OpenApiOperationww' 7
.ww7 8
DeprecatedDefaultww8 I
;wwI J
ifyy 
(yy 
	parameteryy 
.yy 
Descriptionyy )
==yy* ,
nullyy- 1
)yy1 2
{zz 
	parameter{{ 
.{{ 
Description{{ )
={{* +
description{{, 7
.{{7 8
ModelMetadata{{8 E
?{{E F
.{{F G
Description{{G R
;{{R S
}|| 
if~~ 
(~~ 
	routeInfo~~ 
==~~  
null~~! %
)~~% &
{ 
continue
ÄÄ 
;
ÄÄ 
}
ÅÅ 
if
ÉÉ 
(
ÉÉ 
	parameter
ÉÉ 
.
ÉÉ 
In
ÉÉ  
!=
ÉÉ! #
ParameterLocation
ÉÉ$ 5
.
ÉÉ5 6
Path
ÉÉ6 :
&&
ÉÉ; =
	parameter
ÉÉ> G
.
ÉÉG H
Schema
ÉÉH N
.
ÉÉN O
Default
ÉÉO V
==
ÉÉW Y
null
ÉÉZ ^
)
ÉÉ^ _
{
ÑÑ 
	parameter
ÖÖ 
.
ÖÖ 
Schema
ÖÖ $
.
ÖÖ$ %
Default
ÖÖ% ,
=
ÖÖ- .
new
ÖÖ/ 2
OpenApiString
ÖÖ3 @
(
ÖÖ@ A
	routeInfo
ÖÖA J
.
ÖÖJ K
DefaultValue
ÖÖK W
.
ÖÖW X
ToString
ÖÖX `
(
ÖÖ` a
)
ÖÖa b
)
ÖÖb c
;
ÖÖc d
}
ÜÜ 
	parameter
àà 
.
àà 
Required
àà "
|=
àà# %
!
àà& '
	routeInfo
àà' 0
.
àà0 1

IsOptional
àà1 ;
;
àà; <
}
ââ 
}
ää 	
}
ãã 
public
çç 

class
çç )
SwaggerAuthorizedMiddleware
çç ,
{
éé 
private
èè 
readonly
èè 
RequestDelegate
èè (
_next
èè) .
;
èè. /
public
ëë )
SwaggerAuthorizedMiddleware
ëë *
(
ëë* +
RequestDelegate
ëë+ :
next
ëë; ?
)
ëë? @
{
íí 	
_next
ìì 
=
ìì 
next
ìì 
;
ìì 
}
îî 	
public
ññ 
async
ññ 
Task
ññ 
Invoke
ññ  
(
ññ  !
HttpContext
ññ! ,
context
ññ- 4
)
ññ4 5
{
óó 	
if
ôô 
(
ôô 
context
ôô 
.
ôô 
Request
ôô 
.
ôô  
Path
ôô  $
.
ôô$ % 
StartsWithSegments
ôô% 7
(
ôô7 8
$str
ôô8 B
)
ôôB C
&&
öö 
!
öö 
context
öö 
.
öö 
User
öö  
.
öö  !
Identity
öö! )
.
öö) *
IsAuthenticated
öö* 9
)
öö9 :
{
õõ 
context
úú 
.
úú 
Response
úú  
.
úú  !

StatusCode
úú! +
=
úú, -
StatusCodes
úú. 9
.
úú9 :#
Status401Unauthorized
úú: O
;
úúO P
return
ùù 
;
ùù 
}
ûû 
await
†† 
_next
†† 
.
†† 
Invoke
†† 
(
†† 
context
†† &
)
††& '
;
††' (
}
°° 	
}
¢¢ 
}££ æ&
]D:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Controllers\MainController.cs
	namespace		 	
IHunger		
 
.		 
WebAPI		 
.		 
Controllers		 $
{

 
[ 
ApiController 
] 
public 

class 
MainController 
:  !
ControllerBase" 0
{ 
private 
readonly 
	INotifier "
	_notifier# ,
;, -
public 
readonly 
IUser 
AppUser %
;% &
	protected 
Guid 
UserId 
{ 
get  #
;# $
set% (
;( )
}* +
	protected 
bool 
UserAuthenticated (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
MainController 
( 
	INotifier '
notifier( 0
,0 1
IUser2 7
appUser8 ?
)? @
{ 	
	_notifier 
= 
notifier  
;  !
AppUser 
= 
appUser 
; 
if 
( 
appUser 
. 
IsAuthenticated '
(' (
)( )
)) *
{ 
UserId 
= 
appUser  
.  !
	GetUserId! *
(* +
)+ ,
;, -
UserAuthenticated !
=" #
true$ (
;( )
} 
} 	
	protected   
bool   
ValidOperation   %
(  % &
)  & '
{!! 	
return"" 
!"" 
	_notifier"" 
."" 
HasNotification"" -
(""- .
)"". /
;""/ 0
}## 	
	protected%% 
ActionResult%% 
CustomResponse%% -
(%%- .
object%%. 4
result%%5 ;
=%%< =
null%%> B
)%%B C
{&& 	
if'' 
('' 
ValidOperation'' 
('' 
)''  
)''  !
{(( 
return)) 
Ok)) 
()) 
new)) $
ResponseSuccessViewModel)) 6
())6 7
true))7 ;
,)); <
result))= C
)))C D
)))D E
;))E F
}** 
return,, 

BadRequest,, 
(,, 
new,, !"
ResponseErrorViewModel,," 8
(,,8 9
false,,9 >
,,,> ?
	_notifier,,@ I
.,,I J
GetNotifications,,J Z
(,,Z [
),,[ \
.,,\ ]
Select,,] c
(,,c d
n,,d e
=>,,f h
n,,i j
.,,j k
message,,k r
),,r s
),,s t
),,t u
;,,u v
}-- 	
	protected// 
ActionResult// 
CustomResponse// -
(//- . 
ModelStateDictionary//. B

modelState//C M
)//M N
{00 	
if11 
(11 
!11 

modelState11 
.11 
IsValid11 #
)11# $#
NotifyInvalidModelError11% <
(11< =

modelState11= G
)11G H
;11H I
return22 
CustomResponse22 !
(22! "
)22" #
;22# $
}33 	
	protected55 
void55 #
NotifyInvalidModelError55 .
(55. / 
ModelStateDictionary55/ C

modelState55D N
)55N O
{66 	
var77 
erros77 
=77 

modelState77 "
.77" #
Values77# )
.77) *

SelectMany77* 4
(774 5
e775 6
=>777 9
e77: ;
.77; <
Errors77< B
)77B C
;77C D
foreach88 
(88 
var88 
erro88 
in88  
erros88! &
)88& '
{99 
var:: 
errorMsg:: 
=:: 
erro:: #
.::# $
	Exception::$ -
==::. 0
null::1 5
?::6 7
erro::8 <
.::< =
ErrorMessage::= I
:::J K
erro::L P
.::P Q
	Exception::Q Z
.::Z [
Message::[ b
;::b c
NotifyError;; 
(;; 
errorMsg;; $
);;$ %
;;;% &
}<< 
}== 	
	protected?? 
void?? 
NotifyError?? "
(??" #
string??# )
mensagem??* 2
)??2 3
{@@ 	
	_notifierAA 
.AA 
HandleAA 
(AA 
newAA  
NotificationAA! -
(AA- .
mensagemAA. 6
)AA6 7
)AA7 8
;AA8 9
}BB 	
}CC 
}DD æ
XD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Extensions\AspNetUser.cs
	namespace		 	
IHunger		
 
.		 
WebAPI		 
.		 

Extensions		 #
{

 
public 

class 

AspNetUser 
: 
IUser #
{ 
private 
readonly  
IHttpContextAccessor -
	_accessor. 7
;7 8
public 

AspNetUser 
(  
IHttpContextAccessor .
accessor/ 7
)7 8
{ 	
	_accessor 
= 
accessor  
;  !
} 	
public 
string 
Name 
=> 
	_accessor '
.' (
HttpContext( 3
.3 4
User4 8
.8 9
Identity9 A
.A B
NameB F
;F G
public 
Guid 
	GetUserId 
( 
) 
{ 	
return 
IsAuthenticated "
(" #
)# $
?% &
Guid' +
.+ ,
Parse, 1
(1 2
	_accessor2 ;
.; <
HttpContext< G
.G H
UserH L
.L M
	GetUserIdM V
(V W
)W X
)X Y
:Z [
Guid\ `
.` a
Emptya f
;f g
} 	
public 
string 
GetUserEmail "
(" #
)# $
{ 	
return 
IsAuthenticated "
(" #
)# $
?% &
	_accessor' 0
.0 1
HttpContext1 <
.< =
User= A
.A B
GetUserEmailB N
(N O
)O P
:Q R
$strS U
;U V
} 	
public   
bool   
IsAuthenticated   #
(  # $
)  $ %
{!! 	
return"" 
	_accessor"" 
."" 
HttpContext"" (
.""( )
User"") -
.""- .
Identity"". 6
.""6 7
IsAuthenticated""7 F
;""F G
}## 	
public%% 
bool%% 
IsInRole%% 
(%% 
string%% #
role%%$ (
)%%( )
{&& 	
return'' 
	_accessor'' 
.'' 
HttpContext'' (
.''( )
User'') -
.''- .
IsInRole''. 6
(''6 7
role''7 ;
)''; <
;''< =
}(( 	
public** 
IEnumerable** 
<** 
Claim**  
>**  !
GetClaimsIdentity**" 3
(**3 4
)**4 5
{++ 	
return,, 
	_accessor,, 
.,, 
HttpContext,, (
.,,( )
User,,) -
.,,- .
Claims,,. 4
;,,4 5
}-- 	
}.. 
}// •
gD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Extensions\ClaimsPrincipalExtensions.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

Extensions #
{ 
public		 

static		 
class		 %
ClaimsPrincipalExtensions		 1
{

 
public 
static 
string 
	GetUserId &
(& '
this' +
ClaimsPrincipal, ;
	principal< E
)E F
{ 	
if 
( 
	principal 
== 
null !
)! "
{ 
throw 
new 
ArgumentException +
(+ ,
nameof, 2
(2 3
	principal3 <
)< =
)= >
;> ?
} 
var 
claim 
= 
	principal !
.! "
	FindFirst" +
(+ ,

ClaimTypes, 6
.6 7
NameIdentifier7 E
)E F
;F G
return 
claim 
? 
. 
Value 
;  
} 	
public 
static 
string 
GetUserEmail )
() *
this* .
ClaimsPrincipal/ >
	principal? H
)H I
{ 	
if 
( 
	principal 
== 
null !
)! "
{ 
throw 
new 
ArgumentException +
(+ ,
nameof, 2
(2 3
	principal3 <
)< =
)= >
;> ?
} 
var 
claim 
= 
	principal !
.! "
	FindFirst" +
(+ ,

ClaimTypes, 6
.6 7
Email7 <
)< =
;= >
return 
claim 
? 
. 
Value 
;  
} 	
}   
}!! »
aD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Extensions\CustomAuthorization.cs
	namespace

 	
IHunger


 
.

 
WebAPI

 
.

 

Extensions

 #
{ 
public 

class 
CustomAuthorization $
{ 
public 
static 
bool 
ValidateClaimsUser -
(- .
HttpContext. 9
context: A
,A B
stringC I
	claimNameJ S
,S T
stringU [

claimValue\ f
)f g
{ 	
return 
context 
. 
User 
.  
Identity  (
.( )
IsAuthenticated) 8
&&9 ;
context 
. 
User 
.  
Claims  &
.& '
Any' *
(* +
c+ ,
=>- /
c0 1
.1 2
Type2 6
==7 9
	claimName: C
&&D F
cG H
.H I
ValueI N
.N O
ContainsO W
(W X

claimValueX b
)b c
)c d
;d e
} 	
} 
public 

class $
ClaimsAuthorizeAttribute )
:* +
TypeFilterAttribute, ?
{ 
public $
ClaimsAuthorizeAttribute '
(' (
string( .
	claimName/ 8
,8 9
string: @

claimValueA K
)K L
:M N
baseO S
(S T
typeofT Z
(Z [
RegistryClaimFilter[ n
)n o
)o p
{ 	
	Arguments 
= 
new 
object "
[" #
]# $
{% &
new' *
Claim+ 0
(0 1
	claimName1 :
,: ;

claimValue< F
)F G
}H I
;I J
} 	
} 
public 

class 
RegistryClaimFilter $
:% & 
IAuthorizationFilter' ;
{ 
private 
readonly 
Claim 
_claim %
;% &
public!! 
RegistryClaimFilter!! "
(!!" #
Claim!!# (
claim!!) .
)!!. /
{"" 	
_claim## 
=## 
claim## 
;## 
}$$ 	
public&& 
void&& 
OnAuthorization&& #
(&&# $&
AuthorizationFilterContext&&$ >
context&&? F
)&&F G
{'' 	
if(( 
((( 
!(( 
context(( 
.(( 
HttpContext(( $
.(($ %
User((% )
.(() *
Identity((* 2
.((2 3
IsAuthenticated((3 B
)((B C
{)) 
context** 
.** 
Result** 
=**  
new**! $
StatusCodeResult**% 5
(**5 6
$num**6 9
)**9 :
;**: ;
return++ 
;++ 
},, 
if.. 
(.. 
!.. 
CustomAuthorization.. $
...$ %
ValidateClaimsUser..% 7
(..7 8
context..8 ?
...? @
HttpContext..@ K
,..K L
_claim..M S
...S T
Type..T X
,..X Y
_claim..Z `
...` a
Value..a f
)..f g
)..g h
{// 
context00 
.00 
Result00 
=00  
new00! $
StatusCodeResult00% 5
(005 6
$num006 9
)009 :
;00: ;
}11 
}22 	
}33 
}44 “
aD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Extensions\ExceptionMiddleware.cs
	namespace		 	
IHunger		
 
.		 
WebAPI		 
.		 

Extensions		 #
{

 
public 

class 
ExceptionMiddleware $
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
readonly 
ILogger 
< 
ExceptionMiddleware ,
>, -
_log. 2
;2 3
public 
ExceptionMiddleware "
(" #
RequestDelegate# 2
next3 7
,7 8
ILogger9 @
<@ A
ExceptionMiddlewareA T
>T U
logV Y
)Y Z
{ 	
_log 
= 
log 
; 
_next 
= 
next 
; 
} 	
public 
async 
Task 
InvokeAsync %
(% &
HttpContext& 1
httpContext2 =
)= >
{ 	
try 
{ 
await 
_next 
( 
httpContext '
)' (
;( )
} 
catch 
( 
	Exception 
ex 
)  
{ 
_log 
. 
LogError 
( 
ex  
.  !
Message! (
)( )
;) * 
HandleExceptionAsync $
($ %
httpContext% 0
,0 1
ex2 4
)4 5
;5 6
}   
}!! 	
private## 
static## 
void##  
HandleExceptionAsync## 0
(##0 1
HttpContext##1 <
context##= D
,##D E
	Exception##F O
	exception##P Y
)##Y Z
{$$ 	
context%% 
.%% 
Response%% 
.%% 

StatusCode%% '
=%%( )
(%%* +
int%%+ .
)%%. /
HttpStatusCode%%0 >
.%%> ?
InternalServerError%%? R
;%%R S
}&& 	
}'' 
}(( ‰
JD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Program.cs
	namespace

 	
IHunger


 
.

 
WebAPI

 
{ 
public 

class 
Program 
{ 
public 
static 
bool #
DisableProfilingResults 2
{3 4
get5 8
;8 9
internal: B
setC F
;F G
}H I
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. 
ConfigureLogging !
(! "
(" #
hostingContext# 1
,1 2
builder3 :
): ;
=>< >
{? @
builder 
. 
AddFile #
(# $
$str$ A
)A B
;B C
} 
) 
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
}   …
JD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\Startup.cs
	namespace 	
IHunger
 
. 
WebAPI 
{ 
public 

class 
Startup 
{ 
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
Startup 
( 
IHostEnvironment '
hostEnvironment( 7
)7 8
{ 	
var 
builder 
= 
new  
ConfigurationBuilder 2
(2 3
)3 4
. 
SetBasePath 
( 
hostEnvironment ,
., -
ContentRootPath- <
)< =
. 
AddJsonFile 
( 
$str /
,/ 0
true1 5
,5 6
true7 ;
); <
. 
AddJsonFile 
( 
$" 
$str +
{+ ,
hostEnvironment, ;
.; <
EnvironmentName< K
}K L
$strL Q
"Q R
,R S
trueT X
,X Y
trueZ ^
)^ _
. #
AddEnvironmentVariables (
(( )
)) *
;* +
if!! 
(!! 
hostEnvironment!! 
.!!  
IsDevelopment!!  -
(!!- .
)!!. /
)!!/ 0
{"" 
builder## 
.## 
AddUserSecrets## &
<##& '
Startup##' .
>##. /
(##/ 0
)##0 1
;##1 2
}$$ 
Configuration&& 
=&& 
builder&& #
.&&# $
Build&&$ )
(&&) *
)&&* +
;&&+ ,
}(( 	
public** 
void** 
ConfigureServices** %
(**% &
IServiceCollection**& 8
services**9 A
)**A B
{++ 	
services,, 
.,, 
AddIdentityConfig,, &
(,,& '
Configuration,,' 4
),,4 5
;,,5 6
services.. 
... 
AddAutoMapper.. "
(.." #
typeof..# )
(..) *
Startup..* 1
)..1 2
)..2 3
;..3 4
services00 
.00 
AddApiConfig00 !
(00! "
)00" #
;00# $
services22 
.22 
AddSwaggerConfig22 %
(22% &
)22& '
;22' (
services44 
.44 
ResolveDependencies44 (
(44( )
)44) *
;44* +
}66 	
public88 
void88 
	Configure88 
(88 
IApplicationBuilder99 
app99  #
,99# $
IWebHostEnvironment:: 
env::  #
,::# $*
IApiVersionDescriptionProvider;; *
provider;;+ 3
,;;3 4
IServiceProvider<< 
serviceProvider<< ,
)<<, -
{== 	
app>> 
.>> 
UseApiConfig>> 
(>> 
env>>  
,>>  !
serviceProvider>>" 1
)>>1 2
;>>2 3
app@@ 
.@@ 
UseSwaggerConfig@@  
(@@  !
provider@@! )
)@@) *
;@@* +
}AA 	
}CC 
}DD 
`D:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\V1\Controllers\AuthController.cs
	namespace		 	
IHunger		
 
.		 
WebAPI		 
.		 
V1		 
.		 
Controllers		 '
{

 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str +
)+ ,
], -
public 

class 
AuthController 
:  !
MainController" 0
{ 
private 
readonly 
IAuthService %
_authService& 2
;2 3
public 
AuthController 
( 
	INotifier 
notifier 
, 
IAuthService 
authService $
,$ %
IUser 
user 
) 
: 
base 
( 
notifier '
,' (
user) -
)- .
{ 	
_authService 
= 
authService &
;& '
} 	
[ 	
AllowAnonymous	 
] 
[ 	
HttpPost	 
( 
$str 
) 
] 
public 
async 
Task 
< 
ActionResult &
>& '
Register( 0
(0 1!
RegisterUserViewModel1 F
	viewModelG P
)P Q
{ 	
if 
( 
! 

ModelState 
. 
IsValid #
)# $
return% +
CustomResponse, :
(: ;

ModelState; E
)E F
;F G
var 
user 
= 
	viewModel  
.  !
ToDomain! )
() *
)* +
;+ ,
var!! 
resp!! 
=!! 
await!! 
_authService!! )
.!!) *
Register!!* 2
(!!2 3
user!!3 7
,!!7 8
	viewModel!!9 B
.!!B C
Password!!C K
)!!K L
;!!L M
return## 
CustomResponse## !
(##! "
resp##" &
)##& '
;##' (
}$$ 	
[&& 	
AllowAnonymous&&	 
]&& 
['' 	
HttpPost''	 
('' 
$str'' 
)'' 
]'' 
public(( 
async(( 
Task(( 
<(( 
ActionResult(( &
>((& '
Login((( -
(((- .
LoginUserViewModel((. @
	viewModel((A J
)((J K
{)) 	
if** 
(** 
!** 

ModelState** 
.** 
IsValid** #
)**# $
return**% +
CustomResponse**, :
(**: ;

ModelState**; E
)**E F
;**F G
var,, 
result,, 
=,, 
await,, 
_authService,, +
.,,+ ,
Login,,, 1
(,,1 2
	viewModel,,2 ;
.,,; <
Email,,< A
,,,A B
	viewModel,,C L
.,,L M
Password,,M U
),,U V
;,,V W
return.. 
CustomResponse.. !
(..! "
result.." (
)..( )
;..) *
}// 	
}00 
}11 ¸;
kD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\V1\Controllers\CategoryProductController.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
V1 
. 
Controllers '
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
$str 8
)8 9
]9 :
public 

class %
CategoryProductController *
:+ ,
MainController- ;
{ 
private 
readonly #
ICategoryProductService 0#
_categoryProductService1 H
;H I
private 
readonly 
IMapper  
_mapper! (
;( )
public %
CategoryProductController (
(( )#
ICategoryProductService #"
categoryProductService$ :
,: ;
IMapper 
mapper 
, 
	INotifier 
notifier 
, 
IUser 
appUser 
) 
: 
base !
(! "
notifier" *
,* +
appUser, 3
)3 4
{ 	#
_categoryProductService   #
=  $ %"
categoryProductService  & <
;  < =
_mapper!! 
=!! 
mapper!! 
;!! 
}"" 	
[$$ 	
HttpPost$$	 
]$$ 
[%% 	
ClaimsAuthorize%%	 
(%% 
$str%% *
,%%* +
$str%%, 4
)%%4 5
]%%5 6
public&& 
async&& 
Task&& 
<&& 
ActionResult&& &
<&&& '$
CategoryProductViewModel&&' ?
>&&? @
>&&@ A
Create&&B H
(&&H I+
CategoryProductCreatedViewModel&&I h
	viewModel&&i r
)&&r s
{'' 	
if(( 
((( 
!(( 

ModelState(( 
.(( 
IsValid(( #
)((# $
return((% +
CustomResponse((, :
(((: ;

ModelState((; E
)((E F
;((F G
var** 
categoryProduct** 
=**  !
await**" '#
_categoryProductService**( ?
.**? @
Create**@ F
(**F G
_mapper**G N
.**N O
Map**O R
<**R S
CategoryProduct**S b
>**b c
(**c d
	viewModel**d m
)**m n
)**n o
;**o p
var,, 
resp,, 
=,, 
_mapper,, 
.,, 
Map,, "
<,," #$
CategoryProductViewModel,,# ;
>,,; <
(,,< =
categoryProduct,,= L
),,L M
;,,M N
return.. 
CustomResponse.. !
(..! "
resp.." &
)..& '
;..' (
}// 	
[11 	
HttpGet11	 
]11 
[22 	
ClaimsAuthorize22	 
(22 
$str22 *
,22* +
$str22, 1
)221 2
]222 3
public33 
async33 
Task33 
<33 
IEnumerable33 %
<33% &$
CategoryProductViewModel33& >
>33> ?
>33? @
GetAllWithFilter33A Q
(33Q R
[33R S
	FromQuery33S \
]33\ ]!
CategoryProductFilter33^ s
filter33t z
)33z {
{44 	
return55 
_mapper55 
.55 
Map55 
<55 
IEnumerable55 *
<55* +$
CategoryProductViewModel55+ C
>55C D
>55D E
(55E F
await55F K#
_categoryProductService55L c
.55c d
GetAllWithFilter55d t
(55t u
filter55u {
)55{ |
)55| }
;55} ~
}66 	
[88 	
HttpGet88	 
(88 
$str88 
)88 
]88 
[99 	
ClaimsAuthorize99	 
(99 
$str99 *
,99* +
$str99, 1
)991 2
]992 3
public:: 
async:: 
Task:: 
<:: $
CategoryProductViewModel:: 2
>::2 3
GetById::4 ;
(::; <
Guid::< @
id::A C
)::C D
{;; 	
return<< 
_mapper<< 
.<< 
Map<< 
<<< $
CategoryProductViewModel<< 7
><<7 8
(<<8 9
await<<9 >#
_categoryProductService<<? V
.<<V W
GetById<<W ^
(<<^ _
id<<_ a
)<<a b
)<<b c
;<<c d
}== 	
[?? 	
HttpPut??	 
(?? 
$str?? 
)?? 
]?? 
[@@ 	
ClaimsAuthorize@@	 
(@@ 
$str@@ *
,@@* +
$str@@, 4
)@@4 5
]@@5 6
publicAA 
asyncAA 
TaskAA 
<AA 
ActionResultAA &
<AA& '$
CategoryProductViewModelAA' ?
>AA? @
>AA@ A
UpdateAAB H
(AAH I
[AAI J
	FromRouteAAJ S
]AAS T
GuidAAU Y
idAAZ \
,AA\ ]
[AA^ _
FromBodyAA_ g
]AAg h%
CategoryProductViewModel	AAi Å
	viewModel
AAÇ ã
)
AAã å
{BB 	
ifCC 
(CC 
!CC 

ModelStateCC 
.CC 
IsValidCC #
)CC# $
returnCC% +
CustomResponseCC, :
(CC: ;

ModelStateCC; E
)CCE F
;CCF G
ifDD 
(DD 
idDD 
!=DD 
	viewModelDD 
.DD  
IdDD  "
)DD" #
returnDD$ *
NotFoundDD+ 3
(DD3 4
)DD4 5
;DD5 6
varFF 
categoryProductFF 
=FF  !
awaitFF" '#
_categoryProductServiceFF( ?
.FF? @
UpdateFF@ F
(FFF G
_mapperFFG N
.FFN O
MapFFO R
<FFR S
CategoryProductFFS b
>FFb c
(FFc d
	viewModelFFd m
)FFm n
)FFn o
;FFo p
varHH 
respHH 
=HH 
_mapperHH 
.HH 
MapHH "
<HH" #$
CategoryProductViewModelHH# ;
>HH; <
(HH< =
categoryProductHH= L
)HHL M
;HHM N
returnJJ 
CustomResponseJJ !
(JJ! "
respJJ" &
)JJ& '
;JJ' (
}KK 	
[MM 	

HttpDeleteMM	 
(MM 
$strMM 
)MM 
]MM 
[NN 	
ClaimsAuthorizeNN	 
(NN 
$strNN *
,NN* +
$strNN, 4
)NN4 5
]NN5 6
publicOO 
asyncOO 
TaskOO 
<OO $
CategoryProductViewModelOO 2
>OO2 3
DeleteOO4 :
(OO: ;
GuidOO; ?
idOO@ B
)OOB C
{PP 	
returnQQ 
_mapperQQ 
.QQ 
MapQQ 
<QQ $
CategoryProductViewModelQQ 7
>QQ7 8
(QQ8 9
awaitQQ9 >#
_categoryProductServiceQQ? V
.QQV W
DeleteQQW ]
(QQ] ^
idQQ^ `
)QQ` a
)QQa b
;QQb c
}RR 	
}SS 
}TT È<
nD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\V1\Controllers\CategoryRestaurantController.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
V1 
. 
Controllers '
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
$str ;
); <
]< =
public 

class (
CategoryRestaurantController -
:. /
MainController0 >
{ 
private 
readonly &
ICategoryRestaurantService 3&
_categoryRestaurantService4 N
;N O
private 
readonly 
IMapper  
_mapper! (
;( )
public (
CategoryRestaurantController +
(+ ,&
ICategoryRestaurantService &%
categoryRestaurantService' @
,@ A
IMapper 
mapper 
, 
	INotifier 
notifier 
, 
IUser 
appUser 
) 
: 
base !
(! "
notifier" *
,* +
appUser, 3
)3 4
{ 	&
_categoryRestaurantService   &
=  ' (%
categoryRestaurantService  ) B
;  B C
_mapper!! 
=!! 
mapper!! 
;!! 
}"" 	
[$$ 	
HttpPost$$	 
]$$ 
[%% 	
ClaimsAuthorize%%	 
(%% 
$str%% -
,%%- .
$str%%/ 7
)%%7 8
]%%8 9
public&& 
async&& 
Task&& 
<&& 
ActionResult&& &
<&&& ''
CategoryRestaurantViewModel&&' B
>&&B C
>&&C D
Create&&E K
(&&K L.
"CategoryRestaurantCreatedViewModel&&L n
	viewModel&&o x
)&&x y
{'' 	
if(( 
((( 
!(( 

ModelState(( 
.(( 
IsValid(( #
)((# $
return((% +
CustomResponse((, :
(((: ;

ModelState((; E
)((E F
;((F G
var** 
categoryRestaurant** "
=**# $
await**% *&
_categoryRestaurantService**+ E
.**E F
Create**F L
(**L M
_mapper**M T
.**T U
Map**U X
<**X Y
CategoryRestaurant**Y k
>**k l
(**l m
	viewModel**m v
)**v w
)**w x
;**x y
var,, 
resp,, 
=,, 
_mapper,, 
.,, 
Map,, "
<,," #'
CategoryRestaurantViewModel,,# >
>,,> ?
(,,? @
categoryRestaurant,,@ R
),,R S
;,,S T
return.. 
CustomResponse.. !
(..! "
resp.." &
)..& '
;..' (
}// 	
[11 	
HttpGet11	 
]11 
[22 	
ClaimsAuthorize22	 
(22 
$str22 -
,22- .
$str22/ 4
)224 5
]225 6
public33 
async33 
Task33 
<33 
IEnumerable33 %
<33% &'
CategoryRestaurantViewModel33& A
>33A B
>33B C
GetAllWithFilter33D T
(33T U
[33U V
	FromQuery33V _
]33_ `$
CategoryRestaurantFilter33a y
filter	33z Ä
)
33Ä Å
{44 	
return55 
_mapper55 
.55 
Map55 
<55 
IEnumerable55 *
<55* +'
CategoryRestaurantViewModel55+ F
>55F G
>55G H
(55H I
await55I N&
_categoryRestaurantService55O i
.55i j
GetAllWithFilter55j z
(55z {
filter	55{ Å
)
55Å Ç
)
55Ç É
;
55É Ñ
}66 	
[88 	
HttpGet88	 
(88 
$str88 
)88 
]88 
[99 	
ClaimsAuthorize99	 
(99 
$str99 -
,99- .
$str99/ 4
)994 5
]995 6
public:: 
async:: 
Task:: 
<:: '
CategoryRestaurantViewModel:: 5
>::5 6
GetById::7 >
(::> ?
Guid::? C
id::D F
)::F G
{;; 	
return<< 
_mapper<< 
.<< 
Map<< 
<<< '
CategoryRestaurantViewModel<< :
><<: ;
(<<; <
await<<< A&
_categoryRestaurantService<<B \
.<<\ ]
GetById<<] d
(<<d e
id<<e g
)<<g h
)<<h i
;<<i j
}== 	
[?? 	
HttpPut??	 
(?? 
$str?? 
)?? 
]?? 
[@@ 	
ClaimsAuthorize@@	 
(@@ 
$str@@ -
,@@- .
$str@@/ 7
)@@7 8
]@@8 9
publicAA 
asyncAA 
TaskAA 
<AA 
ActionResultAA &
<AA& ''
CategoryRestaurantViewModelAA' B
>AAB C
>AAC D
UpdateAAE K
(AAK L
[AAL M
	FromRouteAAM V
]AAV W
GuidAAX \
idAA] _
,AA_ `
[AAa b
FromBodyAAb j
]AAj k(
CategoryRestaurantViewModel	AAl á
	viewModel
AAà ë
)
AAë í
{BB 	
ifCC 
(CC 
!CC 

ModelStateCC 
.CC 
IsValidCC #
)CC# $
returnCC% +
CustomResponseCC, :
(CC: ;

ModelStateCC; E
)CCE F
;CCF G
ifDD 
(DD 
idDD 
!=DD 
	viewModelDD 
.DD  
IdDD  "
)DD" #
returnDD$ *
NotFoundDD+ 3
(DD3 4
)DD4 5
;DD5 6
varFF 
categoryRestaurantFF "
=FF# $
awaitFF% *&
_categoryRestaurantServiceFF+ E
.FFE F
UpdateFFF L
(FFL M
_mapperFFM T
.FFT U
MapFFU X
<FFX Y
CategoryRestaurantFFY k
>FFk l
(FFl m
	viewModelFFm v
)FFv w
)FFw x
;FFx y
varHH 
respHH 
=HH 
_mapperHH 
.HH 
MapHH "
<HH" #'
CategoryRestaurantViewModelHH# >
>HH> ?
(HH? @
categoryRestaurantHH@ R
)HHR S
;HHS T
returnJJ 
CustomResponseJJ !
(JJ! "
respJJ" &
)JJ& '
;JJ' (
}KK 	
[MM 	

HttpDeleteMM	 
(MM 
$strMM 
)MM 
]MM 
[NN 	
ClaimsAuthorizeNN	 
(NN 
$strNN -
,NN- .
$strNN/ 7
)NN7 8
]NN8 9
publicOO 
asyncOO 
TaskOO 
<OO '
CategoryRestaurantViewModelOO 5
>OO5 6
DeleteOO7 =
(OO= >
GuidOO> B
idOOC E
)OOE F
{PP 	
returnQQ 
_mapperQQ 
.QQ 
MapQQ 
<QQ '
CategoryRestaurantViewModelQQ :
>QQ: ;
(QQ; <
awaitQQ< A&
_categoryRestaurantServiceQQB \
.QQ\ ]
DeleteQQ] c
(QQc d
idQQd f
)QQf g
)QQg h
;QQh i
}RR 	
}SS 
}TT —9
bD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\V1\Controllers\CouponController.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
V1 
. 
Controllers '
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
$str .
). /
]/ 0
public 

class 
CouponController !
:" #
MainController$ 2
{ 
private 
readonly 
ICouponService '
_couponService( 6
;6 7
private 
readonly 
IMapper  
_mapper! (
;( )
public 
CouponController 
(  
ICouponService 
couponService (
,( )
IMapper 
mapper 
, 
	INotifier 
notifier 
, 
IUser 
appUser 
) 
: 
base !
(! "
notifier" *
,* +
appUser, 3
)3 4
{ 	
_couponService   
=   
couponService   *
;  * +
_mapper!! 
=!! 
mapper!! 
;!! 
}"" 	
[$$ 	
HttpPost$$	 
]$$ 
[%% 	
ClaimsAuthorize%%	 
(%% 
$str%% *
,%%* +
$str%%, 4
)%%4 5
]%%5 6
public&& 
async&& 
Task&& 
<&& 
ActionResult&& &
<&&& '
CouponViewModel&&' 6
>&&6 7
>&&7 8
Create&&9 ?
(&&? @"
CouponCreatedViewModel&&@ V
	viewModel&&W `
)&&` a
{'' 	
if(( 
((( 
!(( 

ModelState(( 
.(( 
IsValid(( #
)((# $
return((% +
CustomResponse((, :
(((: ;

ModelState((; E
)((E F
;((F G
var** 
entity** 
=** 
await** 
_couponService** -
.**- .
Create**. 4
(**4 5
_mapper**5 <
.**< =
Map**= @
<**@ A
Coupon**A G
>**G H
(**H I
	viewModel**I R
)**R S
)**S T
;**T U
var,, 
resp,, 
=,, 
_mapper,, 
.,, 
Map,, "
<,," #
CouponViewModel,,# 2
>,,2 3
(,,3 4
entity,,4 :
),,: ;
;,,; <
return.. 
CustomResponse.. !
(..! "
resp.." &
)..& '
;..' (
}// 	
[11 	
HttpGet11	 
]11 
[22 	
ClaimsAuthorize22	 
(22 
$str22 *
,22* +
$str22, 1
)221 2
]222 3
public33 
async33 
Task33 
<33 
IEnumerable33 %
<33% &
CouponViewModel33& 5
>335 6
>336 7
GetAll338 >
(33> ?
[33? @
	FromQuery33@ I
]33I J
bool33K O
ative33P U
=33V W
true33X \
)33\ ]
{44 	
return55 
_mapper55 
.55 
Map55 
<55 
IEnumerable55 *
<55* +
CouponViewModel55+ :
>55: ;
>55; <
(55< =
await55= B
_couponService55C Q
.55Q R
GetAll55R X
(55X Y
ative55Y ^
)55^ _
)55_ `
;55` a
}66 	
[88 	
HttpGet88	 
(88 
$str88 
)88 
]88 
[99 	
ClaimsAuthorize99	 
(99 
$str99 *
,99* +
$str99, 1
)991 2
]992 3
public:: 
async:: 
Task:: 
<:: 
CouponViewModel:: )
>::) *
GetById::+ 2
(::2 3
Guid::3 7
id::8 :
)::: ;
{;; 	
return<< 
_mapper<< 
.<< 
Map<< 
<<< 
CouponViewModel<< .
><<. /
(<</ 0
await<<0 5
_couponService<<6 D
.<<D E
GetById<<E L
(<<L M
id<<M O
)<<O P
)<<P Q
;<<Q R
}== 	
[@@ 	
HttpPut@@	 
(@@ 
$str@@ 
)@@ 
]@@ 
[AA 	
ClaimsAuthorizeAA	 
(AA 
$strAA *
,AA* +
$strAA, 4
)AA4 5
]AA5 6
publicBB 
asyncBB 
TaskBB 
<BB 
ActionResultBB &
<BB& '
CouponViewModelBB' 6
>BB6 7
>BB7 8
UpdateBB9 ?
(BB? @
[BB@ A
	FromRouteBBA J
]BBJ K
GuidBBL P
idBBQ S
,BBS T
[BBU V
FromBodyBBV ^
]BB^ _
CouponViewModelBB` o
	viewModelBBp y
)BBy z
{CC 	
ifDD 
(DD 
!DD 

ModelStateDD 
.DD 
IsValidDD #
)DD# $
returnDD% +
CustomResponseDD, :
(DD: ;

ModelStateDD; E
)DDE F
;DDF G
ifEE 
(EE 
idEE 
!=EE 
	viewModelEE 
.EE  
IdEE  "
)EE" #
returnEE$ *
NotFoundEE+ 3
(EE3 4
)EE4 5
;EE5 6
varGG 
entityGG 
=GG 
awaitGG 
_couponServiceGG -
.GG- .
UpdateGG. 4
(GG4 5
_mapperGG5 <
.GG< =
MapGG= @
<GG@ A
CouponGGA G
>GGG H
(GGH I
	viewModelGGI R
)GGR S
)GGS T
;GGT U
varII 
respII 
=II 
_mapperII 
.II 
MapII "
<II" #
CouponViewModelII# 2
>II2 3
(II3 4
entityII4 :
)II: ;
;II; <
returnKK 
CustomResponseKK !
(KK! "
respKK" &
)KK& '
;KK' (
}LL 	
[NN 	

HttpDeleteNN	 
(NN 
$strNN 
)NN 
]NN 
[OO 	
ClaimsAuthorizeOO	 
(OO 
$strOO *
,OO* +
$strOO, 4
)OO4 5
]OO5 6
publicPP 
asyncPP 
TaskPP 
<PP 
CouponViewModelPP )
>PP) *
DeletePP+ 1
(PP1 2
GuidPP2 6
idPP7 9
)PP9 :
{QQ 	
returnRR 
_mapperRR 
.RR 
MapRR 
<RR 
CouponViewModelRR .
>RR. /
(RR/ 0
awaitRR0 5
_couponServiceRR6 D
.RRD E
DeleteRRE K
(RRK L
idRRL N
)RRN O
)RRO P
;RRP Q
}SS 	
}TT 
}UU Ç
`D:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\V1\Controllers\ItemController.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
V1 
. 
Controllers '
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
$str ,
), -
]- .
public 

class 
ItemController 
:  !
MainController" 0
{ 
private 
readonly 
IItemService %
_itemService& 2
;2 3
public 
ItemController 
( 
IItemService 
itemService $
,$ %
	INotifier 
notifier 
, 
IUser 
appUser 
) 
: 
base !
(! "
notifier" *
,* +
appUser, 3
)3 4
{ 	
_itemService 
= 
itemService &
;& '
} 	
} 
} ü%
aD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\V1\Controllers\OrderController.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
V1 
. 
Controllers '
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
$str -
)- .
]. /
public 

class 
OrderController  
:! "
MainController# 1
{ 
private 
readonly 
IOrderService &
_orderService' 4
;4 5
private 
readonly 
IMapper  
_mapper! (
;( )
public 
OrderController 
( 
IOrderService 
orderService &
,& '
IMapper 
mapper 
, 
	INotifier 
notifier 
, 
IUser 
appUser 
) 
: 
base !
(! "
notifier" *
,* +
appUser, 3
)3 4
{   	
_orderService!! 
=!! 
orderService!! (
;!!( )
_mapper"" 
="" 
mapper"" 
;"" 
}## 	
[%% 	
HttpGet%%	 
(%% 
$str%% 
)%% 
]%% 
[&& 	
ClaimsAuthorize&&	 
(&& 
$str&&  
,&&  !
$str&&" '
)&&' (
]&&( )
public'' 
async'' 
Task'' 
<'' 
OrderViewModel'' (
>''( )
GetById''* 1
(''1 2
Guid''2 6
id''7 9
)''9 :
{(( 	
return)) 
_mapper)) 
.)) 
Map)) 
<)) 
OrderViewModel)) -
>))- .
()). /
await))/ 4
_orderService))5 B
.))B C
GetById))C J
())J K
id))K M
)))M N
)))N O
;))O P
}** 	
[,, 	
HttpPost,,	 
],, 
[-- 	
ClaimsAuthorize--	 
(-- 
$str--  
,--  !
$str--" *
)--* +
]--+ ,
public.. 
async.. 
Task.. 
<.. 
ActionResult.. &
<..& '
OrderViewModel..' 5
>..5 6
>..6 7
Create..8 >
(..> ?!
OrderCreatedViewModel..? T
	viewModel..U ^
)..^ _
{// 	
if11 
(11 
!11 

ModelState11 
.11 
IsValid11 #
)11# $
return11% +
CustomResponse11, :
(11: ;

ModelState11; E
)11E F
;11F G
var33 
categoryProduct33 
=33  !
await33" '
_orderService33( 5
.335 6
Create336 <
(33< =
_mapper33= D
.33D E
Map33E H
<33H I
Order33I N
>33N O
(33O P
	viewModel33P Y
)33Y Z
)33Z [
;33[ \
var55 
resp55 
=55 
_mapper55 
.55 
Map55 "
<55" #
OrderViewModel55# 1
>551 2
(552 3
categoryProduct553 B
)55B C
;55C D
return77 
CustomResponse77 !
(77! "
resp77" &
)77& '
;77' (
}99 	
[;; 	
HttpGet;;	 
];; 
[<< 	
ClaimsAuthorize<<	 
(<< 
$str<<  
,<<  !
$str<<" '
)<<' (
]<<( )
public== 
async== 
Task== 
<== 
IEnumerable== %
<==% &
OrderViewModel==& 4
>==4 5
>==5 6
GetAllWithFilter==7 G
(==G H
[==H I
	FromQuery==I R
]==R S
OrderFilter==T _
filter==` f
)==f g
{>> 	
return?? 
_mapper?? 
.?? 
Map?? 
<?? 
IEnumerable?? *
<??* +
OrderViewModel??+ 9
>??9 :
>??: ;
(??; <
await??< A
_orderService??B O
.??O P
GetAllWithFilter??P `
(??` a
filter??a g
)??g h
)??h i
;??i j
}@@ 	
}AA 
}BB Ê
gD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\V1\Controllers\OrderStatusController.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
V1 
. 
Controllers '
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
$str 3
)3 4
]4 5
public 

class !
OrderStatusController &
:' (
MainController) 7
{ 
private 
readonly 
IOrderStatusService ,
_orderStatusService- @
;@ A
private 
readonly 
IMapper  
_mapper! (
;( )
public !
OrderStatusController $
($ %
IOrderStatusService 
orderStatusService  2
,2 3
IMapper 
mapper 
, 
	INotifier 
notifier 
, 
IUser 
appUser 
) 
: 
base !
(! "
notifier" *
,* +
appUser, 3
)3 4
{ 	
_orderStatusService 
=  !
orderStatusService" 4
;4 5
_mapper   
=   
mapper   
;   
}!! 	
[## 	
HttpGet##	 
]## 
[$$ 	
ClaimsAuthorize$$	 
($$ 
$str$$ &
,$$& '
$str$$( -
)$$- .
]$$. /
public%% 
async%% 
Task%% 
<%% 
IEnumerable%% %
<%%% & 
OrderStatusViewModel%%& :
>%%: ;
>%%; <
GetAllWithFilter%%= M
(%%M N
)%%N O
{&& 	
return'' 
_mapper'' 
.'' 
Map'' 
<'' 
IEnumerable'' *
<''* + 
OrderStatusViewModel''+ ?
>''? @
>''@ A
(''A B
await''B G
_orderStatusService''H [
.''[ \
GetAll''\ b
(''b c
)''c d
)''d e
;''e f
}(( 	
[** 	
HttpGet**	 
(** 
$str** 
)** 
]** 
[++ 	
ClaimsAuthorize++	 
(++ 
$str++ &
,++& '
$str++( -
)++- .
]++. /
public,, 
async,, 
Task,, 
<,,  
OrderStatusViewModel,, .
>,,. /
GetById,,0 7
(,,7 8
Guid,,8 <
id,,= ?
),,? @
{-- 	
return.. 
_mapper.. 
... 
Map.. 
<..  
OrderStatusViewModel.. 3
>..3 4
(..4 5
await..5 :
_orderStatusService..; N
...N O
GetById..O V
(..V W
id..W Y
)..Y Z
)..Z [
;..[ \
}// 	
}00 
}11 ö,
cD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\V1\Controllers\ProductController.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
V1 
. 
Controllers '
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
$str /
)/ 0
]0 1
public 

class 
ProductController "
:# $
MainController% 3
{ 
private 
readonly 
IProductService (
_productService) 8
;8 9
private 
readonly 
IMapper  
_mapper! (
;( )
public 
ProductController  
(  !
IProductService 
productService *
,* +
IMapper 
mapper 
, 
	INotifier 
notifier 
, 
IUser 
appUser 
) 
: 
base !
(! "
notifier" *
,* +
appUser, 3
)3 4
{   	
_productService!! 
=!! 
productService!! ,
;!!, -
_mapper"" 
="" 
mapper"" 
;"" 
}## 	
[%% 	
HttpPost%%	 
]%% 
[&& 	
ClaimsAuthorize&&	 
(&& 
$str&& "
,&&" #
$str&&$ ,
)&&, -
]&&- .
public'' 
async'' 
Task'' 
<'' 
ActionResult'' &
<''& '
ProductViewModel''' 7
>''7 8
>''8 9
Create'': @
(''@ A#
ProductCreatedViewModel''A X
	viewModel''Y b
)''b c
{(( 	
if)) 
()) 
!)) 

ModelState)) 
.)) 
IsValid)) #
)))# $
return))% +
CustomResponse)), :
()): ;

ModelState)); E
)))E F
;))F G
var++ 
entity++ 
=++ 
await++ 
_productService++ .
.++. /
Create++/ 5
(++5 6
_mapper++6 =
.++= >
Map++> A
<++A B
Product++B I
>++I J
(++J K
	viewModel++K T
)++T U
)++U V
;++V W
var-- 
resp-- 
=-- 
_mapper-- 
.-- 
Map-- "
<--" #
ProductViewModel--# 3
>--3 4
(--4 5
entity--5 ;
)--; <
;--< =
return// 
CustomResponse// !
(//! "
resp//" &
)//& '
;//' (
}00 	
[22 	
HttpGet22	 
]22 
[33 	
ClaimsAuthorize33	 
(33 
$str33 "
,33" #
$str33$ )
)33) *
]33* +
public44 
async44 
Task44 
<44 
IEnumerable44 %
<44% &
ProductViewModel44& 6
>446 7
>447 8
GetAllWithFilter449 I
(44I J
[44J K
	FromQuery44K T
]44T U
ProductFilter44V c
filter44d j
)44j k
{55 	
return66 
_mapper66 
.66 
Map66 
<66 
IEnumerable66 *
<66* +
ProductViewModel66+ ;
>66; <
>66< =
(66= >
await66> C
_productService66D S
.66S T
GetAllWithFilter66T d
(66d e
filter66e k
)66k l
)66l m
;66m n
}77 	
[99 	
HttpGet99	 
(99 
$str99 
)99 
]99 
[:: 	
ClaimsAuthorize::	 
(:: 
$str:: "
,::" #
$str::$ )
)::) *
]::* +
public;; 
async;; 
Task;; 
<;; 
ProductViewModel;; *
>;;* +
GetById;;, 3
(;;3 4
Guid;;4 8
id;;9 ;
);;; <
{<< 	
var== 
entity== 
=== 
await== 
_productService== .
.==. /
GetById==/ 6
(==6 7
id==7 9
)==9 :
;==: ;
return?? 
_mapper?? 
.?? 
Map?? 
<?? 
ProductViewModel?? /
>??/ 0
(??0 1
entity??1 7
)??7 8
;??8 9
}@@ 	
[BB 	

HttpDeleteBB	 
(BB 
$strBB 
)BB 
]BB 
[CC 	
ClaimsAuthorizeCC	 
(CC 
$strCC "
,CC" #
$strCC$ ,
)CC, -
]CC- .
publicDD 
asyncDD 
TaskDD 
<DD 
ProductViewModelDD *
>DD* +
DeleteDD, 2
(DD2 3
GuidDD3 7
idDD8 :
)DD: ;
{EE 	
returnFF 
_mapperFF 
.FF 
MapFF 
<FF 
ProductViewModelFF /
>FF/ 0
(FF0 1
awaitFF1 6
_productServiceFF7 F
.FFF G
DeleteFFG M
(FFM N
idFFN P
)FFP Q
)FFQ R
;FFR S
}GG 	
}HH 
}II ã
cD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\V1\Controllers\ProfileController.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
V1 
. 
Controllers '
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
$str .
). /
]/ 0
public 

class 
ProfileController "
:# $
MainController% 3
{ 
private 
readonly 
IUserService %
_userService& 2
;2 3
public 
ProfileController  
(  !
IUserService 
userService $
,$ %
	INotifier 
notifier 
, 
IUser 
appUser 
) 
: 
base !
(! "
notifier" *
,* +
appUser, 3
)3 4
{ 	
_userService 
= 
userService &
;& '
} 	
} 
} ÷â
fD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\V1\Controllers\RestaurantController.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 
V1 
. 
Controllers '
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
	Authorize 
( !
AuthenticationSchemes $
=% &
JwtBearerDefaults' 8
.8 9 
AuthenticationScheme9 M
)M N
]N O
[ 
Route 

(
 
$str 2
)2 3
]3 4
public 

class  
RestaurantController %
:& '
MainController( 6
{ 
private 
readonly 
IRestaurantService +
_restaurantService, >
;> ?
private 
readonly 
ICommentService (
_commentService) 8
;8 9
private 
readonly 
IProductService (
_productService) 8
;8 9
private 
readonly 
IMapper  
_mapper! (
;( )
public  
RestaurantController #
(# $
IRestaurantService 
restaurantService 0
,0 1
ICommentService   
commentService   *
,  * +
IProductService!! 
productService!! *
,!!* +
IMapper"" 
mapper"" 
,"" 
	INotifier## 
notifier## 
,## 
IUser$$ 
appUser$$ 
)$$ 
:$$ 
base$$ !
($$! "
notifier$$" *
,$$* +
appUser$$, 3
)$$3 4
{%% 	
_restaurantService&& 
=&&  
restaurantService&&! 2
;&&2 3
_commentService'' 
='' 
commentService'' ,
;'', -
_productService(( 
=(( 
productService(( ,
;((, -
_mapper)) 
=)) 
mapper)) 
;)) 
}** 	
[-- 	
HttpPost--	 
]-- 
[.. 	
ClaimsAuthorize..	 
(.. 
$str.. %
,..% &
$str..' /
)../ 0
]..0 1
public// 
async// 
Task// 
<// 
ActionResult// &
<//& '
RestaurantViewModel//' :
>//: ;
>//; <
Create//= C
(//C D&
RestaurantCreatedViewModel//D ^
	viewModel//_ h
)//h i
{00 	
if11 
(11 
!11 

ModelState11 
.11 
IsValid11 #
)11# $
return11% +
CustomResponse11, :
(11: ;

ModelState11; E
)11E F
;11F G
var33 
entity33 
=33 
await33 
_restaurantService33 1
.331 2
Create332 8
(338 9
_mapper339 @
.33@ A
Map33A D
<33D E

Restaurant33E O
>33O P
(33P Q
	viewModel33Q Z
)33Z [
)33[ \
;33\ ]
var55 
resp55 
=55 
_mapper55 
.55 
Map55 "
<55" #
RestaurantViewModel55# 6
>556 7
(557 8
entity558 >
)55> ?
;55? @
return77 
CustomResponse77 !
(77! "
resp77" &
)77& '
;77' (
}88 	
[:: 	
HttpGet::	 
]:: 
[;; 	
ClaimsAuthorize;;	 
(;; 
$str;; %
,;;% &
$str;;' ,
);;, -
];;- .
public<< 
async<< 
Task<< 
<<< 
IEnumerable<< %
<<<% &
RestaurantViewModel<<& 9
><<9 :
><<: ;
GetAllWithFilter<<< L
(<<L M
[<<M N
	FromQuery<<N W
]<<W X
RestaurantFilter<<Y i
filter<<j p
)<<p q
{== 	
return>> 
_mapper>> 
.>> 
Map>> 
<>> 
IEnumerable>> *
<>>* +
RestaurantViewModel>>+ >
>>>> ?
>>>? @
(>>@ A
await>>A F
_restaurantService>>G Y
.>>Y Z
GetAllWithFilter>>Z j
(>>j k
filter>>k q
)>>q r
)>>r s
;>>s t
}?? 	
[AA 	
HttpGetAA	 
(AA 
$strAA 
)AA 
]AA 
[BB 	
ClaimsAuthorizeBB	 
(BB 
$strBB %
,BB% &
$strBB' ,
)BB, -
]BB- .
publicCC 
asyncCC 
TaskCC 
<CC 
RestaurantViewModelCC -
>CC- .
GetByIdCC/ 6
(CC6 7
GuidCC7 ;
idCC< >
)CC> ?
{DD 	
returnEE 
_mapperEE 
.EE 
MapEE 
<EE 
RestaurantViewModelEE 2
>EE2 3
(EE3 4
awaitEE4 9
_restaurantServiceEE: L
.EEL M
GetByIdEEM T
(EET U
idEEU W
)EEW X
)EEX Y
;EEY Z
}FF 	
[HH 	
HttpPutHH	 
(HH 
$strHH 
)HH 
]HH 
[II 	
ClaimsAuthorizeII	 
(II 
$strII %
,II% &
$strII' /
)II/ 0
]II0 1
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
ActionResultJJ &
<JJ& '
RestaurantViewModelJJ' :
>JJ: ;
>JJ; <
UpdateJJ= C
(JJC D
[JJD E
	FromRouteJJE N
]JJN O
GuidJJP T
idJJU W
,JJW X
[JJY Z
FromBodyJJZ b
]JJb c
RestaurantViewModelJJd w
	viewModel	JJx Å
)
JJÅ Ç
{KK 	
ifLL 
(LL 
!LL 

ModelStateLL 
.LL 
IsValidLL #
)LL# $
returnLL% +
CustomResponseLL, :
(LL: ;

ModelStateLL; E
)LLE F
;LLF G
ifMM 
(MM 
idMM 
!=MM 
	viewModelMM 
.MM  
IdMM  "
)MM" #
returnMM$ *
NotFoundMM+ 3
(MM3 4
)MM4 5
;MM5 6
varOO 
entityOO 
=OO 
awaitOO 
_restaurantServiceOO 1
.OO1 2
UpdateOO2 8
(OO8 9
_mapperOO9 @
.OO@ A
MapOOA D
<OOD E

RestaurantOOE O
>OOO P
(OOP Q
	viewModelOOQ Z
)OOZ [
)OO[ \
;OO\ ]
varQQ 
respQQ 
=QQ 
_mapperQQ 
.QQ 
MapQQ "
<QQ" #
RestaurantViewModelQQ# 6
>QQ6 7
(QQ7 8
entityQQ8 >
)QQ> ?
;QQ? @
returnSS 
CustomResponseSS !
(SS! "
respSS" &
)SS& '
;SS' (
}TT 	
[VV 	

HttpDeleteVV	 
(VV 
$strVV 
)VV 
]VV 
[WW 	
ClaimsAuthorizeWW	 
(WW 
$strWW %
,WW% &
$strWW' /
)WW/ 0
]WW0 1
publicXX 
asyncXX 
TaskXX 
<XX 
RestaurantViewModelXX -
>XX- .
DeleteXX/ 5
(XX5 6
GuidXX6 :
idXX; =
)XX= >
{YY 	
returnZZ 
_mapperZZ 
.ZZ 
MapZZ 
<ZZ 
RestaurantViewModelZZ 2
>ZZ2 3
(ZZ3 4
awaitZZ4 9
_restaurantServiceZZ: L
.ZZL M
DeleteZZM S
(ZZS T
idZZT V
)ZZV W
)ZZW X
;ZZX Y
}[[ 	
[`` 	
HttpPost``	 
(`` 
$str`` +
)``+ ,
]``, -
[aa 	
ClaimsAuthorizeaa	 
(aa 
$straa %
,aa% &
$straa' ,
)aa, -
]aa- .
publicbb 
asyncbb 
Taskbb 
<bb 
ActionResultbb &
<bb& '
CommentViewModelbb' 7
>bb7 8
>bb8 9
CreateCommentbb: G
(bbG H
[bbH I
	FromRoutebbI R
]bbR S
GuidbbT X
idRestaurantbbY e
,bbe f
[bbg h
FromBodybbh p
]bbp q$
CommentCreatedViewModel	bbr â
	viewModel
bbä ì
)
bbì î
{cc 	
ifdd 
(dd 
!dd 

ModelStatedd 
.dd 
IsValiddd #
)dd# $
returndd% +
CustomResponsedd, :
(dd: ;

ModelStatedd; E
)ddE F
;ddF G
varff 
commentff 
=ff 
_mapperff !
.ff! "
Mapff" %
<ff% &
Commentff& -
>ff- .
(ff. /
	viewModelff/ 8
)ff8 9
;ff9 :
commentgg 
.gg 
IdRestaurantgg  
=gg! "
idRestaurantgg# /
;gg/ 0
varii 
entityii 
=ii 
awaitii 
_commentServiceii .
.ii. /
Createii/ 5
(ii5 6
idRestaurantii6 B
,iiB C
commentiiD K
)iiK L
;iiL M
varkk 
respkk 
=kk 
_mapperkk 
.kk 
Mapkk "
<kk" #
CommentViewModelkk# 3
>kk3 4
(kk4 5
entitykk5 ;
)kk; <
;kk< =
returnmm 
CustomResponsemm !
(mm! "
respmm" &
)mm& '
;mm' (
}nn 	
[pp 	
HttpGetpp	 
(pp 
$strpp *
)pp* +
]pp+ ,
[qq 	
ClaimsAuthorizeqq	 
(qq 
$strqq %
,qq% &
$strqq' ,
)qq, -
]qq- .
publicrr 
asyncrr 
Taskrr 
<rr 
ActionResultrr &
<rr& '
IEnumerablerr' 2
<rr2 3
CommentViewModelrr3 C
>rrC D
>rrD E
>rrE F
GetAllCommentrrG T
(rrT U
[rrU V
	FromRouterrV _
]rr_ `
Guidrra e
idRestaurantrrf r
)rrr s
{ss 	
vartt 
listtt 
=tt 
awaittt 
_commentServicett ,
.tt, -
GetAlltt- 3
(tt3 4
idRestauranttt4 @
)tt@ A
;ttA B
returnuu 
_mapperuu 
.uu 
Mapuu 
<uu 
Listuu #
<uu# $
CommentViewModeluu$ 4
>uu4 5
>uu5 6
(uu6 7
listuu7 ;
)uu; <
;uu< =
}vv 	
[xx 	
HttpGetxx	 
(xx 
$strxx 6
)xx6 7
]xx7 8
[yy 	
ClaimsAuthorizeyy	 
(yy 
$stryy %
,yy% &
$stryy' ,
)yy, -
]yy- .
publiczz 
asynczz 
Taskzz 
<zz 
ActionResultzz &
<zz& '
CommentViewModelzz' 7
>zz7 8
>zz8 9

GetCommentzz: D
(zzD E
[zzE F
	FromRoutezzF O
]zzO P
GuidzzQ U
idRestaurantzzV b
,zzb c
[zzd e
	FromRoutezze n
]zzn o
Guidzzp t
	idCommentzzu ~
)zz~ 
{{{ 	
return|| 
_mapper|| 
.|| 
Map|| 
<|| 
CommentViewModel|| /
>||/ 0
(||0 1
await||1 6
_commentService||7 F
.||F G
GetById||G N
(||N O
idRestaurant||O [
,||[ \
	idComment||] f
)||f g
)||g h
;||h i
}}} 	
[ 	
HttpPut	 
( 
$str 6
)6 7
]7 8
[
ÄÄ 	
ClaimsAuthorize
ÄÄ	 
(
ÄÄ 
$str
ÄÄ %
,
ÄÄ% &
$str
ÄÄ' ,
)
ÄÄ, -
]
ÄÄ- .
public
ÅÅ 
async
ÅÅ 
Task
ÅÅ 
<
ÅÅ 
ActionResult
ÅÅ &
<
ÅÅ& '
CommentViewModel
ÅÅ' 7
>
ÅÅ7 8
>
ÅÅ8 9
UpdateComment
ÅÅ: G
(
ÅÅG H
[
ÅÅH I
	FromRoute
ÅÅI R
]
ÅÅR S
Guid
ÅÅT X
idRestaurant
ÅÅY e
,
ÅÅe f
[
ÅÅg h
	FromRoute
ÅÅh q
]
ÅÅq r
Guid
ÅÅs w
	idCommentÅÅx Å
,ÅÅÅ Ç
[ÅÅÉ Ñ
FromBodyÅÅÑ å
]ÅÅå ç 
CommentViewModelÅÅé û
	viewModelÅÅü ®
)ÅÅ® ©
{
ÇÇ 	
if
ÉÉ 
(
ÉÉ 
!
ÉÉ 

ModelState
ÉÉ 
.
ÉÉ 
IsValid
ÉÉ #
)
ÉÉ# $
return
ÉÉ% +
CustomResponse
ÉÉ, :
(
ÉÉ: ;

ModelState
ÉÉ; E
)
ÉÉE F
;
ÉÉF G
var
ÖÖ 
entity
ÖÖ 
=
ÖÖ 
await
ÖÖ 
_commentService
ÖÖ .
.
ÖÖ. /
Update
ÖÖ/ 5
(
ÖÖ5 6
idRestaurant
ÖÖ6 B
,
ÖÖB C
	idComment
ÖÖD M
,
ÖÖM N
_mapper
ÖÖO V
.
ÖÖV W
Map
ÖÖW Z
<
ÖÖZ [
Comment
ÖÖ[ b
>
ÖÖb c
(
ÖÖc d
	viewModel
ÖÖd m
)
ÖÖm n
)
ÖÖn o
;
ÖÖo p
var
áá 
resp
áá 
=
áá 
_mapper
áá 
.
áá 
Map
áá "
<
áá" #
CommentViewModel
áá# 3
>
áá3 4
(
áá4 5
entity
áá5 ;
)
áá; <
;
áá< =
return
ââ 
CustomResponse
ââ !
(
ââ! "
resp
ââ" &
)
ââ& '
;
ââ' (
}
ää 	
[
åå 	

HttpDelete
åå	 
(
åå 
$str
åå 9
)
åå9 :
]
åå: ;
[
çç 	
ClaimsAuthorize
çç	 
(
çç 
$str
çç %
,
çç% &
$str
çç' ,
)
çç, -
]
çç- .
public
éé 
async
éé 
Task
éé 
<
éé 
ActionResult
éé &
<
éé& '
CommentViewModel
éé' 7
>
éé7 8
>
éé8 9
DeleteComment
éé: G
(
ééG H
[
ééH I
	FromRoute
ééI R
]
ééR S
Guid
ééT X
idRestaurant
ééY e
,
éée f
[
éég h
	FromRoute
ééh q
]
ééq r
Guid
éés w
	idCommentééx Å
)ééÅ Ç
{
èè 	
return
êê 
_mapper
êê 
.
êê 
Map
êê 
<
êê 
CommentViewModel
êê /
>
êê/ 0
(
êê0 1
await
êê1 6
_commentService
êê7 F
.
êêF G
Delete
êêG M
(
êêM N
idRestaurant
êêN Z
,
êêZ [
	idComment
êê\ e
)
êêe f
)
êêf g
;
êêg h
}
ëë 	
[
ìì 	
HttpGet
ìì	 
(
ìì 
$str
ìì *
)
ìì* +
]
ìì+ ,
[
îî 	
ClaimsAuthorize
îî	 
(
îî 
$str
îî %
,
îî% &
$str
îî' ,
)
îî, -
]
îî- .
public
ïï 
async
ïï 
Task
ïï 
<
ïï 
ActionResult
ïï &
<
ïï& '
List
ïï' +
<
ïï+ ,
ProductViewModel
ïï, <
>
ïï< =
>
ïï= >
>
ïï> ?
GetAllProducts
ïï@ N
(
ïïN O
[
ïïO P
	FromRoute
ïïP Y
]
ïïY Z
Guid
ïï[ _
idRestaurant
ïï` l
)
ïïl m
{
ññ 	
return
óó 
_mapper
óó 
.
óó 
Map
óó 
<
óó 
List
óó #
<
óó# $
ProductViewModel
óó$ 4
>
óó4 5
>
óó5 6
(
óó6 7
await
óó7 <
_productService
óó= L
.
óóL M
GetByRestaurant
óóM \
(
óó\ ]
idRestaurant
óó] i
)
óói j
)
óój k
;
óók l
}
òò 	
[
öö 	
HttpGet
öö	 
(
öö 
$str
öö 6
)
öö6 7
]
öö7 8
[
õõ 	
ClaimsAuthorize
õõ	 
(
õõ 
$str
õõ %
,
õõ% &
$str
õõ' ,
)
õõ, -
]
õõ- .
public
úú 
async
úú 
Task
úú 
<
úú 
ActionResult
úú &
<
úú& '
ProductViewModel
úú' 7
>
úú7 8
>
úú8 9

GetProduct
úú: D
(
úúD E
[
úúE F
	FromRoute
úúF O
]
úúO P
Guid
úúQ U
idRestaurant
úúV b
,
úúb c
[
úúd e
	FromRoute
úúe n
]
úún o
Guid
úúp t
	idProduct
úúu ~
)
úú~ 
{
ùù 	
return
ûû 
_mapper
ûû 
.
ûû 
Map
ûû 
<
ûû 
ProductViewModel
ûû /
>
ûû/ 0
(
ûû0 1
await
ûû1 6
_productService
ûû7 F
.
ûûF G(
GetByRestaurantByIdProduct
ûûG a
(
ûûa b
idRestaurant
ûûb n
,
ûûn o
	idProduct
ûûp y
)
ûûy z
)
ûûz {
;
ûû{ |
}
üü 	
}
££ 
}§§ œ
qD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Address\AddressBaseCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Address$ +
{ 
public 

class '
AddressBaseCreatedViewModel ,
{		 
public

 
string

 
Street

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
string 
District 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
County 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Latitude 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	Longitude 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} Î
jD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Address\AddressBaseViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Address$ +
{ 
public 

class  
AddressBaseViewModel %
:& '
BaseViewModel( 5
{		 
public

 
string

 
Street

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
string 
District 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
County 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Latitude 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	Longitude 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ◊
wD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Address\AddressRestaurantCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Address$ +
{ 
public 

class -
!AddressRestaurantCreatedViewModel 2
:3 4'
AddressBaseCreatedViewModel5 P
{		 
}

 
} ¬
pD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Address\AddressRestaurantViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Address$ +
{ 
public 

class &
AddressRestaurantViewModel +
:, - 
AddressBaseViewModel. B
{		 
}

 
} À
qD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Address\AddressUserCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Address$ +
{ 
public 

class '
AddressUserCreatedViewModel ,
:- .'
AddressBaseCreatedViewModel/ J
{		 
}

 
} ∂
jD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Address\AddressUserViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Address$ +
{ 
public 

class  
AddressUserViewModel %
:& ' 
AddressBaseViewModel( <
{		 
}

 
} ‚
[D:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\BaseViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
{ 
public		 

abstract		 
class		 
BaseViewModel		 '
{

 
[ 	
Key	 
] 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
	UpdatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ˆ
}D:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\CategoryProduct\CategoryProductCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
CategoryProduct$ 3
{ 
public		 

class		 +
CategoryProductCreatedViewModel		 0
{

 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage &
=' (
$str) d
,d e
MinimumLengthf s
=t u
$numv w
)w x
]x y
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* e
,e f
MinimumLengthg t
=u v
$numw x
)x y
]y z
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} í
vD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\CategoryProduct\CategoryProductViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
CategoryProduct$ 3
{ 
public		 

class		 $
CategoryProductViewModel		 )
:		* +
BaseViewModel		, 9
{

 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage &
=' (
$str) d
,d e
MinimumLengthf s
=t u
$numv w
)w x
]x y
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* e
,e f
MinimumLengthg t
=u v
$numw x
)x y
]y z
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} É
ÉD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\CategoryRestaurant\CategoryRestaurantCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
CategoryRestaurant$ 6
{ 
public		 

class		 .
"CategoryRestaurantCreatedViewModel		 3
{

 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage &
=' (
$str) d
,d e
MinimumLengthf s
=t u
$numv w
)w x
]x y
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* e
,e f
MinimumLengthg t
=u v
$numw x
)x y
]y z
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} û
|D:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\CategoryRestaurant\CategoryRestaurantViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
CategoryRestaurant$ 6
{ 
public		 

class		 '
CategoryRestaurantViewModel		 ,
:		- .
BaseViewModel		/ <
{

 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage &
=' (
$str) d
,d e
MinimumLengthf s
=t u
$numv w
)w x
]x y
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* e
,e f
MinimumLengthg t
=u v
$numw x
)x y
]y z
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} æ
mD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Comment\CommentCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Comment$ +
{ 
public 

class #
CommentCreatedViewModel (
{ 
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
public 
decimal 
Starts 
{ 
get  #
;# $
set% (
;( )
}* +
}		 
}

 ⁄
fD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Comment\CommentViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Comment$ +
{ 
public 

class 
CommentViewModel !
:" #
BaseViewModel$ 1
{ 
public 
string 
Text 
{ 
get  
;  !
set" %
;% &
}' (
public 
decimal 
Starts 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ”
kD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Coupon\CouponCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Coupon$ *
{ 
public 

class "
CouponCreatedViewModel '
{ 
public 
string 
Code 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
Value 
{ 
get 
; 
set  #
;# $
}% &
public		 
DateTime		 
ExpireAt		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
}

 
} Ô
dD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Coupon\CouponViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Coupon$ *
{ 
public 

class 
CouponViewModel  
:! "
BaseViewModel# 0
{ 
public 
string 
Code 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
Value 
{ 
get 
; 
set  #
;# $
}% &
public		 
DateTime		 
ExpireAt		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
}

 
} é
`D:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Item\ItemViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Item$ (
{ 
public 

class 
ItemViewModel 
:  
BaseViewModel! .
{ 
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public		 
int		 
Quantity		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
public

 
Guid

 
	IdProduct

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
ProductViewModel 
Product  '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
} 
} è
iD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Order\OrderCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Order$ )
{ 
public 

class !
OrderCreatedViewModel &
:' (
BaseViewModel) 6
{ 
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
OrderStatus !
{" #
get$ '
;' (
set) ,
;, -
}. /
public		 
Guid		 
?		 
IdCoupon		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
} 
} é
tD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Order\OrderStatus\OrderStatusViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Order$ )
.) *
OrderStatus* 5
{ 
public 

class  
OrderStatusViewModel %
:& '
BaseViewModel( 5
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
Number 
{ 
get 
;  
set! $
;$ %
}& '
} 
} Ö	
bD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Order\OrderViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Order$ )
{ 
public 

class 
OrderViewModel 
:  !
BaseViewModel" /
{		 
public

 
Guid

 
?

 
IdCoupon

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
CouponViewModel 
Coupon %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
Guid 
? 
IdProfileUser "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
IEnumerable "
<" #
ItemViewModel# 0
>0 1
Items2 7
{8 9
get: =
;= >
set? B
;B C
}D E
} 
} ä
mD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Product\ProductCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Product$ +
{ 
public 

class #
ProductCreatedViewModel (
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Boolean 
Vegan 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Boolean 

Vegetarian !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Boolean 
Kosher 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
public 
Guid 
IdCategoryProduct %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
Guid 
IdRestaurant  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ≈
fD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Product\ProductViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Product$ +
{		 
public

 

class

 
ProductViewModel

 !
:

" #
BaseViewModel

$ 1
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Boolean 
Vegan 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Boolean 

Vegetarian !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Boolean 
Kosher 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
public $
CategoryProductViewModel '
CategoryProduct( 7
{8 9
get: =
;= >
set? B
;B C
}D E
public 
RestaurantViewModel "

Restaurant# -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
} 
} Ç
mD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Profile\ProfileCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Profile$ +
{ 
public 

class #
ProfileCreatedViewModel (
{		 
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
? 
	BirthDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
Type 
{ 
get 
; 
set "
;" #
}$ %
} 
} ¬

mD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Response\ResponseErrorViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Response$ ,
{ 
public 

class "
ResponseErrorViewModel '
{ 
public 
bool 
success 
{ 
get !
;! "
set# &
;& '
}( )
public 
IEnumerable 
< 
string !
>! "
errors# )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public

 "
ResponseErrorViewModel

 %
(

% &
)

& '
{ 	
} 	
public "
ResponseErrorViewModel %
(% &
bool& *
success+ 2
,2 3
IEnumerable4 ?
<? @
string@ F
>F G
errorsH N
)N O
{ 	
this 
. 
success 
= 
success "
;" #
this 
. 
errors 
= 
errors  
;  !
} 	
} 
} ‘	
oD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Response\ResponseSuccessViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
Response$ ,
{ 
public 

class $
ResponseSuccessViewModel )
{ 
public 
bool 
success 
{ 
get !
;! "
set# &
;& '
}( )
public 
object 
data 
{ 
get  
;  !
set" %
;% &
}' (
public		 $
ResponseSuccessViewModel		 '
(		' (
)		( )
{

 	
} 	
public $
ResponseSuccessViewModel '
(' (
bool( ,
success- 4
,4 5
object6 <
data= A
)A B
{ 	
this 
. 
success 
= 
success "
;" #
this 
. 
data 
= 
data 
; 
} 	
} 
} √	
sD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Restaurant\RestaurantCreatedViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $

Restaurant$ .
{		 
public

 

class

 &
RestaurantCreatedViewModel

 +
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
public 
Guid  
IdCategoryRestaurant (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public -
!AddressRestaurantCreatedViewModel 0
Address1 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
} 
} ‘
lD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\Restaurant\RestaurantViewModel.cs
	namespace		 	
IHunger		
 
.		 
WebAPI		 
.		 

ViewModels		 #
.		# $

Restaurant		$ .
{

 
public 

class 
RestaurantViewModel $
:% &
BaseViewModel' 4
{ 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
public '
CategoryRestaurantViewModel *
CategoryRestaurant+ =
{> ?
get@ C
;C D
setE H
;H I
}J K
public &
AddressRestaurantViewModel )
AddressRestaurant* ;
{< =
get> A
;A B
setC F
;F G
}H I
public 
IEnumerable 
< 
CommentViewModel +
>+ ,
Comments- 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
} 
} Ï
aD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\User\ClaimViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
User$ (
{ 
public		 

class		 
ClaimViewModel		 
{

 
public 
string 
Value 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
ClaimViewModel 
( 
) 
{ 	
} 	
public 
ClaimViewModel 
( 
Claim #
claim$ )
)) *
{ 	
Value 
= 
claim 
. 
Value 
;  
Type 
= 
claim 
. 
Type 
; 
} 	
} 
} Ë
iD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\User\LoginResponseViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
User$ (
{ 
public 

class "
LoginResponseViewModel '
{		 
public

 
string

 
AccessToken

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
public 
double 
	ExpiresIn 
{  !
get" %
;% &
set' *
;* +
}, -
public 
UserTokenViewModel !
	UserToken" +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} ç

eD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\User\LoginUserViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
User$ (
{ 
public		 

class		 
LoginUserViewModel		 #
{

 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
EmailAddress	 
( 
ErrorMessage "
=# $
$str% ?
)? @
]@ A
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* D
)D E
]E F
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ò,
hD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\User\RegisterUserViewModel.cs
	namespace		 	
IHunger		
 
.		 
WebAPI		 
.		 

ViewModels		 #
.		# $
User		$ (
{

 
public 

class !
RegisterUserViewModel &
{ 
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
EmailAddress	 
( 
ErrorMessage "
=# $
$str% ?
)? @
]@ A
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 	
StringLength	 
( 
$num 
, 
ErrorMessage '
=( )
$str* e
,e f
MinimumLengthg t
=u v
$numw x
)x y
]y z
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Compare	 
( 
$str 
, 
ErrorMessage )
=* +
$str, E
)E F
]F G
public 
string 
ConfirmPassword %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public #
ProfileCreatedViewModel &
Profile' .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public '
AddressUserCreatedViewModel *
Address+ 2
{3 4
get5 8
;8 9
set: =
;= >
}? @
public 
Domain 
. 
Models 
. 
User !
ToDomain" *
(* +
)+ ,
{ 	
var 
entity 
= 
new 
Domain #
.# $
Models$ *
.* +
User+ /
(/ 0
)0 1
;1 2
entity 
. 
UserName 
= 
Email #
;# $
entity   
.   
Email   
=   
Email    
;    !
entity!! 
.!! 
EmailConfirmed!! !
=!!" #
true!!$ (
;!!( )
entity## 
.## 
ProfileUser## 
=##  
new##! $
Domain##% +
.##+ ,
Models##, 2
.##2 3
ProfileUser##3 >
(##> ?
)##? @
;##@ A
entity$$ 
.$$ 
ProfileUser$$ 
.$$ 
Name$$ #
=$$$ %
Profile$$& -
.$$- .
Name$$. 2
;$$2 3
entity%% 
.%% 
ProfileUser%% 
.%% 
LastName%% '
=%%( )
Profile%%* 1
.%%1 2
LastName%%2 :
;%%: ;
entity&& 
.&& 
ProfileUser&& 
.&& 
	BirthDate&& (
=&&) *
Profile&&+ 2
.&&2 3
	BirthDate&&3 <
;&&< =
entity'' 
.'' 
ProfileUser'' 
.'' 
Type'' #
=''$ %
Profile''& -
.''- .
Type''. 2
;''2 3
if** 
(** 
Address** 
!=** 
null** 
)** 
{++ 
entity,, 
.,, 
ProfileUser,, "
.,," #
AddressUser,,# .
=,,/ 0
new,,1 4
Domain,,5 ;
.,,; <
Models,,< B
.,,B C
AddressUser,,C N
(,,N O
),,O P
;,,P Q
entity-- 
.-- 
ProfileUser-- "
.--" #
AddressUser--# .
.--. /
Street--/ 5
=--6 7
Address--8 ?
.--? @
Street--@ F
;--F G
entity.. 
... 
ProfileUser.. "
..." #
AddressUser..# .
.... /
District../ 7
=..8 9
Address..: A
...A B
District..B J
;..J K
entity// 
.// 
ProfileUser// "
.//" #
AddressUser//# .
.//. /
City/// 3
=//4 5
Address//6 =
.//= >
City//> B
;//B C
entity00 
.00 
ProfileUser00 "
.00" #
AddressUser00# .
.00. /
County00/ 5
=006 7
Address008 ?
.00? @
County00@ F
;00F G
entity11 
.11 
ProfileUser11 "
.11" #
AddressUser11# .
.11. /
ZipCode11/ 6
=117 8
Address119 @
.11@ A
ZipCode11A H
;11H I
entity22 
.22 
ProfileUser22 "
.22" #
AddressUser22# .
.22. /
Latitude22/ 7
=228 9
Address22: A
.22A B
Latitude22B J
;22J K
entity33 
.33 
ProfileUser33 "
.33" #
AddressUser33# .
.33. /
	Longitude33/ 8
=339 :
Address33; B
.33B C
	Longitude33C L
;33L M
}44 
return66 
entity66 
;66 
}77 	
}88 
}99 ª
eD:\TI\git\v2\IHunger_API\IHunger\1 - Application\IHunger.WebAPI\ViewModels\User\UserTokenViewModel.cs
	namespace 	
IHunger
 
. 
WebAPI 
. 

ViewModels #
.# $
User$ (
{ 
public		 

class		 
UserTokenViewModel		 #
{

 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
IEnumerable 
< 
ClaimViewModel )
>) *
Claims+ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
UserTokenViewModel !
(! "
)" #
{ 	
} 	
public 
UserTokenViewModel !
(! "
Domain" (
.( )
Models) /
./ 0
User0 4
user5 9
,9 :
IList; @
<@ A
ClaimA F
>F G
claimsH N
)N O
{ 	
Id 
= 
user 
. 
Id 
. 
ToString !
(! "
)" #
;# $
Email 
= 
user 
. 
Email 
; 
Claims 
= 
claims 
. 
Select "
(" #
c# $
=>% '
new( +
ClaimViewModel, :
(: ;
c; <
)< =
)= >
;> ?
} 	
} 
} 