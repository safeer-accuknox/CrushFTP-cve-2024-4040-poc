FROM openjdk:24-slim
WORKDIR /var/opt
RUN apt-get update -y && apt-get -y install unzip wget
COPY CrushFTP.zip .
RUN unzip CrushFTP.zip
EXPOSE 21
EXPOSE 8080
EXPOSE 443
EXPOSE 2222
WORKDIR /var/opt/CrushFTP
RUN java -Xmx1024m -jar CrushFTP.jar -a "admin" "admin"
CMD java -Xmx1024m -jar CrushFTP.jar -d
# #CMD ["sleep", "infinity"]