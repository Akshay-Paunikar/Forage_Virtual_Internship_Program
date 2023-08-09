import os
import numpy as np
import pandas as pd
from datetime import datetime
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score, adjusted_rand_score

def load_data(
    path1:str="Cognizant\\Task 3 - Model Building and Interpretation\\sales.csv", 
    path2:str="Cognizant\\Task 3 - Model Building and Interpretation\\sensor_stock_levels.csv", 
    path3:str="Cognizant\\Task 3 - Model Building and Interpretation\\sensor_storage_temperature.csv"):
    sales_data = pd.read_csv(path1, index_col=0)
    stock_level_data = pd.read_csv(path2, index_col=0)
    storage_temp_data = pd.read_csv(path3, index_col=0)
    
    return sales_data, stock_level_data, storage_temp_data


def convert_to_datetime(data: pd.DataFrame = None, column: str = None):
  dummy = data.copy()
  dummy[column] = pd.to_datetime(dummy[column], format='%Y-%m-%d %H:%M:%S')
  return dummy

def convert_timestamp_to_hourly(data: pd.DataFrame = None, column: str = None):
  dummy = data.copy()
  new_ts = dummy[column].tolist()
  new_ts = [i.strftime('%Y-%m-%d %H:00:00') for i in new_ts]
  new_ts = [datetime.strptime(i, '%Y-%m-%d %H:00:00') for i in new_ts]
  dummy[column] = new_ts
  return dummy

def agg_data(data, group_columns, agg_column, aggregation):
    dataset = data.groupby(group_columns).agg({agg_column:aggregation}).reset_index()
    return dataset
  
def split_timestamp(data, column):
  data['date'] = data[column].dt.day
  data['day'] = data[column].dt.day_of_week
  data['hour'] = data[column].dt.hour
  
  data = data.drop([column], axis=1)
  return data

def train_test_data(data, column):
  X = data.drop([column], axis=1)
  y = data[column]
  
  # train test split
  X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=111)
  return X_train, X_test, y_train, y_test

def evaluate_model(true, predicted):
    MeanSquaredError = mean_squared_error(true, predicted)
    MeanAbsoluteError = mean_absolute_error(true, predicted)
    return MeanSquaredError, MeanAbsoluteError
  
  
def model_training(X_train, X_test, y_train, y_test):
  # first scale the data
  SS = StandardScaler()
  
  X_train_scaled = SS.fit_transform(X_train)
  X_test_scaled = SS.transform(X_test)
  
  # Random Forest Regressor
  rf = RandomForestRegressor()
  
  # fit model on training data
  rf.fit(X_train_scaled, y_train)
  
  # predict on test data
  y_pred = rf.predict(X_test_scaled)
  
  # check model performance
  mean_error, absolute_error = evaluate_model(true=y_test, predicted=y_pred)
  
  return mean_error, absolute_error
  
  
  