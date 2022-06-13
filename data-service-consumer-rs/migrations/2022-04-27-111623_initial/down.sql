DROP TABLE IF EXISTS asset_origins;
DROP TABLE IF EXISTS asset_updates;
DROP TABLE IF EXISTS blocks_microblocks;
DROP TABLE IF EXISTS assets_names_map;
DROP TABLE IF EXISTS assets_metadata;
DROP TABLE IF EXISTS tickers;
DROP TABLE IF EXISTS candles;
DROP TABLE IF EXISTS pairs;
DROP TABLE IF EXISTS waves_data;
DROP TABLE IF EXISTS txs_1;
DROP TABLE IF EXISTS txs_2;
DROP TABLE IF EXISTS txs_3;
DROP TABLE IF EXISTS txs_4;
DROP TABLE IF EXISTS txs_5;
DROP TABLE IF EXISTS txs_6;
DROP TABLE IF EXISTS txs_7;
DROP TABLE IF EXISTS txs_8;
DROP TABLE IF EXISTS txs_9;
DROP TABLE IF EXISTS txs_10;
DROP TABLE IF EXISTS txs_11_transfers;
DROP TABLE IF EXISTS txs_11;
DROP TABLE IF EXISTS txs_12_data;
DROP TABLE IF EXISTS txs_12;
DROP TABLE IF EXISTS txs_13;
DROP TABLE IF EXISTS txs_14;
DROP TABLE IF EXISTS txs_15;
DROP TABLE IF EXISTS txs_16_args;
DROP TABLE IF EXISTS txs_16_payment;
DROP TABLE IF EXISTS txs_16;
DROP TABLE IF EXISTS txs CASCADE;
DROP TABLE IF EXISTS blocks CASCADE;

