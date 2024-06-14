def clean_column_names(col):
    original_col = col
    col = col.lower()
    
    col = col.replace(' ', '')
    col = col.replace('.', '')
    col = col.replace('_', '')
    
    if col == 'instpowerfactor':
        col = 'powerfactor'
    elif col == 'powerfactor1':
        col = 'powerfactor'
    
    return col


data = '/lirneasia/data/lacuna/raw/Leco_data/Second 500'
data.columns = [clean_column_names(col) for col in data.columns]
columns = data.columns
columns


root_folder = '/lirneasia/data/lacuna/raw/Leco_data/Second 500'

for folder_name in range(1, 11):
    folder_path = os.path.join(root_folder, str(folder_name))
    
    if os.path.exists(folder_path):
        files = os.listdir(folder_path)
        
        for file_name in files:
            if file_name.endswith('.csv'):
                file_path = os.path.join(folder_path, file_name)
                
                df = pd.read_csv(file_path, low_memory=False)

                df.columns = [clean_column_names(col) for col in df.columns]

                df = df[columns]
                
                df.to_csv(f'/lirneasia/data/lacuna/processed/sm_april_2024_dump/{folder_name}{file_name}.csv', index=False)
        
    else:
        print('file path doesnt exist')