FROM		ubuntu:16.04
MAINTAINER	technopreneural@yahoo.com

# Install package(s) 
RUN		apt-get update \
		&& apt-get install -yq --no-install-recommends \
			apt-utils \
		&& mkdir /nonexistent \
		&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
			mysql-server \

# Delete downloaded data afterwards to reduce image footprint
		&& rm -rf /var/lib/apt/lists/*

# Create volume for data
# NOTE: use "docker run -v <folder_path>:<volume>..." to bind volume to host folder
VOLUME		["/var/lib/mysql/","/var/log/mysql/"]

# Expose port 3306 (MySQL) to other containers
# NOTE: use "docker run -p 3306:3306..." to map port to host
EXPOSE  	3306
