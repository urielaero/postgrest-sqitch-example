-- Verify flipt:insert_flip on pg

BEGIN;

SELECT has_function_privilege('flipr.insert_flip(text, text)', 'execute');

ROLLBACK;
