-- Deploy flipt:flips to pg
-- requires: appschema
-- requires: users

BEGIN;

SET client_min_messages = 'warning';

CREATE TABLE flipr.flips (
    id        BIGSERIAL   PRIMARY KEY,
    user_id   int         NOT NULL REFERENCES flipr.users(id),
    body      TEXT        NOT NULL DEFAULT '' CHECK ( length(body) <= 180 ),
    timestamp TIMESTAMPTZ NOT NULL DEFAULT clock_timestamp()
);

COMMIT;
