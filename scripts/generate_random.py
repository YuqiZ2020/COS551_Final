from random import choice

# Function to generate a random nucleotide sequence of a given length
def generate_random_nucleotides(length):
    nucleotides = ['A', 'T', 'C', 'G']  # The four nucleotides
    return ''.join(choice(nucleotides) for _ in range(length))

# Generate a sequence of 100 nucleotides
nucleotide_sequence = generate_random_nucleotides(24893)

# Write the sequence to a FASTA file
fasta_content = f">Random_Sequence\n{nucleotide_sequence}"
fasta_filename = "../data/random_nucleotides.fasta"
with open(fasta_filename, "w") as file:
    file.write(fasta_content)
