-- Verify flipt:todos on pg

BEGIN;

SELECT id, done, task, due
    FROM flipr.todos
    WHERE FALSE;

ROLLBACK;
