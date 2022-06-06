# Introdução ao monitoramento em Servidores Linux

### monitoring and alert systems

<https://youtu.be/GylDJm8Fhxc>

- Ferramentas
    - Zabbix
    - Prometheus
    - Grafana - gráficos
    - Netdata

```bash
git clone https://github.com/4linux/hands-on.git
cd hands-on
vagrant status
vagrant up
vagrant ssh <virtualMachine>

# aplicativos interessantes de monitoramento
# da linha de comando
nmon
htop
sar
ss
tune2fs
iptraf
tcpdump
iotop
iftop
```

 #### Prometheus
 
1:02:00

script de instalação do prometheus no centos:
<https://github.com/4linux/hands-on/blob/main/scripts/install_prometheus.sh>

instalação do node exporter:
<https://github.com/4linux/hands-on/blob/main/scripts/install_node_exporter.sh>

#### Grafana

1:24:00 - instalação do grafana

Grafana serve para montar os gráficos pegando dados de outras fontes. Neste hands-on o data source é o Prometheus.


#### Zabbix

1:37:15 - instalação do Zabbix no debian10

2:04:00 - usar o Zabbix como data source para o grafana


#### netdata