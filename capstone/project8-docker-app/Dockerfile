FROM nginx:alpine

LABEL maintainer="Amrish Yadav" \
      project="Capstone Project 8 - Local Docker App"

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy custom web application
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget -q --spider http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
