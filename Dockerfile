FROM nginx:latest
WORKDIR /var/www
# COPY --from=builder /app/build /var/www/
COPY . .
RUN mv -v build/* . && mv nginx.conf /etc/nginx/nginx.conf
# RUN npm i -g http-server && find / -name http-server
# CMD /usr/local/lib/node_modules/http-server/bin/http-server --name icon-server  /app/build -p 8080 --proxy http://localhost:8080?
EXPOSE 8080
ENTRYPOINT ["nginx","-g","daemon off;"]
