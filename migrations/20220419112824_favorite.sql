create table favorite_archive
(
    id         SERIAL primary key not null,
    uid        integer not null,
    archive_id text not null,
    created_at timestamp not null,
    foreign key (uid) references "user" (uid) on delete cascade
);

create unique index favorite_archive_uid_archive_id on favorite_archive (uid, archive_id);
