use poem_openapi::Enum;
//use sqlx::postgres::{PgArgumentBuffer, PgArguments};

/// Update action type
#[derive(
    Debug, Copy, Clone, Eq, PartialEq, num_enum::IntoPrimitive, num_enum::TryFromPrimitive, Enum,
)]
#[repr(i32)]
#[oai(rename_all = "snake_case")]
pub enum UpdateAction {
    Create = 1,
    Update = 2,
    Delete = 3,
}

impl sqlx::Type<sqlx::Postgres> for UpdateAction {
    fn type_info() -> sqlx::postgres::PgTypeInfo {
        //i32::type_info()
        sqlx::postgres::PgTypeInfo::with_name("Int4")
    }

    fn compatible(ty: &sqlx::postgres::PgTypeInfo) -> bool {
        let string_type = sqlx::postgres::PgTypeInfo::with_name("Int4");
        string_type.oid() == ty.oid()
        //i32::compatible(ty)
    }
}

impl<'a> sqlx::Decode<'a, sqlx::Postgres> for UpdateAction {
    fn decode(value: sqlx::postgres::PgValueRef<'a>) -> Result<Self, sqlx::error::BoxDynError> {
        let mut decoder = sqlx::postgres::types::PgRecordDecoder::new(value)?;
        let n = decoder.try_decode::<i32>()?;
        Ok(Self::try_from(n)?)
    }
}

impl<'a> sqlx::Encode<'a, sqlx::Postgres> for UpdateAction {
    fn encode_by_ref(
        &self,
        buf: &mut sqlx::postgres::PgArgumentBuffer,
    ) -> sqlx::encode::IsNull {
        let v: u8 = *self as u8;
        buf.push(v);
        sqlx::encode::IsNull::No
    }
}