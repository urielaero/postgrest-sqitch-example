-- Revert flipt:role_login_user from pg

BEGIN;

REASSIGN OWNED BY login_user to postgres;

DROP OWNED BY login_user;
DROP ROLE login_user;

COMMIT;
