-- Revert flipt:flips from pg

BEGIN;

DROP TABLE flipr.flips;

COMMIT;
