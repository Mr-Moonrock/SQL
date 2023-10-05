CREATE TABLE "Posts"(
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "user_id" BIGINT NOT NULL,
    "region_id" BIGINT NOT NULL,
    "category_id" BIGINT NOT NULL
);
ALTER TABLE
    "Posts" ADD PRIMARY KEY("id");
CREATE TABLE "Regions"(
    "id" SERIAL NOT NULL,
    "name" BIGINT NOT NULL
);
ALTER TABLE
    "Regions" ADD PRIMARY KEY("id");
CREATE TABLE "Catergories"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "Catergories" ADD PRIMARY KEY("id");
CREATE TABLE "Users"(
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "encrypted_password" TEXT NOT NULL,
    "preferrred_region_id" TEXT NOT NULL
);
ALTER TABLE
    "Users" ADD PRIMARY KEY("id");
ALTER TABLE
    "Posts" ADD CONSTRAINT "posts_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("id");
ALTER TABLE
    "Posts" ADD CONSTRAINT "posts_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "Catergories"("id");
ALTER TABLE
    "Posts" ADD CONSTRAINT "posts_region_id_foreign" FOREIGN KEY("region_id") REFERENCES "Regions"("id");