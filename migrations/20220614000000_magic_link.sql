create table user_tmp
(
    uid               integer primary key not null,
    name              text not null,
    password          text,
    email             text,
    gender            integer             not null,
    language          text                not null,
    is_admin          boolean             not null default false,
    create_by         text                not null,
    avatar_updated_at timestamp           not null default '1970-01-01 00:00:00',
    created_at        timestamp           not null default current_timestamp,
    updated_at        timestamp           not null default current_timestamp
);

CREATE SEQUENCE "user_tmp_sequence" ;
ALTER SEQUENCE "user_tmp_sequence"
OWNED BY "user_tmp"."uid";

create unique index user_tmp_email on "user" (email);