CREATE DATABASE db_medicalCenter;
USE db_medicalCenter;

---TABLES

CREATE TABLE history(
	 idHistory INTEGER NOT NULL,
	 recordDate DATETIME NULL,
	 observationHis VARCHAR NULL,
	 CONSTRAINT pk_history primary key (idHistory)
);

CREATE TABLE countries(
	idCountries INTEGER NOT NULL,
	country VARCHAR NOT NULL,
	observationCou VARCHAR NULL,
	CONSTRAINT pk_countries PRIMARY KEY (idCountries)
);

CREATE TABLE doctors(
	idDoctors INTEGER NOT NULL,
	names VARCHAR NOT NULL,
	paName VARCHAR  NOT NULL,
	maName VARCHAR NOT NULL,
	observationDoc VARCHAR NULL,
	CONSTRAINT pk_doctors primary key (idDoctors)
);

CREATE TABLE patients(
	idPatients INTEGER NOT NULL,
	idCountries INTEGER NOT NULL,
	names VARCHAR NOT NULL,
	paName VARCHAR  NOT NULL,
	maName VARCHAR NOT NULL,
	dateOfBirth DATE NULL,
	addressHome VARCHAR NULL,
	phone VARCHAR (10) NULL,
	email VARCHAR NULL,
	observationPat VARCHAR NULL,
	CONSTRAINT pk_patients primary key (idPatients),
	CONSTRAINT fk_idCountry FOREIGN KEY (idCountries) REFERENCES countries(idCountries)
);

CREATE TABLE turns(
	idTurns INTEGER NOT NULL,
	dateTurn DATETIME NOT NULL,
	statusTurn INTEGER NOT NULL,
	observationTur VARCHAR NULL,
	CONSTRAINT pk_turns PRIMARY KEY(idTurns)
);

CREATE TABLE patient_history(
	id_pHistory INTEGER NOT NULL,
	idPatients INTEGER NOT NULL,
	idDoctors INTEGER NOT NULL,
	CONSTRAINT pk_pHistory PRIMARY KEY (id_pHistory),
	CONSTRAINT fk_patient FOREIGN KEY (idPatients) REFERENCES patients (idPatients),
	CONSTRAINT fk_doctors FOREIGN KEY (idDoctors) REFERENCES doctors (idDoctors)
);

CREATE TABLE status_Turn(
	id_sTurn INTEGER NOT NULL,
	descriptionTurn VARCHAR NULL,
	CONSTRAINT pk_sTurn PRIMARY KEY (id_sTurn)
);

CREATE TABLE patient_Turn(
	id_pTurn INTEGER NOT NULL,
	idDoctors INTEGER NOT NULL,
	idPatients INTEGER NOT NULL,
	CONSTRAINT pk_pTurn PRIMARY KEY (id_pTurn),
	CONSTRAINT fk_pTurn_patient FOREIGN KEY (idPatients) REFERENCES patients (idPatients),
	CONSTRAINT fk_pTurn_doctors FOREIGN KEY (idDoctors) REFERENCES doctors (idDoctors)
);