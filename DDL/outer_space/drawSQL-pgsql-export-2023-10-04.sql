CREATE TABLE "orbits"(
    "id" SERIAL NOT NULL,
    "orbits_period_in_years" TEXT NOT NULL,
    "orbits_around" INTEGER NOT NULL
);
ALTER TABLE
    "orbits" ADD PRIMARY KEY("id");
CREATE TABLE "milkyway"(
    "id" SERIAL NOT NULL,
    "planets_id" TEXT NOT NULL,
    "moons_id" TEXT NOT NULL,
    "orbits_id" TEXT NOT NULL,
    "galaxy_name" TEXT NOT NULL
);
ALTER TABLE
    "milkyway" ADD PRIMARY KEY("id");
CREATE TABLE "planets"(
    "id" SERIAL NOT NULL,
    "planets_name" TEXT NOT NULL
);
ALTER TABLE
    "planets" ADD PRIMARY KEY("id");
CREATE TABLE "moons"(
    "id" SERIAL NOT NULL,
    "moon_names" TEXT NOT NULL
);
ALTER TABLE
    "moons" ADD PRIMARY KEY("id");
ALTER TABLE
    "milkyway" ADD CONSTRAINT "milkyway_moons_id_foreign" FOREIGN KEY("moons_id") REFERENCES "moons"("id");
ALTER TABLE
    "milkyway" ADD CONSTRAINT "milkyway_planets_id_foreign" FOREIGN KEY("planets_id") REFERENCES "planets"("id");
ALTER TABLE
    "milkyway" ADD CONSTRAINT "milkyway_orbits_id_foreign" FOREIGN KEY("orbits_id") REFERENCES "orbits"("id");