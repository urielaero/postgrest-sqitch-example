-- Verify flipt:rpc_jwt_token on pg

BEGIN;

SELECT has_function_privilege('pgjwtfns.jwt_token(int, text, text)', 'execute');

ROLLBACK;
