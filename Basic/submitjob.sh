rm gpuinfo.out
make
if [ -f bin/gpuinfo ]; then
	echo "Submitting job..."
	sbatch gpuinfo.sb
fi
while [ ! -f gpuinfo.out ]
do
	squeue -u parasher
	sleep 5
done
cat gpuinfo.out
make clean
