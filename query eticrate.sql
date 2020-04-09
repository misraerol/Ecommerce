Create Database ECORE2020

use ECommerce2020

Create Table AppUser(
AppUserId int identity primary key
,Email nvarchar(200) 
,[Password] nvarchar(max)
,IsActivation bit not null
,IsWantNotification bit not null
,FirstName nvarchar(100)
,LastName nvarchar(100)
,BirthDate datetime not null
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

Create Table City (
CityId int identity primary key
,Name nvarchar(max)
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

Create Table County (
CountyId int identity primary key
,Name nvarchar(max)
,CityId int references City(CityId) not null
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)


Create Table [Address](
AddressId int identity primary key
,AppUserId int references AppUser(AppUserId) not null
,Title nvarchar(150)
,Explanation  nvarchar(max)
,CountyId int references County(CountyId) not null
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

Create Table AppUserMapAddress(
AppUserMapAddress int  identity primary key
,AddressId int references [Address](AddressId) not null
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)



Create Table Category(
CategoryId int identity primary key
,[Name] nvarchar(200)
,TopCategoryId int not null
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

Create Table Shipper(
ShipperId int primary key identity
,Name nvarchar(100)
,ImagePath nvarchar(max)
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)


Create Table Product(
ProductId int identity primary key
,[Name] nvarchar(200)
,ShortName nvarchar(150)
,Explanation nvarchar(max)
,Amount money not null
,DiscountRate money not null
,CategoryId int references Category(CategoryId)
,ParentId int --kankileri
,IsShipperPay bit not null ---kargo parasý var mý ?
,IsRequiredFields bit not null 
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

Create Table ProductMapImage(
ProductMapImageId int primary key identity
,ProductId int references Product(ProductId) not null
,ImagePath nvarchar(max)
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

Create Table ProductMapShippers(
ProductMapShippersId int primary key identity
,ProductId int references Product(ProductId) not null
,ShipperId int references Shipper(ShipperId) not null
,Amount money
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

Create Table ParameterType(
ParameterTypeId int identity primary key
,Name nvarchar(max)
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

Create Table Parameter(
ParameterId int identity primary key
,Name nvarchar(max)
,ParameterTypeId int references ParameterType(ParameterTypeId)not null
,TypeValue int
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

---bak
Create Table ProductMapRequiredFields(
ProductMapRequiredFieldsId int primary key identity
,ProductId int references Product(ProductId) not null
,ParameterTypeId int references ParameterType(ParameterTypeId)not null
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)


Create Table ProductMapProperty(
ProductMapPropertyId int primary key identity
,ProductId int references Product(ProductId) not null
,ParameterId int references ParameterType(ParameterTypeId)not null
,PropetyKey nvarchar(max)
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)


Create Table DiscountKey(
DiscountKeyId int primary key identity
,Discount decimal
,GuidKey nvarchar(100)
,ExpiredDate datetime null
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

Create Table ProductMapComment(
ProductMapComment int primary key identity
,ProductId int references Product(ProductId) not null
,AppUserId int not null references AppUser(AppUserId)
,Comment nvarchar(max)
,Star tinyint not null
,IsApproved bit not null
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

Create Table AppUserMapWish(
AppUserMapWish int identity primary key
,AppUserId int references AppUser(AppUserId) not null
,ProductId int references Product(ProductId) not null
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
)

 

 Create Table UserCart(
 UserCartId int identity primary key
,AppUserId int references AppUser(AppUserId) not null
,ProductId int references Product(ProductId) not null
,ProductCount int  not null
,
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
 )

Create table AdminUser(
AdminUserId int identity primary key
,Email nvarchar(150)
,[Password] nvarchar(max)
,CreateDate datetime not null
,IsActive bit not null
,IsDeleted bit not null
 )