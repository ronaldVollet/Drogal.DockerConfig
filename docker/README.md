# 🚀 Scripts de Automação com Docker

Este repositório contém scripts de automação que **facilitam a criação e o deploy de imagens Docker para aplicações React**, com foco em uso no **Portainer**.

Os scripts padronizam o fluxo de **build**, **versionamento** e **publicação**, reduzindo erros manuais e acelerando o processo de implantação.

---

## 📦 Requisitos

* Docker instalado e em execução
* Projeto React com build gerado na pasta `dist`

> ⚠️ **Importante:**
> Todos os scripts trabalham **exclusivamente com o conteúdo da pasta `dist`**.

---

## ⚙️ Configuração Inicial

Antes de utilizar os scripts, **é obrigatório ajustar o nome do projeto** nos arquivos:

* `docker/deploy.sh`
* `docker/server.sh`

Isso garante que o nome da imagem seja gerado corretamente.

---

## 📜 Scripts no `package.json`

Adicione os scripts abaixo ao seu `package.json`:

```json
{
  "scripts": {
    "deploy": "bash docker/deploy.sh",
    "server": "bash docker/server.sh"
  }
}
```

---

## 🛠 Comandos Disponíveis

### 🚀 `yarn deploy`

Utilizado para publicar a aplicação em ambientes remotos.

**O que faz:**

* Executa o build do projeto
* Gera a imagem Docker
* Aplica as tags necessárias
* Realiza o `push` para o registro de imagens

**Ambientes:**

* Staging
* Produção

---

### 🧪 `yarn server`

Utilizado para desenvolvimento e validação local.

**O que faz:**

* Gera a imagem Docker localmente
* Inicializa o container para testes imediatos

**Ambientes:**

* Desenvolvimento
* Testes locais

---

## 💡 Dicas Rápidas

| Comando       | Ambiente  | Descrição                            |
| ------------- | --------- | ------------------------------------ |
| `yarn server` | 🧪 Local  | Sobe o container para testes rápidos |
| `yarn deploy` | 🚀 Remoto | Publica a versão estável             |