-- +migrate up
CREATE TABLE users (
  id  SERIAL PRIMARY KEY,

  -- Fields
  email     TEXT  NOT NULL,
  password  TEXT  NOT NULL, -- It's stored encrypted
  username  TEXT  NOT NULL,
  bio       TEXT,
  image     VARCHAR(256),

  -- Timestamps
  created_at  TIMESTAMPTZ NOT NULL  DEFAULT NOW(),
  updated_at  TIMESTAMPTZ           DEFAULT NOW()
);

-- Indexes
CREATE UNIQUE INDEX users_email_index ON users (email);
CREATE UNIQUE INDEX users_username_index ON users (username);

-- +migrate down
DROP TABLE users;
