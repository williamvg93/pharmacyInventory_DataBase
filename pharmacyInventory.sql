CREATE TABLE country(
	id int AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT PK_idCountry PRIMARY KEY(id)
);

CREATE TABLE department(
	id int AUTO_INCREMENT,
	name VARCHAR(50) UNIQUE NOT NULL,
	idCountryFk int(11) NOT NULL,
	CONSTRAINT PK_idDepartment PRIMARY KEY(id),
	CONSTRAINT FK_idCountry FOREIGN KEY (idCountryFk) REFERENCES country(id)
);

CREATE TABLE city(
	id int AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	idDepartFK int(11) NOT NULL,
	CONSTRAINT PK_idCity PRIMARY KEY(id),
	CONSTRAINT FK_idDepart FOREIGN KEY (idDepartFK) REFERENCES department(id)
);

CREATE TABLE typePerson(
	id int AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT PK_idTypePer PRIMARY KEY(id)
);

CREATE TABLE documentType(
	id int AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT PK_idDocuType PRIMARY KEY(id)
);

CREATE TABLE rolePerson(
	id int AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT PK_idRolPer PRIMARY KEY(id)
);

CREATE TABLE presentationType(
	id int AUTO_INCREMENT,
	name VARCHAR(50) UNIQUE NOT NULL,
	CONSTRAINT PK_idPresenType PRIMARY KEY(id)
);

CREATE TABLE paymentMethod(
	id int AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT PK_idPayMethod PRIMARY KEY(id)
);

CREATE TABLE typeContact(
	id int AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT PK_idTypeCont PRIMARY KEY(id)
);

CREATE TABLE movementType(
	id int AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT PK_idMovemType PRIMARY KEY(id)
);

CREATE TABLE productBrand(
	id INT AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT PK_idproBrand PRIMARY KEY(id)
);

CREATE TABLE product(
	code VARCHAR(10),
	name VARCHAR(50) NOT NULL UNIQUE,
	idProdBrandFk int(11) NOT NULL,
	CONSTRAINT PK_idProd PRIMARY KEY(code),
	CONSTRAINT FK_prodBrad FOREIGN KEY (idProdBrandFk) REFERENCES productBrand(id)
);

CREATE TABLE person(
	code VARCHAR(20),
	name VARCHAR(50) NOT NULL,
	registreDate DATE NOT NULL,
	idDocumTypeFk INT(11) NOT NULL,
	idRolePerFk INT(11) NOT NULL,
	idTypePerFk INT(11) NOT NULL,
	CONSTRAINT PK_codePerson PRIMARY KEY(code),
	CONSTRAINT FK_idDocumType FOREIGN KEY (idDocumTypeFk) REFERENCES documentType(id),
	CONSTRAINT FK_idRolePer FOREIGN KEY (idRolePerFk) REFERENCES rolePerson(id),
	CONSTRAINT FK_idTypePer FOREIGN KEY (idTypePerFk) REFERENCES typePerson(id)	
);


CREATE TABLE locationPerson(
	id int AUTO_INCREMENT,
	roadType VARCHAR(50),
	firstNumber SMALLINT,
	firstLetter CHAR(2),
	bis CHAR(10),
	secondLetter CHAR(2),
	cardinal CHAR(10),
	secondNumber SMALLINT,
	thirdLetter CHAR(2),
	thirdNumber SMALLINT,
	secondCardinal CHAR(10),
	complement VARCHAR(50),
	codePersonFk VARCHAR(20),
	idCityFk int(10),
	CONSTRAINT PK_idLocaPer PRIMARY KEY(id),
	CONSTRAINT FK_codePerson FOREIGN KEY (codePersonFk) REFERENCES person(code),
	CONSTRAINT FK_idCity FOREIGN KEY (idCityFk) REFERENCES city(id)
);

CREATE TABLE personContact(
	id INT AUTO_INCREMENT,
	codePersonFk VARCHAR(20) NOT NULL,
	idTypeContFK INT(11) NOT NULL,
	CONSTRAINT PK_idPerCont PRIMARY KEY(id),
	CONSTRAINT FK_codePersonCont FOREIGN KEY (codePersonFk) REFERENCES person(code),
	CONSTRAINT FK_idTypeCont FOREIGN KEY (idTypeContFK) REFERENCES typeContact(id)
);

