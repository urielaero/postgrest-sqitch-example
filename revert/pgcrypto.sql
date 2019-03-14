-- Revert flipt:pgcrypto from pg

BEGIN;

DROP EXTENSION pgcrypto;

COMMIT;
