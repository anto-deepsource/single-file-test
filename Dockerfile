# Using latest tag instead of specific version
FROM ubuntu:latest

# Running as root user (no USER instruction)
# Hardcoded credentials
ENV DB_PASSWORD=admin123
ENV API_KEY=sk-1234567890abcdef

# Using ADD instead of COPY
ADD app.tar.gz /app/

# Installing packages without cleaning cache
RUN apt-get update && apt-get install -y \
    nginx \
    curl \
    wget

# Exposing unnecessary ports
EXPOSE 22
EXPOSE 3306

# Multiple RUN commands (inefficient layering)
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip

# Using shell form of ENTRYPOINT (prevents signal handling)
ENTRYPOINT /usr/bin/myapp

# Hardcoded secrets in build
ARG SECRET_TOKEN=hardcoded-secret-token

# Using curl with pipe to shell (security risk)
RUN curl https://example.com/install.sh | sh

# Missing health check
# Missing LABEL for metadata

# Copying entire context (might include secrets)
COPY . /app/

# Wide open permissions
RUN chmod 777 /app

# Not pinning package versions
RUN pip install flask requests

# Using deprecated MAINTAINER
MAINTAINER admin@example.com
