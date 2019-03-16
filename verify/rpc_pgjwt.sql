-- Verify flipt:rpc_pgjwt on pg

BEGIN;

SELECT has_function_privilege('pgjwtfns.url_encode(bytea)', 'execute' );
SELECT has_function_privilege('pgjwtfns.url_decode(text)', 'execute');
SELECT has_function_privilege('pgjwtfns.algorithm_sign(text, text, text)', 'execute');
SELECT has_function_privilege('pgjwtfns.sign(json, text, text)', 'execute');
SELECT has_function_privilege('pgjwtfns.verify(text, text, text)', 'execute');

SELECT 1/COUNT(*) from (SELECT * from pgjwtfns.verify(pgjwtfns.sign('{"sub":"1234567890","name":"John Doe","admin":true}', 'secret'), 'secret')) AS ver WHERE ver.valid = TRUE;
SELECT 1/COUNT(*) from (SELECT * from pgjwtfns.verify(pgjwtfns.sign('{"sub":"1234567890","name":"John Doe","admin":true}', 'secret'), 'secret2')) AS ver WHERE ver.valid = FALSE;

ROLLBACK;
