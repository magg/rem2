CREATE TABLE "admins" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nombre" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "usuario_id" integer);
CREATE TABLE "clients" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nombre" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "usuario_id" integer);
CREATE TABLE "criterios" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "descripcion" text, "story_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "projects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nombre" varchar(255), "descripcion" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "periodo" varchar(255), "client_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "sprints" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "comentario" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "fechainicio" date, "fechafin" date);
CREATE TABLE "sprints_stories" ("sprint_id" integer, "story_id" integer);
CREATE TABLE "statuses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "descripcion" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "stories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "status_id" integer DEFAULT 1, "descripcion" text, "functionpts" integer, "prioridad" varchar(255), "usuario" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "comentarios" text, "project_id" integer);
CREATE TABLE "students" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nombre" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "rol" varchar(255), "usuario_id" integer, "team_id" integer);
CREATE TABLE "tasks" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "descripcion" text, "estimadoinicial" integer, "status" varchar(255), "story_id" integer, "student_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "teams" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "nombre" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "project_id" integer);
CREATE TABLE "usuarios" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(255), "password_digest" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "tipo" varchar(255), "auth_token" varchar(255), "email" varchar(255), "password_reset_token" varchar(255), "password_reset_sent_at" datetime);
CREATE TABLE "workdetails" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "task_id" integer, "hrstrabajadas" integer, "hrsporterminar" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120312224850');

INSERT INTO schema_migrations (version) VALUES ('20120312225058');

INSERT INTO schema_migrations (version) VALUES ('20120316211625');

INSERT INTO schema_migrations (version) VALUES ('20120316212332');

INSERT INTO schema_migrations (version) VALUES ('20120316223352');

INSERT INTO schema_migrations (version) VALUES ('20120316225034');

INSERT INTO schema_migrations (version) VALUES ('20120325050216');

INSERT INTO schema_migrations (version) VALUES ('20120325063323');

INSERT INTO schema_migrations (version) VALUES ('20120325074717');

INSERT INTO schema_migrations (version) VALUES ('20120325075420');

INSERT INTO schema_migrations (version) VALUES ('20120325090255');

INSERT INTO schema_migrations (version) VALUES ('20120325092113');

INSERT INTO schema_migrations (version) VALUES ('20120327183337');

INSERT INTO schema_migrations (version) VALUES ('20120327184653');

INSERT INTO schema_migrations (version) VALUES ('20120327185527');

INSERT INTO schema_migrations (version) VALUES ('20120329234459');

INSERT INTO schema_migrations (version) VALUES ('20120409221402');

INSERT INTO schema_migrations (version) VALUES ('20120409221630');

INSERT INTO schema_migrations (version) VALUES ('20120409223755');

INSERT INTO schema_migrations (version) VALUES ('20120409223838');

INSERT INTO schema_migrations (version) VALUES ('20120409224735');

INSERT INTO schema_migrations (version) VALUES ('20120409224809');

INSERT INTO schema_migrations (version) VALUES ('20120412203955');

INSERT INTO schema_migrations (version) VALUES ('20120415235029');

INSERT INTO schema_migrations (version) VALUES ('20120417005104');

INSERT INTO schema_migrations (version) VALUES ('20120418024015');

INSERT INTO schema_migrations (version) VALUES ('20120418155648');

INSERT INTO schema_migrations (version) VALUES ('20120420054821');

INSERT INTO schema_migrations (version) VALUES ('20120421182650');

INSERT INTO schema_migrations (version) VALUES ('20120421182813');

INSERT INTO schema_migrations (version) VALUES ('20120422204816');