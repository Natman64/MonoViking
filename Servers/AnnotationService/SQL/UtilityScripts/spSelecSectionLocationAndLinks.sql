USE [Rabbit]
GO
/****** Object:  StoredProcedure [dbo].[SelectSectionLocationsAndLinks]    Script Date: 01/21/2011 12:12:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[SelectSectionLocationsAndLinks]
	-- Add the parameters for the stored procedure here
	@Z float,
	@QueryDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @QueryDate <> NULL
		Select * from Location 
		where Z = @Z AND LastModified >= @QueryDate
	ELSE
		Select * from Location 
		where Z = @Z	
		
	IF @QueryDate <> NULL
		-- Insert statements for procedure here
		Select * from LocationLink
		 WHERE ((A in 
		(SELECT ID
		  FROM [Rabbit].[dbo].[Location]
		  WHERE Z = @Z)
		 )
		  OR
		  (B in 
		(SELECT ID
		  FROM [Rabbit].[dbo].[Location]
		  WHERE Z = @Z)
		 ))
		 AND Created >= @QueryDate
	ELSE
		-- Insert statements for procedure here
		Select * from LocationLink
		 WHERE ((A in 
		(SELECT ID
		  FROM [Rabbit].[dbo].[Location]
		  WHERE Z = @Z)
		 )
		  OR
		  (B in 
		(SELECT ID
		  FROM [Rabbit].[dbo].[Location]
		  WHERE Z = @Z)
		 ))
	
	 
END
