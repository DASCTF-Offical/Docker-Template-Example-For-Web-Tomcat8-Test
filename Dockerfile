FROM ghcr.io/dasctf-offical/docker-template-for-web-tomcat8:main

COPY src /usr/local/tomcat/webapps/ROOT

# 内部编译构建以及安装依赖和权限调整等操作请务必在此完成！
RUN mkdir -p /usr/local/tomcat/conf/Catalina/localhost && \
    chown -R app:app /usr/local/tomcat/conf/Catalina/localhost && \
    chmod -R 755 /usr/local/tomcat/webapps/ROOT

# 如需自定义启动命令请覆盖 APP_CMD 环境变量
ENV APP_CMD="export CATALINA_HOME=/usr/local/tomcat && export PATH=/usr/local/tomcat/bin:/usr/local/openjdk-8/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin && JAVA_HOME=/usr/local/openjdk-8 && catalina.sh run"

# 如需自定义 FLAG 请将自定义脚本覆盖到 /flag.sh
# COPY files/flag.sh /flag.sh

# 如有上传文件等操作请务必将权限设置正确！
# RUN chown app:app /app/uploads/

# 如需静态 FLAG 请在此利用环境变量声明
# ENV DASFLAG=DASCTF{flag_test}

# 请声明对外暴露端口
EXPOSE 8080