#################################################################
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
#################################################################

FROM ubuntu:saucy
MAINTAINER Michael Orr <michael@cloudspace.com>

ADD config_files/sources.list /etc/apt/sources.list
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install supervisor openssh-server pwgen vim

# basic ssh setup
RUN mkdir -p /var/run/sshd
ADD config_files/ssh_config /etc/ssh/ssh_config
ADD config_files/sshd_config /etc/ssh/sshd_config
ADD config_files/supervisord-sshd.conf /etc/supervisor/conf.d/supervisord-sshd.conf

ADD bash_scripts/passes_requirements.sh /passes_requirements.sh
ADD bash_scripts/setup.sh /setup.sh
ADD bash_scripts/run.sh /run.sh

RUN chmod 755 /*.sh

EXPOSE 22

CMD ["/run.sh"]