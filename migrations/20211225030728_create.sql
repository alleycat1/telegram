create table "user"
(
    uid               SERIAL8 primary key not null,
    name              text not null,
    password          text,
    email             text,
    gender            integer             not null,
    language          text                not null,
    is_admin          boolean             not null default false,
    create_by         text                not null,
    avatar_updated_at timestamp           not null default current_timestamp,
    created_at        timestamp           not null default current_timestamp,
    updated_at        timestamp           not null default current_timestamp
);

create unique index "user_name" on "user" (name);
create unique index "user_email" on "user" (email);

create table "google_auth"
(
    email text primary key not null,
    uid   integer          not null,
    foreign key (uid) references "user" (uid) on delete cascade
);

create unique index google_auth_uid on google_auth (uid);

create table "openid_connect"
(
    issuer  text    not null,
    subject text    not null,
    uid     integer not null,
    primary key (issuer, subject),
    foreign key (uid) references "user" (uid) on delete cascade
);

create unique index "openid_connect_uid" on openid_connect (uid);

create table "refresh_token"
(
    uid        integer   not null,
    device     text      not null,
    token      text      not null,
    created_at timestamp not null default current_timestamp,
    updated_at timestamp not null default current_timestamp,
    primary key (uid, device),
    foreign key (uid) references "user" (uid) on delete cascade
);

create table "device"
(
    uid          integer   not null,
    device       text      not null,
    device_token text,
    created_at   timestamp not null default current_timestamp,
    updated_at   timestamp not null default current_timestamp,
    primary key (uid, device),
    foreign key (uid) references "user" (uid) on delete cascade
);

create table "group"
(
    gid         SERIAL8 primary key not null,
    name        text      not null,
    owner       integer,
    is_public   bool      not null default false,
    description text      not null default '',
    created_at  timestamp not null default current_timestamp,
    updated_at  timestamp not null default current_timestamp
);

create table "group_user"
(
    id  SERIAL8 primary key not null,
    gid integer not null,
    uid integer not null,
    foreign key (gid) references "group" (gid) on delete cascade,
    foreign key (uid) references "user" (uid) on delete cascade
);

create unique index group_user_gid_uid on group_user (gid, uid);
create index group_user_gid on group_user (gid);
