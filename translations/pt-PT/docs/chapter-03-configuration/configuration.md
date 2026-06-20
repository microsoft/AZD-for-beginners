# Guia de Configuração

**Navegação pelo Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 3 - Configuração & Autenticação
- **⬅️ Anterior**: [O Seu Primeiro Projeto](first-project.md)
- **➡️ Seguinte**: [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Próximo Capítulo**: [Capítulo 4: Infraestrutura como Código](../chapter-04-infrastructure/deployment-guide.md)

## Introdução

Este guia abrangente cobre todos os aspetos de configurar o Azure Developer CLI para fluxos de trabalho ótimos de desenvolvimento e implantação. Irá aprender sobre a hierarquia de configuração, gestão de ambientes, métodos de autenticação e padrões avançados de configuração que permitem implantações Azure eficientes e seguras.

## Objetivos de Aprendizagem

No final desta lição, você irá:
- Dominar a hierarquia de configuração do azd e compreender como as definições são priorizadas
- Configurar definições globais e específicas de projeto de forma eficaz
- Gerir múltiplos ambientes com configurações diferentes
- Implementar padrões seguros de autenticação e autorização
- Compreender padrões avançados de configuração para cenários complexos

## Resultados de Aprendizagem

Após completar esta lição, você será capaz de:
- Configurar o azd para fluxos de trabalho de desenvolvimento ótimos
- Configurar e gerir múltiplos ambientes de implantação
- Implementar práticas seguras de gestão de configuração
- Diagnosticar problemas relacionados com configuração
- Personalizar o comportamento do azd para requisitos organizacionais específicos

Este guia abrangente cobre todos os aspetos de configurar o Azure Developer CLI para fluxos de trabalho ótimos de desenvolvimento e implantação.

## Compreendendo Agentes de IA num Projeto azd

Se é novo em agentes de IA, aqui está uma forma simples de os entender no mundo azd.

### O Que É um Agente?

Um agente é um programa que pode receber um pedido, raciocinar sobre ele e executar ações — frequentemente invocando um modelo de IA, procurando dados ou chamando outros serviços. Numa projeto azd, um agente é apenas outro **serviço** junto com o seu frontend web ou backend de API.

### Como os Agentes Se Encaixam na Estrutura do Projeto azd

Um projeto azd é composto por três camadas: **infraestrutura**, **código** e **configuração**. Os agentes ligam-se a estas camadas da mesma forma que qualquer outro serviço:

| Camada | O Que Faz para uma Aplicação Tradicional | O Que Faz para um Agente |
|-------|------------------------------------------|--------------------------|
| **Infraestrutura** (`infra/`) | Provisiona uma app web e base de dados | Provisiona um endpoint de modelo Microsoft Foundry, índice de pesquisa ou host do agente |
| **Código** (`src/`) | Contém o código fonte do frontend e API | Contém a lógica do agente e definições de prompts |
| **Configuração** (`azure.yaml`) | Lista os seus serviços e as suas metas de alojamento | Lista o seu agente como um serviço, apontando para o seu código e host |

### O Papel do `azure.yaml`

Não precisa de memorizar a sintaxe agora. Conceptualmente, o `azure.yaml` é o ficheiro onde diz ao azd: *"Aqui estão os serviços que compõem a minha aplicação, e aqui está onde encontrar o código deles."*

Quando o seu projeto inclui um agente de IA, o `azure.yaml` lista simplesmente esse agente como um dos serviços. O azd sabe então providenciar a infraestrutura correta (como um endpoint Microsoft Foundry Models ou um Container App para alojar o agente) e implantar o código do seu agente — tal como faria para uma app web ou API.

Isto significa que não há nada fundamentalmente novo para aprender. Se compreende como o azd gere um serviço web, já compreende como gere um agente.

## Hierarquia de Configuração

O azd usa um sistema hierárquico de configuração:
1. **Flags da linha de comando** (prioridade máxima)
2. **Variáveis de ambiente**
3. **Configuração local do projeto** (`.azd/config.json`)
4. **Configuração global do utilizador** (`~/.azd/config.json`)
5. **Valores por defeito** (prioridade mínima)

## Configuração Global

### Definir Predefinições Globais
```bash
# Definir subscrição predefinida
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Definir localização predefinida
azd config set defaults.location "eastus2"

# Definir convenção de nomenclatura predefinida para grupo de recursos
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Ver toda a configuração global
azd config show

# Remover uma configuração
azd config unset defaults.location
```

### Definições Globais Comuns
```bash
# Preferências de desenvolvimento
azd config set alpha.enable true                    # Ativar funcionalidades alfa
azd config set telemetry.enabled false             # Desativar telemetria
azd config set output.format json                  # Definir formato de saída

# Configurações de segurança
azd config set auth.useAzureCliCredential true     # Utilizar Azure CLI para autenticação
azd config set tls.insecure false                  # Aplicar verificação TLS

# Otimização de desempenho
azd config set provision.parallelism 5             # Criação paralela de recursos
azd config set deploy.timeout 30m                  # Tempo limite de implantação
```

## 🏗️ Configuração do Projeto

### Estrutura do azure.yaml
O ficheiro `azure.yaml` é o núcleo do seu projeto azd:

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

### Opções de Configuração do Serviço

#### Tipos de Alojamento
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

#### Definições Específicas por Linguagem
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

## 🌟 Gestão de Ambientes

### Criar Ambientes
```bash
# Criar um novo ambiente
azd env new development

# Criar com localização específica
azd env new staging --location "westus2"

# Criar a partir do modelo
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Configuração de Ambiente
Cada ambiente tem a sua própria configuração em `.azure/<env-name>/config.json`:

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

# Ver variáveis de ambiente
azd env get-values

# Saída esperada:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=chave-api-secreta
# DEBUG=true

# Remover variável de ambiente
azd env unset DEBUG

# Verificar remoção
azd env get-values | grep DEBUG
# (deve retornar nada)
```

### Modelos de Ambiente
Crie `.azure/env.template` para configuração consistente de ambiente:
```bash
# Variáveis obrigatórias
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Configurações da aplicação
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Configurações opcionais de desenvolvimento
DEBUG=false
LOG_LEVEL=info
```

### Partilhar Ambientes entre uma Equipa

Quando mais do que uma pessoa trabalha num projeto, é necessário concordar **o que se mantém no repositório e o que fica local**. O azd mantém cada ambiente numa pasta `.azure/`, e nem tudo deve ser colocado no repositório.

**O que está em `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**O que colocar no gitignore.** O `.gitignore` padrão do azd já exclui o `.azure/`. Mantenha assim — os ficheiros `.env` podem conter segredos, e os IDs dos recursos são específicos de quem os provisionou. Cada colega cria o seu **próprio** ambiente localmente:

```bash
# Cada programador executa isto uma vez para obter o seu próprio ambiente isolado
azd env new dev-alice
azd up
```

**Alternar entre ambientes.** Um programador que gere vários ambientes seleciona o ativo antes de executar comandos:

```bash
azd env list                 # ver todos os ambientes locais e qual é o padrão
azd env select staging       # tornar 'staging' o ambiente ativo
azd env get-values           # confirmar que está apontado para o correto
```

**Fornecer predefinições não secretas à equipa.** Faça commit de um template (como o `.azure/env.template` acima) para que todos saibam quais variáveis configurar — mas nunca submeta os valores preenchidos. Novos membros da equipa copiam o template e preenchem os seus próprios dados.

**Ambientes em CI/CD.** Os pipelines não leem a sua pasta `.azure/` local. Em vez disso, forneça os valores do ambiente como variáveis/segredos no pipeline, e o azd lê-os do ambiente do processo:

```bash
# Em CI, azd lê estes do ambiente, não de .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Regra geral:** o código de infraestrutura (`infra/`, `azure.yaml`) é partilhado no Git; o *estado e segredos* do ambiente (`.azure/`) são por programador e por pipeline. O comando `azd pipeline config` configura automaticamente as variáveis do pipeline para si.

## 🔐 Configuração de Autenticação

### Integração com Azure CLI
```bash
# Usar credenciais do Azure CLI (padrão)
azd config set auth.useAzureCliCredential true

# Iniciar sessão com tenant específico
az login --tenant <tenant-id>

# Definir subscrição padrão
az account set --subscription <subscription-id>
```

### Autenticação com Service Principal
Para pipelines CI/CD:
```bash
# Definir variáveis de ambiente
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ou configurar diretamente
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Identidade Gerida
Para ambientes alojados no Azure:
```bash
# Ativar autenticação de identidade gerida
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

## 🚀 Configuração de Implantação

### Configuração da Construção
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

### Configuração de Monitorização
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

## 🎯 Configurações Específicas para Ambiente

### Ambiente de Desenvolvimento
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Ambiente de Pré-Produção
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

## 🔍 Validação da Configuração

### Validar Configuração
```bash
# Verificar a sintaxe da configuração
azd config validate

# Testar as variáveis de ambiente
azd env get-values

# Validar a infraestrutura
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

### 2. Organize os Ficheiros de Configuração
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

### 3. Considerações sobre Controlo de Versão
```bash
# .gitignore
.azure/*/config.json         # Configurações de ambiente (contêm IDs dos recursos)
.azure/*/.env               # Variáveis de ambiente (podem conter segredos)
.env                        # Ficheiro local de ambiente
```

### 4. Documentação da Configuração
Documente a sua configuração em `CONFIG.md`:
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

### Exercício 1: Configuração Multi-Ambientes (15 minutos)

**Objetivo**: Criar e configurar três ambientes com definições diferentes

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
- [ ] Pode alternar entre ambientes sem erros
- [ ] `azd env list` mostra os três ambientes

### Exercício 2: Gestão de Segredos (10 minutos)

**Objetivo**: Praticar configuração segura com dados sensíveis

```bash
# Definir segredos (não exibidos na saída)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Definir configuração não secreta
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Ver ambiente (segredos devem ser ocultados)
azd env get-values

# Verificar se os segredos estão armazenados
azd env get DB_PASSWORD  # Deve mostrar o valor real
```

**Critérios de Sucesso:**
- [ ] Segredos armazenados sem exibição no terminal
- [ ] `azd env get-values` mostra segredos ocultados
- [ ] `azd env get <SECRET_NAME>` individual recupera valor real

## Próximos Passos

- [O Seu Primeiro Projeto](first-project.md) - Aplique configuração na prática
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) - Use configuração para implantação
- [Provisionamento de Recursos](../chapter-04-infrastructure/provisioning.md) - Configurações prontas para produção

## Referências

- [Referência de Configuração azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Esquema do azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Variáveis de Ambiente](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Navegação pelo Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 3 - Configuração & Autenticação
- **⬅️ Anterior**: [O Seu Primeiro Projeto](first-project.md)
- **➡️ Próximo Capítulo**: [Capítulo 4: Infraestrutura como Código](../chapter-04-infrastructure/deployment-guide.md)
- **Lição Seguinte**: [O Seu Primeiro Projeto](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->