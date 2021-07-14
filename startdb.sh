


y=$(eval "ls /var/lib/postgresql/12/main | wc -l")
echo "$y"

if [ "$y" -eq 0 ]; then
    echo "y came"
    cp -R -n /var/lib/postgresql/12/main_bkp/* /var/lib/postgresql/12/main
    chown -R postgres:postgres /var/lib/postgresql/12/main
    
fi

chmod -R 700 /var/lib/postgresql/12/main

z=$(eval "ls /var/lib/pgadmin | wc -l")
echo "$z"

if [ "$z" -eq 0 ]; then
    echo "z came"
    cp -R -n /var/lib/pgadmin_bkp/* /var/lib/pgadmin
    chown -R www-data:www-data /var/lib/pgadmin
fi

service postgresql start
service apache2 start
