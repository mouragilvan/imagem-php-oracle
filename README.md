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

### Clonando o repositório
```bash
git clone https://github.com/mouragilvan/imagem-php-oracle.git
cd imagem-php-oracle
```

### Construindo a imagem
```bash
docker build -t php-oracle .
```

### Executando o container
```bash
docker run -d -p 80:80 -v $(pwd):/var/www/html php-oracle
```

## ⚙️ Configuração
O arquivo de configuração principal do PHP está localizado em `/usr/local/etc/php/php.ini`. Você pode personalizar as configurações editando este arquivo conforme necessário.

## 🤝 Contribuindo
1. Faça um Fork do projeto
2. Crie sua Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a Branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Licença
Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 📫 Contato
Gilvan Moura - [@mouragilvan](https://mouragilvan.github.io)
E-mail: gilvan.moura@outlook.com.br

Link do projeto: [https://github.com/mouragilvan/imagem-php-oracle](https://github.com/mouragilvan/imagem-php-oracle)