yum -q update | awk '/^(\w|-)+\.[a-zA-Z]+\s+\w+\.\w+\.\w+/ {print $1 "-" $3 "." $2}'
yum -q check-update | awk '/^(\w|-)+\.[a-zA-Z]+\s+\w+\.\w+\.\w+/ {print $1 "-" $2 "." $3}'
yum -q check-update | awk '{print $1 "-" $2}'
yum -q check-update | awk '{print $1 "-" $2 $3}'
sed -i 's/kernel-uek\.x86_64\.\(.*\)/kernel-uek.\1.x86_64/' <file_name>
sed -i 's/kernel-uek\.x86_64-\(.*\)/kernel-uek-\1.x86_64/' <file_name>
sed -E 's/(.*)(x86_64|noarch)-([^-]+)$/\1\3.\2/'
