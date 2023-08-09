# import required libraries
import os
import numpy as np
import pandas as pd
from datetime import datetime
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score, adjusted_rand_score
from modules import load_data, convert_to_datetime, convert_timestamp_to_hourly, agg_data

# load the dataset

sales_data, stock_level_data, storage_temp_data = load_data()

# convert timestamp column to datetime

sales_data = convert_to_datetime(data=sales_data, column='timestamp')
stock_level_data = convert_to_datetime(data=stock_level_data, column='timestamp')
storage_temp_data = convert_to_datetime(data=storage_temp_data, column='timestamp')

# convert timestamp to hourly

sales_data = convert_timestamp_to_hourly(data=sales_data, column='timestamp')
stock_level_data = convert_timestamp_to_hourly(data=stock_level_data, column='timestamp')
storage_temp_data = convert_timestamp_to_hourly(data=storage_temp_data, column='timestamp')

# aggregate datasets
sales_agg = agg_data(data=sales_data, group_columns=['timestamp', 'product_id'], agg_column='quantity', aggregation='sum')
stock_agg = agg_data(data=stock_level_data, group_columns=['timestamp', 'product_id'], agg_column='estimated_stock_pct', aggregation='mean')
temp_agg = agg_data(data=storage_temp_data, group_columns=['timestamp'], agg_column='temperature', aggregation='mean')


# let's merge our data
merged_data = stock_agg.merge(right=sales_agg, how='left', on=['timestamp', 'product_id'])
merged_data = merged_data.merge(right=temp_agg, how='left', on=['timestamp'])

# fill null values
merged_data['quantity'] = merged_data['quantity'].fillna(0)

# combine more features
category_data = sales_data[['product_id','category', 'customer_type', 'payment_type']]
category_data = category_data.drop_duplicates()

numerical_data = sales_data[['product_id', 'unit_price']]
numerical_data = numerical_data.drop_duplicates()

merged_data = merged_data.merge(right=category_data, how='left', on=['product_id'])
merged_data = merged_data.merge(right=numerical_data, how='left', on=['product_id'])
print(merged_data.head())




