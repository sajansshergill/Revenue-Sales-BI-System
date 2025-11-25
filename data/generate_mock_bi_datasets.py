import pandas as pd
import os

os.makedirs("data", exist_ok=True)

# -----------------------------
# 1. customers.csv
# -----------------------------
customers = pd.DataFrame([
    ["C001","2023-01-15","Software","SMB","R01"],
    ["C002","2023-02-10","Finance","Mid","R02"],
    ["C003","2023-02-22","Healthcare","Enterprise","R03"],
    ["C004","2023-03-01","Retail","SMB","R04"],
    ["C005","2023-03-14","Software","Mid","R02"],
    ["C006","2023-03-20","Education","SMB","R01"],
    ["C007","2023-04-02","Finance","Enterprise","R03"],
    ["C008","2023-04-11","Healthcare","Mid","R04"],
    ["C009","2023-04-19","Retail","SMB","R01"],
    ["C010","2023-05-03","Software","Enterprise","R02"]
], columns=["customer_id","signup_date","industry","company_size","sales_rep_id"])

customers.to_csv("data/customers.csv", index=False)



# -----------------------------
# 2. subscriptions.csv
# -----------------------------
subscriptions = pd.DataFrame([
    ["S001","C001","2023-01-15",None,"Basic",50],
    ["S002","C002","2023-02-10",None,"Pro",120],
    ["S003","C003","2023-02-22",None,"Enterprise",500],
    ["S004","C004","2023-03-01","2023-06-01","Basic",50],
    ["S005","C005","2023-03-14",None,"Pro",120],
    ["S006","C006","2023-03-20","2023-09-30","Basic",50],
    ["S007","C007","2023-04-02",None,"Enterprise",500],
    ["S008","C008","2023-04-11",None,"Pro",120],
    ["S009","C009","2023-04-19",None,"Basic",50],
    ["S010","C010","2023-05-03",None,"Enterprise",500]
], columns=["subscription_id","customer_id","start_date","end_date","plan","mrr"])

subscriptions.to_csv("data/subscriptions.csv", index=False)



# -----------------------------
# 3. revenue_daily.csv (May 1–5 sample)
# -----------------------------
rows = []
dates = ["2023-05-01","2023-05-02","2023-05-03"]
active_customers = {
    "C001":50, "C002":120, "C003":500, "C005":120,
    "C007":500, "C008":120, "C009":50, "C010":500
}

for d in dates:
    for cust, revenue in active_customers.items():
        rows.append([d, cust, revenue])

revenue_daily = pd.DataFrame(rows, columns=["date","customer_id","revenue"])
revenue_daily.to_csv("data/revenue_daily.csv", index=False)



# -----------------------------
# 4. sales_pipeline.csv
# -----------------------------
sales_pipeline = pd.DataFrame([
    ["OP001","C001","Closed Won",1500,"2023-01-01","2023-01-15","R01"],
    ["OP002","C002","Closed Won",3600,"2023-01-20","2023-02-10","R02"],
    ["OP003","C003","Closed Won",15000,"2023-02-01","2023-02-22","R03"],
    ["OP004","C004","Closed Lost",1200,"2023-02-15","2023-03-01","R04"],
    ["OP005","C005","Closed Won",3600,"2023-02-20","2023-03-14","R02"],
    ["OP006","C006","Closed Lost",1200,"2023-03-05","2023-03-20","R01"],
    ["OP007","C007","Closed Won",15000,"2023-03-10","2023-04-02","R03"],
    ["OP008","C008","Negotiation",3600,"2023-03-18",None,"R04"],
    ["OP009","C009","Prospect",1200,"2023-04-01",None,"R01"],
    ["OP010","C010","Closed Won",15000,"2023-04-10","2023-05-03","R02"]
], columns=["opportunity_id","customer_id","stage","amount","created_at","closed_at","sales_rep_id"])

sales_pipeline.to_csv("data/sales_pipeline.csv", index=False)



# -----------------------------
# 5. sales_team.csv
# -----------------------------
sales_team = pd.DataFrame([
    ["R01","Alice","North"],
    ["R02","Bob","West"],
    ["R03","Charlie","East"],
    ["R04","Diana","South"]
], columns=["sales_rep_id","rep_name","region"])

sales_team.to_csv("data/sales_team.csv", index=False)




print("✅ All datasets created inside /data folder!")
