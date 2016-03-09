FROM taf7lwappqystqp4u7wjsqkdc7dquw/systemd_rawhide
RUN dnf install --assumeyes npm nodejs
RUN dnf install --assumeyes jenkins && dnf clean all && systemctl enable jenkins
EXPOSE 8080
CMD ["/usr/sbin/init"]
COPY src/package.json /src/package.json
RUN cd /src; npm install
COPY src/server.express.js /src
EXPOSE 3000
CMD ["node", "/src/server.express.js"]