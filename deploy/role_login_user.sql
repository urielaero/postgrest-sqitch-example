-- Deploy flipt:role_login_user to pg

BEGIN;

CREATE role login_user nologin;
GRANT login_user to authenticator;

GRANT usage on schema flipr to login_user;

GRANT ALL on flipr.todos to login_user;
GRANT usage, select on sequence flipr.todos_id_seq to login_user;


CREATE POLICY owner_policy ON flipr.todos
  TO login_user
  /*SELECT*/
  USING (user_id = current_setting('request.jwt.claim.sub', true)::int)
  /*INSERT/DELETE*/
  WITH CHECK (user_id = current_setting('request.jwt.claim.sub', true)::int);

-- If row-level security is enabled for a table, but no applicable policies exist, a "default deny" policy is assumed, so that no rows will be visible or updatable.
CREATE POLICY anon_policy ON flipr.todos
  TO web_anon
  /*SELECT*/
  USING (TRUE)
  /*INSERT/DELETE*/
  WITH CHECK (FALSE);

alter table flipr.todos enable row level security;

COMMIT;
