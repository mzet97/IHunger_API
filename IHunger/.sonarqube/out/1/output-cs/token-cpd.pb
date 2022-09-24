ß
YD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Enumeration\TypeOrderStatus.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Enumeration $
{ 
public		 

enum		 
TypeOrderStatus		 
{

 
WaitingForPayment 
= 
$num 
, 
Paid 
= 
$num 
, 
	Preparing 
= 
$num 
, 
OutForDelivery 
= 
$num 
, 
	Delivered 
= 
$num 
} 
} É
UD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Enumeration\TypeProfile.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Enumeration $
{ 
public		 

enum		 
TypeProfile		 
{

 
Admin 
= 
$num 
, 
Client 
= 
$num 
, 

Restaurant 
= 
$num 
} 
} ∫
RD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\INotifier.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
{		 
public

 

	interface

 
	INotifier

 
{ 
bool 
HasNotification 
( 
) 
; 
List 
< 
Notification 
> 
GetNotifications +
(+ ,
), -
;- .
void 
Handle 
( 
Notification  
notification! -
)- .
;. /
} 
} ö
TD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\IRepository.cs
	namespace		 	
IHunger		
 
.		 
Domain		 
.		 

Interfaces		 #
{

 
public 

	interface 
IRepository  
<  !
TEntity! (
>( )
:* +
IDisposable, 7
where8 =
TEntity> E
:F G
EntityH N
{ 
Task 
Add 
( 
TEntity 
entity 
)  
;  !
Task 
< 
TEntity 
> 
GetById 
( 
Guid "
id# %
)% &
;& '
Task 
< 
List 
< 
TEntity 
> 
> 
GetAll "
(" #
)# $
;$ %
Task 
< 
IEnumerable 
< 
TEntity  
>  !
>! "
Find# '
(' (

Expression( 2
<2 3
Func3 7
<7 8
TEntity8 ?
,? @
boolA E
>E F
>F G
	predicateH Q
)Q R
;R S
void 
Update 
( 
TEntity 
entity "
)" #
;# $
void 
Remove 
( 
Guid 
id 
) 
; 
Task 
< 
List 
< 
TEntity 
> 
> 
Search "
(" #

Expression 
< 
Func 
< 
TEntity #
,# $
bool% )
>) *
>* +
	predicate, 5
=6 7
null8 <
,< =
Func 
< 

IQueryable 
< 
TEntity #
># $
,$ %
IOrderedQueryable& 7
<7 8
TEntity8 ?
>? @
>@ A
orderByB I
=J K
nullL P
,P Q
int 
? 
pageSize 
= 
null  
,  !
int 
? 
index 
= 
null 
) 
; 
Task 
< 
bool 
> 
Commit 
( 
) 
; 
} 
} ¸
[D:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\IRepositoryFactory.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
{		 
public

 

	interface

 
IRepositoryFactory

 '
{ (
IAddressRestaurantRepository $'
AddressRestaurantRepository% @
{A B
getC F
;F G
}H I"
IAddressUserRepository !
AddressUserRepository 4
{5 6
get7 :
;: ;
}< =&
ICategoryProductRepository "%
CategoryProductRepository# <
{= >
get? B
;B C
}D E)
ICategoryRestaurantRepository %(
CategoryRestaurantRepository& B
{C D
getE H
;H I
}J K
ICommentRepository 
CommentRepository ,
{- .
get/ 2
;2 3
}4 5
ICouponRepository 
CouponRepository *
{+ ,
get- 0
;0 1
}2 3
IItemRepository 
ItemRepository &
{' (
get) ,
;, -
}. /
IOrderRepository 
OrderRepository (
{) *
get+ .
;. /
}0 1"
IOrderStatusRepository !
OrderStatusRepository 4
{5 6
get7 :
;: ;
}< =
IProductRepository 
ProductRepository ,
{- .
get/ 2
;2 3
}4 5!
IRestaurantRepository  
RestaurantRepository 2
{3 4
get5 8
;8 9
}: ;"
IProfileUserRepository !
ProfileUserRepository 4
{5 6
get7 :
;: ;
}< =
} 
} ö
TD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\IUnitOfWork.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
{ 
public		 

	interface		 
IUnitOfWork		  
{

 
Task 
< 
bool 
> 
Commit 
( 
) 
; 
void 
Dispose 
( 
) 
; 
IRepositoryFactory 
RepositoryFactory ,
{- .
get/ 2
;2 3
}4 5
} 
} º
ND:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\IUser.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
{		 
public

 

	interface

 
IUser

 
{ 
string 
Name 
{ 
get 
; 
} 
Guid 
	GetUserId 
( 
) 
; 
string 
GetUserEmail 
( 
) 
; 
bool 
IsAuthenticated 
( 
) 
; 
bool 
IsInRole 
( 
string 
role !
)! "
;" #
IEnumerable 
< 
Claim 
> 
GetClaimsIdentity ,
(, -
)- .
;. /
} 
} ˇ
pD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\IAddressRestaurantRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public 

	interface (
IAddressRestaurantRepository 1
:2 3
IRepository4 ?
<? @
AddressRestaurant@ Q
>Q R
{		 
}

 
} Ì
jD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\IAddressUserRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public 

	interface "
IAddressUserRepository +
:, -
IRepository. 9
<9 :
AddressUser: E
>E F
{		 
}

 
} ˘
nD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\ICategoryProductRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public 

	interface &
