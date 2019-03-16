-- Deploy flipt:rpc_jwt_token to pg

BEGIN;

CREATE OR REPLACE FUNCTION pgjwtfns.jwt_token(user_sub int, user_role text, user_security_stamp text) RETURNS text AS $$
  SELECT pgjwtfns.sign(
    row_to_json(r), current_setting('app.settings.jwt_secret')
  ) AS token
  FROM (
    SELECT
      user_sub::text as sub,
      user_role::text as role,
      user_security_stamp as security_stamp
  ) r;
$$ LANGUAGE sql;

COMMIT;
