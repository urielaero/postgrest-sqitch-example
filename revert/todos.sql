-- Revert flipt:todos from pg

BEGIN;

DROP TABLE flipr.todos;

COMMIT;
