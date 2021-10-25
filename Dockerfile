ADD file:6340c690b08865d7eb84a36050a0ab0e8effc2b010a4ccb20b810153a97a9228 in / 
CMD ["/bin/bash"]
MAINTAINER Matteo Capitanio <matteo.capitanio@gmail.com> 
ENV JAVA_VER=11
ENV JAVA_HOME=/opt/jdk-11/
/bin/sh -c yum update -y;     yum install -y wget unzip curl vim python-setuptools sudo;     easy_install supervisor
/bin/sh -c yum update -y;     yum install -y wget unzip curl vim python-setuptools sudo;     easy_install supervisor
/bin/sh -c cd /opt;     tar -xvf jdk.tar.gz;     rm jdk.tar.gz
/bin/sh -c cd /opt/jdk-$JAVA_VER;     alternatives --install /usr/bin/java java /opt/jdk-$JAVA_VER/bin/java 2
/bin/sh -c yum clean all
CMD ["/bin/bash"]
COPY dir:62dcf6dd46874d7d688e687c08948a9e543184893ce691c10330b2705b8d5ea5 in / 
ADD file:186f0c185f58352cd7cece3e0dd3a5ae0d9a776cdd85f4f564c7bdeebf870e75 in /snowflake-jdbc-3.12.2.jar 
ADD file:80742a45d44ab4c769c7a327950626c11738b54d5d593c3bf1c255e55b66d2c1 in /mysql-connector-java-8.0.19.jar 
ADD file:e0e2ac8885eb27cd81f25958b5d327b5cd088c095f5e51ec35dc7f24a966d0ac in /RedshiftJDBC41-no-awssdk-1.2.41.1065.jar 
/bin/sh -c echo "JAVA_OPTS=\"\$JAVA_OPTS \$ADD_JAVA_OPTS\"" >> /usr/local/tomcat/TalendDataCatalog/tomcat/bin/setenv.sh
/bin/sh -c sed -i -e "$ a echo \"applied JAVA_OPTS as \$JAVA_OPTS\"" /usr/local/tomcat/TalendDataCatalog/tomcat/bin/setenv.sh
/bin/sh -c chmod 777 /usr/local/tomcat/TalendDataCatalog/RestartServerApplication.sh
/bin/sh -c /usr/local/tomcat/TalendDataCatalog/Setup.sh --tomcat-port 8080 --tomcat-agent true --tomcat-service true --ssl false
ADD file:e3f77b9b8a0c2e333637e7e443b4582bd477c8f8078491b8faea6c5401eff1bb in /start_harvesting_agent.sh 
/bin/sh -c chmod +x /start_harvesting_agent.sh
ADD file:82e32c0cc6bf4e6a309b24238aea0fa82fd8433e7d25ded140d7c51c7d887e8b in /make_harvesting_logs_readable_on_console.sh 
/bin/sh -c chmod +x /make_harvesting_logs_readable_on_console.sh
ADD file:eb67f6eb1768ae58bd00a7b98f6629424ceab46db5e3486133f1e0535257e300 in /harvesting_agent_TCDC_release_notes.txt 
EXPOSE 8080
CMD ["/bin/sh" "-c" "/start_harvesting_agent.sh"]
