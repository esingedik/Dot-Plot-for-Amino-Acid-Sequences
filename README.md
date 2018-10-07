# Dot Plot for Amino Acid Sequences

A Perl program to find dot plot for given two amino acid sequences.

The program controls the noise level in the dot plot.

Sequences are read from a file. Each nucleotide is in separate rows in the file. Nucleotides should be written only in characters without hyphen and gaps.

One of basic techniques for determining the alignment between two sequences is by using a visual alignment known as dot plots.

The dot plotting method addresses string alignment by assigning query sequences to different axes of a two-dimensional matrix. The matrix is scored by placing dots at junctions of columns and rows. Rows of the matrix are characters of the first sequence, columns of the matrix are characters of the second sequence.

A dot is placed at an inersection if the pairing of a column and a row member produces a score that exceeds a cutoff value. 

Interpretation of a scored matrix is made visually, and is based on the understanding that a sequence that is plotted against itself (100% similarity) will produce a straight diagonal line when plotted. 

To filter out random matches, sliding windows are used and percentage of bases matching in the window is set as threshold.

A dot is printed only if a minimal number of matches occur.
