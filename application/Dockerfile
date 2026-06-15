FROM python:3.11-alpine
RUN apk add --no-cache iproute2 iptables tcpdump curl
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY app.py /app/app.py
WORKDIR /app
