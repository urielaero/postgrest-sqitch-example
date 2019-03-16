-- Revert flipt:rpc_jwt_login from pg

BEGIN;

DROP FUNCTION flipr.jwt_login(text, text);
DROP TYPE flipr.type_jwt_token;

COMMIT;
