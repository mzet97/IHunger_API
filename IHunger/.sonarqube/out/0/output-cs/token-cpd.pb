÷
rD:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\Extensions\AppSettings.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %

Extensions% /
{ 
public		 

class		 
AppSettings		 
{

 
public 
string 
Secret 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
ExpirationHours "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Issuer 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ValidOn 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} Ò

nD:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\Filters\BaseFilter.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %
Filters% ,
{ 
public		 

abstract		 
class		 

BaseFilter		 $
{

 
public 
Guid 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
	UpdatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Order 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
? 
	PageIndex 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
? 
PageSize 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ô
yD:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\Filters\CategoryProductFilter.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %
Filters% ,
{ 
public 

class !
CategoryProductFilter &
:' (

BaseFilter) 3
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
. /
} 
} ú
|D:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\Filters\CategoryRestaurantFilter.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %
Filters% ,
{ 
public 

class $
CategoryRestaurantFilter )
:* +

BaseFilter, 6
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
. /
} 
} ©
oD:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\Filters\OrderFilter.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %
Filters% ,
{ 
public		 

class		 
OrderFilter		 
:		 

BaseFilter		 )
{

 
} 
} º
qD:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\Filters\ProductFilter.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %
Filters% ,
{ 
public		 

class		 
ProductFilter		 
:		  

BaseFilter		! +
{

 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Boolean 
Vegan 
{ 
get "
;" #
set$ '
;' (
}) *
public 
Boolean 

Vegetarian !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
Boolean 
Kosher 
{ 
get  #
;# $
set% (
;( )
}* +
public 
Guid 
IdCategoryProduct %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
string 
NameCategoryProduct )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
Guid 
IdRestaurant  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ¦
tD:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\Filters\RestaurantFilter.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %
Filters% ,
{ 
public 

class 
RestaurantFilter !
:" #

BaseFilter$ .
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
public 
Guid 

CategoryId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
CategoryName "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ô
|D:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\ViewModels\User\AddressViewModel.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %

ViewModels% /
./ 0
User0 4
{ 
public		 

class		 
AddressViewModel		 !
{

 
public 
string 
Street 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
District 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
City 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
County 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
ZipCode 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Latitude 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
	Longitude 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} ­	
zD:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\ViewModels\User\ClaimViewModel.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %

ViewModels% /
./ 0
User0 4
{		 
public

 

class

 
ClaimViewModel

 
{ 
public 
string 
Value 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
public 
ClaimViewModel 
( 
) 
{ 	
} 	
public 
ClaimViewModel 
( 
Claim #
claim$ )
)) *
{ 	
Value 
= 
claim 
. 
Value 
;  
Type 
= 
claim 
. 
Type 
; 
} 	
} 
} ª
‚D:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\ViewModels\User\LoginResponseViewModel.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %

ViewModels% /
./ 0
User0 4
{ 
public		 

class		 "
LoginResponseViewModel		 '
{

 
public 
string 
AccessToken !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
double 
	ExpiresIn 
{  !
get" %
;% &
set' *
;* +
}, -
public 
UserTokenViewModel !
	UserToken" +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
} 
} ²
|D:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\ViewModels\User\ProfileViewModel.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %

ViewModels% /
./ 0
User0 4
{ 
public		 

class		 
ProfileViewModel		 !
{

 
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
DateTime 
? 
	BirthDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
Type 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ±
~D:\TI\git\v2\IHunger_API\IHunger\4 - Infra\4.2 - CrossCutting\IHunger.Infra.CrossCutting\ViewModels\User\UserTokenViewModel.cs
	namespace 	
IHunger
 
. 
Infra 
. 
CrossCutting $
.$ %

ViewModels% /
./ 0
User0 4
{		 
public

 

class

 
UserTokenViewModel

 #
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
ProfileViewModel 
Profile  '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
AddressViewModel 
Address  '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
IEnumerable 
< 
ClaimViewModel )
>) *
Claims+ 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
public 
UserTokenViewModel !
(! "
)" #
{ 	
} 	
public 
UserTokenViewModel !
(! "
string" (
id) +
,+ ,
string- 3
email4 9
,9 :
IList; @
<@ A
ClaimA F
>F G
claimsH N
)N O
{ 	
Id 
= 
id 
; 
Email 
= 
email 
; 
Claims 
= 
claims 
. 
Select "
(" #
c# $
=>% '
new( +
ClaimViewModel, :
(: ;
c; <
)< =
)= >
;> ?
} 	
} 
}   