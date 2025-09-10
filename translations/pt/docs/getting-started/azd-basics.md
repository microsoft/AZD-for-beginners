<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:08:14+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "pt"
}
-->
# Noções Básicas do AZD - Compreender o Azure Developer CLI

## Introdução

Esta lição apresenta o Azure Developer CLI (azd), uma ferramenta poderosa de linha de comandos que acelera a sua jornada desde o desenvolvimento local até à implementação no Azure. Vai aprender os conceitos fundamentais, as principais funcionalidades e como o azd simplifica a implementação de aplicações nativas na cloud.

## Objetivos de Aprendizagem

No final desta lição, será capaz de:
- Compreender o que é o Azure Developer CLI e o seu principal propósito
- Aprender os conceitos principais de templates, ambientes e serviços
- Explorar funcionalidades-chave, incluindo desenvolvimento orientado por templates e Infraestrutura como Código
- Compreender a estrutura e o fluxo de trabalho de um projeto azd
- Estar preparado para instalar e configurar o azd no seu ambiente de desenvolvimento

## Resultados de Aprendizagem

Após concluir esta lição, será capaz de:
- Explicar o papel do azd nos fluxos de trabalho modernos de desenvolvimento na cloud
- Identificar os componentes da estrutura de um projeto azd
- Descrever como os templates, ambientes e serviços funcionam em conjunto
- Compreender os benefícios da Infraestrutura como Código com o azd
- Reconhecer diferentes comandos do azd e os seus propósitos

## O que é o Azure Developer CLI (azd)?

O Azure Developer CLI (azd) é uma ferramenta de linha de comandos projetada para acelerar a sua jornada desde o desenvolvimento local até à implementação no Azure. Simplifica o processo de criação, implementação e gestão de aplicações nativas na cloud no Azure.

## Conceitos Principais

### Templates
Os templates são a base do azd. Eles contêm:
- **Código da aplicação** - O seu código-fonte e dependências
- **Definições de infraestrutura** - Recursos do Azure definidos em Bicep ou Terraform
- **Ficheiros de configuração** - Definições e variáveis de ambiente
- **Scripts de implementação** - Fluxos de trabalho de implementação automatizados

### Ambientes
Os ambientes representam diferentes alvos de implementação:
- **Desenvolvimento** - Para testes e desenvolvimento
- **Staging** - Ambiente de pré-produção
- **Produção** - Ambiente de produção ao vivo

Cada ambiente mantém o seu próprio:
- Grupo de recursos do Azure
- Definições de configuração
- Estado de implementação

### Serviços
Os serviços são os blocos de construção da sua aplicação:
- **Frontend** - Aplicações web, SPAs
- **Backend** - APIs, microserviços
- **Base de Dados** - Soluções de armazenamento de dados
- **Armazenamento** - Armazenamento de ficheiros e blobs

## Funcionalidades-Chave

### 1. Desenvolvimento Orientado por Templates
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infraestrutura como Código
- **Bicep** - Linguagem específica de domínio do Azure
- **Terraform** - Ferramenta de infraestrutura multi-cloud
- **ARM Templates** - Templates do Azure Resource Manager

### 3. Fluxos de Trabalho Integrados
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Gestão de Ambientes
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Estrutura do Projeto

Uma estrutura típica de projeto azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Ficheiros de Configuração

### azure.yaml
O ficheiro principal de configuração do projeto:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Configuração específica do ambiente:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Fluxos de Trabalho Comuns

### Iniciar um Novo Projeto
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Ciclo de Desenvolvimento
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Compreender `azd down --force --purge`
O comando `azd down --force --purge` é uma forma poderosa de desmontar completamente o seu ambiente azd e todos os recursos associados. Aqui está uma explicação do que cada parâmetro faz:
```
--force
```
- Ignora os pedidos de confirmação.
- Útil para automação ou scripts onde a entrada manual não é viável.
- Garante que o processo de desmontagem prossegue sem interrupções, mesmo que a CLI detete inconsistências.

```
--purge
```
Elimina **todos os metadados associados**, incluindo:
Estado do ambiente  
Pasta local `.azure`  
Informações de implementação em cache  
Impede que o azd "lembre" implementações anteriores, o que pode causar problemas como grupos de recursos incompatíveis ou referências de registo obsoletas.

### Por que usar ambos?
Quando encontra problemas com `azd up` devido a estados persistentes ou implementações parciais, esta combinação garante um **novo começo**.

É especialmente útil após eliminações manuais de recursos no portal do Azure ou ao alternar entre templates, ambientes ou convenções de nomenclatura de grupos de recursos.

### Gerir Múltiplos Ambientes
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Comandos de Navegação

### Descoberta
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Gestão de Projetos
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitorização
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Boas Práticas

### 1. Use Nomes Significativos
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Aproveite os Templates
- Comece com templates existentes
- Personalize conforme as suas necessidades
- Crie templates reutilizáveis para a sua organização

### 3. Isolamento de Ambientes
- Use ambientes separados para dev/staging/prod
- Nunca implemente diretamente em produção a partir da máquina local
- Use pipelines CI/CD para implementações em produção

### 4. Gestão de Configuração
- Use variáveis de ambiente para dados sensíveis
- Mantenha a configuração sob controlo de versão
- Documente as definições específicas de cada ambiente

## Progressão de Aprendizagem

### Iniciante (Semana 1-2)
1. Instale o azd e autentique-se
2. Implemente um template simples
3. Compreenda a estrutura do projeto
4. Aprenda comandos básicos (up, down, deploy)

### Intermédio (Semana 3-4)
1. Personalize templates
2. Gere múltiplos ambientes
3. Compreenda o código de infraestrutura
4. Configure pipelines CI/CD

### Avançado (Semana 5+)
1. Crie templates personalizados
2. Padrões avançados de infraestrutura
3. Implementações multi-região
4. Configurações de nível empresarial

## Próximos Passos

- [Instalação e Configuração](installation.md) - Instale e configure o azd
- [O Seu Primeiro Projeto](first-project.md) - Tutorial prático
- [Guia de Configuração](configuration.md) - Opções avançadas de configuração

## Recursos Adicionais

- [Visão Geral do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galeria de Templates](https://azure.github.io/awesome-azd/)
- [Exemplos da Comunidade](https://github.com/Azure-Samples)

---

**Navegação**
- **Lição Anterior**: [README](../../README.md)
- **Próxima Lição**: [Instalação e Configuração](installation.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se uma tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.