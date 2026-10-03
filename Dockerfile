FROM ubuntu:latest
RUN echo "Hello from my first Docker image" > /message.txt
CMD ["cat", "/message.txt"]
