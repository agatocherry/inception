FROM	alpine:3.14

RUN		apk update

RUN		apk add --no-cache --quiet --update nginx
RUN		apk add --no-cache --quiet --update openssl

RUN		mkdir -p /etc/nginx/ssl

RUN 	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/agcolas.42.fr.crt \	
	-keyout /etc/nginx/ssl/agcolas.42.fr.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=agcolas.42.fr/UID=agcolas"

RUN 	mkdir -p /var/run/nginx

COPY	config/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE	443

CMD	[ "nginx", "-g", "daemon off;" ]
