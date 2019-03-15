-- Verify flipt:flips on pg

BEGIN;

SELECT id
     , user_id
     , body
     , timestamp
  FROM flipr.flips
 WHERE FALSE;

ROLLBACK;
