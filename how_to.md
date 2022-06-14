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

## Conexión de dos clientes en simultáneo

3. Conectar ambos clientes con el mismo comando 

```bash
ffplay rtmp://$SERVER_IP/app/mystream 
```
 
## Ver grabación 
4. Reproducir la grabación que se almacenó en la siguiente carpeta:
```bash
cd srs/trunk/objs/nginx/html/rec/app
ffplay file.mp4
```
## Stream de video 

5. Publicar un video 
```bash
ffmpeg -stream_loop -1 -re -i ./demo.flv -c copy -f flv -y rtmp://$SERVER_IP/app/mystream
```

6. Consumir el video desde el cliente
```bash
ffplay rtmp://$SERVER_IP/app/mystream 
```

## Ver Métricas 

7. Entrar a la página de métricas 
```bash
http://$SERVER_IP:8080
```
Probar: 
- Tirar el Server (se ve que está bufferizado)
- Cerrar el stream de cada client 


## Wireshark 
Ya se capturaron los paquetes y se puede ver:
- Intercambio RTMP ( Handshake, publishStream )
- Codecs ( H.264 para video, HE-AAC para audio ) 

Ir a la sección STATISTICS -> CONVERSATIONS -> IPV4 O TCP -> BIT PER SECOND. Se puede ver:
- Ancho de banda Total 
- Ancho de banda por Cliente  