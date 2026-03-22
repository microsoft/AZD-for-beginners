# Command Cheat Sheet - Essential AZD Commands

**Referência Rápida para Todos os Capítulos**
- **📚 Course Home**: [AZD para Iniciantes](../README.md)
- **📖 Quick Start**: [Capítulo 1: Fundamentos & Início Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Capítulo 2: Desenvolvimento com Foco em IA](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Capítulo 4: Infraestrutura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introdução

Esta folha de referência abrangente fornece acesso rápido aos comandos mais usados do Azure Developer CLI, organizados por categoria com exemplos práticos. Perfeita para consultas rápidas durante o desenvolvimento, solução de problemas e operações diárias com projetos azd.

## Objetivos de Aprendizagem

Ao usar esta folha de referência, você irá:
- Ter acesso instantâneo aos comandos e sintaxe essenciais do Azure Developer CLI
- Entender a organização dos comandos por categorias funcionais e casos de uso
- Consultar exemplos práticos para cenários comuns de desenvolvimento e implantação
- Acessar comandos de solução de problemas para resolução rápida de questões
- Encontrar opções avançadas de configuração e personalização de forma eficiente
- Localizar comandos de gerenciamento de ambientes e fluxos de trabalho multi-ambiente

## Resultados de Aprendizagem

Com a referência regular a esta folha, você será capaz de:
- Executar comandos azd com confiança sem consultar a documentação completa
- Resolver rapidamente problemas comuns usando comandos diagnósticos apropriados
- Gerenciar múltiplos ambientes e cenários de implantação de forma eficiente
- Aplicar recursos avançados e opções de configuração do azd conforme necessário
- Solucionar problemas de implantação usando sequências de comandos sistemáticas
- Otimizar fluxos de trabalho por meio do uso eficaz de atalhos e opções do azd

## Comandos para Começar

### Autenticação
```bash
# Fazer login no Azure via AZD
azd auth login

# Fazer login na Azure CLI (o AZD usa isso internamente)
az login

# Verificar conta atual
az account show

# Definir assinatura padrão
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Fazer logout do AZD
azd auth logout

# Fazer logout da Azure CLI
az logout
```

### Inicialização do Projeto
```bash
# Navegar pelos modelos disponíveis
azd template list

# Inicializar a partir de um modelo
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inicializar no diretório atual
azd init .

# Inicializar com nome personalizado
azd init --template todo-nodejs-mongo my-awesome-app
```

## Comandos Principais de Implantação

### Fluxo Completo de Implantação
```bash
# Implantar tudo (provisionamento + implantação)
azd up

# Implantar com prompts de confirmação desativados
azd up --confirm-with-no-prompt

# Implantar para um ambiente específico
azd up --environment production

# Implantar com parâmetros personalizados
azd up --parameter location=westus2
```

### Somente Infraestrutura
```bash
# Provisionar recursos do Azure
azd provision

# 🧪 Pré-visualizar alterações na infraestrutura
azd provision --preview
# Mostra uma visualização em modo de simulação (dry-run) do que seria criado/modificado/excluído
# Semelhante a 'terraform plan' ou 'bicep what-if' - seguro para executar, nenhuma alteração será aplicada
```

### Somente Aplicação
```bash
# Implantar o código da aplicação
azd deploy

# Implantar serviço específico
azd deploy --service web
azd deploy --service api

# Implantar todos os serviços
azd deploy --all
```

### Build e Empacotamento
```bash
# Construir aplicações
azd package

# Construir serviço específico
azd package --service api
```

## 🌍 Gerenciamento de Ambientes

### Operações de Ambiente
```bash
# Listar todos os ambientes
azd env list

# Criar um novo ambiente
azd env new development
azd env new staging --location westus2

# Selecionar ambiente
azd env select production

# Mostrar ambiente atual
azd env show

# Atualizar o estado do ambiente
azd env refresh
```

### Variáveis de Ambiente
```bash
# Definir variável de ambiente
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Obter variável de ambiente
azd env get API_KEY

# Listar todas as variáveis de ambiente
azd env get-values

# Remover variável de ambiente
azd env unset DEBUG
```

## ⚙️ Comandos de Configuração

### Configuração Global
```bash
# Listar todas as configurações
azd config list

# Definir padrões globais
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remover configuração
azd config unset defaults.location

# Redefinir todas as configurações
azd config reset
```

### Configuração do Projeto
```bash
# Validar azure.yaml
azd config validate

# Mostrar informações do projeto
azd show

# Obter endpoints de serviço
azd show --output json
```

## 📊 Monitoramento e Diagnóstico

### Painel de Monitoramento
```bash
# Abrir o painel de monitoramento do portal do Azure
azd monitor

# Abrir métricas em tempo real do Application Insights
azd monitor --live

# Abrir a lâmina de logs do Application Insights
azd monitor --logs

# Abrir visão geral do Application Insights
azd monitor --overview
```

### Visualizando Logs de Contêiner
```bash
# Visualizar logs pelo Azure CLI (para Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Acompanhar logs em tempo real
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Visualizar logs no Portal do Azure
azd monitor --logs
```

### Consultas do Log Analytics
```bash
# Acessar o Log Analytics via Portal do Azure
azd monitor --logs

# Consultar logs usando a Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comandos de Manutenção

### Limpeza
```bash
# Remover todos os recursos do Azure
azd down

# Forçar exclusão sem confirmação
azd down --force

# Purgar recursos excluídos temporariamente
azd down --purge

# Limpeza completa
azd down --force --purge
```

### Atualizações
```bash
# Verificar atualizações do azd
azd version

# Obter versão atual
azd version

# Visualizar configuração atual
azd config list
```

## 🔧 Comandos Avançados

### Pipeline e CI/CD
```bash
# Configurar o GitHub Actions
azd pipeline config

# Configurar o Azure DevOps
azd pipeline config --provider azdo

# Mostrar configuração do pipeline
azd pipeline show
```

### Gerenciamento de Infraestrutura
```bash
# Gerar modelos de infraestrutura
azd infra generate

# 🧪 Visualização e planejamento de infraestrutura
azd provision --preview
# Simula o provisionamento da infraestrutura sem implantar
# Analisa modelos Bicep/Terraform e mostra:
# - Recursos a serem adicionados (verde +)
# - Recursos a serem modificados (amarelo ~)
# - Recursos a serem excluídos (vermelho -)
# Seguro para executar - nenhuma alteração real é feita no ambiente do Azure

# Sintetizar infraestrutura a partir do azure.yaml
azd infra synth
```

### Informações do Projeto
```bash
# Mostrar status do projeto e endpoints
azd show

# Mostrar informações detalhadas do projeto em JSON
azd show --output json

# Obter endpoints do serviço
azd show --output json | jq '.services'
```

## 🤖 Comandos de IA & Extensões

### Extensões AZD
```bash
# Listar todas as extensões disponíveis (incluindo IA)
azd extension list

# Instalar a extensão Foundry agents
azd extension install azure.ai.agents

# Instalar a extensão de ajuste fino
azd extension install azure.ai.finetune

# Instalar a extensão de modelos personalizados
azd extension install azure.ai.models

# Atualizar todas as extensões instaladas
azd extension upgrade --all
```

### Comandos do Agente de IA
```bash
# Inicializar um projeto de agente a partir de um manifesto
azd ai agent init -m <manifest-path-or-uri>

# Apontar para um projeto Foundry específico
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Especificar o diretório de origem do agente
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Escolher um destino de hospedagem
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Inicie o servidor MCP para o seu projeto
azd mcp start

# Gerencie o consentimento de ferramentas para operações MCP
azd mcp consent
```

### Geração de Infraestrutura
```bash
# Gerar arquivos IaC a partir da definição do seu projeto
azd infra generate

# Sintetizar infraestrutura a partir do azure.yaml
azd infra synth
```

---

## 🎯 Fluxos de Trabalho Rápidos

### Fluxo de Trabalho de Desenvolvimento
```bash
# Iniciar novo projeto
azd init --template todo-nodejs-mongo
cd my-project

# Implantar no ambiente de desenvolvimento
azd env new dev
azd up

# Fazer alterações e reimplantar
azd deploy

# Abrir painel de monitoramento
azd monitor --live
```

### Fluxo de Trabalho Multi-Ambiente
```bash
# Configurar ambientes
azd env new dev
azd env new staging  
azd env new production

# Implantar no ambiente de desenvolvimento
azd env select dev
azd up

# Testar e promover para homologação
azd env select staging
azd up

# Implantar em produção
azd env select production
azd up
```

### Fluxo de Trabalho de Solução de Problemas
```bash
# Ativar modo de depuração
export AZD_DEBUG=true

# Verificar status de implantação
azd show

# Validar configuração
azd config list

# Abrir painel de monitoramento para logs
azd monitor --logs

# Verificar status dos recursos
azd show --output json
```

## 🔍 Comandos de Depuração

### Informações de Depuração
```bash
# Habilitar saída de depuração
export AZD_DEBUG=true
azd <command> --debug

# Desativar telemetria para uma saída mais limpa
export AZD_DISABLE_TELEMETRY=true

# Verificar configuração atual
azd config list

# Verificar status de autenticação
az account show
```

### Depuração de Templates
```bash
# Listar modelos disponíveis com detalhes
azd template list --output json

# Mostrar informações do modelo
azd template show <template-name>

# Validar modelo antes da inicialização
azd template validate <template-name>
```

## 📁 Comandos de Arquivo e Diretório

### Estrutura do Projeto
```bash
# Mostrar a estrutura de diretórios atual
tree /f  # Windows
find . -type f  # Linux/macOS

# Navegar até a raiz do projeto azd
cd $(azd root)

# Mostrar o diretório de configuração do azd
echo $AZD_CONFIG_DIR  # Normalmente ~/.azd
```

## 🎨 Formatação de Saída

### Saída JSON
```bash
# Obter saída JSON para uso em scripts
azd show --output json
azd env list --output json
azd config list --output json

# Analisar com jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Saída em Tabela
```bash
# Formatar como tabela
azd env list --output table

# Visualizar serviços implantados
azd show --output json | jq '.services | keys'
```

## 🔧 Combinações Comuns de Comandos

### Script de Verificação de Saúde
```bash
#!/bin/bash
# Verificação rápida de integridade
azd show
azd env show
azd monitor --logs
```

### Validação de Implantação
```bash
#!/bin/bash
# Validação pré-implantação
azd show
azd provision --preview  # Visualizar alterações antes de implantar
az account show
```

### Comparação de Ambientes
```bash
#!/bin/bash
# Comparar ambientes
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Script de Limpeza de Recursos
```bash
#!/bin/bash
# Limpar ambientes antigos
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variáveis de Ambiente

### Variáveis de Ambiente Comuns
```bash
# Configuração do Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Configuração do AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Configuração do aplicativo
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandos de Emergência

### Correções Rápidas
```bash
# Redefinir autenticação
az account clear
az login

# Forçar atualização do ambiente
azd env refresh

# Reimplantar todos os serviços
azd deploy

# Verificar status da implantação
azd show --output json
```

### Comandos de Recuperação
```bash
# Recuperar de implantação com falha - limpar e reimplantar
azd down --force --purge
azd up

# Reprovisionar apenas a infraestrutura
azd provision

# Reimplantar apenas a aplicação
azd deploy
```

## 💡 Dicas Profissionais

### Aliases para Fluxo de Trabalho Mais Rápido
```bash
# Adicione ao seu .bashrc ou .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Atalhos de Função
```bash
# Alternância rápida de ambiente
azd-env() {
    azd env select $1 && azd show
}

# Implantação rápida com monitoramento
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Status do ambiente
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ajuda e Documentação

### Obtendo Ajuda
```bash
# Ajuda geral
azd --help
azd help

# Ajuda específica do comando
azd up --help
azd env --help
azd config --help

# Mostrar informações de versão e de compilação
azd version
azd version --output json
```

### Links de Documentação
```bash
# Abrir a documentação no navegador
azd docs

# Mostrar a documentação do modelo
azd template show <template-name> --docs
```

---

**Dica**: Coloque este cheat sheet nos favoritos e use `Ctrl+F` para encontrar rapidamente os comandos que você precisa!

---

**Navegação**
- **Lição Anterior**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Próxima Lição**: [Glossário](glossary.md)

---

> **💡 Quer ajuda com comandos do Azure no seu editor?** Instale [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) com `npx skills add microsoft/github-copilot-for-azure` — 37 skills para IA, Foundry, implantação, diagnóstico e muito mais.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma de origem deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução humana profissional. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->