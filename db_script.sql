USE [master]
GO
/****** Object:  Database [BusBookingSystem]    Script Date: 3/3/2024 3:59:20 PM ******/
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
/****** Object:  Table [dbo].[Buses]    Script Date: 3/3/2024 3:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buses](
	[BusID] [int] IDENTITY(1,1) NOT NULL,
	[Bus_Name] [varchar](100) NOT NULL,
	[Capacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusRoutes]    Script Date: 3/3/2024 3:59:20 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[RouteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusSchedules]    Script Date: 3/3/2024 3:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusSchedules](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[BusID] [int] NULL,
	[RouteID] [int] NULL,
	[DeparterDate] [datetime] NULL,
	[DepartureTime] [datetime] NOT NULL,
	[ArrivalTime] [datetime] NOT NULL,
	[AvailableSeats] [int] NULL,
 CONSTRAINT [PK__BusSched__9C8A5B69430B9F5A] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 3/3/2024 3:59:20 PM ******/
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
/****** Object:  Table [dbo].[QRCodes]    Script Date: 3/3/2024 3:59:20 PM ******/
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
/****** Object:  Table [dbo].[Reservations]    Script Date: 3/3/2024 3:59:20 PM ******/
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
	[IsCancelled] [bit] NULL,
	[CreatedDate] [nchar](100) NULL,
	[CreatedBy] [nchar](100) NULL,
	[Deleted] [bit] NULL,
	[No_of_seats] [nchar](10) NULL,
	[Seat_No] [nchar](10) NULL,
	[Additional_luggage] [nchar](10) NULL,
	[Additional_luggage_details] [nchar](255) NULL,
 CONSTRAINT [PK__Reservat__B7EE5F045430630E] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCredentials]    Script Date: 3/3/2024 3:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCredentials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[Salt] [varchar](255) NOT NULL,
 CONSTRAINT [PK_UserCredentials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/3/2024 3:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[PhoneNumber] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reservations] ADD  CONSTRAINT [DF__Reservati__Booki__2D27B809]  DEFAULT (getdate()) FOR [BookingDateTime]
GO
ALTER TABLE [dbo].[Reservations] ADD  CONSTRAINT [DF__Reservati__IsCan__2E1BDC42]  DEFAULT ((0)) FOR [IsCancelled]
GO
/****** Object:  StoredProcedure [dbo].[sp_CancelReservation]    Script Date: 3/3/2024 3:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CancelReservation]
    @ReservationID INT
AS
BEGIN
    UPDATE Reservations
    SET IsCancelled = 1
    WHERE ReservationID = @ReservationID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBusRoute]    Script Date: 3/3/2024 3:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create
CREATE PROCEDURE [dbo].[sp_CreateBusRoute]
    @DepartureStation VARCHAR(100),
    @ArrivalStation VARCHAR(100),
    @Distance DECIMAL(10, 2),
    @EstimatedDuration INT,
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
        INSERT INTO BusRoutes (DepartureStation, ArrivalStation, Distance, EstimatedDuration)
        VALUES (@DepartureStation, @ArrivalStation, @Distance, @EstimatedDuration);

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
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateBusSchedule]    Script Date: 3/3/2024 3:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateBusSchedule]
    @BusID INT,
    @RouteID INT,
    @DepartureTime DATETIME,
    @ArrivalTime DATETIME,
    @AvailableSeats INT
AS
BEGIN
    INSERT INTO BusSchedules (BusID, RouteID, DepartureTime, ArrivalTime, AvailableSeats)
    VALUES (@BusID, @RouteID, @DepartureTime, @ArrivalTime, @AvailableSeats);
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateReservation]    Script Date: 3/3/2024 3:59:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_CreateUser]    Script Date: 3/3/2024 3:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateUser]
    @Email VARCHAR(255),
    @PasswordHash VARCHAR(255),
    @Salt VARCHAR(255),
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @ResultCode INT OUTPUT,
    @ResultMessage NVARCHAR(255) OUTPUT
AS
BEGIN
    BEGIN TRY
	 DECLARE @UserID INT;
        INSERT INTO Users (Email, FirstName, LastName)
        VALUES (@Email, @FirstName, @LastName);

		 SET @UserID = SCOPE_IDENTITY();

		INSERT INTO UserCredentials(UserID, PasswordHash, Salt)
		VALUES (@UserID, @PasswordHash, @Salt);

        SET @ResultCode = 1;  -- 1 for success
        SET @ResultMessage = 'User created successfully';
    END TRY
    BEGIN CATCH
        SET @ResultCode = 0;  -- 0 for failure
        SET @ResultMessage = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBusSchedule]    Script Date: 3/3/2024 3:59:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GenerateQRCode]    Script Date: 3/3/2024 3:59:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetBusSchedules]    Script Date: 3/3/2024 3:59:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetReservations]    Script Date: 3/3/2024 3:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetReservations]
    @UserID INT
AS
BEGIN
    SELECT * FROM Reservations
    WHERE UserID = @UserID;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserByEmailAndPassword]    Script Date: 3/3/2024 3:59:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_SearchBusSchedule]    Script Date: 3/3/2024 3:59:20 PM ******/
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
	@numberOfPassangers VARCHAR(255)
AS
BEGIN
    -- Use SELECT statement with JOIN to fetch relevant data based on input parameters
    SELECT 
        bs.BusID,
        br.RouteID,
        b.Bus_Name,
		b.Capacity,
        br.DepartureCity,
        br.ArrivalCity,
		br.EstimatedDuration,
		bs.DeparterDate,
        bs.DepartureTime,
        bs.ArrivalTime
    FROM
        BusSchedules bs
    INNER JOIN
        BusRoutes br ON bs.RouteID = br.RouteID
    INNER JOIN
        Buses b ON bs.BusID = b.BusID
    WHERE
        br.DepartureCity = @departureCity
        AND br.ArrivalCity = @arrivalCity
        AND bs.DepartureTime >= @departureTime;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBusSchedule]    Script Date: 3/3/2024 3:59:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Update
CREATE PROCEDURE [dbo].[sp_UpdateBusSchedule]
    @ScheduleID INT,
    @BusID INT,
    @RouteID INT,
    @DepartureTime DATETIME,
    @ArrivalTime DATETIME,
    @AvailableSeats INT
AS
BEGIN
    UPDATE BusSchedules
    SET BusID = @BusID,
        RouteID = @RouteID,
        DepartureTime = @DepartureTime,
        ArrivalTime = @ArrivalTime,
        AvailableSeats = @AvailableSeats
    WHERE ScheduleID = @ScheduleID;
END;
GO
USE [master]
GO
ALTER DATABASE [BusBookingSystem] SET  READ_WRITE 
GO
