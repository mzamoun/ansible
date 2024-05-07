usage(){
	echo "
	$0 playbook [options]
	ex:
	$0 date.yml
	$0 date.yml -vvv
	"
	exit 1
}
if (($#<0)); then usage; fi 
playbook=$1
shift
options=$*
is_inv_exist=0
for x in $options; do 
	[ "$x" == "-i" ] && {
		is_inv_exist=1
		break;
	}
done

opt_inv=""
if ((is_inv_exist==0)); then opt_inv="-i inventoty.txt"; fi 

ansible-playbook $opt_inv $playbook $*
