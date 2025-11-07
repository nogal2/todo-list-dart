BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "todo" (
    "id" bigserial PRIMARY KEY,
    "content" text NOT NULL,
    "isCompleted" boolean NOT NULL
);


--
-- MIGRATION VERSION FOR todo_list_dart
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('todo_list_dart', '20251107114132704', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251107114132704', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
