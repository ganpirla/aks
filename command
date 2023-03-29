yum -q update | awk '/^(\w|-)+\.[a-zA-Z]+\s+\w+\.\w+\.\w+/ {print $1 "-" $3 "." $2}'
yum -q check-update | awk '/^(\w|-)+\.[a-zA-Z]+\s+\w+\.\w+\.\w+/ {print $1 "-" $2 "." $3}'
