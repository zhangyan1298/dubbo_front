FROM registry-internal.cn-shanghai.aliyuncs.com/czy/node:cac6fe3d
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
  
  
