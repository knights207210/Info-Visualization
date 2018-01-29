import pandas as pd
import numpy as np
from numpy import array
import psycopg2
import math
import traceback
import matplotlib.pyplot as plt

try:
    conn = psycopg2.connect(database = 'postgres', user = 'postgres', host = 'localhost', port = '5432', password = '1234')

except psycopg2.Error as e:
    print("I am unable to connect to the database")
    print(e)
    print(e.pgcode)
    print(e.pgerror)
    print(traceback.format_exc())

cur = conn.cursor()

def draw_graph():
    """
    get all features
    """
    year = [1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017]
    count = []
    for i in year:
    	cur.execute("select count(DATE) from seattle_weather where DATE between '%d-01-01' and '%d-12-31' and RAIN = True "%(i,i))
    	a = cur.fetchall()
    	count.append(a[0][0])    
    plt.figure()
    plt.bar(year,count, color='b', label='count')  
        #plt.plot(fpr, tpr, color='darkorange',lw=3)
    plt.ylim(100,200)
    plt.xlabel('Year')
    plt.ylabel('Count')
    plt.title('The Number of Rainy Days in One Year for Past 20 Years')
    plt.legend(loc="upper right")
    plt.show()

if __name__ == "__main__":

    draw_graph()
