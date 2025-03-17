import pandas as pd
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, classification_report
import matplotlib.pyplot as plt
import seaborn as sns

# Load the Iris dataset
iris = load_iris()
X = iris.data
y = iris.target
feature_names = iris.feature_names
target_names = iris.target_names

# Convert to pandas DataFrame for easier handling
df = pd.DataFrame(X, columns=feature_names)
df['target'] = y
df['species'] = [target_names[i] for i in y]

# Exploratory Data Analysis (EDA) - Optional but good for understanding the data
print("Dataset Overview:")
print(df.head())
print("\\nDescriptive Statistics:")
print(df.describe())
print("\\nClass Distribution:")
print(df['species'].value_counts())

# Visualize the data (optional)
sns.pairplot(df, hue='species')
plt.suptitle("Pairplot of Iris Features", y=1.02)
plt.show()

# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Train a Logistic Regression model
model = LogisticRegression(max_iter=1000)  # You can try other models like DecisionTreeClassifier or RandomForestClassifier
model.fit(X_train, y_train)

# Make predictions on the test set
y_pred = model.predict(X_test)

# Evaluate the model
accuracy = accuracy_score(y_test, y_pred)
print(f"\\nAccuracy: {accuracy:.4f}")

print("\\nClassification Report:")
print(classification_report(y_test, y_pred, target_names=target_names))

# Explain the most important features
# For Logistic Regression, we can look at the coefficients
print("\\nFeature Importance (Logistic Regression Coefficients):")
for feature, coef in zip(feature_names, model.coef_[0]):
    print(f"{feature}: {coef:.4f}")

# The coefficients indicate the impact of each feature on the log-odds of the positive class.
# Larger absolute values indicate stronger influence.

# You can adapt this part for other models like Decision Trees or Random Forests
# by using model.feature_importances_

# Example for Decision Tree:
# from sklearn.tree import DecisionTreeClassifier
# model = DecisionTreeClassifier()
# model.fit(X_train, y_train)
# print("\\nFeature Importance (Decision Tree):")
# for feature, importance in zip(feature_names, model.feature_importances_):
#     print(f"{feature}: {importance:.4f}")