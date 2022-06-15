# How To 

0. Descargar el Server SRS como lo explica en el README.md 

1. Levantar el server 
```bash
 cd srs/trunk
 ./objs/srs -c conf/custom.conf
```

2. Abrir Wireshark para capturar los paquetes en la interfaz correspondiente

```bash
 sudo wireshark
```

3. Abrir OBS y comenzar el Streaming

## Conexión de dos clientes en simultáneo

4. Conectar ambos clientes con el mismo comando 

```bash
ffplay rtmp://$SERVER_IP/app/mystream 
```
 
## Ver grabación 
5. Reproducir la grabación que se almacenó en la siguiente carpeta:
```bash
cd srs/trunk/objs/nginx/html/rec/app
ffplay file.flv
```

## Ver Métricas 

6. Entrar a la página de métricas 
```bash
http://$SERVER_IP:8080
```
Probar: 
- Tirar el Server (se ve que está bufferizado)
- Cerrar el stream de cada client 

## Wireshark 
7. Ya se capturaron los paquetes y se puede ver:
- Intercambio RTMP ( Handshake, publishStream )
- Codecs ( H.264 para video, HE-AAC para audio ) 

Ir a la sección STATISTICS -> CONVERSATIONS -> IPV4 O TCP -> BIT PER SECOND. Se puede ver:
- Ancho de banda Total 
- Ancho de banda por Cliente 

## Codecs  

8. Publicar un video 
```bash
ffmpeg -stream_loop -1 -re -i ./demo.flv -c copy -f flv -y rtmp://$SERVER_IP/app/mystream
```

9. Consumir el video desde el cliente
```bash
ffplay rtmp://$SERVER_IP/app/mystream 
```

10. Ver en Wireshark que se usa H.263 para Video y MP3 para Audio

## HLS 

11. Con la extensión de Chrome "Play HLS m3u8" instalada acceder a: 
```bash
http://$SERVER_IP:8080/app/mystream.m3u8
```
12. En Wireshark se pueden ver los paquetes HTTP que usa el protocolo