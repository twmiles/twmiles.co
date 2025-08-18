FROM nginx:alpine
COPY . /usr/share/nginx/html

# Simple Nginx container example (optional)
# docker run -d -p 80:80 --name devtest --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html,readonly nginx:alpine


