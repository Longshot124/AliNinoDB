CREATE TABLE [Books] (
	Id int NOT NULL,
	Name nvarchar(40) NOT NULL,
	Price decimal(5,2) NOT NULL,
	Description nvarchar(300) NOT NULL,
	PageCount int NOT NULL,
	Binding nvarchar(30) NOT NULL,
	Information_id int NOT NULL,
	Publish_Id int NOT NULL,
	Author_Id int NOT NULL,
  CONSTRAINT [PK_BOOKS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Genres] (
	Id int NOT NULL,
	Name nvarchar(40) NOT NULL,
  CONSTRAINT [PK_GENRES] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [BookCategory] (
	Id int NOT NULL,
	Genre_Id int NOT NULL,
	Book_Id int NOT NULL,
  CONSTRAINT [PK_BOOKCATEGORY] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [PublishHouse] (
	Id int NOT NULL,
	Name nvarchar(40) NOT NULL,
  CONSTRAINT [PK_PUBLISHHOUSE] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Information] (
	Id int NOT NULL,
	Delivery nvarchar(30) NOT NULL,
	Payment nvarchar(50) NOT NULL,
  CONSTRAINT [PK_INFORMATION] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Authors] (
	Id int NOT NULL,
	Name nvarchar(40) NOT NULL,
	Suranme nvarchar(40) NOT NULL,
  CONSTRAINT [PK_AUTHORS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [User] (
	Id int NOT NULL,
	Name nvarchar(40) NOT NULL,
	Surname nvarchar(40) NOT NULL,
	Image image NOT NULL,
  CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Comments] (
	Id int NOT NULL,
	Message nvarchar(250) NOT NULL,
	Date date NOT NULL,
	User_Id int NOT NULL,
	Book_id int NOT NULL,
  CONSTRAINT [PK_COMMENTS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Untitled] (
	Id int NOT NULL,
	OldPrice int NOT NULL,
	DiscountPercent decimal NOT NULL,
	NewPrice decimal(5,2) NOT NULL,
	Book_id int NOT NULL,
  CONSTRAINT [PK_UNTITLED] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [SocialMedia] (
	Id int NOT NULL,
	Name nvarchar(40) NOT NULL,
	URL nvarchar(200) NOT NULL,
	Icon image NOT NULL,
	Setting_Id int NOT NULL,
  CONSTRAINT [PK_SOCIALMEDIA] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Settings] (
	Id int NOT NULL,
	HeaderLogo nvarchar(100) NOT NULL,
	FooterLogo nvarchar(100) NOT NULL,
	Phone nvarchar(25) NOT NULL,
	Language nvarchar(25) NOT NULL,
  CONSTRAINT [PK_SETTINGS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [Books] WITH CHECK ADD CONSTRAINT [Books_fk0] FOREIGN KEY ([Information_id]) REFERENCES [Information]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Books] CHECK CONSTRAINT [Books_fk0]
GO
ALTER TABLE [Books] WITH CHECK ADD CONSTRAINT [Books_fk1] FOREIGN KEY ([Publish_Id]) REFERENCES [PublishHouse]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Books] CHECK CONSTRAINT [Books_fk1]
GO
ALTER TABLE [Books] WITH CHECK ADD CONSTRAINT [Books_fk2] FOREIGN KEY ([Author_Id]) REFERENCES [Authors]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Books] CHECK CONSTRAINT [Books_fk2]
GO


ALTER TABLE [BookCategory] WITH CHECK ADD CONSTRAINT [BookCategory_fk0] FOREIGN KEY ([Genre_Id]) REFERENCES [Genres]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [BookCategory] CHECK CONSTRAINT [BookCategory_fk0]
GO
ALTER TABLE [BookCategory] WITH CHECK ADD CONSTRAINT [BookCategory_fk1] FOREIGN KEY ([Book_Id]) REFERENCES [Books]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [BookCategory] CHECK CONSTRAINT [BookCategory_fk1]
GO





ALTER TABLE [Comments] WITH CHECK ADD CONSTRAINT [Comments_fk0] FOREIGN KEY ([User_Id]) REFERENCES [User]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Comments] CHECK CONSTRAINT [Comments_fk0]
GO
ALTER TABLE [Comments] WITH CHECK ADD CONSTRAINT [Comments_fk1] FOREIGN KEY ([Book_id]) REFERENCES [Books]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Comments] CHECK CONSTRAINT [Comments_fk1]
GO

ALTER TABLE [Untitled] WITH CHECK ADD CONSTRAINT [Untitled_fk0] FOREIGN KEY ([Book_id]) REFERENCES [Books]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Untitled] CHECK CONSTRAINT [Untitled_fk0]
GO

ALTER TABLE [SocialMedia] WITH CHECK ADD CONSTRAINT [SocialMedia_fk0] FOREIGN KEY ([Setting_Id]) REFERENCES [Settings]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [SocialMedia] CHECK CONSTRAINT [SocialMedia_fk0]
GO


