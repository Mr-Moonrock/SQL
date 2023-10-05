CREATE TABLE "Patients"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "insurance" TEXT NOT NULL,
    "birthday" TEXT NOT NULL
);
ALTER TABLE
    "Patients" ADD PRIMARY KEY("id");
CREATE TABLE "Diseases"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL
);
ALTER TABLE
    "Diseases" ADD PRIMARY KEY("id");
CREATE TABLE "Visits"(
    "id" SERIAL NOT NULL,
    "doctor_id" smallserial NOT NULL,
    "patient_id" smallserial NOT NULL,
    "date" DATE NOT NULL
);
ALTER TABLE
    "Visits" ADD PRIMARY KEY("id");
CREATE TABLE "Diagnoses"(
    "id" SERIAL NOT NULL,
    "visit_id" smallserial NOT NULL,
    "disease_id" smallserial NOT NULL,
    "notes" TEXT NOT NULL
);
ALTER TABLE
    "Diagnoses" ADD PRIMARY KEY("id");
CREATE TABLE "Doctors"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "speciality" TEXT NOT NULL
);
ALTER TABLE
    "Doctors" ADD PRIMARY KEY("id");
ALTER TABLE
    "Diagnoses" ADD CONSTRAINT "diagnoses_visit_id_foreign" FOREIGN KEY("visit_id") REFERENCES "Visits"("id");
ALTER TABLE
    "Visits" ADD CONSTRAINT "visits_doctor_id_foreign" FOREIGN KEY("doctor_id") REFERENCES "Doctors"("id");
ALTER TABLE
    "Diagnoses" ADD CONSTRAINT "diagnoses_disease_id_foreign" FOREIGN KEY("disease_id") REFERENCES "Diseases"("id");
ALTER TABLE
    "Visits" ADD CONSTRAINT "visits_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "Patients"("id");