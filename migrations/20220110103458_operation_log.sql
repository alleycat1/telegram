create table "operation_log"
(
    id SERIAL primary key not null,
    log text not null,
    created_at timestamp not null default current_timestamp
);
