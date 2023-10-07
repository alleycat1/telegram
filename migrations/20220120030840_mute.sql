create table mute
(
    id         integer primary key not null,
    uid        integer not null,
    mute_uid   integer,
    mute_gid   integer,
    expired_at timestamp,
    foreign key (uid) references "user" (uid) on delete cascade,
    foreign key (mute_uid) references "user" (uid) on delete cascade,
    foreign key (mute_gid) references "group" (gid) on delete cascade
);

CREATE SEQUENCE "mute_sequence" ;
ALTER SEQUENCE "mute_sequence"
OWNED BY "mute"."id";

create unique index mute_uid_uid on mute (uid, mute_uid);
create unique index mute_uid_gid on mute (uid, mute_gid);
create index mute_uid on mute (uid);
create index mute_expired_at on mute (expired_at);
