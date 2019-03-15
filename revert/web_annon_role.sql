-- Revert flipt:web_annon_role from pg

BEGIN;

DROP ROLE authenticator;

REASSIGN OWNED BY web_anon to postgres;

DROP OWNED BY web_anon;
DROP ROLE web_anon;

COMMIT;
