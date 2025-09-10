<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:09:18+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "br"
}
-->
# Noções Básicas do AZD - Entendendo o Azure Developer CLI

## Introdução

Esta lição apresenta o Azure Developer CLI (azd), uma poderosa ferramenta de linha de comando que acelera sua jornada do desenvolvimento local para a implantação no Azure. Você aprenderá os conceitos fundamentais, os principais recursos e entenderá como o azd simplifica a implantação de aplicações nativas na nuvem.

## Objetivos de Aprendizagem

Ao final desta lição, você será capaz de:
- Entender o que é o Azure Developer CLI e seu principal propósito
- Aprender os conceitos fundamentais de templates, ambientes e serviços
- Explorar os principais recursos, incluindo desenvolvimento orientado por templates e Infraestrutura como Código
- Compreender a estrutura e o fluxo de trabalho de projetos azd
- Estar preparado para instalar e configurar o azd para seu ambiente de desenvolvimento

## Resultados de Aprendizagem

Após concluir esta lição, você será capaz de:
- Explicar o papel do azd nos fluxos de trabalho modernos de desenvolvimento na nuvem
- Identificar os componentes da estrutura de um projeto azd
- Descrever como templates, ambientes e serviços funcionam juntos
- Entender os benefícios da Infraestrutura como Código com azd
- Reconhecer diferentes comandos do azd e seus propósitos

## O que é o Azure Developer CLI (azd)?

Azure Developer CLI (azd) é uma ferramenta de linha de comando projetada para acelerar sua jornada do desenvolvimento local para a implantação no Azure. Ela simplifica o processo de construção, implantação e gerenciamento de aplicações nativas na nuvem no Azure.

## Conceitos Fundamentais

### Templates
Templates são a base do azd. Eles contêm:
- **Código da aplicação** - Seu código-fonte e dependências
- **Definições de infraestrutura** - Recursos do Azure definidos em Bicep ou Terraform
- **Arquivos de configuração** - Configurações e variáveis de ambiente
- **Scripts de implantação** - Fluxos de trabalho automatizados de implantação

### Ambientes
Ambientes representam diferentes alvos de implantação:
- **Desenvolvimento** - Para testes e desenvolvimento
- **Staging** - Ambiente de pré-produção
- **Produção** - Ambiente de produção ao vivo

Cada ambiente mantém seu próprio:
- Grupo de recursos do Azure
- Configurações
- Estado de implantação

### Serviços
Serviços são os blocos de construção da sua aplicação:
- **Frontend** - Aplicações web, SPAs
- **Backend** - APIs, microsserviços
- **Banco de dados** - Soluções de armazenamento de dados
- **Armazenamento** - Armazenamento de arquivos e blobs

## Principais Recursos

### 1. Desenvolvimento Orientado por Templates
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infraestrutura como Código
- **Bicep** - Linguagem específica de domínio do Azure
- **Terraform** - Ferramenta de infraestrutura multi-nuvem
- **ARM Templates** - Templates do Azure Resource Manager

### 3. Fluxos de Trabalho Integrados
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Gerenciamento de Ambientes
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Estrutura de Projetos

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

## 🔧 Arquivos de Configuração

### azure.yaml
O principal arquivo de configuração do projeto:
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
Configuração específica de ambiente:
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

### Iniciando um Novo Projeto
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

## Entendendo `azd down --force --purge`
O comando `azd down --force --purge` é uma maneira poderosa de desmontar completamente seu ambiente azd e todos os recursos associados. Aqui está um detalhamento do que cada flag faz:
```
--force
```
- Ignora prompts de confirmação.
- Útil para automação ou scripts onde a entrada manual não é viável.
- Garante que a desmontagem prossiga sem interrupções, mesmo se o CLI detectar inconsistências.

```
--purge
```
Exclui **todos os metadados associados**, incluindo:
Estado do ambiente  
Pasta local `.azure`  
Informações de implantação em cache  
Impede que o azd "lembre" implantações anteriores, o que pode causar problemas como grupos de recursos incompatíveis ou referências de registro obsoletas.

### Por que usar ambos?
Quando você encontra problemas com `azd up` devido a estado residual ou implantações parciais, essa combinação garante um **novo começo**.

É especialmente útil após exclusões manuais de recursos no portal do Azure ou ao alternar templates, ambientes ou convenções de nomenclatura de grupos de recursos.

### Gerenciando Múltiplos Ambientes
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

### Gerenciamento de Projetos
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitoramento
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Melhores Práticas

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
- Personalize conforme suas necessidades
- Crie templates reutilizáveis para sua organização

### 3. Isolamento de Ambientes
- Use ambientes separados para dev/staging/prod
- Nunca implante diretamente na produção a partir da máquina local
- Use pipelines de CI/CD para implantações em produção

### 4. Gerenciamento de Configuração
- Use variáveis de ambiente para dados sensíveis
- Mantenha configurações no controle de versão
- Documente configurações específicas de ambiente

## Progressão de Aprendizado

### Iniciante (Semana 1-2)
1. Instale o azd e autentique-se
2. Implemente um template simples
3. Entenda a estrutura do projeto
4. Aprenda comandos básicos (up, down, deploy)

### Intermediário (Semana 3-4)
1. Personalize templates
2. Gerencie múltiplos ambientes
3. Entenda o código de infraestrutura
4. Configure pipelines de CI/CD

### Avançado (Semana 5+)
1. Crie templates personalizados
2. Padrões avançados de infraestrutura
3. Implantações em múltiplas regiões
4. Configurações de nível empresarial

## Próximos Passos

- [Instalação e Configuração](installation.md) - Instale e configure o azd
- [Seu Primeiro Projeto](first-project.md) - Tutorial prático
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
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.