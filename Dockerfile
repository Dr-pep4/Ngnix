# 공식 Ubuntu 베이스 이미지 사용
FROM ubuntu:22.04

# Nginx 설치
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# 기본 Nginx 설정 제거
RUN rm /etc/nginx/sites-enabled/default

# Nginx 포트 노출
EXPOSE 80

# Nginx를 슈퍼 유저 권한으로 실행
CMD ["nginx", "-g", "daemon off;"]
