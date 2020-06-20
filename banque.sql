--	Banque du peuple

CREATE database banque;

SHOW DATABASES;

USE banque;

CREATE TABLE typeCompte(
                       id_Compte int(10) auto_increment primary key not null, 
					   libelle varchar(55) not null
					   );

CREATE TABLE compte(
                       id_C int(10) auto_increment primary key not null, 
					   numAgence varchar(25) not null, 
					   numCompte varchar(25) unique not null, 
					   cleRib varchar(25) not null
					   );
					   
CREATE TABLE etatCompte(
                           id_etatCompte int auto_increment primary key not null, 
						   libelle varchar(15) not null
						   );

CREATE TABLE agios(
                    id_Agios int auto_increment primary key not null, 
					libelle varchar(15) not null, 
					montant varchar(55) not null
					);

CREATE TABLE charge_Compte(
                            id_chargeCompte int auto_increment primary key not null, 
							nomChargeCompte varchar(255) not null
							);
							
CREATE TABLE responsable(
                         id_responsable int auto_increment primary key not null, 
						 nomComplet varchar(45) not null
						 );
						 
CREATE TABLE client(
                       id_client int auto_increment primary key not null, 
					   NumCNI varchar(20) UNIQUE NOT NULL,
					   nom varchar(255) not null, 
					   adresse varchar(255) unique not null, 
					   email varchar(255) unique, 
					   telephone varchar(255) not null
					   );
CREATE TABLE virement(
                    id_virement int auto_increment primary key not null, 
					numero_virement int(45) UNIQUE not null,
					libelle varchar(20)
				   );
				   
CREATE TABLE releveCompte(
                          id_releveCompte int auto_increment primary key not null, 
						  numCompte varchar(25) not null, 
						  rib varchar(25) not null, 
						  operations varchar(25) not null, 
						  montant varchar(25) not null, 
						  dateRelevé Date not null
						  );
						  
CREATE TABLE client_physique(
                            id_client_physique int auto_increment primary key not null, 
							prenom varchar(25) not null, 
							profession varchar(75) not null, 
							salaire varchar(25) not null
							);

CREATE TABLE client_moral(
                            id_client_moral int auto_increment primary key not null, 
							raison_sociale varchar(35) not null, 
							nomEmployeur varchar(25) not null, 
							rc varchar(25), 
							ninea varchar(25) not null
							);

CREATE TABLE operations (
                          id_operation int auto_increment primary key not null, 
						  libelle varchar(45) not null
					   );  
					   
CREATE TABLE caissiere(
                       id_caissiere int auto_increment primary key not null, 
					   nom varchar(45) not null
					   );
CREATE TABLE agence(
                      id_agence int auto_increment primary key not null, 
					  numAgence varchar(45) not null,
					  libelle varchar(25)
					  );

CREATE TABLE employe(
                       id_employe int auto_increment primary key not null, 
					   nomEmploye varchar(45) not null, 
					   prenomEmploye varchar(55) not null
					   );

CREATE TABLE administrateur(
                         id_admin int auto_increment primary key not null, 
						 nomAdmin varchar(45) not null, 
						 prenomAdmin varchar(45) not null
						 );		
CREATE TABLE depot(
                    id_depot int auto_increment primary key not null, 
					numero int(45) not null
				   );

CREATE TABLE retrait(
                     id_retrait int auto_increment primary key not null, 
					 numeroVirement int(45) not null
					 );						 
					   
ALTER TABLE compte ADD COLUMN id_Compte int(10);
ALTER TABLE compte ADD CONSTRAINT fk_typecompte FOREIGN KEY(id_Compte) REFERENCES typeCompte(id_Compte);

ALTER TABLE compte ADD COLUMN id_etatCompte int;
ALTER TABLE compte ADD CONSTRAINT fk_etatcompte FOREIGN KEY(id_etatCompte) REFERENCES etatCompte(id_etatCompte);
 