ICategoryProductRepository /
:0 1
IRepository2 =
<= >
CategoryProduct> M
>M N
{		 
}

 
} Ç
qD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\ICategoryRestaurantRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public 

	interface )
ICategoryRestaurantRepository 2
:3 4
IRepository5 @
<@ A
CategoryRestaurantA S
>S T
{		 
}

 
} Æ
fD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\ICommentRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public		 

	interface		 
ICommentRepository		 '
:		( )
IRepository		* 5
<		5 6
Comment		6 =
>		= >
{

 
Task 
< 
Comment 
> 
GetById 
( 
Guid "
idRestaurant# /
,/ 0
Guid1 5
	idComment6 ?
)? @
;@ A
Task 
< 
List 
< 
Comment 
> 
> 
GetAll "
(" #
Guid# '
idRestaurant( 4
)4 5
;5 6
} 
} ﬁ
eD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\ICouponRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public 

	interface 
ICouponRepository &
:' (
IRepository) 4
<4 5
Coupon5 ;
>; <
{		 
}

 
} ÿ
cD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\IItemRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public 

	interface 
IItemRepository $
:% &
IRepository' 2
<2 3
Item3 7
>7 8
{		 
}

 
} €
dD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\IOrderRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public 

	interface 
IOrderRepository %
:& '
IRepository( 3
<3 4
Order4 9
>9 :
{		 
}

 
} Ì
jD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\IOrderStatusRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public 

	interface "
IOrderStatusRepository +
:, -
IRepository. 9
<9 :
OrderStatus: E
>E F
{		 
}

 
} ¿
fD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\IProductRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public		 

	interface		 
IProductRepository		 '
:		( )
IRepository		* 5
<		5 6
Product		6 =
>		= >
{

 
Task 
< 
List 
< 
Product 
> 
> 
GetByRestaurant +
(+ ,
Guid, 0
id1 3
)3 4
;4 5
Task 
< 
Product 
> &
GetByRestaurantByIdProduct 0
(0 1
Guid1 5
idRestaurant6 B
,B C
GuidD H
	idProductI R
)R S
;S T
} 
} Ì
jD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\IProfileUserRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public		 

	interface		 "
IProfileUserRepository		 +
:		, -
IRepository		. 9
<		9 :
ProfileUser		: E
>		E F
{

 
} 
} Í
iD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Repository\IRestaurantRepository.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $

Repository$ .
{ 
public 

	interface !
IRestaurantRepository *
:+ ,
IRepository- 8
<8 9

Restaurant9 C
>C D
{		 
}

 
} ê
kD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\IAddressRestaurantService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{ 
public 

	interface %
IAddressRestaurantService .
{ 
}		 
}

 Ñ
