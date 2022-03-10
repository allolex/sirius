for p in $(find $MAILCONF/accounts -mindepth 1 -maxdepth 1 -type l -o -type d); do
	account=`basename ${p}`
	alias_cmd="alias mutt-${account}=\"MUTT_INSTANCE=${account} mutt\""
	eval $alias_cmd
done
