# Folha de Referência de Comandos - Comandos Essenciais do AZD

**Referência Rápida para Todos os Capítulos**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Começo Rápido**: [Capítulo 1: Fundamentos & Começo Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avançado**: [Capítulo 4: Infraestrutura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introdução

Esta folha de referência abrangente fornece uma consulta rápida para os comandos mais utilizados do Azure Developer CLI, organizados por categoria com exemplos práticos. Perfeita para consultas rápidas durante o desenvolvimento, solução de problemas e operações diárias com projetos azd.

## Objetivos de Aprendizagem

Usando esta folha de referência, você irá:
- Ter acesso instantâneo aos comandos essenciais e sintaxe do Azure Developer CLI
- Entender a organização dos comandos por categorias funcionais e casos de uso
- Consultar exemplos práticos para cenários comuns de desenvolvimento e implantação
- Acessar comandos de solução de problemas para rápida resolução de questões
- Encontrar opções avançadas de configuração e personalização de forma eficiente
- Localizar comandos para gerenciamento de ambientes e fluxos de trabalho multi-ambiente

## Resultados Esperados

Com referências regulares a esta folha, você será capaz de:
- Executar comandos azd com confiança sem precisar consultar a documentação completa
- Resolver rapidamente problemas comuns usando comandos de diagnóstico apropriados
- Gerenciar eficientemente múltiplos ambientes e cenários de implantação
- Aplicar recursos e opções avançadas do azd conforme necessário
- Diagnosticar problemas de implantação usando sequências sistemáticas de comandos
- Otimizar fluxos de trabalho através do uso eficaz de atalhos e opções do azd

## Comandos para Iniciar

### Autenticação
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### Inicialização do Projeto
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## Comandos Básicos de Implantação

### Fluxo Completo de Implantação
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### Apenas Infraestrutura
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Apenas Aplicação
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Construção e Empacotamento
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** baixa as dependências do seu app (npm, pip, NuGet, Maven, etc.). Ele é executado automaticamente durante `azd package` e `azd deploy`, então raramente você precisa chamar diretamente — execute manualmente para pré-baixar dependências (por exemplo, para aquecer um cache CI ou trabalhar offline depois).

> **`azd package`** prepara um artefato implantável sem implantar o serviço da aplicação. O comportamento depende da linguagem e host: o empacotamento de container pode usar builds remotos do Azure e publicar imagens em um registro, então não é necessariamente offline ou livre de gravações no Azure. `azd deploy` pode empacotar automaticamente; use uma etapa de empacotamento separada quando precisar de um artefato ou checagem de build.


## 🌍 Gerenciamento de Ambiente

### Operações de Ambiente
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### Variáveis de Ambiente
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

Arquivos de ambiente são texto simples. Não use `azd env set` como armazenamento secreto; utilize referências do Key Vault ou identidade gerenciada conforme apropriado.

## ⚙️ Comandos de Configuração

### Configuração Global
```bash
# List all configuration
azd config show

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Configuração do Projeto
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Monitoramento e Diagnóstico

### Painel de Monitoramento
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

O Application Insights deve estar configurado pelo template. A opção Live Metrics do AZD não é atualmente suportada para aplicações Python; utilize a visão geral, logs, ou o fluxo de rastreamento documentado no exemplo.

### Visualizar Logs de Container
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Consultas Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
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
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Comandos Avançados

### Pipeline e CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Gerenciamento de Infraestrutura
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### Informações do Projeto
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Comandos de IA & Extensões

### Extensões AZD

Referência CLI de IA revisada em 2026-11-04: `azd 1.37.2`, agentes `1.0.0-beta.23`, avaliações `1.0.0-beta.2`. Use `azd >= 1.37.0` para o fluxo combinado; atualize o CLI core antes de extensões incompatíveis.

```bash
# List all available extensions (including AI)
azd extension list

# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the agent skills extension (preview)
azd extension install azure.ai.skills

# Install the Foundry connections extension (preview)
azd extension install azure.ai.connections

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Upgrade all installed extensions
azd extension upgrade --all
```

### Comandos de Agente de IA
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` substitui a grafia depreciada `--manifest`/`-m`; manifestos legados precisam de migração. Atualmente não há opção agent-init `--host containerapp`. Visualizações gerenciadas, voz e de longa duração necessitam de opt-ins independentes para shell/CI; veja a [referência CLI de IA](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Avaliações e Otimização de IA
```bash
# In an initialized agent project, configure evaluation resources
azd ai eval init

# Optionally generate a rubric and dataset; review files and printed next steps
azd ai eval generate

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Agentes beta.22 substituíram comandos de avaliação legados por `azd ai eval` do `azure.ai.evaluations`. A nova configuração de avaliação usa chaves camelCase. A otimização `--config` é uma requisição de API de otimização independente, **não** os legados `eval.yaml` ou novo `azure.eval.yaml`; use `--eval`/`--eval-config` para reuso de avaliação. Veja [configuração de avaliação](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) e [migração de otimização](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Servidor MCP (Alpha)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Geração de Infraestrutura
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Fluxos Rápidos

### Fluxo de Desenvolvimento
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
```

### Fluxo Multi-Ambiente
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

### Fluxo de Solução de Problemas
```bash
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 Comandos de Depuração

### Informações de Depuração
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### Depuração de Template
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Comandos de Arquivo e Diretório

### Estrutura do Projeto
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Formatação de Saída

### Saída JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Saída em Tabela
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Combinações Comuns de Comandos

### Script de Verificação de Saúde
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Validação de Implantação
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Comparação de Ambiente
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Script de Limpeza de Recursos
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Variáveis de Ambiente

### Variáveis Comuns de Ambiente
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandos de Emergência

### Correções Rápidas
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### Comandos de Recuperação
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Dicas Profissionais

### Aliases para Fluxo mais Rápido
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Atalhos de Função
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ajuda e Documentação

### Obtendo Ajuda
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

**Dica**: Adicione esta folha de referência aos favoritos e use `Ctrl+F` para encontrar rapidamente os comandos que você precisa!

---

**Navegação**
- **Lição Anterior**: [Verificações Preliminares](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Próxima Lição**: [Glossário](glossary.md)

---

> **💡 Quer ajuda com comandos do Azure no seu editor?** Instale [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) com `npx skills add microsoft/github-copilot-for-azure` — 37 skills para IA, Foundry, implantação, diagnóstico e mais.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->