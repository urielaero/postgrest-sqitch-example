-- Verify flipt:role_login_user on pg

BEGIN;

SELECT 1/COUNT(*) from pg_roles where rolname='login_user';

ROLLBACK;
