#!/usr/bin/env python
# coding: utf-8



# In[6]:


import warnings
warnings.filterwarnings('ignore')

import pandas as pd
from statsmodels.graphics.tsaplots import plot_acf
from statsmodels.graphics.tsaplots import plot_pacf
from statsmodels.tsa.arima_model import ARIMA
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')
import os
import sys



# In[7]:


mem = pd.read_csv('/root/kalyan-thesis/jupyter/csv/mem.csv', parse_dates = [0], index_col = [0])


# In[8]:


mem 


# In[9]:


#mem.plot()


# In[10]:


#plot_pacf(mem, lags=3)


# In[11]:


#plot_acf(mem, lags=3)


# In[12]:


mem.describe()  


# In[21]:

mem_mod = ARIMA(mem, order=(1,1,0)) 


# In[22]:


mem_mod_fit = mem_mod.fit()  


# In[23]:


mem_mod_fit.aic  


# In[24]:


mem_forecast = mem_mod_fit.forecast(steps = 6)[0]


# In[25]:


#print(mem_forecast) 
os.system("echo Memory ARIMA Prediction Values are :%s"%mem_forecast)



# In[14]:


os.system("echo %s >> /root/kalyan-thesis/jupyter/output/mem_pred_output"%mem_forecast)

os.system("bash /root/kalyan-thesis/jupyter/output/cloudwatchmem.sh")

# In[ ]:



#os.system("rm /root/kalyan-thesis/metrics/*")
#os.system("rm /root/kalyan-thesis/jupyter/csv/*")