DROP INDEX IF EXISTS order_senders_timestamp_id_idx;
DROP INDEX IF EXISTS bm_id_idx;
DROP INDEX IF EXISTS bm_time_stamp_uid_desc_idx;
DROP INDEX IF EXISTS asset_updates_block_id_idx;
DROP INDEX IF EXISTS asset_updates_name_idx;
DROP INDEX IF EXISTS assets_names_map_asset_name_idx;
DROP INDEX IF EXISTS candles_max_height_index;
DROP INDEX IF EXISTS pairs_amount_asset_id_price_asset_id_index;
DROP INDEX IF EXISTS searchable_asset_name_idx;
DROP INDEX IF EXISTS tickers_ticker_idx;
DROP INDEX IF EXISTS txs_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_1_height_idx;
DROP INDEX IF EXISTS txs_1_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_2_height_idx;
DROP INDEX IF EXISTS txs_2_sender_idx;
DROP INDEX IF EXISTS txs_2_time_stamp_desc_id_asc_idx;
DROP INDEX IF EXISTS txs_2_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_3_asset_id_idx;
DROP INDEX IF EXISTS txs_3_height_idx;
DROP INDEX IF EXISTS txs_3_sender_idx;
DROP INDEX IF EXISTS txs_3_time_stamp_asc_id_asc_idx;
DROP INDEX IF EXISTS txs_3_time_stamp_desc_id_asc_idx;
DROP INDEX IF EXISTS txs_3_time_stamp_desc_id_desc_idx;
DROP INDEX IF EXISTS txs_3_md5_script_idx;
DROP INDEX IF EXISTS txs_3_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_4_asset_id_index;
DROP INDEX IF EXISTS txs_4_height_idx;
DROP INDEX IF EXISTS txs_4_recipient_idx;
DROP INDEX IF EXISTS txs_4_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_4_time_stamp_desc_id_asc_idx;
DROP INDEX IF EXISTS txs_4_time_stamp_desc_id_desc_idx;
DROP INDEX IF EXISTS txs_5_asset_id_idx;
DROP INDEX IF EXISTS txs_5_height_idx;
DROP INDEX IF EXISTS txs_5_sender_idx;
DROP INDEX IF EXISTS txs_5_time_stamp_asc_id_asc_idx;
DROP INDEX IF EXISTS txs_5_time_stamp_desc_id_asc_idx;
DROP INDEX IF EXISTS txs_5_time_stamp_desc_id_desc_idx;
DROP INDEX IF EXISTS txs_5_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_6_asset_id_idx;
DROP INDEX IF EXISTS txs_6_height_idx;
DROP INDEX IF EXISTS txs_6_sender_idx;
DROP INDEX IF EXISTS txs_6_time_stamp_asc_id_asc_idx;
DROP INDEX IF EXISTS txs_6_time_stamp_desc_id_asc_idx;
DROP INDEX IF EXISTS txs_6_time_stamp_desc_id_desc_idx;
DROP INDEX IF EXISTS txs_6_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_7_amount_asset_price_asset_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_7_height_idx;
DROP INDEX IF EXISTS txs_7_price_asset_idx;
DROP INDEX IF EXISTS txs_7_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_7_time_stamp_asc_id_asc_idx;
DROP INDEX IF EXISTS txs_7_time_stamp_desc_id_desc_idx;
DROP INDEX IF EXISTS txs_7_order_ids_timestamp_id_idx;
DROP INDEX IF EXISTS txs_7_order_senders_timestamp_id_idx;
DROP INDEX IF EXISTS txs_7_amount_asset_price_asset_time_stamp_id_partial_idx;
DROP INDEX IF EXISTS txs_7_time_stamp_id_partial_idx;
DROP INDEX IF EXISTS txs_8_height_idx;
DROP INDEX IF EXISTS txs_8_recipient_idx;
DROP INDEX IF EXISTS txs_8_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_8_time_stamp_asc_id_asc_idx;
DROP INDEX IF EXISTS txs_8_time_stamp_desc_id_asc_idx;
DROP INDEX IF EXISTS txs_8_time_stamp_desc_id_desc_idx;
DROP INDEX IF EXISTS txs_9_height_idx;
DROP INDEX IF EXISTS txs_9_lease_id_idx;
DROP INDEX IF EXISTS txs_9_sender_idx;
DROP INDEX IF EXISTS txs_9_time_stamp_asc_id_asc_idx;
DROP INDEX IF EXISTS txs_9_time_stamp_desc_id_asc_idx;
DROP INDEX IF EXISTS txs_9_time_stamp_desc_id_desc_idx;
DROP INDEX IF EXISTS txs_9_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_10_alias_idx;
DROP INDEX IF EXISTS txs_10_height_idx;
DROP INDEX IF EXISTS txs_10_sender_idx;
DROP INDEX IF EXISTS txs_10_time_stamp_asc_id_asc_idx;
DROP INDEX IF EXISTS txs_10_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_11_asset_id_idx;
DROP INDEX IF EXISTS txs_11_height_idx;
DROP INDEX IF EXISTS txs_11_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_11_time_stamp_desc_id_desc_idx;
DROP INDEX IF EXISTS txs_11_transfers_recipient_index;
DROP INDEX IF EXISTS txs_12_data_data_key_idx;
DROP INDEX IF EXISTS txs_12_data_data_type_idx;
DROP INDEX IF EXISTS txs_12_data_value_binary_partial_idx;
DROP INDEX IF EXISTS txs_12_data_value_boolean_partial_idx;
DROP INDEX IF EXISTS txs_12_data_value_integer_partial_idx;
DROP INDEX IF EXISTS txs_12_data_value_string_partial_idx;
DROP INDEX IF EXISTS txs_12_height_idx;
DROP INDEX IF EXISTS txs_12_sender_idx;
DROP INDEX IF EXISTS txs_12_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_12_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_13_height_idx;
DROP INDEX IF EXISTS txs_13_sender_idx;
DROP INDEX IF EXISTS txs_13_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_13_md5_script_idx;
DROP INDEX IF EXISTS txs_13_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_14_height_idx;
DROP INDEX IF EXISTS txs_14_sender_idx;
DROP INDEX IF EXISTS txs_14_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_14_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_15_height_idx;
DROP INDEX IF EXISTS txs_15_sender_idx;
DROP INDEX IF EXISTS txs_15_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_15_md5_script_idx;
DROP INDEX IF EXISTS txs_15_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_16_args_arg_type_idx;
DROP INDEX IF EXISTS txs_16_args_arg_value_binary_partial_idx;
DROP INDEX IF EXISTS txs_16_args_arg_value_boolean_partial_idx;
DROP INDEX IF EXISTS txs_16_args_arg_value_integer_partial_idx;
DROP INDEX IF EXISTS txs_16_args_arg_value_string_partial_idx;
DROP INDEX IF EXISTS txs_16_height_idx;
DROP INDEX IF EXISTS txs_16_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_16_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_17_height_idx;
DROP INDEX IF EXISTS txs_17_sender_time_stamp_id_idx;
DROP INDEX IF EXISTS txs_17_asset_id_id_idx;
DROP INDEX IF EXISTS waves_data_height_idx;

DROP EXTENSION IF EXISTS btree_gin;