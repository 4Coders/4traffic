find /home/gnunes/Workspace/4traffic/misc/csv -name \*.csv -type f | \
    (while read file; do
        iconv -f ISO-8859-1 -t UTF-8 "$file" > "${file%.csv}-utf8.csv";
    done);
