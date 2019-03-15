-- Deploy flipt:users to pg
-- requires: appschema

BEGIN;

SET client_min_messages = 'warning';
CREATE TABLE flipr.users (
    id SERIAL PRIMARY KEY,
    nickname TEXT,
    password TEXT NOT NULL,
    timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

COMMIT;
