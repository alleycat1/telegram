create table bot_key (
    id SERIAL primary key not null,
    uid integer not null,
    name text not null,
    key text not null,
    created_at timestamp not null default current_timestamp,
    last_used timestamp,
    foreign key (uid) references "user" (uid) on delete cascade
);

create index bot_key_uid on bot_key (uid);

create unique index bot_key_uid_name on bot_key (uid, name);