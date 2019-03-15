-- Deploy flipt:insert_user to pg
-- requires: users
-- requires: appschema

BEGIN;


CREATE OR REPLACE FUNCTION flipr.insert_user(
    nickname TEXT,
    password TEXT
) RETURNS VOID LANGUAGE SQL SECURITY DEFINER AS $$
    INSERT INTO flipr.users(nickname, password) VALUES($1, md5($2));
$$;

COMMIT;
