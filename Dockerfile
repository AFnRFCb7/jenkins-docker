FROM taf7lwappqystqp4u7wjsqkdc7dquw/systemd_rawhide
RUN dnf install --assumeyes initscripts
RUN dnf install --assumeyes jenkins && dnf clean all && systemctl enable jenkins
EXPOSE 8080
CMD ["/usr/sbin/init"]