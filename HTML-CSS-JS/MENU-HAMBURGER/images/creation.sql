DROP DATABASE IF EXISTS Commande ;
CREATE DATABASE Commande DEFAULT CHARSET UTF8MB4;
 
USE Commande;
 


CREATE TABLE Client
(
	Identifiant  INT  AUTO_INCREMENT NOT NULL,
	Nom VARCHAR(100) NOT NULL,
	Prenom VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NULL,
	IdentifiantCivilite INT NOT NULL,
	ModifiedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY(Identifiant)
)ENGINE = INNODB;

CREATE TABLE Civilite
(
	Identifiant INT AUTO_INCREMENT NOT NULL,
	CiviliteCourte VARCHAR(10) NOT NULL,
	CiviliteLongue VARCHAR(25) NOT NULL,
    PRIMARY KEY(Identifiant)
)ENGINE = INNODB;



CREATE TABLE EnteteCommande
(
	Identifiant INT  AUTO_INCREMENT NOT NULL,
	Date DATETIME NOT NULL,
	IdentifiantClient INT NOT NULL,
	Total DECIMAL(8,2) DEFAULT 0.00 NOT NULL,
	ModifiedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(Identifiant)
)ENGINE = INNODB ;

CREATE TABLE Produit
(
	Identifiant INT AUTO_INCREMENT NOT NULL,
	Libelle VARCHAR(200) NOT NULL,
	PrixUnitaire  DECIMAL(8,2) DEFAULT 0.00 NOT NULL,
	ModifiedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(Identifiant)
)ENGINE = INNODB ;

CREATE TABLE LigneCommande
(
	Identifiant INT AUTO_INCREMENT NOT NULL,
	Quantite INT NOT NULL,
	PrixUnitaire DECIMAL(8,2) DEFAULT 0.00 NOT NULL,
	PrixTotal DECIMAL(8,2) AS (Quantite * PrixUnitaire),
	IdentifiantEnteteCommande INT NOT NULL,
	IdentifiantProduit INT NOT NULL,
	ModifiedDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(Identifiant)
)ENGINE = INNODB ;

CREATE TABLE Categorie
(
	Identifiant INT AUTO_INCREMENT NOT NULL,
	Libelle VARCHAR (100) NOT NULL,
    PRIMARY KEY(Identifiant)
)ENGINE = INNODB ;

CREATE TABLE ProduitCategorie
(
	IdentifiantProduit INT NOT NULL,
	IdentifiantCategorie INT NOT NULL,
    PRIMARY KEY(IdentifiantProduit,IdentifiantCategorie )
)ENGINE = INNODB ;




ALTER TABLE Client ADD CONSTRAINT FK_Client_Civilite FOREIGN KEY (IdentifiantCivilite) REFERENCES Civilite(Identifiant);
ALTER TABLE EnteteCommande ADD CONSTRAINT FK_EnteteCde_Client FOREIGN KEY (IdentifiantClient) REFERENCES Client(Identifiant);
ALTER TABLE LigneCommande ADD CONSTRAINT FK_LigneCde_EnteteCde FOREIGN KEY (IdentifiantEnteteCommande) REFERENCES EnteteCommande(Identifiant);
ALTER TABLE LigneCommande ADD CONSTRAINT FK_LigneCde_Produit FOREIGN KEY (IdentifiantProduit) REFERENCES Produit(Identifiant);
ALTER TABLE ProduitCategorie ADD CONSTRAINT FK_ProdCat_Produit FOREIGN KEY (IdentifiantProduit) REFERENCES Produit(Identifiant);
ALTER TABLE ProduitCategorie ADD CONSTRAINT FK_ProdCat_Categorie FOREIGN KEY (IdentifiantCategorie) REFERENCES Categorie(Identifiant);


