import numpy as np

def read_file_to_np_matrix(file_path):
    data_rows = []
    with open(file_path, 'r') as file:
        for line in file:
            if not line.startswith('#'):
                elements = line.split()[1:]  # Split the line into elements, ignore the first element (file name)
                row = [float(x) if x != '-' else np.nan for x in elements]  # Replace '-' with np.nan and convert to float
                data_rows.append(row)

    data_matrix = np.array(data_rows)
    data_matrix = np.nan_to_num(data_matrix)  # Replace nan with 0
    return data_matrix

# Usage
file_path = 'comparison_table_4'
matrix = read_file_to_np_matrix(file_path)
print(matrix)
