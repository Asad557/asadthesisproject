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


cpu = pd.read_csv('/root/kalyan-thesis/jupyter/csv/cpu.csv', parse_dates = [0], index_col = [0])


# In[8]:


cpu 


# In[9]:


#cpu.plot()


# In[10]:


#plot_pacf(cpu, lags=3)


# In[11]:


#plot_acf(cpu, lags=3)


# In[12]:


cpu.describe()  


# In[21]:

cpu_mod = ARIMA(cpu, order=(1,1,0)) 


# In[22]:


cpu_mod_fit = cpu_mod.fit()  


# In[23]:


cpu_mod_fit.aic  


# In[24]:


cpu_forecast = cpu_mod_fit.forecast(steps = 6)[0]


# In[25]:


#print(cpu_forecast) 
os.system("echo CPU ARIMA Prediction Values are :%s"%cpu_forecast)



# In[14]:


os.system("echo %s >> /root/kalyan-thesis/jupyter/output/cpu_pred_output"%cpu_forecast)

os.system("bash /root/kalyan-thesis/jupyter/output/cloudwatchcpu.sh")
# In[ ]:



#os.system("rm /root/kalyan-thesis/metrics/*")
#os.system("rm /root/kalyan-thesis/jupyter/csv/*")

