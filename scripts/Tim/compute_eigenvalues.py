import sys
import numpy as np

def main(matrix_file):
    with open(matrix_file, 'r') as file:
        lines = file.readlines()

    num_cols = len(lines[1].split()) - 1  # Subtract 1 for the row label
    matrix = np.zeros((num_cols, num_cols))
    print(matrix)
    for i, line in enumerate(lines[3:]):  # Skip the first two header lines
        values = line.split('\t')[1:]  # Skip the row label
        for j, val in enumerate(values):
            if val != '-':
                matrix[i, j] = float(val)
    eigenvalues = np.linalg.eigvals(matrix)
    print(eigenvalues)
    return max(abs(eigenvalues))

if __name__ == "__main__":
    main(sys.argv[1])
