CREATE TABLE "Address" (
	"address_id" INT NOT NULL,
	"house_no" VARCHAR2(255),
	"streetName" VARCHAR2(255),
	"landmark" VARCHAR2(255),
	"city" VARCHAR2(50),
	"district" VARCHAR2(50) NOT NULL,
	"state" VARCHAR2(50) NOT NULL,
	"country" VARCHAR2(50) NOT NULL DEFAULT "India",
	constraint ADDRESS_PK PRIMARY KEY ("address_id"));

CREATE sequence "ADDRESS_ADDRESS_ID_SEQ";

CREATE trigger "BI_ADDRESS_ADDRESS_ID"
  before insert on "Address"
  for each row
begin
  select "ADDRESS_ADDRESS_ID_SEQ".nextval into :NEW."address_id" from dual;
end;

/
CREATE TABLE "User" (
	"user_id" INT NOT NULL,
	"firstName" VARCHAR2(50) NOT NULL,
	"middleName" VARCHAR2(50) NOT NULL,
	"lastName" VARCHAR2(50) NOT NULL,
	"email" VARCHAR2(100) UNIQUE NOT NULL,
	"contact" VARCHAR2(20) NOT NULL,
	"address_id" INT NOT NULL,
	"gender" VARCHAR2(10) NOT NULL,
	"bloodGroup" VARCHAR2(20) NOT NULL,
	"dateOfBirth" DATE NOT NULL,
	"photo" BLOB NOT NULL,
	constraint USER_PK PRIMARY KEY ("user_id"));

CREATE sequence "USER_USER_ID_SEQ";

CREATE trigger "BI_USER_USER_ID"
  before insert on "User"
  for each row
begin
  select "USER_USER_ID_SEQ".nextval into :NEW."user_id" from dual;
end;

/
CREATE TABLE "Discription" (
	"discription_id" INT NOT NULL,
	"user_id" INT NOT NULL,
	"age" INT NOT NULL,
	"height" FLOAT NOT NULL,
	"oxygenLevel" FLOAT,
	"heartRate" INT,
	"bloodPressure" INT,
	"allergies" VARCHAR2(4000),
	"medicalHistory" VARCHAR2(4000),
	"LastCheckUpDate" TIMESTAMP NOT NULL,
	"UpcomingCheckUpDate" TIMESTAMP,
	constraint DISCRIPTION_PK PRIMARY KEY ("discription_id"));

CREATE sequence "DISCRIPTION_DISCRIPTION_ID_SEQ";

CREATE trigger "BI_DISCRIPTION_DISCRIPTION_ID"
  before insert on "Discription"
  for each row
begin
  select "DISCRIPTION_DISCRIPTION_ID_SEQ".nextval into :NEW."discription_id" from dual;
end;

/
CREATE TABLE "Doctor" (
	"doctor_id" INT NOT NULL,
	"title" VARCHAR2(256) NOT NULL,
	"email" VARCHAR2(256) UNIQUE NOT NULL,
	"contactNo" VARCHAR2(100) UNIQUE NOT NULL,
	"specialization" VARCHAR2(256) NOT NULL,
	constraint DOCTOR_PK PRIMARY KEY ("doctor_id"));

CREATE sequence "DOCTOR_DOCTOR_ID_SEQ";

CREATE trigger "BI_DOCTOR_DOCTOR_ID"
  before insert on "Doctor"
  for each row
begin
  select "DOCTOR_DOCTOR_ID_SEQ".nextval into :NEW."doctor_id" from dual;
end;

/
CREATE TABLE "Admin" (
	"admin_id" INT NOT NULL,
	"firstName" VARCHAR2(50) NOT NULL,
	"lastName" VARCHAR2(50) NOT NULL,
	"email" VARCHAR2(255) UNIQUE NOT NULL,
	"contact" VARCHAR2(50) UNIQUE NOT NULL,
	constraint ADMIN_PK PRIMARY KEY ("admin_id"));

CREATE sequence "ADMIN_ADMIN_ID_SEQ";

CREATE trigger "BI_ADMIN_ADMIN_ID"
  before insert on "Admin"
  for each row
begin
  select "ADMIN_ADMIN_ID_SEQ".nextval into :NEW."admin_id" from dual;
end;

/
CREATE TABLE "Claim" (
	"claim_id" INT NOT NULL,
	"user_id" INT NOT NULL,
	"photo" BLOB NOT NULL,
	"doctor_id" INT NOT NULL,
	constraint CLAIM_PK PRIMARY KEY ("claim_id"));

CREATE sequence "CLAIM_CLAIM_ID_SEQ";

CREATE trigger "BI_CLAIM_CLAIM_ID"
  before insert on "Claim"
  for each row
begin
  select "CLAIM_CLAIM_ID_SEQ".nextval into :NEW."claim_id" from dual;
end;

/

ALTER TABLE "User" ADD CONSTRAINT "User_fk0" FOREIGN KEY ("address_id") REFERENCES "Address"("address_id");

ALTER TABLE "Discription" ADD CONSTRAINT "Discription_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");



ALTER TABLE "Claim" ADD CONSTRAINT "Claim_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");
ALTER TABLE "Claim" ADD CONSTRAINT "Claim_fk1" FOREIGN KEY ("doctor_id") REFERENCES "Doctor"("doctor_id");

