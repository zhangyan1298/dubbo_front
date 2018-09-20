FROM maven:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-ops.git /source
WORKDIR /source/dubbo-admin-frontend
# install dependencies
RUN npm install

# serve with hot reload at localhost:8080
RUN npm run dev

# build for production with minification
RUN npm run build

# build for production and view the bundle analyzer report
npm run build --report
  
  
FROM tomcat:8.0-jre8
RUN rm -rf /usr/local/tomcat/webapps/
COPY --from=0 /source/dubbo-admin-backend/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
