# importing dependencies

import numpy as np
import pandas as pd
from matplotlib import pyplot as plt

from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
% matplotlib
inline

mnist_dataset = pd.read_csv("mnist.csv")

# viewing column heads
mnist_dataset.head()


# extracting data from the dataset on viewing them up close

a = mnist_dataset.iloc[3, 1:].values

# to able to viwe it,, reshaping the extracted data into a reasonable size
a = a.reshape(28, 28).astype('uint8')
plt.imshow(a)

# separate the label values cz we only need pixel values

df_x = mnist_dataset.iloc[:, 1:]
df_y = mnist_dataset.iloc[:, 0]

# creating test & train sizes/batches
x_train, x_test, y_train, y_test = train_test_split(df_x, df_y, test_size=0.2, random_state=4)

# check data
x_train.head()



y_train.head()



# calling rf:random forest classifier
rf = RandomForestClassifier(n_estimators=100)

# fit the model
rf.fit(x_train, y_train)

RandomForestClassifier(bootstrap=True, ccp_alpha=0.0, class_weight=None,
                       criterion='gini', max_depth=None, max_features='auto',
                       max_leaf_nodes=None, max_samples=None,
                       min_impurity_decrease=0.0, min_impurity_split=None,
                       min_samples_leaf=1, min_samples_split=2,
                       min_weight_fraction_leaf=0.0, n_estimators=100,
                       n_jobs=None, oob_score=False, random_state=None,
                       verbose=0, warm_start=False)

# prediction on test data
pred = rf.predict(x_test)

# check prediction accuracy
s = y_test.values

# calculate no. of corrected predicted values
count = 0
for i in range(len(pred)):
    if pred[i] == s[i]:
        count = count + 1

        # accuracy value
11625 / 12000

0.96875