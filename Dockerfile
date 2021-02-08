# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ncatrien <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 13:13:51 by ncatrien          #+#    #+#              #
#    Updated: 2021/02/08 15:13:12 by ncatrien         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

COPY ./srcs/ .

# Both command in same RUN statement: "cache busting" (avoid pb with cache)
# -qq: suppress output of the command
RUN apt-get -qq update && apt-get -qq install -y nginx

RUN apt-get -qq install -y mariadb-server mariadb-client

# install PHP
RUN apt-get -qq install -y php-fpm php-mysql php-cli
# modules for phpmyadmin
RUN apt-get -qq install -y php-json php-mbstring

EXPOSE 80 443


#CMD ["bash", "install_script.sh"]
CMD ["nginx", "-g", "daemon off;"]
