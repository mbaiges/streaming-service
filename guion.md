# Guión 

## Conexión de dos clientes en simultáneo

0. cd srs/trunk

1. ./objs/srs -c conf/custom.conf

2. ffplay rtmp://$SERVER_IP/app/mystream 

3. ffplay rtmp://$SERVER_IP/app/mystream

## Ver grabación 

0. cd srs/trunk/objs/nginx/html/rec/app

1. ffplay file.mp4

## Stream de video 

0. ffmpeg -stream_loop -1 -re -i ./demo.flv -c copy -f flv -y rtmp://$SERVER_IP/app/mystream

## Ver Métricas 
- Tirar el Server (se ve que está bufferizado)
- Cerrar el stream de cada client 
- Ancho de banda Total 
- Ancho de banda por cliente  

## Wireshark 
- Intercambio RTMP ( Handshake, publishStream )
- Codecs ( H.264 para video, HE-AAC para audio ) 