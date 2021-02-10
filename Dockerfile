# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ncatrien <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/09 09:27:11 by ncatrien          #+#    #+#              #
#    Updated: 2021/02/10 17:11:23 by ncatrien         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

ENV INDEX=off

# # # #
COPY ./srcs/.vimrc /root
COPY ./srcs/.bashrc /root
# # # #

COPY ./srcs/setup.sh /root
COPY ./srcs/nginx_host_conf /root
COPY ./srcs/index.html /root
COPY ./srcs/config.inc.php /root
COPY ./srcs/wp-config.php /root

EXPOSE 80 443

CMD ["tail", "-f", "/dev/null"]
#ENTRYPOINT ["bash", "/root/setup.sh"]
