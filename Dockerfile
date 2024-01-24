# Use a suitable base image for x86_64
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from your local machine to the container
COPY securing-web/build/libs/*.jar app.jar

# Expose the port that your Spring Boot application will listen on (if applicable)
# Replace 8080 with the port number your Spring Boot app is configured to use
EXPOSE 8080

# Specify the command to run your Spring Boot application
CMD ["java", "-jar", "app.jar"]

# Set metadata labels
LABEL maintainer="Your Name <your.email@example.com>"
LABEL description="Your application description"
LABEL version="1.0"



#docker build --no-cache -t my-spring-boot-app-image:0.1 .   
#docker run -p 8080:8080 my-spring-boot-app-image:0.1
#docker buildx create --use
#docker buildx build --platform linux/arm64 -t my-spring-boot-app-image-arm:0.1 -f Dockerfile.arm . --load
#docker run --platform linux/arm64 -p 8080:8080 -it --rm my-spring-boot-app-image-arm:0.1
#docker buildx inspect multiarch --bootstrap
#docker buildx create --name multiarch --platform linux/amd64,linux/arm64 \
#  --driver-opt network=host --buildkitd-flags '--allow-insecure-entitlement network.host'
#ap-northeast-2211125543833.dkr.ecr.ap-northeast-2.amazonaws.com/haai-test-repository
#  aws ecr get-login-password --region ap-northeast-2 --profile haai-infra-shared | docker login --username AWS --password-stdin 211125543833.dkr.ecr.ap-northeast-2.amazonaws.com
#
#  docker buildx build --push --builder multiarch --platform linux/amd64,linux/arm64 -t 211125543833.dkr.ecr.ap-northeast-2.amazonaws.com/haai-test-repository .
# aws ecr describe-images --repository-name haai-test-repository --profile haai-infra-shared
# docker manifest inspect 211125543833.dkr.ecr.ap-northeast-2.amazonaws.com/haai-test-repository
# https://www.amarjanica.com/build-multi-arch-docker-images-with-buildx-and-ecr