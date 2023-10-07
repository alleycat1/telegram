create table pinned_message
(
    id         integer primary key not null,
    gid        integer not null,
    mid        integer not null,
    created_by integer not null,
    created_at timestamp not null,
    foreign key (created_by) references "user" (uid) on delete cascade,
    foreign key (gid) references "group" (gid) on delete cascade
);

CREATE SEQUENCE "pinned_message_sequence" ;
ALTER SEQUENCE "pinned_message_sequence"
OWNED BY "pinned_message"."id";


create index pinned_message_gid on pinned_message (gid);
create unique index pinned_message_gid_mid on pinned_message (gid, mid);
