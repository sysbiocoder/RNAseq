#FASTQC
$input = "Your directory containing input files
for inp in $input/*_1.clean.fq.gz; do

dir=$(dirname  $inp)
echo $dir
infile=$(basename $inp "_1.clean.fq.gz")
echo $infile
fastqc $dir/${infile}_1.clean.fq.gz $dir/${infile}_2.clean.fq.gz -o $output
done
