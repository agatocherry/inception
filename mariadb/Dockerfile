# MariaDB 10.3 with SSH
# Pull the mariadb latest image
FROM mariadb:latest
# List all the packages that we want to install
ENV PACKAGES openssh-server openssh-client
# Install Packages
RUN apt-get update && apt-get install -y $PACKAGES
# Allow SSH Root Login
RUN sed -i 's|^#PermitRootLogin.*|PermitRootLogin yes|g' /etc/ssh/sshd_config
# Configure root password
RUN echo "root:root123" | chpasswd

# FROM qui vous permet de définir l'image source ;
# RUN qui vous permet d’exécuter des commandes dans votre conteneur ;
# ADD qui vous permet d'ajouter des fichiers dans votre conteneur ;
# WORKDIR qui vous permet de définir votre répertoire de travail ;
# EXPOSE qui permet de définir les ports d'écoute par défaut ;
# VOLUME qui permet de définir les volumes utilisables ;
# CMD qui permet de définir la commande par défaut lors de l’exécution de vos conteneurs Docker.
