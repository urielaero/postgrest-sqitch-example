-- Deploy flipt:insert_flip to pg
-- requires: flips
-- requires: appschema
-- requires: users

BEGIN;


CREATE OR REPLACE FUNCTION flipr.insert_flip(
   user_id int,
   body     TEXT
) RETURNS BIGINT LANGUAGE sql SECURITY DEFINER AS $$
    INSERT INTO flipr.flips (user_id, body)
    VALUES ($1, $2)
    RETURNING id;
$$;


COMMIT;
