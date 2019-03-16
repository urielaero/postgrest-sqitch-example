-- Verify flipt:rpc_jwt_login on pg

BEGIN;

SELECT has_function_privilege('flipr.jwt_login(text, text)', 'execute');

ROLLBACK;
