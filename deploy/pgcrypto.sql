-- Deploy flipt:pgcrypto to pg

BEGIN;

CREATE EXTENSION pgcrypto;


COMMIT;
