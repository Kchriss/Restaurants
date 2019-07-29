USE [master]
GO
/****** Object:  Database [Restaurants]    Script Date: 29/07/2019 11:45:42 ******/
CREATE DATABASE [Restaurants]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restaurants', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Restaurants.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Restaurants_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Restaurants_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Restaurants] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurants].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurants] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurants] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurants] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurants] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurants] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurants] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Restaurants] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurants] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurants] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurants] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurants] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurants] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurants] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurants] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurants] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Restaurants] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurants] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurants] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurants] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurants] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurants] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurants] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurants] SET RECOVERY FULL 
GO
ALTER DATABASE [Restaurants] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurants] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurants] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurants] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurants] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Restaurants] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Restaurants', N'ON'
GO
USE [Restaurants]
GO
/****** Object:  Table [dbo].[Commandes]    Script Date: 29/07/2019 11:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commandes](
	[ID_Commandes] [int] NOT NULL,
	[Numero_Commande] [int] NOT NULL,
	[Nbre_Plats_Commandes] [int] NOT NULL,
 CONSTRAINT [PK_Commandes] PRIMARY KEY CLUSTERED 
(
	[ID_Commandes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notes]    Script Date: 29/07/2019 11:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[ID_Note] [int] NOT NULL,
	[Commentaire] [nvarchar](200) NOT NULL,
	[Note] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[ID_Note] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Personnes]    Script Date: 29/07/2019 11:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personnes](
	[ID_Personnes] [int] NOT NULL,
	[Statut] [varchar](10) NOT NULL,
	[Nom] [nvarchar](50) NOT NULL,
	[Prenom] [nvarchar](50) NOT NULL,
	[Tel] [int] NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[Commentaire] [nvarchar](200) NULL,
	[Mot_De_Passe] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Personnes] PRIMARY KEY CLUSTERED 
(
	[ID_Personnes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plats]    Script Date: 29/07/2019 11:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plats](
	[ID_Plats] [int] NOT NULL,
	[Descriptif] [nvarchar](200) NULL,
	[Ingredients] [nvarchar](200) NOT NULL,
	[Prix] [smallmoney] NOT NULL,
	[URL] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Plats] PRIMARY KEY CLUSTERED 
(
	[ID_Plats] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 29/07/2019 11:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ID_Reservation] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Heure] [time](7) NOT NULL,
	[Nbre_Personnes] [int] NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[ID_Reservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 29/07/2019 11:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Restaurants](
	[ID_Restaurants] [int] NOT NULL,
	[Nom] [varchar](50) NOT NULL,
	[Numero_Rue] [int] NOT NULL,
	[Nom_Rue] [varchar](50) NOT NULL,
	[Ville] [varbinary](50) NOT NULL,
	[Code_Postal] [int] NOT NULL,
	[URL] [varchar](50) NOT NULL,
	[Geolocalisation] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Restaurants] PRIMARY KEY CLUSTERED 
(
	[ID_Restaurants] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tables]    Script Date: 29/07/2019 11:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tables](
	[ID_Tables] [int] NOT NULL,
	[Numero] [int] NOT NULL,
	[Statut] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Tables] PRIMARY KEY CLUSTERED 
(
	[ID_Tables] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tables_Reservation]    Script Date: 29/07/2019 11:45:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tables_Reservation](
	[ID_Tables_Reservation] [int] NOT NULL,
 CONSTRAINT [PK_Tables_Reservation] PRIMARY KEY CLUSTERED 
(
	[ID_Tables_Reservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Commandes]  WITH CHECK ADD  CONSTRAINT [FK_Commandes_Plats] FOREIGN KEY([ID_Commandes])
REFERENCES [dbo].[Plats] ([ID_Plats])
GO
ALTER TABLE [dbo].[Commandes] CHECK CONSTRAINT [FK_Commandes_Plats]
GO
ALTER TABLE [dbo].[Commandes]  WITH CHECK ADD  CONSTRAINT [FK_Commandes_Tables] FOREIGN KEY([ID_Commandes])
REFERENCES [dbo].[Tables] ([ID_Tables])
GO
ALTER TABLE [dbo].[Commandes] CHECK CONSTRAINT [FK_Commandes_Tables]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Personnes] FOREIGN KEY([ID_Note])
REFERENCES [dbo].[Personnes] ([ID_Personnes])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_Personnes]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Plats] FOREIGN KEY([ID_Note])
REFERENCES [dbo].[Plats] ([ID_Plats])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_Plats]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Resaurants] FOREIGN KEY([ID_Note])
REFERENCES [dbo].[Restaurants] ([ID_Restaurants])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_Resaurants]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Personnes] FOREIGN KEY([ID_Reservation])
REFERENCES [dbo].[Personnes] ([ID_Personnes])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Personnes]
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD  CONSTRAINT [FK_Restaurants_Personnes] FOREIGN KEY([ID_Restaurants])
REFERENCES [dbo].[Personnes] ([ID_Personnes])
GO
ALTER TABLE [dbo].[Restaurants] CHECK CONSTRAINT [FK_Restaurants_Personnes]
GO
ALTER TABLE [dbo].[Tables]  WITH CHECK ADD  CONSTRAINT [FK_Tables_Resaurants] FOREIGN KEY([ID_Tables])
REFERENCES [dbo].[Restaurants] ([ID_Restaurants])
GO
ALTER TABLE [dbo].[Tables] CHECK CONSTRAINT [FK_Tables_Resaurants]
GO
ALTER TABLE [dbo].[Tables_Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Tables_Reservation_Reservations] FOREIGN KEY([ID_Tables_Reservation])
REFERENCES [dbo].[Reservations] ([ID_Reservation])
GO
ALTER TABLE [dbo].[Tables_Reservation] CHECK CONSTRAINT [FK_Tables_Reservation_Reservations]
GO
ALTER TABLE [dbo].[Tables_Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Tables_Reservation_Tables] FOREIGN KEY([ID_Tables_Reservation])
REFERENCES [dbo].[Tables] ([ID_Tables])
GO
ALTER TABLE [dbo].[Tables_Reservation] CHECK CONSTRAINT [FK_Tables_Reservation_Tables]
GO
USE [master]
GO
ALTER DATABASE [Restaurants] SET  READ_WRITE 
GO
