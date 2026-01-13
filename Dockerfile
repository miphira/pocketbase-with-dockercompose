# Sử dụng Alpine Linux cho nhẹ
FROM alpine:latest

# Khai báo phiên bản PocketBase muốn cài (Check github để lấy bản mới nhất)
ARG PB_VERSION=0.35.1

# Cài các gói cần thiết: unzip, ca-certificates (để gọi https)
RUN apk add --no-cache \
    unzip \
    ca-certificates \
    wget

# Tải và giải nén PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

# Mở port 8090
EXPOSE 8090

# Chạy PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090"]
