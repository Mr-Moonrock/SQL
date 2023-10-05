CREATE TABLE "Goals"(
    "id" SERIAL NOT NULL,
    "player_id" smallserial NOT NULL,
    "match_id" smallserial NOT NULL
);
ALTER TABLE
    "Goals" ADD PRIMARY KEY("id");
CREATE TABLE "Lineups"(
    "id" SERIAL NOT NULL,
    "player_id" smallserial NOT NULL,
    "match_id" smallserial NOT NULL,
    "team_id" smallserial NOT NULL
);
ALTER TABLE
    "Lineups" ADD PRIMARY KEY("id");
CREATE TABLE "Matches"(
    "id" SERIAL NOT NULL,
    "home_team_id" smallserial NOT NULL,
    "away_team_id" smallserial NOT NULL,
    "location" TEXT NOT NULL,
    "date" DATE NOT NULL,
    "start_time" TEXT NOT NULL,
    "season_id" smallserial NOT NULL,
    "head_referee_id" smallserial NOT NULL,
    "assistant_referee_1_id" smallserial NOT NULL,
    "assitant_referee_2_id" smallserial NOT NULL
);
ALTER TABLE
    "Matches" ADD PRIMARY KEY("id");
CREATE TABLE "Referees"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "Referees" ADD PRIMARY KEY("id");
CREATE TABLE "Results"(
    "id" SERIAL NOT NULL,
    "team_id" smallserial NOT NULL,
    "match_id" smallserial NOT NULL,
    "result(win, loss, or draw)" TEXT NOT NULL
);
ALTER TABLE
    "Results" ADD PRIMARY KEY("id");
CREATE TABLE "Season"(
    "id" SERIAL NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL
);
ALTER TABLE
    "Season" ADD PRIMARY KEY("id");
CREATE TABLE "Teams"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "city" TEXT NOT NULL
);
ALTER TABLE
    "Teams" ADD PRIMARY KEY("id");
CREATE TABLE "Players"(
    "id" SERIAL NOT NULL,
    "birthday" DATE NOT NULL,
    "height" TEXT NOT NULL,
    "current_team_id" smallserial NOT NULL
);
ALTER TABLE
    "Players" ADD PRIMARY KEY("id");
ALTER TABLE
    "Matches" ADD CONSTRAINT "matches_season_id_foreign" FOREIGN KEY("season_id") REFERENCES "Season"("id");
ALTER TABLE
    "Results" ADD CONSTRAINT "results_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "Matches"("id");
ALTER TABLE
    "Lineups" ADD CONSTRAINT "lineups_team_id_foreign" FOREIGN KEY("team_id") REFERENCES "Teams"("id");
ALTER TABLE
    "Goals" ADD CONSTRAINT "goals_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "Matches"("id");
ALTER TABLE
    "Matches" ADD CONSTRAINT "matches_assistant_referee_1_id_foreign" FOREIGN KEY("assistant_referee_1_id") REFERENCES "Referees"("id");
ALTER TABLE
    "Goals" ADD CONSTRAINT "goals_player_id_foreign" FOREIGN KEY("player_id") REFERENCES "Players"("id");
ALTER TABLE
    "Results" ADD CONSTRAINT "results_team_id_foreign" FOREIGN KEY("team_id") REFERENCES "Teams"("id");
ALTER TABLE
    "Players" ADD CONSTRAINT "players_current_team_id_foreign" FOREIGN KEY("current_team_id") REFERENCES "Teams"("id");
ALTER TABLE
    "Lineups" ADD CONSTRAINT "lineups_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "Matches"("id");
ALTER TABLE
    "Lineups" ADD CONSTRAINT "lineups_player_id_foreign" FOREIGN KEY("player_id") REFERENCES "Players"("id");