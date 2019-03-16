-- Revert flipt:rpc_pgjwt from pg

BEGIN;

SET client_min_messages = 'warning';
DROP schema pgjwtfns CASCADE;

COMMIT;
