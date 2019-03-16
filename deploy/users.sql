-- Deploy flipt:users to pg
-- requires: appschema

BEGIN;

SET client_min_messages = 'warning';
CREATE TABLE flipr.users (
    id SERIAL PRIMARY KEY,
    nickname TEXT,
    password TEXT NOT NULL,
    security_stamp TEXT,
    role TEXT NOT NULL DEFAULT 'login_user',

    timestamp TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

COMMIT;
