# Guia de Configuração

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 3 - Configuração & Autenticação
- **⬅️ Anterior**: [Seu Primeiro Projeto](first-project.md)
- **➡️ Próximo**: [Guia de Deploy](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Próximo Capítulo**: [Capítulo 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introdução

Este guia abrangente cobre todos os aspectos de configurar o Azure Developer CLI para fluxos de trabalho de desenvolvimento e implantação ideais. Você aprenderá sobre a hierarquia de configuração, gerenciamento de ambientes, métodos de autenticação e padrões avançados de configuração que possibilitam implantações no Azure de forma eficiente e segura.

## Objetivos de Aprendizagem

Ao final desta lição, você irá:
- Dominar a hierarquia de configuração do azd e entender como as configurações são priorizadas
- Configurar efetivamente configurações globais e específicas do projeto
- Gerenciar múltiplos ambientes com configurações diferentes
- Implementar padrões seguros de autenticação e autorização
- Entender padrões avançados de configuração para cenários complexos

## Resultados de Aprendizagem

Após completar esta lição, você será capaz de:
- Configurar o azd para fluxos de trabalho de desenvolvimento ideais
- Configurar e gerenciar múltiplos ambientes de implantação
- Implementar práticas seguras de gerenciamento de configuração
- Solucionar problemas relacionados à configuração
- Customizar o comportamento do azd para requisitos organizacionais específicos

Este guia abrangente cobre todos os aspectos de configurar o Azure Developer CLI para fluxos de trabalho de desenvolvimento e implantação ideais.

## Entendendo Agentes de IA em um Projeto azd

Se você é novo em agentes de IA, aqui está uma maneira simples de pensá-los dentro do universo azd.

### O que é um Agente?

Um agente é um pedaço de software que pode receber uma solicitação, raciocinar sobre ela e executar ações — frequentemente chamando um modelo de IA, consultando dados ou invocando outros serviços. Em um projeto azd, um agente é apenas outro **serviço** ao lado do seu frontend web ou backend de API.

### Como os Agentes se Encaixam na Estrutura do Projeto azd

Um projeto azd é composto por três camadas: **infraestrutura**, **código** e **configuração**. Agentes se conectam a essas camadas da mesma forma que qualquer outro serviço:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisions a web app and database | Provisions an AI model endpoint, search index, or agent host |
| **Code** (`src/`) | Contains your frontend and API source code | Contains your agent logic and prompt definitions |
| **Configuration** (`azure.yaml`) | Lists your services and their hosting targets | Lists your agent as a service, pointing to its code and host |

### O Papel de `azure.yaml`

Você não precisa memorizar a sintaxe agora. Conceitualmente, `azure.yaml` é o arquivo onde você diz ao azd: *"Aqui estão os serviços que compõem minha aplicação, e aqui está onde encontrar o código deles."*

Quando seu projeto inclui um agente de IA, `azure.yaml` simplesmente lista esse agente como um dos serviços. O azd então sabe provisionar a infraestrutura correta (como um endpoint do Microsoft Foundry Models ou um Container App para hospedar o agente) e implantar o código do agente — da mesma forma que faria para um web app ou API.

Isso significa que não há nada fundamentalmente novo para aprender. Se você entende como o azd gerencia um serviço web, você já entende como ele gerencia um agente.

## Hierarquia de Configuração

o azd usa um sistema hierárquico de configuração:
1. **Flags de linha de comando** (maior prioridade)
2. **Variáveis de ambiente**
3. **Configuração local do projeto** (`.azd/config.json`)
4. **Configuração global do usuário** (`~/.azd/config.json`)
5. **Valores padrão** (menor prioridade)

## Configuração Global

### Definindo Padrões Globais
```bash
# Definir assinatura padrão
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Definir localização padrão
azd config set defaults.location "eastus2"

# Definir convenção padrão de nomenclatura para grupos de recursos
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Exibir toda a configuração global
azd config show

# Remover uma configuração
azd config unset defaults.location
```

### Configurações Globais Comuns
```bash
# Preferências de desenvolvimento
azd config set alpha.enable true                    # Ativar recursos alfa
azd config set telemetry.enabled false             # Desativar telemetria
azd config set output.format json                  # Definir formato de saída

# Configurações de segurança
azd config set auth.useAzureCliCredential true     # Usar Azure CLI para autenticação
azd config set tls.insecure false                  # Forçar verificação TLS

# Ajuste de desempenho
azd config set provision.parallelism 5             # Criação paralela de recursos
azd config set deploy.timeout 30m                  # Tempo limite de implantação
```

## 🏗️ Configuração do Projeto

### Estrutura do azure.yaml
O arquivo `azure.yaml` é o coração do seu projeto azd:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### Opções de Configuração de Serviço

#### Tipos de Host
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Configurações Específicas por Linguagem
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Gerenciamento de Ambientes

### Criando Ambientes
```bash
# Criar um novo ambiente
azd env new development

# Criar com localização específica
azd env new staging --location "westus2"

# Criar a partir de um modelo
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configuração do Ambiente
Cada ambiente tem sua própria configuração em `.azure/<env-name>/config.json`:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Variáveis de Ambiente
```bash
# Definir variáveis específicas do ambiente
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Visualizar variáveis de ambiente
azd env get-values

# Saída esperada:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remover variável de ambiente
azd env unset DEBUG

# Verificar remoção
azd env get-values | grep DEBUG
# (não deve retornar nada)
```

### Templates de Ambiente
Crie `.azure/env.template` para uma configuração consistente de ambientes:
```bash
# Variáveis obrigatórias
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Configurações do aplicativo
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Configurações de desenvolvimento opcionais
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Configuração de Autenticação

### Integração com Azure CLI
```bash
# Use credenciais do Azure CLI (padrão)
azd config set auth.useAzureCliCredential true

# Fazer login com locatário específico
az login --tenant <tenant-id>

# Definir assinatura padrão
az account set --subscription <subscription-id>
```

### Autenticação com Service Principal
Para pipelines de CI/CD:
```bash
# Defina variáveis de ambiente
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ou configure diretamente
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Para ambientes hospedados no Azure:
```bash
# Habilitar autenticação de identidade gerenciada
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Configuração de Infraestrutura

### Parâmetros do Bicep
Configure parâmetros de infraestrutura em `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Configuração do Terraform
Para projetos Terraform, configure em `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Configuração de Deploy

### Configuração de Build
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Configuração do Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Exemplo de `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Configuração Avançada

### Nomeação Personalizada de Recursos
```bash
# Definir convenções de nomenclatura
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Configuração de Rede
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Configuração de Monitoramento
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Configurações Específicas por Ambiente

### Ambiente de Desenvolvimento
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Ambiente de Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Ambiente de Produção
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validação de Configuração

### Validar Configuração
```bash
# Verifique a sintaxe da configuração
azd config validate

# Teste as variáveis de ambiente
azd env get-values

# Valide a infraestrutura
azd provision --dry-run
```

### Scripts de Configuração
Crie scripts de validação em `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Verificar as variáveis de ambiente obrigatórias
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validar a sintaxe do azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Melhores Práticas

### 1. Use Variáveis de Ambiente
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organize Arquivos de Configuração
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Considerações sobre Controle de Versão
```bash
# .gitignore
.azure/*/config.json         # Configurações de ambiente (contêm IDs de recursos)
.azure/*/.env               # Variáveis de ambiente (podem conter segredos)
.env                        # Arquivo de ambiente local
```

### 4. Documentação da Configuração
Documente sua configuração em `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Exercícios Práticos

### Exercício 1: Configuração Multiambiente (15 minutos)

**Objetivo**: Criar e configurar três ambientes com configurações diferentes

```bash
# Criar ambiente de desenvolvimento
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Criar ambiente de homologação
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Criar ambiente de produção
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verificar cada ambiente
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Critérios de Sucesso:**
- [ ] Três ambientes criados com sucesso
- [ ] Cada ambiente tem configuração única
- [ ] É possível alternar entre ambientes sem erros
- [ ] `azd env list` mostra todos os três ambientes

### Exercício 2: Gerenciamento de Segredos (10 minutos)

**Objetivo**: Praticar configuração segura com dados sensíveis

```bash
# Definir segredos (não exibidos na saída)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Definir configuração não secreta
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Ver ambiente (os segredos devem ser ocultados)
azd env get-values

# Verificar se os segredos estão armazenados
azd env get DB_PASSWORD  # Deve mostrar o valor real
```

**Critérios de Sucesso:**
- [ ] Segredos armazenados sem serem exibidos no terminal
- [ ] `azd env get-values` mostra segredos redigidos
- [ ] `azd env get <SECRET_NAME>` individual recupera o valor real

## Próximos Passos

- [Seu Primeiro Projeto](first-project.md) - Aplicar a configuração na prática
- [Guia de Deploy](../chapter-04-infrastructure/deployment-guide.md) - Usar a configuração para implantação
- [Provisionamento de Recursos](../chapter-04-infrastructure/provisioning.md) - Configurações prontas para produção

## Referências

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 3 - Configuração & Autenticação
- **⬅️ Anterior**: [Seu Primeiro Projeto](first-project.md)
- **➡️ Próximo Capítulo**: [Capítulo 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Próxima Lição**: [Seu Primeiro Projeto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos empenhemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original, em seu idioma nativo, deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se uma tradução profissional realizada por tradutores humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->