docker run --detach --restart=on-failure --name=spawning-pool --env=MYSQL_ROOT_PASSWORD=Kerrigan -v hatchery --env=MYSQL_DATABASE=zerglings mysql
