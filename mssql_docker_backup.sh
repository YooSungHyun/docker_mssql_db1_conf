container_id=$(docker ps | grep db1 | awk '{print $1}')
container_name=$(docker ps | grep db1 | awk '{print $2}')
date_now=$(date +%Y%m%d)

echo ${container_id}
echo ${container_name}
echo 'Start!!!'
echo 'Old_Backup_Delete!!!'

find /home/docker-container/mssql/docker_image_backup/ -name '*.tar' -mtime +7 -exec rm -f {} \;

echo 'New_Backup_Create!!!'

docker commit -p ${container_id} ${container_name}
docker save -o /home/docker-container/mssql/docker_image_backup/mssql_db1_backup_${date_now}.tar ${container_name}