USE [master]
GO
/****** Object:  Database [BusBookingSystem]    Script Date: 4/22/2024 12:13:41 AM ******/
CREATE DATABASE [BusBookingSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bus_booking_system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Bus_booking_system.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bus_booking_system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Bus_booking_system_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BusBookingSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BusBookingSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BusBookingSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BusBookingSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BusBookingSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BusBookingSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BusBookingSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [BusBookingSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BusBookingSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BusBookingSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BusBookingSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BusBookingSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BusBookingSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BusBookingSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BusBookingSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BusBookingSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BusBookingSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BusBookingSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BusBookingSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BusBookingSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BusBookingSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BusBookingSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BusBookingSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BusBookingSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BusBookingSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [BusBookingSystem] SET  MULTI_USER 
GO
ALTER DATABASE [BusBookingSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BusBookingSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BusBookingSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BusBookingSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BusBookingSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BusBookingSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BusBookingSystem', N'ON'
GO
ALTER DATABASE [BusBookingSystem] SET QUERY_STORE = OFF
GO
USE [BusBookingSystem]
GO
/****** Object:  Table [dbo].[Buses]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[BusID] [int] IDENTITY(1,1) NOT NULL,
	[Bus_Name] [varchar](100) NOT NULL,
	[Capacity] [int] NULL,
	[BusNo] [varchar](100) NULL,
	[BusType] [varchar](100) NULL,
	[Model] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusRoutes]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusRoutes](
	[RouteID] [int] IDENTITY(1,1) NOT NULL,
	[DepartureCity] [varchar](100) NOT NULL,
	[ArrivalCity] [varchar](100) NOT NULL,
	[Distance] [decimal](10, 2) NULL,
	[EstimatedDuration] [int] NULL,
	[BaseFare] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusSchedules]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusSchedules](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[BusID] [int] NULL,
	[RouteID] [int] NULL,
	[DepartureDate] [varchar](100) NULL,
	[DepartureTime] [varchar](100) NOT NULL,
	[ArrivalTime] [varchar](100) NOT NULL,
	[AvailableSeats] [int] NULL,
 CONSTRAINT [PK__BusSched__9C8A5B69430B9F5A] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City_Name] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [nchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentId] [int] IDENTITY(100,1) NOT NULL,
	[PaymentMode] [nchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nchar](100) NOT NULL,
	[PaymentStatus] [nchar](100) NOT NULL,
	[ReservationId] [nchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QRCodes]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QRCodes](
	[QRCodeID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NULL,
	[QRCodeData] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[QRCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ScheduleID] [int] NOT NULL,
	[BookingDateTime] [datetime] NOT NULL,
	[Bus_Id] [int] NOT NULL,
	[Charges] [nchar](10) NULL,
	[Reservation_Status] [nchar](100) NULL,
	[IsCancelled] [bit] NULL,
	[No_of_seats] [nchar](10) NULL,
	[Seat_No] [nchar](10) NULL,
	[Additional_luggage] [nchar](10) NULL,
	[Additional_luggage_details] [nchar](255) NULL,
	[CreatedBy] [nchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[Deleted] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nchar](100) NULL,
 CONSTRAINT [PK__Reservat__B7EE5F045430630E] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationStatus]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationStatus](
	[Id] [nchar](10) NOT NULL,
	[Title] [nchar](150) NULL,
	[CreatedBy] [nchar](100) NULL,
	[CreatedDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCredentials]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCredentials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](255) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_UserCredentials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Role] [nchar](250) NULL,
	[CreatedBy] [nchar](250) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK__Users__1788CCAC860EFDC2] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Buses] ON 

INSERT [dbo].[Buses] ([BusID], [Bus_Name], [Capacity], [BusNo], [BusType], [Model]) VALUES (5007, N'Tarsin', 58, N'ROM-23232', N'Executive', NULL)
INSERT [dbo].[Buses] ([BusID], [Bus_Name], [Capacity], [BusNo], [BusType], [Model]) VALUES (5008, N'RATBV SA', 80, N'ROM-032115', N'Public', NULL)
INSERT [dbo].[Buses] ([BusID], [Bus_Name], [Capacity], [BusNo], [BusType], [Model]) VALUES (6007, N'All Buses', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Buses] OFF
GO
SET IDENTITY_INSERT [dbo].[BusRoutes] ON 

INSERT [dbo].[BusRoutes] ([RouteID], [DepartureCity], [ArrivalCity], [Distance], [EstimatedDuration], [BaseFare]) VALUES (1007, N'Constanta', N'Iasi', CAST(350.00 AS Decimal(10, 2)), 7, CAST(650.00 AS Decimal(10, 2)))
INSERT [dbo].[BusRoutes] ([RouteID], [DepartureCity], [ArrivalCity], [Distance], [EstimatedDuration], [BaseFare]) VALUES (2007, N'Bucharest', N'Sofia', CAST(120.00 AS Decimal(10, 2)), 2, CAST(450.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[BusRoutes] OFF
GO
SET IDENTITY_INSERT [dbo].[BusSchedules] ON 

INSERT [dbo].[BusSchedules] ([ScheduleID], [BusID], [RouteID], [DepartureDate], [DepartureTime], [ArrivalTime], [AvailableSeats]) VALUES (4007, 5007, 1007, N'2024-04-21', N'2024-04-21', N'2024-04-21', 58)
INSERT [dbo].[BusSchedules] ([ScheduleID], [BusID], [RouteID], [DepartureDate], [DepartureTime], [ArrivalTime], [AvailableSeats]) VALUES (5007, 5008, 2007, N'2024-04-21', N'2024-04-21', N'2024-04-21', 48)
INSERT [dbo].[BusSchedules] ([ScheduleID], [BusID], [RouteID], [DepartureDate], [DepartureTime], [ArrivalTime], [AvailableSeats]) VALUES (5008, 5007, 2007, N'2024-04-21', N'2024-04-21', N'2024-04-21', 45)
SET IDENTITY_INSERT [dbo].[BusSchedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [City_Name], [Country], [CreatedBy], [CreatedDate]) VALUES (1009, N'Cluj-Napoca', N'Romania', N'Admin', N'Apr 21 2024 11:42AM                               ')
INSERT [dbo].[Cities] ([Id], [City_Name], [Country], [CreatedBy], [CreatedDate]) VALUES (1013, N'Sofia', N'Romania', N'Admin', N'Apr 21 2024 11:52AM                               ')
INSERT [dbo].[Cities] ([Id], [City_Name], [Country], [CreatedBy], [CreatedDate]) VALUES (1011, N'Constanta', N'Romania', N'Admin', N'Apr 21 2024 11:44AM                               ')
INSERT [dbo].[Cities] ([Id], [City_Name], [Country], [CreatedBy], [CreatedDate]) VALUES (1012, N'Iasi', N'Romania', N'Admin', N'Apr 21 2024 11:47AM                               ')
INSERT [dbo].[Cities] ([Id], [City_Name], [Country], [CreatedBy], [CreatedDate]) VALUES (1008, N'Bucharest', N'Romania', N'Admin', N'Apr 21 2024 11:41AM                               ')
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (3, 2007, 2, CAST(N'2024-03-10T00:00:00.000' AS DateTime), 3002, N'18004     ', N'Pending                                                                                             ', 1, N'3         ', N'3,4,5     ', N'string    ', N'string                                                                                                                                                                                                                                                         ', N'admin                                                                                               ', CAST(N'2024-03-10T22:29:40.837' AS DateTime), 1, CAST(N'2024-04-21T11:53:49.697' AS DateTime), N'2007                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (4, 2007, 3, CAST(N'2024-03-10T00:00:00.000' AS DateTime), 3003, N'1250      ', N'Confirmed                                                                                           ', 1, N'1         ', N'5         ', N'No        ', N'                                                                                                                                                                                                                                                               ', N'admin                                                                                               ', CAST(N'2024-03-10T22:42:31.110' AS DateTime), 1, CAST(N'2024-04-21T11:53:53.627' AS DateTime), N'2007                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (5, 0, 0, CAST(N'2024-04-09T16:20:00.000' AS DateTime), 0, N'0         ', NULL, 1, N'0         ', N'string    ', N'string    ', N'string                                                                                                                                                                                                                                                         ', N'string                                                                                              ', CAST(N'2024-04-09T21:38:27.203' AS DateTime), 1, CAST(N'2024-04-21T12:24:43.493' AS DateTime), N'0                                                                                                   ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (6, 2007, 0, CAST(N'2024-04-09T16:20:00.000' AS DateTime), 0, N'0         ', NULL, 1, N'1         ', N'5         ', N'string    ', N'string                                                                                                                                                                                                                                                         ', N'2007                                                                                                ', CAST(N'2024-04-14T21:15:49.427' AS DateTime), 1, CAST(N'2024-04-19T12:49:58.863' AS DateTime), N'2007                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (7, 2007, 0, CAST(N'2024-04-09T16:20:00.000' AS DateTime), 0, N'0         ', NULL, 1, N'2         ', N'1, 2      ', N'string    ', N'string                                                                                                                                                                                                                                                         ', N'2007                                                                                                ', CAST(N'2024-04-14T21:18:21.493' AS DateTime), 1, CAST(N'2024-04-19T12:49:56.310' AS DateTime), N'2007                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (8, 2007, 0, CAST(N'2024-04-14T17:40:00.000' AS DateTime), 1003, N'3000      ', NULL, 1, N'3         ', N'1, 2, 3   ', N'Nil       ', N'Nil                                                                                                                                                                                                                                                            ', N'2007                                                                                                ', CAST(N'2024-04-14T22:41:14.563' AS DateTime), 1, CAST(N'2024-04-19T12:49:50.750' AS DateTime), N'2007                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (9, 2007, 0, CAST(N'2024-04-14T17:44:00.000' AS DateTime), 1003, N'3000      ', NULL, 1, N'1         ', N'3         ', N'Nil       ', N'Nil                                                                                                                                                                                                                                                            ', N'2007                                                                                                ', CAST(N'2024-04-14T22:44:10.333' AS DateTime), 1, CAST(N'2024-04-19T12:49:22.723' AS DateTime), N'2007                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (10, 2007, 0, CAST(N'2024-04-14T17:44:00.000' AS DateTime), 1003, N'3000      ', NULL, 1, N'2         ', N'1, 3      ', N'Nil       ', N'Nil                                                                                                                                                                                                                                                            ', N'2007                                                                                                ', CAST(N'2024-04-14T22:44:51.410' AS DateTime), 1, CAST(N'2024-04-19T12:49:17.560' AS DateTime), N'2007                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (11, 0, 0, CAST(N'2024-04-15T07:26:00.000' AS DateTime), 0, N'0         ', N'Pending                                                                                             ', 1, N'0         ', N'string    ', N'string    ', N'string                                                                                                                                                                                                                                                         ', N'0                                                                                                   ', CAST(N'2024-04-15T12:29:26.527' AS DateTime), 1, CAST(N'2024-04-21T12:24:45.750' AS DateTime), N'0                                                                                                   ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (13, 4011, 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 1003, N'3000      ', N'Pending                                                                                             ', 1, N'3         ', N'1, 3, 4   ', N'Nil       ', N'Nil                                                                                                                                                                                                                                                            ', N'4011                                                                                                ', CAST(N'2024-04-15T12:41:02.683' AS DateTime), 1, CAST(N'2024-04-21T12:24:48.817' AS DateTime), N'4011                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (1006, 2006, 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 1003, N'3000      ', N'Pending                                                                                             ', 1, N'3         ', N'1, 3, 4   ', N'Nil       ', N'Nil                                                                                                                                                                                                                                                            ', N'2006                                                                                                ', CAST(N'2024-04-17T19:38:02.840' AS DateTime), 1, CAST(N'2024-04-21T12:24:51.440' AS DateTime), N'2006                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (1007, 2006, 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 3004, N'3000      ', N'Pending                                                                                             ', 1, N'2         ', N'2, 13     ', N'Nil       ', N'Nil                                                                                                                                                                                                                                                            ', N'2006                                                                                                ', CAST(N'2024-04-17T20:30:41.823' AS DateTime), 1, CAST(N'2024-04-21T12:24:39.760' AS DateTime), N'2006                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (2006, 2007, 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 3003, N'1800      ', N'Confirmed                                                                                           ', 1, N'2         ', N'1, 2      ', N'Nil       ', N'Nil                                                                                                                                                                                                                                                            ', N'2007                                                                                                ', CAST(N'2024-04-20T20:59:22.220' AS DateTime), 1, CAST(N'2024-04-21T11:53:55.883' AS DateTime), N'2007                                                                                                ')
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (3006, 5008, 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 5007, N'450       ', N'Confirmed                                                                                           ', 0, N'2         ', N'1, 2      ', N'Nil       ', N'Nil                                                                                                                                                                                                                                                            ', N'5008                                                                                                ', CAST(N'2024-04-21T12:20:02.790' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (3007, 5008, 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 5007, N'650       ', N'Pending                                                                                             ', 0, N'2         ', N'5, 12     ', N'Nil       ', N'Nil                                                                                                                                                                                                                                                            ', N'5008                                                                                                ', CAST(N'2024-04-21T13:02:04.750' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Reservations] ([ReservationID], [UserID], [ScheduleID], [BookingDateTime], [Bus_Id], [Charges], [Reservation_Status], [IsCancelled], [No_of_seats], [Seat_No], [Additional_luggage], [Additional_luggage_details], [CreatedBy], [CreatedDate], [Deleted], [UpdatedDate], [UpdatedBy]) VALUES (4007, 6008, 0, CAST(N'2024-03-24T00:00:00.000' AS DateTime), 5008, N'450       ', N'Pending                                                                                             ', 0, N'3         ', N'1, 2, 3   ', N'Nil       ', N'Nil                                                                                                                                                                                                                                                            ', N'6008                                                                                                ', CAST(N'2024-04-21T23:45:12.977' AS DateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Reservations] OFF
GO
INSERT [dbo].[ReservationStatus] ([Id], [Title], [CreatedBy], [CreatedDate]) VALUES (N'1         ', N'Pending                                                                                                                                               ', N'mumtaz                                                                                              ', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[ReservationStatus] ([Id], [Title], [CreatedBy], [CreatedDate]) VALUES (N'3         ', N'Cancelled                                                                                                                                             ', N'mumtaz                                                                                              ', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[ReservationStatus] ([Id], [Title], [CreatedBy], [CreatedDate]) VALUES (N'2         ', N'Confirmed                                                                                                                                             ', N'mumtaz                                                                                              ', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[ReservationStatus] ([Id], [Title], [CreatedBy], [CreatedDate]) VALUES (N'4         ', N'Expired                                                                                                                                               ', N'mumtaz                                                                                              ', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[ReservationStatus] ([Id], [Title], [CreatedBy], [CreatedDate]) VALUES (N'5         ', N'Completed                                                                                                                                             ', N'mumtaz                                                                                              ', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[ReservationStatus] ([Id], [Title], [CreatedBy], [CreatedDate]) VALUES (N'6         ', N'Feedback Requested                                                                                                                                    ', N'mumtaz                                                                                              ', CAST(N'2024-04-19' AS Date))
INSERT [dbo].[ReservationStatus] ([Id], [Title], [CreatedBy], [CreatedDate]) VALUES (N'7         ', N'Closed                                                                                                                                                ', N'mumtaz                                                                                              ', CAST(N'2024-04-19' AS Date))
GO
SET IDENTITY_INSERT [dbo].[UserCredentials] ON 

INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 2006, N'Sara123', N'system', CAST(N'2024-03-10T20:08:28.363' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 2007, N'John123', N'system', CAST(N'2024-03-10T20:12:32.660' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 2008, N'Saqa123', N'system', CAST(N'2024-03-12T19:45:30.650' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1003, 3008, N'Admin', N'system', CAST(N'2024-03-31T11:27:01.920' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1004, 3009, N'Saqlain', N'system', CAST(N'2024-03-31T12:07:50.157' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2003, 4008, N'Anila', N'system', CAST(N'2024-04-14T22:48:52.083' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2004, 4009, N'string', N'system', CAST(N'2024-04-15T10:01:43.103' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2005, 4011, N'Sajid', N'system', CAST(N'2024-04-15T10:26:59.277' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2006, 4012, N'sdfsdfsd', N'system', CAST(N'2024-04-15T10:27:49.587' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2007, 4013, N'dsfsdf', N'system', CAST(N'2024-04-15T10:28:26.920' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3003, 5008, N'Alina', N'system', CAST(N'2024-04-21T11:51:59.067' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserCredentials] ([Id], [UserID], [Password], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4003, 6008, N'Test', N'system', CAST(N'2024-04-21T23:42:22.150' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserCredentials] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([RoleID], [UserID], [Role], [CreatedBy], [CreatedDate]) VALUES (2, 2007, N'Admin                                                                                                                                                                                                                                                     ', N'Admin                                                                                                                                                                                                                                                     ', CAST(N'2024-03-11T20:17:20.007' AS DateTime))
INSERT [dbo].[UserRoles] ([RoleID], [UserID], [Role], [CreatedBy], [CreatedDate]) VALUES (1002, 5008, N'Admin                                                                                                                                                                                                                                                     ', N'Admin                                                                                                                                                                                                                                                     ', CAST(N'2024-03-11T20:17:20.007' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Email], [FirstName], [LastName], [PhoneNumber], [Gender], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Deleted]) VALUES (2006, N'sara@germany.com', N'Sara', N'Khan', N'34695557', N'Female', N'system', CAST(N'2024-03-10T20:08:28.363' AS DateTime), N'', CAST(N'2024-04-15T14:22:14.033' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Email], [FirstName], [LastName], [PhoneNumber], [Gender], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Deleted]) VALUES (2007, N'john@outlook.com', N'John', N'David', N'1345646   ', N'Male', N'system', CAST(N'2024-03-10T20:12:32.660' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Email], [FirstName], [LastName], [PhoneNumber], [Gender], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Deleted]) VALUES (5008, N'alina@busbooking.com', N'Alina', N'R', N'4025465465', N'Female', N'system', CAST(N'2024-04-21T11:51:59.067' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [Email], [FirstName], [LastName], [PhoneNumber], [Gender], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [Deleted]) VALUES (6008, N'test@user.com', N'Test', N'User', N'32156416546', N'1', N'system', CAST(N'2024-04-21T23:42:22.147' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105345F1E2598]    Script Date: 4/22/2024 12:13:42 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__A9D105345F1E2598] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BusRoutes] ADD  DEFAULT ((50.00)) FOR [BaseFare]
GO
ALTER TABLE [dbo].[Reservations] ADD  CONSTRAINT [DF__Reservati__Booki__2D27B809]  DEFAULT (getdate()) FOR [BookingDateTime]
GO
ALTER TABLE [dbo].[Reservations] ADD  CONSTRAINT [DF__Reservati__IsCan__2E1BDC42]  DEFAULT ((0)) FOR [IsCancelled]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBus]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddBus](
	@Bus_Name VARCHAR(100),
    @Capacity VARCHAR(100),
    @BusNo VARCHAR(100),
    @BusType VARCHAR(100)
)
AS
BEGIN
	INSERT INTO Buses(Bus_Name,Capacity,BusNo,BusType)
	VALUES(@Bus_Name,@Capacity,@BusNo,@BusType)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddCity]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddCity](
	@City_Name VARCHAR(100),
    @Country VARCHAR(100),
    @CreatedBy VARCHAR(100)
)
AS
BEGIN
	INSERT INTO Cities(City_Name,Country,CreatedBy,CreatedDate)
	VALUES(@City_Name,@Country,@CreatedBy,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AssignRole]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AssignRole]
	@userID INT,
	@Role VARCHAR(100),
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
  BEGIN TRY
	INSERT INTO UserRoles (UserID, [Role],CreatedBy,CreatedDate)
	VALUES(@userID, @Role, 'Admin', GETDATE());
	    SET @ResultCode = 1;  -- 1 for success
        SET @ResultMessage = 'Success';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateTicketFare]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CalculateTicketFare]
    @RouteID INT,
    @BusID INT,
    @Fare DECIMAL(10, 2) OUTPUT
AS
BEGIN
    DECLARE @BaseFare DECIMAL(10, 2);
    DECLARE @Multiplier DECIMAL(4, 2);

    -- Get base fare for the given route
    SELECT @BaseFare = BaseFare
    FROM BusRoutes
    WHERE RouteID = @RouteID;

    -- Get multiplier based on bus type (e.g., AC buses may have a higher multiplier)
    SELECT @Multiplier = CASE 
                            WHEN BusType = 'Executive' THEN 2.5
                            ELSE 1.5
                         END
    FROM Buses
    WHERE BusID = @BusID;

    -- Calculate the fare
    SET @Fare = @BaseFare * @Multiplier;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CancelReservation]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CancelReservation]
	@reservation_ID INT,
	@userID INT,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @busExists BIT;

    -- Check if the bus exists
    SELECT @busExists = CASE WHEN EXISTS (SELECT 1 FROM Reservations WHERE ReservationID = @reservation_ID) THEN 1 ELSE 0 END;

    -- If the bus exists, update its details; otherwise, set a message
    IF @busExists = 1
    BEGIN
        UPDATE Reservations
        SET IsCancelled = 1,
		Deleted = 1,
		UpdatedDate=GetDate(),
		UpdatedBy=@userID
        WHERE ReservationID = @reservation_ID;

        SET @message = 'updated successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'Id does not exist';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBusRoute]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create
CREATE PROCEDURE [dbo].[sp_CreateBusRoute]
    @DepartureCity VARCHAR(100),
    @ArrivalCity VARCHAR(100),
    @Distance DECIMAL(10, 2),
    @EstimatedDuration INT,
	@BaseFare DECIMAL(10, 2),
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO BusRoutes (DepartureCity, ArrivalCity, Distance, EstimatedDuration, BaseFare)
        VALUES (@DepartureCity, @ArrivalCity, @Distance, @EstimatedDuration, @BaseFare);

        SET @ResultCode = 1;  -- 1 for success
        SET @ResultMessage = 'Bus route created successfully';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;

-- Read
-- Similar output parameters for other CRUD operations
 SELECT * FROM BusRoutes 
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBusSchedule]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateBusSchedule]
    @BusID INT,
    @RouteID INT,
    @DepartureTime VARCHAR(100),
    @ArrivalTime VARCHAR(100),
    @AvailableSeats INT
AS
BEGIN
    INSERT INTO BusSchedules (BusID, RouteID,DepartureDate, DepartureTime, ArrivalTime, AvailableSeats)
    VALUES (@BusID, @RouteID,@DepartureTime, @DepartureTime, @ArrivalTime, @AvailableSeats);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateReservation]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateReservation]
	--@ReservationID INT,
    @UserID INT,
    @ScheduleID INT,
    @BookingDateTime NVARCHAR(255),
    @Bus_Id INT,
    @Charges INT,
    @CreatedBy NVARCHAR(255),
    @No_of_seats NVARCHAR(255),
    @Seat_No NVARCHAR(255),
    @Additional_luggage NVARCHAR(255),
    @Additional_luggage_details NVARCHAR(255)
AS
BEGIN
    INSERT INTO Reservations (
	--ReservationID,
    UserID,
    ScheduleID,
    BookingDateTime,
    Bus_Id,
    Charges,
	Reservation_Status,
    IsCancelled,
    CreatedDate,
    CreatedBy,
    Deleted,
    No_of_seats,
    Seat_No,
    Additional_luggage,
    Additional_luggage_details
)
    VALUES (
	@UserID, 
	@ScheduleID,
    @BookingDateTime,
    @Bus_Id,
    @Charges,
	'Pending',
    0,
    GETDATE(),
    @CreatedBy,
    0,
    @No_of_seats,
    @Seat_No,
    @Additional_luggage,
    @Additional_luggage_details
	);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBus]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteBus]
     @busID INT,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @busExists BIT;

    -- Check if the bus exists
    SELECT @busExists = CASE WHEN EXISTS (SELECT 1 FROM Buses WHERE BusID = @busID) THEN 1 ELSE 0 END;

    -- If the bus exists, delete it; otherwise, set a message
    IF @busExists = 1
    BEGIN
        DELETE FROM Buses WHERE BusID = @busID;
        SET @message = 'Bus deleted successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'Bus does not exist. Unable to delete.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBusSchedule]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Delete
CREATE PROCEDURE [dbo].[sp_DeleteBusSchedule]
    @ScheduleID INT
AS
BEGIN
    DELETE FROM BusSchedules
    WHERE ScheduleID = @ScheduleID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCity]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteCity]
	 @cityID INT,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @cityExists BIT;

    -- Check if the bus exists
    SELECT @cityExists = CASE WHEN EXISTS (SELECT 1 FROM Cities WHERE Id = @cityID) THEN 1 ELSE 0 END;

    -- If the bus exists, delete it; otherwise, set a message
    IF @cityExists = 1
    BEGIN
        DELETE FROM Cities WHERE Id = @cityID;
        SET @message = 'Bus deleted successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'Bus does not exist. Unable to delete.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRole]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteRole]
	@userID INT,
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
  BEGIN TRY
  DECLARE @userExists BIT;
   SELECT @userExists = CASE WHEN EXISTS (SELECT 1 FROM UserRoles WHERE UserID=@userID) THEN 1 ELSE 0 END;
    IF @userExists = 1
    BEGIN
	DELETE UserRoles WHERE UserID=@userID
	    SET @ResultCode = 1;
        SET @ResultMessage = 'Success';
	END
	ELSE
	BEGIN
	 SET @ResultMessage = 'User does not exist. Unable to delete.';
	 END
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteRoute]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteRoute]
	@RouteID INT,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @dataExists BIT;

    SELECT @dataExists = CASE WHEN EXISTS (SELECT 1 FROM [dbo].[BusRoutes] WHERE RouteID = @RouteID) THEN 1 ELSE 0 END;

    IF @dataExists = 1
    BEGIN
        DELETE FROM [BusRoutes] WHERE RouteID = @RouteID;
        SET @message = 'Deleted successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'Route does not exist. Unable to delete.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSchedule]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteSchedule]
	@ScheduleID INT
AS
BEGIN
	DELETE BusSchedules WHERE ScheduleID = @ScheduleID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteUser]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteUser]
    @userID INT,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @userExists BIT;

    -- Check if the bus exists
    SELECT @userExists = CASE WHEN EXISTS (SELECT 1 FROM [dbo].[Users] WHERE UserID = @userID) THEN 1 ELSE 0 END;

    -- If the bus exists, delete it; otherwise, set a message
    IF @userExists = 1
    BEGIN
        DELETE FROM [Users] WHERE UserID = @userID;
        SET @message = 'User deleted successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'User does not exist. Unable to delete.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GenerateQRCode]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GenerateQRCode]
    @ReservationID INT,
	@QRCodeData NVARCHAR(255),
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
       
        DECLARE @QRCode VARCHAR(MAX) = @QRCodeData; 

        INSERT INTO QRCodes (ReservationID, QRCodeData)
        VALUES (@ReservationID, @QRCodeData);

        SET @ResultCode = 1;  -- 1 for success
        SET @ResultMessage = 'QR code generated successfully';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBusData]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBusData]
  @busID INT
AS
BEGIN
    IF @busID = 0
    BEGIN
        SELECT BusID, Bus_Name,Capacity, BusNo,BusType,Model FROM Buses ORDER BY Bus_Name ASC;
    END
    ELSE
    BEGIN
         SELECT BusID, Bus_Name,Capacity,BusNo,BusType,Model FROM Buses WHERE BusID = @busID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBusRoute]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetBusRoute]
	@routeID INT
AS
BEGIN
    IF @routeID = 0
    BEGIN
        SELECT * FROM BusRoutes;
    END
    ELSE
    BEGIN
        SELECT * FROM BusRoutes WHERE RouteID = @routeID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBusSchedules]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Read
CREATE PROCEDURE [dbo].[sp_GetBusSchedules]
AS
BEGIN
    SELECT * FROM BusSchedules;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCities]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetCities]
  @cityID INT
AS
BEGIN
    IF @cityID = 0
    BEGIN
        SELECT * FROM Cities;
    END
    ELSE
    BEGIN
        SELECT * FROM Cities WHERE Id = @cityID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetReservations]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetReservations]
    @reservation_ID INT = NULL,
    @userID INT
AS
BEGIN
    IF @reservation_ID IS NOT NULL AND EXISTS (SELECT 1 FROM [dbo].[Reservations] WHERE ReservationID = @reservation_ID)
    BEGIN
        SELECT  
		   R.[ReservationID],
            R.[UserID],
            R.[ScheduleID],
            R.[BookingDateTime],
            (SELECT B.[Bus_Name] FROM [dbo].[Buses] B WHERE B.BusID = R.[Bus_Id]) AS Bus_Name,
            R.[Charges],
            R.[Reservation_Status],
            R.[IsCancelled],
            R.[No_of_seats],
            R.[Seat_No],
            R.[Additional_luggage],
            R.[Additional_luggage_details],
            R.[Deleted]
        FROM [dbo].[Reservations] R
        WHERE R.[ReservationID] = @reservation_ID AND R.[Deleted] = 0;
    END
    ELSE
    BEGIN
        SELECT 
		 R.[ReservationID],
            R.[UserID],
            R.[ScheduleID],
            R.[BookingDateTime],
            (SELECT B.[Bus_Name] FROM [dbo].[Buses] B WHERE B.BusID = R.[Bus_Id]) AS Bus_Name,
            R.[Charges],
            R.[Reservation_Status],
            R.[IsCancelled],
            R.[No_of_seats],
            R.[Seat_No],
            R.[Additional_luggage],
            R.[Additional_luggage_details],
            R.[Deleted]
        FROM [dbo].[Reservations] R
        WHERE R.UserID = @userID and Deleted=0;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetReservations_Admin]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetReservations_Admin]
    @reservation_ID INT = NULL
    --@userID INT = NULL 
AS
BEGIN
     IF @reservation_ID IS NOT NULL AND EXISTS (SELECT 1 FROM [dbo].[Reservations] WHERE ReservationID = @reservation_ID)
    BEGIN
        SELECT 
            R.[ReservationID],
            R.[UserID],
            R.[ScheduleID],
            R.[BookingDateTime],
            (SELECT B.[Bus_Name] FROM [dbo].[Buses] B WHERE B.BusID = R.[Bus_Id]) AS Bus_Name,
            R.[Charges],
            R.[Reservation_Status],
            R.[IsCancelled],
            R.[No_of_seats],
            R.[Seat_No],
            R.[Additional_luggage],
            R.[Additional_luggage_details],
            R.[Deleted]
        FROM [dbo].[Reservations] R
        WHERE R.[ReservationID] = @reservation_ID AND R.[Deleted] = 0;
    END
    ELSE
    BEGIN
        SELECT 
            R.[ReservationID],
            R.[UserID],
            R.[ScheduleID],
            R.[BookingDateTime],
            (SELECT B.[Bus_Name] FROM [dbo].[Buses] B WHERE B.BusID = R.[Bus_Id]) AS Bus_Name,
            R.[Charges],
            R.[Reservation_Status],
            R.[IsCancelled],
            R.[No_of_seats],
            R.[Seat_No],
            R.[Additional_luggage],
            R.[Additional_luggage_details],
            R.[Deleted]
        FROM [dbo].[Reservations] R
        WHERE R.[Deleted] = 0; 
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_getReservationStatues]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getReservationStatues]
AS
BEGIN
	SELECT Id, Title FROM [BusBookingSystem].[dbo].[ReservationStatus]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getScheduleAll]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getScheduleAll]
AS
BEGIN
	SELECT [ScheduleID]
      ,[BusID]
      ,[RouteID]
      ,[DepartureDate]
      ,[DepartureTime]
      ,[ArrivalTime]
      ,[AvailableSeats]
  FROM [BusBookingSystem].[dbo].[BusSchedules]
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserByEmailAndPassword]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetUserByEmailAndPassword]
    @Email VARCHAR(255),
    @PasswordHash VARCHAR(255),
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT * FROM Users WHERE Email = @Email AND PasswordHash = @PasswordHash)
        BEGIN
            SET @ResultCode = 1;  -- 1 for success
            SET @ResultMessage = 'Login successful';
        END
        ELSE
        BEGIN
            SET @ResultCode = 0;  -- 0 for failure
            SET @ResultMessage = 'Invalid email or password';
        END
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUsers]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUsers]
	@userID INT
AS
BEGIN
	IF @userID = 0
    BEGIN
        SELECT * FROM Users
    END
    ELSE
    BEGIN
        SELECT * FROM Users WHERE UserID = @userID;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterUser]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RegisterUser]
    @Email VARCHAR(255),
    @Password VARCHAR(255),
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @PhoneNumber VARCHAR(50),
    @Gender VARCHAR(50),
	@User_name VARCHAR(50),
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
	 DECLARE @UserID INT;
        INSERT INTO Users (Email, FirstName, LastName,PhoneNumber,Gender,
	  CreatedBy,
      CreatedDate,
      UpdatedBy,
      UpdatedDate,
      Deleted)
        VALUES (@Email, @FirstName, @LastName, @PhoneNumber,@Gender,
		@User_name,
		GETDATE(),
		'',
		'',
		0
		);

		 SET @UserID = SCOPE_IDENTITY();

		INSERT INTO UserCredentials(UserID, [Password],
		  CreatedBy,
		  CreatedDate,
		  UpdatedBy,
		  UpdatedDate
		)
		VALUES (@UserID, @Password, @User_name,GETDATE(),'','');

        SET @ResultCode = 1;  -- 1 for success
        SET @ResultMessage = 'User created successfully';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchBusSchedule]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SearchBusSchedule]
    @departureCity VARCHAR(255),
    @arrivalCity VARCHAR(255),
    @departureTime DATETIME,
	@busId int
AS
BEGIN
	IF @busId=6007
		BEGIN
		   SELECT  bs.BusID,
				br.RouteID,
				br.DepartureCity,
				br.ArrivalCity,
				br.EstimatedDuration,
				br.BaseFare,
				bs.DepartureDate,
				bs.DepartureTime,
				bs.ArrivalTime,
				bs.AvailableSeats,
				(SELECT [Bus_Name] FROM Buses Where BusID = bs.BusID) as Bus_Name
				FROM BusSchedules bs 
			INNER JOIN
				BusRoutes br ON bs.RouteID = br.RouteID
			--INNER JOIN
			--    Buses b ON bs.BusID = b.BusID
			WHERE
				br.DepartureCity = @departureCity
				AND br.ArrivalCity = @arrivalCity
				AND bs.DepartureTime >= @departureTime;
		END
	ELSE
		BEGIN
		 SELECT  bs.BusID,
				br.RouteID,
				br.DepartureCity,
				br.ArrivalCity,
				br.EstimatedDuration,
				br.BaseFare,
				bs.DepartureDate,
				bs.DepartureTime,
				bs.ArrivalTime,
				bs.AvailableSeats,
				(SELECT [Bus_Name] FROM Buses Where BusID = bs.BusID) as Bus_Name
				FROM BusSchedules bs 
			INNER JOIN
				BusRoutes br ON bs.RouteID = br.RouteID
			--INNER JOIN
			--    Buses b ON bs.BusID = b.BusID
			WHERE
				br.DepartureCity = @departureCity
				AND br.ArrivalCity = @arrivalCity
				AND bs.DepartureTime >= @departureTime
				AND bs.BusID=@busId;
		END
END;

SELECT * FROM BusSchedules
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBus]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateBus]
    @busID INT,
    @newBusName VARCHAR(255)= NULL,
    @newBusCapacity VARCHAR(MAX)= NULL,
	@newBusNo VARCHAR(255)= NULL,
	@newBusType VARCHAR(255)= NULL,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @busExists BIT;

    -- Check if the bus exists
    SELECT @busExists = CASE WHEN EXISTS (SELECT 1 FROM Buses WHERE BusID = @busID) THEN 1 ELSE 0 END;

    -- If the bus exists, update its details; otherwise, set a message
    IF @busExists = 1
    BEGIN
        UPDATE Buses
        SET Bus_Name =ISNULL(@newBusName,Bus_Name),
            Capacity = ISNULL(@newBusCapacity,Capacity),
			BusNo = ISNULL(@newBusNo,BusNo),
			BusType = ISNULL(@newBusType,BusType)
        WHERE BusID = @busID;

        SET @message = 'Bus updated successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'Bus does not exist. Unable to update.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBusSchedule]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Update
CREATE PROCEDURE [dbo].[sp_UpdateBusSchedule]
    @ScheduleID INT,
    @BusID INT= NULL,
    @RouteID INT= NULL,
    @DepartureTime DATETIME= NULL,
    @ArrivalTime DATETIME= NULL,
    @AvailableSeats INT= NULL
AS
BEGIN
    UPDATE BusSchedules
    SET BusID = ISNULL(@BusID, BusID),
        RouteID = ISNULL(@RouteID,RouteID),
        DepartureTime = ISNULL(@DepartureTime,DepartureTime),
        ArrivalTime = ISNULL(@ArrivalTime,ArrivalTime),
        AvailableSeats = ISNULL(@AvailableSeats,AvailableSeats)
    WHERE ScheduleID = @ScheduleID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCity]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateCity]
	 @cityID INT,
    @cityName VARCHAR(255)= NULL,
    @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @busExists BIT;

    -- Check if the bus exists
    SELECT @busExists = CASE WHEN EXISTS (SELECT 1 FROM Cities WHERE Id = @cityID) THEN 1 ELSE 0 END;

    -- If the bus exists, update its details; otherwise, set a message
    IF @busExists = 1
    BEGIN
        UPDATE Cities
        SET City_Name =ISNULL(@cityName,City_Name)
        WHERE Id = @cityID;

        SET @message = 'City updated successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'City does not exist. Unable to update.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateReservation]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mumtaz Ali
-- Create date: 14-March-2024
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateReservation] 
    @reservation_ID INT,
	@userID INT,
	@ScheduleID INT,
    @BookingDateTime DATETIME = NULL,
    @Bus_Id INT = NULL,
	@Charges VARCHAR(100)=NULL,
	@No_of_seats INT,
	@Seat_No VARCHAR(100)=NULL,
	@Status VARCHAR(100)=NULL,
	@Additional_luggage VARCHAR(100)=NULL,
	@Additional_luggage_details VARCHAR(100)=NULL,
	@message NVARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM dbo.[Reservations] WHERE ReservationID = @reservation_ID)
    BEGIN
        SET @message = 'Not found.';
        RETURN;
    END

    BEGIN TRY
        UPDATE dbo.[Reservations] 
        SET 
			userID = ISNULL(userID, userID),
			ScheduleID  = ISNULL(@ScheduleID, ScheduleID),
			bookingDateTime  = ISNULL(@BookingDateTime, bookingDateTime),
			Bus_Id  = ISNULL(@Bus_Id, Bus_Id),
			Charges  = ISNULL(@Charges, Charges),
			No_of_seats  = ISNULL(@No_of_seats, No_of_seats),
			Seat_No  = ISNULL(@Seat_No, Seat_No),
			Reservation_Status  = ISNULL(@Status, Reservation_Status)
        WHERE 
            ReservationID = @reservation_ID;
			SET @message='Success';
        IF @@ROWCOUNT = 0
            THROW 50000, 'No records were updated.', 1;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateRoute]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateRoute]
	@RouteID INT,
    @DepartureCity VARCHAR(100)=NULL,
    @ArrivalCity VARCHAR(100)=NULL,
    @Distance DECIMAL(10, 2)=NULL,
    @EstimatedDuration INT=NULL,
	@BaseFare DECIMAL(10, 2)=NULL,
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        UPDATE BusRoutes 
		  SET 
           DepartureCity = CASE WHEN @DepartureCity IS NOT NULL AND @DepartureCity != '' THEN @DepartureCity ELSE DepartureCity END,
            ArrivalCity = CASE WHEN @ArrivalCity IS NOT NULL AND @ArrivalCity != '' THEN @ArrivalCity ELSE ArrivalCity END,
            Distance = CASE WHEN @Distance IS NOT NULL AND @Distance != 0 THEN @Distance ELSE Distance END,
            EstimatedDuration = CASE WHEN @EstimatedDuration IS NOT NULL AND @EstimatedDuration != 0 THEN @EstimatedDuration ELSE EstimatedDuration END,
            BaseFare = CASE WHEN @BaseFare IS NOT NULL AND @BaseFare != 0 THEN @BaseFare ELSE BaseFare END
       
        WHERE
			RouteID=@RouteID;
        SET @ResultCode = 1;
        SET @ResultMessage = 'Record Updated successfully';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;

-- Read
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateUser]
	  @userID INT,
	  @Email VARCHAR(255)= NULL,
      @FirstName VARCHAR(255)= NULL,
      @LastName VARCHAR(255)= NULL,
      @PhoneNumber VARCHAR(255)= NULL,
      @Gender VARCHAR(255)= NULL,
	  @user_Name VARCHAR(255),
     @message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @userExists BIT;

    -- Check if the bus exists
    SELECT @userExists = CASE WHEN EXISTS (SELECT 1 FROM Users WHERE UserID = @userID) THEN 1 ELSE 0 END;

    -- If the bus exists, update its details; otherwise, set a message
    IF @userExists = 1
    BEGIN
        UPDATE Users
        SET Email = ISNULL(@Email,Email),
            FirstName = ISNULL(@FirstName,FirstName),
			LastName = ISNULL(@LastName,LastName),
			PhoneNumber = ISNULL(@PhoneNumber,PhoneNumber),
			Gender = ISNULL(@Gender,Gender),
			UpdatedBy = @user_Name,
			UpdatedDate = GETDATE()
        WHERE UserID = @userID;

        SET @message = 'User updated successfully.';
    END
    ELSE
    BEGIN
        SET @message = 'User does not exist. Unable to update.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UserLogin]    Script Date: 4/22/2024 12:13:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UserLogin]
    @UserName VARCHAR(255),
    @Password VARCHAR(255),
    @LoginSuccess BIT OUTPUT,
    @UserID INT OUTPUT,
    @UserRole NVARCHAR(255) OUTPUT,
    @Message NVARCHAR(255) OUTPUT
AS
BEGIN
    DECLARE @StoredPassword VARCHAR(255);

    -- Check if the username exists
    IF EXISTS (SELECT 1 FROM Users WHERE Email = @UserName)
    BEGIN
        -- Retrieve the stored password for the given username
        SELECT @StoredPassword = [Password]
        FROM UserCredentials
        WHERE UserID = (SELECT UserID FROM Users WHERE Email = @UserName);

        -- Check if the provided password matches the stored password
        IF @StoredPassword = @Password
        BEGIN
            -- Login successful
            SET @LoginSuccess = 1;
            SET @UserID = (SELECT UserID FROM Users WHERE Email = @UserName);
            SET @UserRole = (SELECT [Role] FROM [dbo].[UserRoles] WHERE UserID = @UserID);
            SET @Message = 'Login successful.';
        END
        ELSE
        BEGIN
            -- Incorrect password
            SET @LoginSuccess = 0;
            SET @UserID = NULL;
            SET @Message = 'Incorrect password. Login failed.';
        END
    END
    ELSE
    BEGIN
        -- User does not exist
        SET @LoginSuccess = 0;
        SET @UserID = NULL;
        SET @Message = 'User does not exist. Login failed.';
    END
END;
GO
USE [master]
GO
ALTER DATABASE [BusBookingSystem] SET  READ_WRITE 
GO
