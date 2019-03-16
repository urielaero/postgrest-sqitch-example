-- Deploy flipt:rpc_jwt_login to pg

BEGIN;

GRANT USAGE ON SCHEMA pgjwtfns to web_anon;

CREATE TYPE flipr.type_jwt_token AS (
  token text
);

CREATE OR REPLACE FUNCTION flipr.jwt_login(email text, pass text) RETURNS flipr.type_jwt_token AS $$
    DECLARE
        token flipr.type_jwt_token;
    BEGIN
        SELECT pgjwtfns.jwt_token(us.id, us.role, us.security_stamp) INTO token FROM
            (SELECT * FROM flipr.users WHERE nickname = email AND password = crypt(pass, password)
        ) as us;

        IF token is null then
            RAISE sqlstate '42501' USING
	    message = 'Invalid access data',
	    detail = 'Email or password invalid',
	    hint = 'Try again';
        END IF;

        return token;
    END
$$ LANGUAGE plpgsql;

COMMIT;
