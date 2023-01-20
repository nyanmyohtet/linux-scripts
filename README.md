# linux-scripts
Linux Scripts

## Update and Upgrade

```bash
wget https://github.com/nyanmyohtet/linux-scripts/raw/master/update_and_upgrade.sh \
&& chmod +x update_and_upgrade.sh \
&& ./update_and_upgrade.sh -u
```

## Install [Timeshift](https://teejeetech.com/timeshift/)

```sh
sudo apt install timeshift
```

- [Install JDK 11 and Maven](./install_jdk_and_maven.sh)

## After installing MySQL 8.0

After installing MySQL 8.0, there are several steps you can take to set it up and configure it for use. Here are some common tasks you may want to perform:

Set the root password: By default, the root user does not have a password set. You can set a password for the root user by running the command mysql_secure_installation.

Create new users: You may want to create new users with specific privileges for different applications or users. You can create new users by running the command CREATE USER 'username'@'host' IDENTIFIED BY 'password';

Create new databases: You may want to create new databases for different applications or projects. You can create new databases by running the command CREATE DATABASE db_name;

Grant privileges: You can grant specific privileges to a user on a specific database by running the command GRANT privileges ON database_name.table_name TO 'username'@'host';

Configure the my.cnf file: The my.cnf file contains the configuration settings for MySQL. You can edit this file to change settings such as the data directory, the memory usage, and the number of connections allowed.

Enable remote access: By default, MySQL only accepts connections from the localhost. If you want to connect to the MySQL server from a remote machine, you will need to enable remote access by editing the my.cnf file and adding bind-address = 0.0.0.0 in the [mysqld] section.

Backup and restore: It's important to take regular backups of your MySQL databases and you can use mysqldump and mysql command for this purpose.

Please note that this is not an exhaustive list and you may need to perform additional setup tasks depending on your specific use case.
