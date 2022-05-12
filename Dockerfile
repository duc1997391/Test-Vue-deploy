FROM node:lts-alpine as build-stage

# install simple http server for serving static content
# RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
# RUN yarn

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY ./dist ./dist

# build app for production with minification
# RUN yarn build

# EXPOSE 8080
# CMD [ "http-server", "dist" ]

FROM nginx:stable-alpine as production-stage
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /app
COPY --from=build-stage /app/dist /app
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]