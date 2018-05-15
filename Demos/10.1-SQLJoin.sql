--poor design
CREATE TABLE SOFTWARE (
    SOFTWARE_ID INT IDENTITY (1,1),
    SOFTWARE_TITLE NVARCHAR(MAX)
)

CREATE TABLE USAGE (
    SOFTWARE_TITLE NVARCHAR(MAX),
    USERNAME NVARCHAR(MAX)
)
--bad join
SELECT u.USERNAME, u.SOFTWARE_TITLE
FROM USAGE u
INNER JOIN SOFTWARE s ON
u.SOFTWARE_TITLE = s.SOFTWARE_TITLE

--joining on nvarchar(max) is really bad news and scales poorly.
--solution?  proper table design with identities and foreign keys CREATE TABLE SOFTWARE (
    SOFTWARE_ID INT IDENTITY (1,1),
    SOFTWARE_TITLE NVARCHAR(MAX)
)

CREATE TABLE USAGE (
    SOFTWARE_ID INT,
    USERNAME NVARCHAR(MAX),
    CONSTRAINT FK_USAGE_SOFTWARE FOREIGN KEY (SOFTWARE_ID)
    REFERENCES SOFTWARE (SOFTWARE_ID)
)

SELECT u.USERNAME, u.SOFTWARE_TITLE
FROM USAGE u
INNER JOIN SOFTWARE s ON
u.SOFTWARE_ID = s.SOFTWARE_ID

--why is this better?  Data integrity with a foriegn key. 
-- much faster and scalable join.
-- joins on string breakdown at scale                     
