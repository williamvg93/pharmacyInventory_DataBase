INSERT INTO country (name) VALUES ("colombia"),("argentina"),("Peru"),("Ecuador");

INSERT INTO typePerson (name) VALUES ("Client"), ("Employee"), ("Supplier");

INSERT INTO documentType (name) VALUES ("C.C identification"), ("C.E identification");

INSERT INTO rolePerson (name) VALUES ("Client"),("Supllies"),("Employee sales"), ("Administrator"), ("Logistic assistant");

INSERT INTO person (code, name, registreDate, idDocumTypeFk, idRolePerFk, idTypePerFk) VALUES ("1098739317", "William Villamizar", "2020-02-20", 1, 3, 2), ("1098821393", "Natalia Correa","2019-10-12", 1, 5, 2), ("1085251369", "Samir Blanco", "2019-07-24", 1, 2, 3);

INSERT INTO productBrand (name) VALUES ("Head Shoulders"), ("dolex"), ("colgate");

INSERT INTO product (code, name, idProdBrandFk) VALUES ("100001", "shampoo Head Shoulders 2 en 1", 1),("100002", "shampoo Head Shoulders Control Caida", 1), ("100003", "Dolex FOrte", 2), ("100004", "Crema dental triple accion", 3);

INSERT INTO typeContact (name) VALUES ("Personal"), ("Home"), ("Emergency contact");

INSERT INTO personContact (codePersonFk, idTypeContFK) VALUES ("1098739317", 1), ("1098739317", 2), ("1098739317", 3), ("1098821393", 1); 


