CREATE TABLE bannerimageupload (
    id INT PRIMARY KEY IDENTITY(1,1),
    imagename VARCHAR(255),
    image VARBINARY(MAX),
    status VARCHAR(50)
);