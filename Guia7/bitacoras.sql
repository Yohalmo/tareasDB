
CREATE TABLE [dbo].[bitacoras] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [tabla] varchar(50) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [valor_anterior] varchar(255) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [valor_nuevo] varchar(255) COLLATE Modern_Spanish_CI_AS  NOT NULL,
  [descripcion] varchar(1000) COLLATE Modern_Spanish_CI_AS  NOT NULL
)