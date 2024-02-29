FROM node:12.2.0-alpine ##download required things
WORKDIR app ##Create Directory 
COPY . . 
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]
