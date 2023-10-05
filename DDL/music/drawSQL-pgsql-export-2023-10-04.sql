CREATE TABLE "Artists"(
    "id" SERIAL NOT NULL,
    "artists" TEXT NOT NULL,
    "songs_id" smallserial NOT NULL,
    "producers_id" smallserial NOT NULL
);
ALTER TABLE
    "Artists" ADD PRIMARY KEY("id");
CREATE TABLE "Producers"(
    "id" SERIAL NOT NULL,
    "producers_name" TEXT NOT NULL,
    "artists_id" smallserial NOT NULL
);
ALTER TABLE
    "Producers" ADD PRIMARY KEY("id");
CREATE TABLE "Songs"(
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "album" TEXT NOT NULL,
    "duration_in_seconds" INTEGER NOT NULL,
    "release_date" DATE NOT NULL,
    "artists_id" smallserial NOT NULL
);
ALTER TABLE
    "Songs" ADD PRIMARY KEY("id");
ALTER TABLE
    "Songs" ADD CONSTRAINT "songs_artists_id_foreign" FOREIGN KEY("artists_id") REFERENCES "Artists"("id");
ALTER TABLE
    "Producers" ADD CONSTRAINT "producers_artists_id_foreign" FOREIGN KEY("artists_id") REFERENCES "Artists"("id");
ALTER TABLE
    "Artists" ADD CONSTRAINT "artists_producers_id_foreign" FOREIGN KEY("producers_id") REFERENCES "Producers"("id");
ALTER TABLE
    "Artists" ADD CONSTRAINT "artists_songs_id_foreign" FOREIGN KEY("songs_id") REFERENCES "Songs"("id");