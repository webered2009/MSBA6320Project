CREATE TABLE [dbo].[dim_user](
	[userId] [int] NOT NULL,
	[yearInSchool] [nvarchar](64) NULL,
	[floorCode] [nvarchar](64) NULL,
CONSTRAINT [PK_user] PRIMARY KEY

(
	[userId] ASC
)
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[dim_diet_status](
	[dietStatusId] [int] NOT NULL,
	[dietDescription] [nvarchar](64) NULL,
CONSTRAINT [PK_healthy_diet] PRIMARY KEY

(
	[dietStatusId] ASC
)
)

CREATE TABLE [dbo].[dim_smoking_status](
	[smokingStatusId] [INT] NOT NULL,
	[smokingStatusDescription] [nvarchar](64) NULL,
CONSTRAINT [PK_smoking_status] PRIMARY KEY

(
	[smokingStatusId] ASC
)
)

CREATE TABLE [dbo].[dim_survey_month](
	[surveyMonthId] [nvarchar](64) NOT NULL,
	[surveyMonthDescription] [nvarchar](64) NULL,
CONSTRAINT [PK_survey_month] PRIMARY KEY

(
	[surveyMonthId] ASC
)
)

CREATE TABLE [dbo].[fact_health](
	[userId] [int] NULL,
	[yearInSchool] [nvarchar](64) NULL,
	[floorCode] [nvarchar](64) NULL,
	[surveyMonthId] [nvarchar](64) NULL,
	[surveyMonthDescription] [nvarchar](64) NULL,
	[smokingStatusId] [int] NULL,
	[smokingStatusDescription] [nvarchar](64) NULL,
	[dietStatusId] [int] NULL,
	[dietDescription] [nvarchar](64) NULL,
	[currentWeight] [int] NULL,
	[currentHeight] [int] NULL,
	[saladsPerWeek] [int] NULL,
	[veggiesFruitsPerWeek] [int] NULL,
	[aerobicPerWeek] [int] NULL,
	[sportsPerWeek] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[fact_health]  
WITH NOCHECK ADD  CONSTRAINT [Health_Information-User] FOREIGN KEY([userId])
REFERENCES [dbo].[dim_user] ([userId])
GO

ALTER TABLE [dbo].[fact_health] NOCHECK CONSTRAINT [Health_Information-User]
GO

ALTER TABLE [dbo].[fact_health]  
WITH NOCHECK ADD  CONSTRAINT [Health_Information-Time] FOREIGN KEY([surveyMonthId])
REFERENCES [dbo].[dim_survey_month] ([surveyMonthId])
GO

ALTER TABLE [dbo].[fact_health] NOCHECK CONSTRAINT [Health_Information-Time]
GO

ALTER TABLE [dbo].[fact_health]  
WITH NOCHECK ADD  CONSTRAINT [Health_Information-Smoking] FOREIGN KEY([smokingStatusId])
REFERENCES [dbo].[dim_smoking_status] ([smokingStatusId])
GO

ALTER TABLE [dbo].[fact_health] NOCHECK CONSTRAINT [Health_Information-Smoking]
GO

ALTER TABLE [dbo].[fact_health]  
WITH NOCHECK ADD  CONSTRAINT [Health_Information-Diet] FOREIGN KEY([dietStatusId])
REFERENCES [dbo].[dim_diet_status] ([dietStatusId])
GO

ALTER TABLE [dbo].[fact_health] NOCHECK CONSTRAINT [Health_Information-Diet]
GO



