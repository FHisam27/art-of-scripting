#Download file for the HW 2
wget http://data.biostarhandbook.com/data/SGD_features.tab
#count the number of lines in the file
wc -l SGD_features.tab
#lines that match the pattern gene
grep -c gene SGD_features.tab
#line that match the patter ORF
grep -c ORF SGD_features.tab
#lines that match the pattern ORF in second column
cut -f2 SGD_features.tab | grep -c ORF
#the word in second column which appears for 50 times
cut -f2 SGD_features.tab | sort | uniq -c | grep -w 50
#The word Z3_region appears how many times in the second column
cut -f2 SGD_features.tab | grep -c Z3_region
#read this file to help get additional information
wget http://data.biostarhandbook.com/data/SGD_features.README
#features with no strand information
cut -f3 SGD_features.tab | grep -c -
#lines with number of features with W in it
cut -f3 SGD_features.tab | grep -c W
# count the number of features on forward strand
cut -f3 SGD_features.tab | grep -c +
# count the number of strands with no strand information
cut -f3 SGD_features.tab | grep -c -
#How many features have no strand information listed
cut -f3 SGD_features.tab | grep -c -
#How many features are on the reverse strand
cut -f3 SGD_features.tab | grep -c -
grep -c W SGD_features.tab
#How many features are on the forward strand
cut -f12 SGD_features.tab | grep W | wc -l
# How many features are on the reverse strand
cut -f12 SGD_features.tab | grep ^$ | wc -l