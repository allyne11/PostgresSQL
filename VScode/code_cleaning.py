import csv

# Define file paths
input_file = r"C:\Users\aidan\OneDrive\Desktop\Starter Code\Starter_Code\data\employees.csv"
output_file = r"C:\Users\aidan\OneDrive\Desktop\Starter Code\Starter_Code\data\cleaned_employees.csv"

# Open the input and output CSV files
with open(input_file, mode="r", newline="", encoding="utf-8") as infile, \
     open(output_file, mode="w", newline="", encoding="utf-8") as outfile:
    
    reader = csv.DictReader(infile)  # Read as a dictionary
    fieldnames = [col for col in reader.fieldnames if col != "emp_title_id"]  # Remove the column
    
    writer = csv.DictWriter(outfile, fieldnames=fieldnames)  
    writer.writeheader()  # Write the header without the removed column
    
    for row in reader:
        del row["emp_title_id"]  # Remove the column from each row
        writer.writerow(row)  # Write the modified row

print(f"Cleaned CSV saved as: {output_file}")