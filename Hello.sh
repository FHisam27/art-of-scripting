# hi
#fghjk
#gfxchvbjdscdhjs
#download fastq from sra
# create conda environment
conda create -n practice_2
# activate conda environment
conda activate practice_2
# install sra-tools
conda install -c bioconda sra-tools
# Install dependencies
conda install -c bioconda bwa samtools bcftools
# download a fastq file from sra
fastq-dump --split-files SRR390728
# download fasta from ncbi
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.38_GRCh38.p12/GCF_000001405.38_GRCh38.p12_genomic.fna.gz
# unzip the fasta file
gunzip GCF_000001405.38_GRCh38.p12_genomic.fna.gz
# index the fasta file
bwa index GCF_000001405.38_GRCh38.p12_genomic.fna
# align the fastq file to the fasta file
bwa mem GCF_000001405.38_GRCh38.p12_genomic.fna SRR390728_1.fastq SRR390728_2.fastq > SRR390728.sam
# convert sam to bam
samtools view -S -b SRR390728.sam > SRR390728.bam
# sort the bam file
samtools sort SRR390728.bam -o SRR390728.sorted.bam
# index the bam file
samtools index SRR390728.sorted.bam
# call variants
samtools mpileup -uf GCF_000001405.38_GRCh38.p12_genomic.fna SRR390728.sorted.bam | bcftools call -mv - > SRR390728.raw.vcf
# filter variants
bcftools filter -s LowQual -e '%QUAL<20 || DP>100' SRR390728.raw.vcf > SRR390728.flt.vcf