eD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\IAddressUserService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{ 
public 

	interface 
IAddressUserService (
{ 
}		 
}

 ö
^D:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\IAuthService.cs
	namespace		 	
IHunger		
 
.		 
Domain		 
.		 

Interfaces		 #
.		# $
Services		$ ,
{

 
public 

	interface 
IAuthService !
{ 
Task 
< "
LoginResponseViewModel #
># $
GetJwt% +
(+ ,
string, 2
email3 8
)8 9
;9 :
Task 
< "
LoginResponseViewModel #
># $
Register% -
(- .
User. 2
user3 7
,7 8
string9 ?
password@ H
)H I
;I J
Task 
< "
LoginResponseViewModel #
># $
Login% *
(* +
string+ 1
email2 7
,7 8
string9 ?
password@ H
)H I
;I J
} 
} …
iD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\ICategoryProductService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{ 
public		 

	interface		 #
ICategoryProductService		 ,
{

 
Task 
< 
CategoryProduct 
> 
Create $
($ %
CategoryProduct% 4
categoryProduct5 D
)D E
;E F
Task 
< 
List 
< 
CategoryProduct !
>! "
>" #
GetAll$ *
(* +
)+ ,
;, -
Task 
< 
List 
< 
CategoryProduct !
>! "
>" #
GetAllWithFilter$ 4
(4 5!
CategoryProductFilter5 J!
categoryProductFilterK `
)` a
;a b
Task 
< 
CategoryProduct 
> 
GetById %
(% &
Guid& *
id+ -
)- .
;. /
Task 
< 
CategoryProduct 
> 
Update $
($ %
CategoryProduct% 4
categoryProduct5 D
)D E
;E F
Task 
< 
CategoryProduct 
> 
Delete $
($ %
Guid% )
id* ,
), -
;- .
} 
} Û
lD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\ICategoryRestaurantService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{ 
public		 

	interface		 &
ICategoryRestaurantService		 /
{

 
Task 
< 
CategoryRestaurant 
>  
Create! '
(' (
CategoryRestaurant( :
categoryRestaurant; M
)M N
;N O
Task 
< 
List 
< 
CategoryRestaurant $
>$ %
>% &
GetAll' -
(- .
). /
;/ 0
Task 
< 
List 
< 
CategoryRestaurant $
>$ %
>% &
GetAllWithFilter' 7
(7 8$
CategoryRestaurantFilter8 P$
CategoryRestaurantFilterQ i
)i j
;j k
Task 
< 
CategoryRestaurant 
>  
GetById! (
(( )
Guid) -
id. 0
)0 1
;1 2
Task 
< 
CategoryRestaurant 
>  
Update! '
(' (
CategoryRestaurant( :
categoryRestaurant; M
)M N
;N O
Task 
< 
CategoryRestaurant 
>  
Delete! '
(' (
Guid( ,
id- /
)/ 0
;0 1
} 
} ¡
aD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\ICommentService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{ 
public		 

	interface		 
ICommentService		 $
{

 
Task 
< 
Comment 
> 
Create 
( 
Guid !
idRestaurant" .
,. /
Comment0 7
comment8 ?
)? @
;@ A
Task 
< 
Comment 
> 
GetById 
( 
Guid "
idRestaurant# /
,/ 0
Guid1 5
	idComment6 ?
)? @
;@ A
Task 
< 
List 
< 
Comment 
> 
> 
GetAll "
(" #
Guid# '
idRestaurant( 4
)4 5
;5 6
Task 
< 
Comment 
> 
Update 
( 
Guid !
idRestaurant" .
,. /
Guid0 4
	idComment5 >
,> ?
Comment@ G
commentH O
)O P
;P Q
Task 
< 
Comment 
> 
Delete 
( 
Guid !
idRestaurant" .
,. /
Guid0 4
	idComment5 >
)> ?
;? @
} 
} û

`D:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\ICouponService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{ 
public		 

	interface		 
ICouponService		 #
{

 
Task 
< 
Coupon 
> 
Create 
( 
Coupon "
coupon# )
)) *
;* +
Task 
< 
List 
< 
Coupon 
> 
> 
GetAll !
(! "
bool" &
ative' ,
=- .
true/ 3
)3 4
;4 5
Task 
< 
Coupon 
> 
GetById 
( 
Guid !
id" $
)$ %
;% &
Task 
< 
Coupon 
> 
Update 
( 
Coupon "
coupon# )
)) *
;* +
Task 
< 
Coupon 
> 
Delete 
( 
Guid  
id! #
)# $
;$ %
} 
} ˆ
^D:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\IItemService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{ 
public 

	interface 
IItemService !
{ 
}		 
}

 â

_D:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\IOrderService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{		 
public

 

	interface

 
IOrderService

 "
{ 
Task 
< 
Order 
> 
Create 
( 
Order  
order! &
)& '
;' (
Task 
< 
List 
< 
Order 
> 
> 
GetAllWithFilter *
(* +
OrderFilter+ 6
orderFilter7 B
)B C
;C D
Task 
< 
Order 
> 
GetById 
( 
Guid  
id! #
)# $
;$ %
Task 
< 
Order 
> 
Update 
( 
Order  
order! &
)& '
;' (
Task 
< 
Order 
> 
Delete 
( 
Guid 
id  "
)" #
;# $
} 
} Î
eD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\IOrderStatusService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{ 
public		 

	interface		 
IOrderStatusService		 (
{

 
Task 
< 
List 
< 
OrderStatus 
> 
> 
GetAll  &
(& '
)' (
;( )
Task 
< 
OrderStatus 
> 
GetById !
(! "
Guid" &
id' )
)) *
;* +
} 
} Ç
aD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\IProductService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{		 
public

 

	interface

 
IProductService

 $
{ 
Task 
< 
Product 
> 
Create 
( 
Product $
product% ,
), -
;- .
Task 
< 
List 
< 
Product 
> 
> 
GetAllWithFilter ,
(, -
ProductFilter- :
productFilter; H
)H I
;I J
Task 
< 
Product 
> 
GetById 
( 
Guid "
id# %
)% &
;& '
Task 
< 
Product 
> &
GetByRestaurantByIdProduct 0
(0 1
Guid1 5
idRestaurant6 B
,B C
GuidD H
	idProductI R
)R S
;S T
Task 
< 
List 
< 
Product 
> 
> 
GetByRestaurant +
(+ ,
Guid, 0
id1 3
)3 4
;4 5
Task 
< 
Product 
> 
Update 
( 
Product $
product% ,
), -
;- .
Task 
< 
Product 
> 
Delete 
( 
Guid !
id" $
)$ %
;% &
} 
}  

dD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\IRestaurantService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{ 
public		 

	interface		 
IRestaurantService		 '
{

 
Task 
< 

Restaurant 
> 
Create 
(  

Restaurant  *

restaurant+ 5
)5 6
;6 7
Task 
< 
List 
< 

Restaurant 
> 
> 
GetAllWithFilter /
(/ 0
RestaurantFilter0 @
restaurantFilterA Q
)Q R
;R S
Task 
< 

Restaurant 
> 
GetById  
(  !
Guid! %
id& (
)( )
;) *
Task 
< 

Restaurant 
> 
Update 
(  

Restaurant  *

restaurant+ 5
)5 6
;6 7
Task 
< 

Restaurant 
> 
Delete 
(  
Guid  $
id% '
)' (
;( )
} 
} ˆ
^D:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Interfaces\Services\IUserService.cs
	namespace 	
IHunger
 
. 
Domain 
. 

Interfaces #
.# $
Services$ ,
{ 
public 

	interface 
IUserService !
{ 
}		 
}

 Ø
PD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\AddressBase.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

abstract 
class 
AddressBase %
:& '
Entity( .
{ 
public		 
string		 
Street		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
string

 
District

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
County 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Latitude 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	Longitude 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ›
VD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\AddressRestaurant.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
AddressRestaurant "
:# $
AddressBase% 0
{ 
public		 
AddressRestaurant		  
(		  !
)		! "
{

 	
} 	
} 
} À
PD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\AddressUser.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
AddressUser 
: 
AddressBase *
{ 
public		 
AddressUser		 
(		 
)		 
{

 	
} 	
} 
} µ
TD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\CategoryProduct.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
CategoryProduct  
:! "
Entity# )
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
public 
CategoryProduct 
( 
)  
{ 	
} 	
public 
CategoryProduct 
( 
Guid #
id$ &
,& '
string( .
name/ 3
,3 4
string5 ;
description< G
,G H
DateTimeI Q
	createdAtR [
)[ \
{ 	
Id 
= 
id 
; 
Name 
= 
name 
; 
Description 
= 
description %
;% &
	CreatedAt 
= 
	createdAt !
;! "
} 	
public 
bool 
IsValid 
( 
) 
{ 	
var 
validationResult  
=! "
new# &%
CategoryProductValidation' @
(@ A
)A B
.B C
ValidateC K
(K L
thisL P
)P Q
;Q R
return 
validationResult #
.# $
IsValid$ +
;+ ,
} 	
} 
}   í
WD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\CategoryRestaurant.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
CategoryRestaurant #
:$ %
Entity& ,
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Description
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
public 
CategoryRestaurant !
(! "
)" #
{ 	
} 	
} 
} ¬
LD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Comment.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
Comment 
: 
Entity !
{ 
public		 
string		 
Text		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
decimal

 
Starts

 
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
public 
Guid 
IdRestaurant  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
virtual 

Restaurant !

Restaurant" ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
Comment 
( 
) 
{ 	
} 	
} 
} Ë
KD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Coupon.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
Coupon 
: 
Entity  
{ 
public		 
string		 
Code		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
int

 
Value

 
{

 
get

 
;

 
set

  #
;

# $
}

% &
public 
DateTime 
ExpireAt  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
virtual 
IEnumerable "
<" #
Order# (
>( )
Orders* 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
Coupon 
( 
) 
{ 	
} 	
} 
} Å
KD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Entity.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

abstract 
class 
Entity  
{ 
	protected		 
Entity		 
(		 
)		 
{

 	
Id 
= 
Guid 
. 
NewGuid 
( 
) 
;  
} 	
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
	UpdatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ˆ

ID:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Item.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
Item 
: 
Entity 
{ 
public		 
decimal		 
Price		 
{		 
get		 "
;		" #
set		$ '
;		' (
}		) *
public

 
int

 
Quantity

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
Guid 
	IdProduct 
{ 
get  #
;# $
set% (
;( )
}* +
public 
virtual 
Product 
Product &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
Guid 
IdOrder 
{ 
get !
;! "
set# &
;& '
}( )
public 
virtual 
Order 
Order "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
Item 
( 
) 
{ 	
} 	
} 
} ò
JD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Order.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
Order 
: 
Entity 
{		 
public

 
decimal

 
Price

 
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
public 
TypeOrderStatus 
OrderStatus *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
virtual 
IEnumerable "
<" #
Item# '
>' (
Items) .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
Guid 
? 
IdCoupon 
{ 
get  #
;# $
set% (
;( )
}* +
public 
virtual 
Coupon 
Coupon $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
Guid 
? 
IdProfileUser "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
ProfileUser "
ProfileUser# .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
Order 
( 
) 
{ 	
} 	
} 
} ı
PD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\OrderStatus.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
OrderStatus 
: 
Entity %
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
int

 
Number

 
{

 
get

 
;

  
set

! $
;

$ %
}

& '
public 
OrderStatus 
( 
) 
{ 	
} 	
} 
} î
LD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Product.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
Product 
: 
Entity !
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Description
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
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Boolean 
Vegan 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Boolean 

Vegetarian !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Boolean 
Kosher 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
public 
Guid 
IdCategoryProduct %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
virtual 
CategoryProduct &
CategoryProduct' 6
{7 8
get9 <
;< =
set> A
;A B
}C D
public 
Guid 
IdRestaurant  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
virtual 

Restaurant !

Restaurant" ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
virtual 
IEnumerable "
<" #
Item# '
>' (
Itens) .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
Product 
( 
) 
{ 	
} 	
} 
} Ö
LD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Profile.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 
ProfileUser 
: 
Entity %
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
LastName

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
DateTime 
? 
	BirthDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
Type 
{ 
get 
; 
set "
;" #
}$ %
public 
Guid 
? 
IdAddressUser "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
virtual 
AddressUser "
AddressUser# .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
virtual 
IEnumerable "
<" #
Order# (
>( )
Orders* 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
ProfileUser 
( 
) 
{ 	
} 	
} 
} º
OD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Restaurant.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public 

class 

Restaurant 
: 
Entity $
{ 
public		 
string		 
Name		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
public

 
string

 
Description
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
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
public 
virtual 
IEnumerable "
<" #
Product# *
>* +
Products, 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
virtual 
IEnumerable "
<" #
Comment# *
>* +
Comments, 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
public 
Guid  
IdCategoryRestaurant (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
virtual 
CategoryRestaurant )
CategoryRestaurant* <
{= >
get? B
;B C
setD G
;G H
}I J
public 
Guid 
IdAddressRestaurant '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
virtual 
AddressRestaurant (
AddressRestaurant) :
{; <
get= @
;@ A
setB E
;E F
}G H
public 

Restaurant 
( 
) 
{ 	
} 	
} 
} ø
ID:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\User.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
{ 
public		 

class		 
User		 
:		 
IdentityUser		 $
<		$ %
Guid		% )
>		) *
{

 
public 
Guid 
IdProfileUser !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
virtual 
ProfileUser "
ProfileUser# .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
User 
( 
) 
{ 	
} 	
} 
} Õ
lD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\AddressRestaurantValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class '
AddressRestaurantValidation ,
:- .
AbstractValidator/ @
<@ A
AddressRestaurantA R
>R S
{		 
public

 '
AddressRestaurantValidation

 *
(

* +
)

+ ,
{ 	
RuleFor 
( 
a 
=> 
a 
. 
City 
)  
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
a 
=> 
a 
. 
County !
)! "
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
a 
=> 
a 
. 
District #
)# $
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
a 
=> 
a 
. 
Street !
)! "
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
a 
=> 
a 
. 
ZipCode "
)" #
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ 
)	 Ä
;
Ä Å
RuleFor   
(   
a   
=>   
a   
.   
Latitude   #
)  # $
.!! 
MaximumLength!! 
(!! 
$num!!  
)!!  !
.!!! "
WithMessage!!" -
(!!- .
$str!!. f
)!!f g
;!!g h
RuleFor## 
(## 
a## 
=>## 
a## 
.## 
	Longitude## $
)##$ %
.$$ 
MaximumLength$$ 
($$ 
$num$$  
)$$  !
.$$! "
WithMessage$$" -
($$- .
$str$$. f
)$$f g
;$$g h
}%% 	
}&& 
}'' µ
fD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\AddressUserValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class !
AddressUserValidation &
:' (
AbstractValidator) :
<: ;
AddressUser; F
>F G
{		 
public

 !
AddressUserValidation

 $
(

$ %
)

% &
{ 	
RuleFor 
( 
a 
=> 
a 
. 
City 
)  
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' P
)P Q
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage )
() *
$str* z
)z {
;{ |
RuleFor 
( 
a 
=> 
a 
. 
County !
)! "
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
a 
=> 
a 
. 
District #
)# $
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
a 
=> 
a 
. 
Street !
)! "
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
a 
=> 
a 
. 
ZipCode "
)" #
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ 
)	 Ä
;
Ä Å
RuleFor   
(   
a   
=>   
a   
.   
Latitude   #
)  # $
.!! 
MaximumLength!! 
(!! 
$num!!  
)!!  !
.!!! "
WithMessage!!" -
(!!- .
$str!!. f
)!!f g
;!!g h
RuleFor## 
(## 
a## 
=>## 
a## 
.## 
	Longitude## $
)##$ %
.$$ 
MaximumLength$$ 
($$ 
$num$$  
)$$  !
.$$! "
WithMessage$$" -
($$- .
$str$$. f
)$$f g
;$$g h
}%% 	
}&& 
}'' ·
jD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\CategoryProductValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class %
CategoryProductValidation *
:+ ,
AbstractValidator- >
<> ?
CategoryProduct? N
>N O
{		 
public

 %
CategoryProductValidation

 (
(

( )
)

) *
{ 	
RuleFor 
( 
c 
=> 
c 
. 
Name 
)  
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
c 
=> 
c 
. 
Description &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
.  
WithMessage  +
(+ ,
$str, |
)| }
;} ~
} 	
} 
} Ì
mD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\CategoryRestaurantValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class (
CategoryRestaurantValidation -
:. /
AbstractValidator0 A
<A B
CategoryRestaurantB T
>T U
{		 
public

 (
CategoryRestaurantValidation

 +
(

+ ,
)

, -
{ 	
RuleFor 
( 
c 
=> 
c 
. 
Name 
)  
. 
NotEmpty 
( 
) 
. 
WithMessage %
(% &
$str& O
)O P
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage (
(( )
$str) y
)y z
;z {
RuleFor 
( 
c 
=> 
c 
. 
Description &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
.  
WithMessage  +
(+ ,
$str, |
)| }
;} ~
} 	
} 
} 

bD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\CommentValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class 
CommentValidation "
:# $
AbstractValidator% 6
<6 7
Comment7 >
>> ?
{		 
public

 
CommentValidation

  
(

  !
)

! "
{ 	
RuleFor 
( 
c 
=> 
c 
. 
Starts !
)! "
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' P
)P Q
;Q R
RuleFor 
( 
c 
=> 
c 
. 
Text 
)  
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
.  
WithMessage  +
(+ ,
$str, |
)| }
;} ~
} 	
} 
} õ
aD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\CouponValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class 
CouponValidation !
:" #
AbstractValidator$ 5
<5 6
Coupon6 <
>< =
{		 
public

 
CouponValidation

 
(

  
)

  !
{ 	
RuleFor 
( 
c 
=> 
c 
. 
Code 
)  
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
c 
=> 
c 
. 
Value  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
;R S
RuleFor 
( 
c 
=> 
c 
. 
ExpireAt #
)# $
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
;R S
} 	
} 
} õ	
_D:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\ItemValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class 
ItemValidation 
:  !
AbstractValidator" 3
<3 4
Item4 8
>8 9
{		 
public

 
ItemValidation

 
(

 
)

 
{ 	
RuleFor 
( 
i 
=> 
i 
. 
Price  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' P
)P Q
;Q R
RuleFor 
( 
i 
=> 
i 
. 
Quantity #
)# $
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
;R S
} 	
} 
} Ô
`D:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\OrderValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class 
OrderValidation  
:! "
AbstractValidator# 4
<4 5
Order5 :
>: ;
{		 
public

 
OrderValidation

 
(

 
)

  
{ 	
RuleFor 
( 
o 
=> 
o 
. 
Price  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' P
)P Q
;Q R
} 	
} 
} ¯
bD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\ProductValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class 
ProductValidation "
:# $
AbstractValidator% 6
<6 7
Product7 >
>> ?
{		 
public

 
ProductValidation

  
(

  !
)

! "
{ 	
RuleFor 
( 
p 
=> 
p 
. 
Price  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' P
)P Q
;Q R
RuleFor 
( 
p 
=> 
p 
. 
Kosher !
)! "
. 
NotNull 
( 
) 
. 
WithMessage %
(% &
$str& O
)O P
;P Q
RuleFor 
( 
p 
=> 
p 
. 
Vegan  
)  !
. 
NotNull 
( 
) 
. 
WithMessage $
($ %
$str% N
)N O
;O P
RuleFor 
( 
p 
=> 
p 
. 

Vegetarian %
)% &
. 
NotNull 
( 
) 
. 
WithMessage $
($ %
$str% N
)N O
;O P
RuleFor 
( 
a 
=> 
a 
. 
Name 
)  
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
a 
=> 
a 
. 
Description &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
.  
WithMessage  +
(+ ,
$str, |
)| }
;} ~
} 	
}   
}!! Ë
fD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\ProfileUserValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{		 
public

 

class

 !
ProfileUserValidation

 &
:

' (
AbstractValidator

) :
<

: ;
ProfileUser

; F
>

F G
{ 
public !
ProfileUserValidation $
($ %
)% &
{ 	
RuleFor 
( 
p 
=> 
p 
. 
	BirthDate $
)$ %
. 
NotEmpty 
( 
) 
. 
WithMessage &
(& '
$str' P
)P Q
;Q R
RuleFor 
( 
p 
=> 
p 
. 
Name 
)  
. 
NotEmpty 
( 
) 
. 
WithMessage *
(* +
$str+ T
)T U
;U V
RuleFor 
( 
p 
=> 
p 
. 
LastName #
)# $
. 
NotEmpty 
( 
) 
. 
WithMessage *
(* +
$str+ T
)T U
;U V
RuleFor 
( 
p 
=> 
p 
. 
Type 
)  
. 
NotNull 
( 
) 
. 
WithMessage )
() *
$str* S
)S T
. 
InclusiveBetween $
($ %
$num% &
,& '
$num( )
)) *
.* +
WithMessage+ 6
(6 7
$str7 [
)[ \
;\ ]
} 	
} 
} Õ
eD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\RestaurantValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class  
RestaurantValidation %
:& '
AbstractValidator( 9
<9 :

Restaurant: D
>D E
{		 
public

  
RestaurantValidation

 #
(

# $
)

$ %
{ 	
RuleFor 
( 
r 
=> 
r 
. 
Name 
)  
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
. 
WithMessage *
(* +
$str+ {
){ |
;| }
RuleFor 
( 
r 
=> 
r 
. 
Description &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( Q
)Q R
. 
Length 
( 
$num 
, 
$num 
) 
.  
WithMessage  +
(+ ,
$str, |
)| }
;} ~
} 	
} 
} û	
_D:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Models\Validations\UserValidation.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Models 
.  
Validations  +
{ 
public 

class 
UserValidation 
:  !
AbstractValidator" 3
<3 4
User4 8
>8 9
{		 
public

 
UserValidation

 
(

 
)

 
{ 	
RuleFor 
( 
u 
=> 
u 
. 
Email  
)  !
. 
NotEmpty 
( 
) 
. 
WithMessage *
(* +
$str+ T
)T U
;U V
RuleFor 
( 
u 
=> 
u 
. 
PhoneNumber &
)& '
. 
NotEmpty 
( 
) 
. 
WithMessage *
(* +
$str+ T
)T U
;U V
} 	
} 
} ¡
XD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Notifications\Notification.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Notifications &
{ 
public		 

class		 
Notification		 
{

 
public 
string 
message 
{ 
get  #
;# $
}% &
public 
Notification 
( 
string "
message# *
)* +
{ 	
this 
. 
message 
= 
message "
;" #
} 	
} 
} Ó
TD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Notifications\Notifier.cs
	namespace		 	
