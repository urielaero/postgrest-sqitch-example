-- Verify flipt:web_annon_role on pg

BEGIN;

SELECT 1/COUNT(*) from pg_roles where rolname='web_anon';
SELECT 1/COUNT(*) from pg_roles where rolname='authenticator';

ROLLBACK;
