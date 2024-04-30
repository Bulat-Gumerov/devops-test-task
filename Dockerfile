# Start from the official golang 1.16 image
FROM golang:1.16.15-alpine3.15 AS build
# Set the working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the source code into the container
COPY . .

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# Start a new stage from the scratch image
FROM scratch

# Copy the binary from the previous build stage
COPY --from=build /app/app /app

# Run the app binary
CMD ["/app"]

# Set Redis address
ENV REDIS_ADDR=""

# Expose port 8080 to the outside world
EXPOSE 8080