IHunger		
 
.		 
Domain		 
.		 
Notifications		 &
{

 
public 

class 
Notifier 
: 
	INotifier %
{ 
readonly 
ILogger 
< 
Notifier !
>! "
_log# '
;' (
private 
List 
< 
Notification !
>! "
_notifications# 1
;1 2
public 
Notifier 
( 
ILogger 
<  
Notifier  (
>( )
log* -
)- .
{ 	
_log 
= 
log 
; 
_notifications 
= 
new  
List! %
<% &
Notification& 2
>2 3
(3 4
)4 5
;5 6
} 	
public 
List 
< 
Notification  
>  !
GetNotifications" 2
(2 3
)3 4
{ 	
return 
_notifications !
;! "
} 	
public 
void 
Handle 
( 
Notification '
notification( 4
)4 5
{ 	
_log 
. 
LogInformation 
(  
notification  ,
., -
message- 4
)4 5
;5 6
_notifications 
. 
Add 
( 
notification +
)+ ,
;, -
} 	
public!! 
bool!! 
HasNotification!! #
(!!# $
)!!$ %
{"" 	
return## 
_notifications## !
.##! "
Any##" %
(##% &
)##& '
;##' (
}$$ 	
}%% 
}&& ∫
YD:\TI\git\v2\IHunger_API\IHunger\2 - Domain\IHunger.Domain\Notifications\NotifierNoLog.cs
	namespace 	
IHunger
 
. 
Domain 
. 
Notifications &
{		 
public

 

class

 
NotifierNoLog

 
:

  
	INotifier

! *
{ 
private 
List 
< 
Notification !
>! "
_notifications# 1
;1 2
public 
NotifierNoLog 
( 
) 
{ 	
_notifications 
= 
new  
List! %
<% &
Notification& 2
>2 3
(3 4
)4 5
;5 6
} 	
public 
List 
< 
Notification  
>  !
GetNotifications" 2
(2 3
)3 4
{ 	
return 
_notifications !
;! "
} 	
public 
void 
Handle 
( 
Notification '
notification( 4
)4 5
{ 	
_notifications 
. 
Add 
( 
notification +
)+ ,
;, -
} 	
public 
bool 
HasNotification #
(# $
)$ %
{ 	
return 
_notifications !
.! "
Any" %
(% &
)& '
;' (
}   	
}!! 
}"" 