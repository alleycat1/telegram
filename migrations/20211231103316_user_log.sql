create table "user_log"
(
    id                SERIAL primary key not null,
    uid               integer   not null,
    action            integer   not null,
    email             text,
    name              text,
    gender            integer,
    language          text,
    is_admin          bool,
    avatar_updated_at timestamp,
    created_at        timestamp not null default current_timestamp
);
