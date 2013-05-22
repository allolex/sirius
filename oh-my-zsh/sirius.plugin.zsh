export SIRIUS=$HOME/.sirius
for p in $(find $SIRIUS/bashrc.d -name "*bash"); do
	source $p
done