ALTER TABLE compte ADD COLUMN id_Agios int;
ALTER TABLE compte ADD CONSTRAINT fk_agios FOREIGN KEY(id_Agios) REFERENCES agios(id_Agios);

ALTER TABLE compte ADD COLUMN id_chargeCompte int;
ALTER TABLE compte ADD CONSTRAINT fk_chargeCompte FOREIGN KEY(id_chargeCompte) REFERENCES charge_Compte(id_chargeCompte);

ALTER TABLE compte ADD COLUMN id_client int;
ALTER TABLE compte ADD CONSTRAINT fk_client FOREIGN KEY(id_client) REFERENCES client(id_client);

ALTER TABLE compte ADD COLUMN id_responsable int;
ALTER TABLE compte ADD CONSTRAINT fk_responsable FOREIGN KEY(id_responsable) REFERENCES responsable(id_responsable);

ALTER TABLE virement ADD COLUMN id_responsable int;
ALTER TABLE virement ADD CONSTRAINT fk_responsable_virement FOREIGN KEY(id_responsable) REFERENCES responsable(id_responsable);

ALTER TABLE releveCompte ADD COLUMN id_responsable int;
ALTER TABLE releveCompte ADD CONSTRAINT fk_responsable_releve FOREIGN KEY(id_responsable) REFERENCES responsable(id_responsable);

ALTER TABLE releveCompte ADD COLUMN id_client int;
ALTER TABLE releveCompte ADD CONSTRAINT fk_releve_client FOREIGN KEY(id_client) REFERENCES client(id_client);
 
ALTER TABLE client_physique ADD COLUMN id_client_moral int;
ALTER TABLE client_physique ADD CONSTRAINT fk_client_physique_moral FOREIGN KEY(id_client_moral) REFERENCES client_moral(id_client_moral);

ALTER TABLE operations ADD COLUMN id_caissiere int;
ALTER TABLE operations ADD CONSTRAINT fk_caissiere_operation FOREIGN KEY(id_caissiere) REFERENCES caissiere(id_caissiere);


ALTER TABLE agence ADD COLUMN id_admin int;
ALTER TABLE agence ADD CONSTRAINT fk_admin_agence FOREIGN KEY(id_admin) REFERENCES administrateur(id_admin);


ALTER TABLE employe ADD COLUMN id_admin int;
ALTER TABLE employe ADD CONSTRAINT fk_admin_employe FOREIGN KEY(id_admin) REFERENCES administrateur(id_admin);


ALTER TABLE operations ADD COLUMN id_depot int;
ALTER TABLE operations ADD CONSTRAINT fk_depot_operations FOREIGN KEY(id_depot) REFERENCES depot(id_depot);


ALTER TABLE operations ADD COLUMN id_retrait int;
ALTER TABLE operations ADD CONSTRAINT fk_retrait_operations FOREIGN KEY(id_retrait) REFERENCES retrait(id_retrait);


ALTER TABLE operations ADD COLUMN id_virement int;
ALTER TABLE operations ADD CONSTRAINT fk_virement_operations FOREIGN KEY(id_virement) REFERENCES virement(id_virement);


ALTER TABLE client ADD COLUMN id_client_physique int;
ALTER TABLE client ADD CONSTRAINT fk_client_physique FOREIGN KEY(id_client_physique) REFERENCES client_physique(id_client_physique);


ALTER TABLE client ADD COLUMN id_client_moral int;
ALTER TABLE client ADD CONSTRAINT fk_client_moral FOREIGN KEY(id_client_moral) REFERENCES client_moral(id_client_moral);

ALTER TABLE compte ADD COLUMN id_agence int;
ALTER TABLE compte ADD CONSTRAINT fk_agence_compte FOREIGN KEY(id_agence) REFERENCES agence(id_agence);


-- export de la base de données

mysqldump -u root -p banque > Documents/banque.sql




