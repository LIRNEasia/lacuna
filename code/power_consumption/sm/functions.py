class functions:

    #function to handle inconsistent column names in smart meter data files
    def clean_column_names(col):
        
        col = col.lower()
        col = col.replace(' ', '')
        col = col.replace('.', '')
        col = col.replace('_', '')
    
        if col == 'instpowerfactor':
            col = 'powerfactor'

        return col


    #function to calculate number of households in a smart-metered dataset, and collect all the Customer reference numbers
    def households_count(root_folder):
        Number_of_households = 0
        cusref = []
        for folder_name in range(1, 11):
            folder_path = os.path.join(root_folder, str(folder_name))
    
            if os.path.exists(folder_path):
                files = os.listdir(folder_path)
        
                for file_name in files:
                    if file_name.endswith('.csv'):
                        file_path = os.path.join(folder_path, file_name)
                
                        df = pd.read_csv(file_path, low_memory=False)
                
                        households = df['CUSTOMER_REF']
                        unique_count = households.nunique()
                        cusref.extend(df['CUSTOMER_REF'].tolist())
                        Number_of_households = Number_of_households + unique_count

            else:
                print(f"Folder '{folder_name}' does not exist.")

        return Number_of_households, cusref





