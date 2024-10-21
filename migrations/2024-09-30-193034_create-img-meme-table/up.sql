-- Your SQL goes here
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS meme_images (
    id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
    meme_name TEXT,
    img BYTEA
);
