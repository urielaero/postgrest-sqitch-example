-- Deploy flipt:web_annon_role to pg

BEGIN;

CREATE ROLE web_anon nologin;
GRANT USAGE ON SCHEMA flipr to web_anon;
GRANT SELECT ON flipr.users to web_anon;

-- Note that the database administrator must allow the authenticator role to switch into this user by previously executing
CREATE ROLE authenticator noinherit login password 'mysecretpassword';
GRANT web_anon to authenticator;

COMMIT;
