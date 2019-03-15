-- Deploy flipt:todos to pg

BEGIN;

CREATE TABLE flipr.todos (
  id SERIAL PRIMARY KEY,
  done BOOLEAN NOT NULL DEFAULT FALSE,
  task TEXT NOT NULL,
  due TIMESTAMPTZ,
  user_id INT NOT NULL REFERENCES flipr.users (id)
);

-- list anon
GRANT SELECT ON flipr.todos to web_anon;

COMMIT;
