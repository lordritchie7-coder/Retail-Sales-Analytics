import pandas as pd

# Load dataset
df = pd.read_csv("superstore.csv", encoding="latin1")

# Convert date columns
df["Order Date"] = pd.to_datetime(df["Order Date"])
df["Ship Date"] = pd.to_datetime(df["Ship Date"])

# Create delivery days
df["Delivery Days"] = (df["Ship Date"] - df["Order Date"]).dt.days

# Create profit margin
df["Profit Margin"] = (df["Profit"] / df["Sales"]) * 100

# Sales and profit summary
print("=== SALES & PROFIT SUMMARY ===")
print(f"Total Sales: ${df['Sales'].sum():,.2f}")
print(f"Total Profit: ${df['Profit'].sum():,.2f}")
print(f"Total Quantity: {df['Quantity'].sum():,}")
print(f"Average Discount: {df['Discount'].mean() * 100:.2f}%")
print(f"Average Delivery Days: {df['Delivery Days'].mean():.2f}")

# Regional performance
print("\n=== SALES & PROFIT BY REGION ===")
region_summary = (
    df.groupby("Region")[["Sales", "Profit"]]
    .sum()
    .sort_values("Sales", ascending=False)
)

print(region_summary)

# Category performance
print("\n=== SALES & PROFIT BY CATEGORY ===")
category_summary = (
    df.groupby("Category")[["Sales", "Profit"]]
    .sum()
    .sort_values("Profit", ascending=False)
)

print(category_summary)

# Sub-category profitability
print("\n=== SUB-CATEGORY PROFITABILITY ===")
subcategory_summary = (
    df.groupby("Sub-Category")[["Sales", "Profit"]]
    .sum()
    .sort_values("Profit", ascending=False)
)

print(subcategory_summary)

# Save analysis results
region_summary.to_csv("region_analysis.csv")
category_summary.to_csv("category_analysis.csv")
subcategory_summary.to_csv("subcategory_analysis.csv")

print("\n=== ANALYSIS FILES CREATED ===")
print("region_analysis.csv")
print("category_analysis.csv")
print("subcategory_analysis.csv")