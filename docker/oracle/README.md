# Imagem Docker PHP com Oracle

## 📋 Descrição
Imagem Docker customizada contendo PHP, Apache2 e conectores Oracle, proporcionando um ambiente de desenvolvimento completo para aplicações PHP que necessitam de integração com bancos de dados Oracle.

## 🚀 Características
- PHP 8.x
- Apache 2.4
- Conectores Oracle (Oracle Instant Client)
- Extensões PHP para Oracle (oci8)
- Configuração otimizada para desenvolvimento

## 📦 Pré-requisitos
- Docker instalado
- Git (para clonar o repositório)

## 🛠️ Como usar

### Construindo a imagem
```bash
docker build -t 172.17.141.121/php-apache-oracle:1.0.0 .
```

### Executando o container
```bash
docker run -d -p 80:80 -v $(pwd):/var/www/html 172.17.141.121/php-apache-oracle:1.0.0
```