CREATE TABLE inventory(
    id VARCHAR(10),
    name VARCHAR(50) NOT NULL,
    price DOUBLE(11,2) NOT NULL,
    stock SMALLINT NOT NULL,
    minStock SMALLINT NOT NULL,
    maxStock SMALLINT NOT NULL,
    codeProductFk VARCHAR(11) NOT NULL,
    IDpreseTypeFk INT(11) NOT NULL,
    CONSTRAINT PK_idInventory PRIMARY KEY(id),
    CONSTRAINT FK_codeProd FOREIGN KEY (codeProductFk) REFERENCES product(code),
    CONSTRAINT FK_preseType FOREIGN KEY (IDpreseTypeFk) REFERENCES presentationType(id)
);

CREATE TABLE invoice(
    id INT AUTO_INCREMENT,
    initialInvoice INT NOT NULL,
    finalInvoice INT NOT NULL,
    currentInvoice INT NOT NULL,
    resolutionNumber VARCHAR(10) NOT NULL UNIQUE,
    CONSTRAINT PK_idInvoice PRIMARY KEY(id)
);

CREATE TABLE inventoryManagement(
    id VARCHAR(10),
    movementDate DATE NOT NULL,
    expirationDate DATE NOT NULL,
    codeSellerFk VARCHAR(20) NOT NULL,
    codeReceiverFk VARCHAR(20) NOT NULL,
    idMovemTypeFk INT(11) NOT NULL,
    idPayMethodFk INT(11) NOT NULL,
    CONSTRAINT PK_idInvenManag PRIMARY KEY(id),
    CONSTRAINT FK_codeSeller FOREIGN KEY (codeSellerFk) REFERENCES person(code),
    CONSTRAINT FK_codeReceiver FOREIGN KEY (codeReceiverFk) REFERENCES person(code),
    CONSTRAINT FK_moveType FOREIGN KEY (idMovemTypeFk) REFERENCES movementType(id),
    CONSTRAINT FK_payMethod FOREIGN KEY (idPayMethodFk) REFERENCES paymentMethod(id)
);

CREATE TABLE movementDetail(
    idInvenManaFk VARCHAR(10),
    idInventoryFk VARCHAR(10),
    quantityUnits TINYINT NOT NULL,
    price DOUBLE(11,2) NOT NULL,
    CONSTRAINT PK_idInve_idinvMang PRIMARY KEY (idInvenManaFk,idInventoryFk),
    CONSTRAINT FK_inventory FOREIGN KEY (idInventoryFk) REFERENCES inventory(id),
    CONSTRAINT FK_invenMana FOREIGN KEY (idInvenManaFk) REFERENCES inventoryManagement(id)
);


/* ADD UNIQUE TO A COLUMN */
ALTER TABLE city ADD UNIQUE(name);

/* CHANGE - MODIFY COLUMN NOT NULL */
ALTER TABLE "tableName" CHANGE "columnName" "newcolumnName" VARCHAR(50) NOT NULL;

/* ADD FOREIGN KEY TO A TABLE */
ALTER TABLE inventoryManagement
ADD FOREIGN KEY (idPayMethodFk) REFERENCES paymentMethod(id);


/* ============================================= */
/* ================== INSERT =================== */
/* ============================================= */


INSERT INTO country (name) VALUES ("colombia"),("argentina"),("Peru"),("Ecuador");


INSERT INTO department (name, idCountryFk) VALUES ("Amazonas", 1), ("Antioquia", 1), ("Arauca",1), ("Atlantico",1), ("Bolivar",1), ("Boyaca", 1), ("Caldas", 1), ("Caqueta", 1), ("Casanare",1), ("Cauca
",1),("Cesar",1),("Choco",1),("Cordoba",1),("Cundinamarca",1),("Guainia",1),("Guaviare",1),("Huila",1),("Guajira",1),("Magdalena",1),("Meta",1),("Nariño",1),("Norte de Santander",1),("Putumayo",1),("Quindio",1),("Risaralda",1),("San Andres y Providencia",1),("Santander",1),("Sucre",1),("Tolima",1),("Valle del Cauca",1),("Vaupes",1),("Vichada",1);

INSERT INTO city (name, idDepartFK) VALUES ("Bucaramanga", 27), ("Barrancabermeja", 27), ("Curiti", 27);

INSERT INTO city (name, idDepartFK) VALUES ("Medellin",2),("Guatape",2),("Itagui",2);

INSERT INTO city (name, idDepartFK) VALUES ("Santa Marta",19),("Taganga",19),("Arataca",19);

INSERT 




/* ======================================================== */
/* ================== SELECT INNER JOIN =================== */
/* ======================================================== */

SELECT co.name AS Country, de.name AS Department, ci.name AS City
FROM country AS co
JOIN department AS de ON de.idCountryFK = co.id
JOIN city AS ci ON ci.idDepartFK = de.id;
