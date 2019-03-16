-- Revert flipt:rpc_jwt_token from pg

BEGIN;

DROP FUNCTION pgjwtfns.jwt_token(int, text, text);

COMMIT;
