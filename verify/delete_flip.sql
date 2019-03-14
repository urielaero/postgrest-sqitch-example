-- Verify flipt:delete_flip on pg

BEGIN;

SELECT has_function_privilege('flipr.delete_flip(bigint)', 'execute');

ROLLBACK;
