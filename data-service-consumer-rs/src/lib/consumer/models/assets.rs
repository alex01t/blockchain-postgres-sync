use crate::schema::*;
use chrono::NaiveDateTime;
use diesel::{Insertable, Queryable};
use diesel_full_text_search::TsVector;
use std::hash::{Hash, Hasher};

pub type BlockUid = i64;
pub type UpdateUid = i64;

#[derive(Clone, Debug, Insertable, Queryable)]
pub struct AssetUpdate {
    pub block_uid: i64,
    pub uid: i64,
    pub superseded_by: i64,
    pub asset_id: String,
    pub decimals: i16,
    pub name: String,
    pub description: String,
    pub reissuable: bool,
    pub volume: i64,
    pub script: Option<String>,
    pub sponsorship: Option<i64>,
    pub nft: bool,
}

impl PartialEq for AssetUpdate {
    fn eq(&self, other: &AssetUpdate) -> bool {
        (&self.asset_id) == (&other.asset_id)
    }
}

impl Eq for AssetUpdate {}

impl Hash for AssetUpdate {
    fn hash<H: Hasher>(&self, state: &mut H) {
        self.asset_id.hash(state);
    }
}

#[derive(Clone, Debug)]
pub struct AssetOverride {
    pub superseded_by: i64,
    pub id: String,
}

#[derive(Clone, Debug)]
pub struct DeletedAsset {
    pub uid: i64,
    pub id: String,
}

impl PartialEq for DeletedAsset {
    fn eq(&self, other: &Self) -> bool {
        (&self.id) == (&other.id)
    }
}

impl Eq for DeletedAsset {}

impl Hash for DeletedAsset {
    fn hash<H: Hasher>(&self, state: &mut H) {
        self.id.hash(state);
    }
}

#[derive(Clone, Debug, Insertable, Queryable)]
pub struct AssetOrigin {
    pub asset_id: String,
    pub first_asset_update_uid: i64,
    pub origin_transaction_id: String,
    pub issuer: String,
    pub issue_height: i32,
    pub issue_time_stamp: NaiveDateTime,
}

#[derive(Clone, Debug, Insertable)]
#[table_name = "assets_metadata"]
struct AssetsMetadata {
    asset_id: String,
    asset_name: Option<String>,
    ticker: Option<String>,
    height: Option<i32>,
}

#[derive(Clone, Debug, Insertable)]
#[table_name = "assets_names_map"]
struct AssetsNames {
    asset_id: String,
    asset_name: Option<String>,
    searchable_asset_name: TsVector,
}