Create or Alter Procedure Insert_Users @First_Name nvarchar(100), 
        @Last_Name nvarchar(100), 
        @City nvarchar(100), 
        @Payment nvarchar(100), 
        @Payment_Date nvarchar(100), 
        @Notes nvarchar(100)
    AS
    Insert into Users (First_Name, 
        Last_Name, 
        City, 
        Payment, 
        Payment_Date, 
        Notes)
    values (@First_Name ,
        @Last_Name ,
        @City ,
        @Payment ,
        @Payment_Date ,
        @Notes)