create table "operation_log"
(
    id integer primary key not null,
    log text not null,
    created_at timestamp not null default current_timestamp
);

CREATE SEQUENCE "operation_log_sequence" ;
ALTER SEQUENCE "operation_log_sequence"
OWNED BY "operation_log"."id";