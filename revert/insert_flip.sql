-- Revert flipt:insert_flip from pg

BEGIN;

DROP FUNCTION flipr.insert_flip(TEXT, TEXT);

COMMIT;
