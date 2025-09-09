<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "04291031a6a1cc0dc4064dcb9c543584",
  "translation_date": "2025-09-09T18:00:56+00:00",
  "source_file": "resources/cheat-sheet.md",
  "language_code": "pt"
}
-->
# Folha de Referência de Comandos - Comandos Essenciais do AZD

## Introdução

Esta folha de referência abrangente fornece um acesso rápido aos comandos mais utilizados do Azure Developer CLI, organizados por categoria com exemplos práticos. Perfeita para consultas rápidas durante o desenvolvimento, resolução de problemas e operações diárias com projetos azd.

## Objetivos de Aprendizagem

Ao utilizar esta folha de referência, você irá:
- Ter acesso instantâneo aos comandos e sintaxes essenciais do Azure Developer CLI
- Compreender a organização dos comandos por categorias funcionais e casos de uso
- Consultar exemplos práticos para cenários comuns de desenvolvimento e implementação
- Acessar comandos de resolução de problemas para uma solução rápida de questões
- Encontrar opções avançadas de configuração e personalização de forma eficiente
- Localizar comandos para gestão de ambientes e fluxos de trabalho multiambiente

## Resultados de Aprendizagem

Com o uso regular desta folha de referência, você será capaz de:
- Executar comandos azd com confiança sem precisar consultar a documentação completa
- Resolver rapidamente problemas comuns utilizando os comandos de diagnóstico apropriados
- Gerir múltiplos ambientes e cenários de implementação de forma eficiente
- Aplicar recursos avançados e opções de configuração do azd conforme necessário
- Solucionar problemas de implementação utilizando sequências sistemáticas de comandos
- Otimizar fluxos de trabalho através do uso eficaz de atalhos e opções do azd

## Comandos para Começar

### Autenticação
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Inicialização de Projeto
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comandos Principais de Implementação

### Fluxo Completo de Implementação
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### Apenas Infraestrutura
```bash
# Provision Azure resources
azd provision

# Preview infrastructure changes
azd provision --preview

# Provision with what-if analysis
azd provision --what-if
```

### Apenas Aplicação
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Construção e Empacotamento
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 Gestão de Ambientes

### Operações de Ambiente
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### Variáveis de Ambiente
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ Comandos de Configuração

### Configuração Global
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Configuração de Projeto
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitorização e Registos

### Registos de Aplicação
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### Monitorização
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ Comandos de Manutenção

### Limpeza
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### Atualizações
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Comandos Avançados

### Pipeline e CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Gestão de Infraestrutura
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate
```

### Gestão de Serviços
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Fluxos de Trabalho Rápidos

### Fluxo de Trabalho de Desenvolvimento
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### Fluxo de Trabalho Multiambiente
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### Fluxo de Trabalho de Resolução de Problemas
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 Comandos de Depuração

### Informações de Depuração
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### Depuração de Templates
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Comandos de Ficheiros e Diretórios

### Estrutura de Projeto
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formatação de Saída

### Saída JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Saída em Tabela
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Combinações Comuns de Comandos

### Script de Verificação de Saúde
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Validação de Implementação
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview
az account show
```

### Comparação de Ambientes
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script de Limpeza de Recursos
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variáveis de Ambiente

### Variáveis de Ambiente Comuns
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandos de Emergência

### Correções Rápidas
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Comandos de Recuperação
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Dicas Profissionais

### Atalhos para Fluxos de Trabalho Mais Rápidos
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Atalhos de Funções
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ajuda e Documentação

### Obter Ajuda
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### Links de Documentação
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Dica**: Adicione esta folha de referência aos favoritos e use `Ctrl+F` para encontrar rapidamente os comandos que precisa!

---

**Navegação**
- **Lição Anterior**: [Verificações Pré-Implementação](../docs/pre-deployment/preflight-checks.md)
- **Próxima Lição**: [Glossário](glossary.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.