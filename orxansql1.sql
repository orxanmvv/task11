create database Orxansql
use Orxansql
create table Authors(
Id int primary key identity,
Name nvarchar(255),
Surname nvarchar(255)
)
create table Books (
Id int primary key identity,
Name nvarchar(255) check (len(Name) between 3 and 50),
AuthorId int,
PageCount int  check(PageCount>30),
 foreign key (AuthorId)   references Authors(Id)
)
insert into Authors(Name , Surname) values('orxan', 'musayev'),('kenan','pasayev')
insert into Books values ('sefiller',1,650),('Robinson cruze',2,250);

CREATE VIEW BookAuthor AS
SELECT 
    a.Id,
    CONCAT(a.Name, ' ', a.Surname) AS FullName,
    COUNT(b.id) AS countbook,
    MAX(b.PageCount) AS maxpagecount
FROM 
    Authors AS a
JOIN 
    Books AS b ON a.Id = b.AuthorId
GROUP BY 
    a.Id, a.Name, a.Surname;
	select * from BookAuthor


