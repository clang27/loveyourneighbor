FROM node:12 as build
WORKDIR /usr/src/app
ENV PATH /usr/src/app/node_modules/.bin:$PATH
COPY ./package*.json ./
RUN npm install --silent
RUN npm install react-scripts react-scripts@3.4.1 -g --silent
COPY . .
RUN npm run build

FROM httpd:2.4
COPY --from=build /usr/src/app/build /usr/local/apache2/htdocs/
COPY ./config/httpd.conf /usr/local/apache2/conf/httpd.conf
EXPOSE 80
