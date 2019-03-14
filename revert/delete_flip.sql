-- Revert flipt:delete_flip from pg

BEGIN;

DROP FUNCTION flipr.delete_flip(BIGINT);

COMMIT;
