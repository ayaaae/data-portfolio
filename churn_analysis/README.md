# Customer Churn Prediction

## Project Overview

This project focuses on predicting **customer churn** using machine learning techniques.  
The goal is to identify customers who are likely to leave a telecom service so that businesses can take proactive retention actions.

---

## Objectives

- Analyze customer behavior and detect churn patterns  
- Build a predictive model using Logistic Regression  
- Evaluate model performance using classification metrics  
- Extract actionable business insights  

---

## Dataset

- Source: Kaggle – Telco Customer Churn Dataset  

### Features include:
- Customer demographics (gender, senior citizen, dependents)
- Account information (tenure, contract type, payment method)
- Services subscribed (internet, phone, security, etc.)
- Financial data (monthly charges, total charges)

---

## Tools & Technologies

- Python  
- Pandas, NumPy  
- Matplotlib, Seaborn  
- Scikit-learn  
- Jupyter Notebook  

---

## Project Structure
customer-churn/
│
├── data/
│ ├── churn.csv
│ ├── cleaned_dataset.csv
│ ├── final_ready_dataset.csv
│
├── notebooks/
│ ├── 01_eda.ipynb
│ ├── 02_preprocessing.ipynb
│ ├── 03_modeling.ipynb
│
├── models/
│ └── logistic_model.pkl
│
├── README.md
└── requirements.txt

---

## Exploratory Data Analysis (EDA)

Key analyses performed:

- Churn distribution analysis  
- Contract type vs churn  
- Tenure group vs churn  
- Monthly charges vs churn  
- Number of services vs churn  

### Key Insights:
- Customers with **month-to-month contracts** churn the most  
- Higher monthly charges increase churn probability  
- Longer tenure significantly reduces churn risk  

---

## Data Preprocessing

- Removed irrelevant columns (`customerID`)  
- Handled missing values in `TotalCharges`  
- Feature engineering:
  - `tenure_group`
  - `num_services`
  - `avg_monthly_spend`
  - `high_value`
- Encoded categorical variables using Label Encoding  

---

## Model: Logistic Regression

- Train-test split: 80/20  
- Model: Logistic Regression  
- Evaluation metrics:
  - Accuracy  
  - Confusion Matrix  
  - Precision, Recall, F1-score  
  - ROC-AUC  

---

## Results

### Model Performance

- **Accuracy:** 81.05%  
- **ROC-AUC:** 0.8609  
- **Precision (Churn class):** 0.67  
- **Recall (Churn class):** 0.55  
- **F1-score (Churn class):** 0.61  

---

### Confusion Matrix

- True Negatives (Stayed): 935  
- False Positives: 101  
- False Negatives: 166  
- True Positives (Churn): 207  

---

## Key Business Insights

### Factors increasing churn risk:
- Paperless Billing  
- High monthly charges (High Value customers)  
- Senior Citizens  
- Multiple Lines  

### Factors reducing churn:
- Long-term Contracts (1–2 years)  
- Online Security & Tech Support services  
- Phone Service subscription  
- Having Dependents  

---

## 💾 Model Saving

```python
import joblib

joblib.dump(model, "models/logistic_model.pkl")
```markdown

## How to Run the Project
Clone the repository
Install dependencies:
pip install -r requirements.txt
Run notebooks in order:
01_eda.ipynb
02_preprocessing.ipynb
03_modeling.ipynb

## Future Improvements
Use One-Hot Encoding instead of Label Encoding
Try advanced models (Random Forest, XGBoost)
Perform hyperparameter tuning
Deploy the model using a web app (Streamlit)

```markdown
## Author
Aya Rahmouny
