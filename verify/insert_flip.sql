-- Verify flipt:insert_flip on pg

BEGIN;

SELECT has_function_privilege('flipr.insert_flip(int, text)', 'execute');

ROLLBACK;
