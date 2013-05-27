for p in $(find $MAILCONF/accounts -mindepth 1 -maxdepth 1 -type l -o -type d); do
	account=`basename ${p}`
	aliased="mutt-${account}=MUTT_INSTANCE=${account} mutt"
	alias $aliased
done
