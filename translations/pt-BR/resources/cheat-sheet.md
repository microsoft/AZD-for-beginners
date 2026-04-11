# Command Cheat Sheet - Essential AZD Commands

**Referência Rápida para Todos os Capítulos**
- **📚 Início do Curso**: [AZD For Beginners](../README.md)
- **📖 Início Rápido**: [Capítulo 1: Fundamentos & Início Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desenvolvimento com Foco em IA](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avançado**: [Capítulo 4: Infraestrutura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introdução

Este guia de referência abrangente fornece consultas rápidas para os comandos do Azure Developer CLI mais usados, organizados por categoria com exemplos práticos. Perfeito para consultas rápidas durante o desenvolvimento, solução de problemas e operações diárias com projetos azd.

## Objetivos de Aprendizagem

Ao usar este guia de referência, você irá:
- Ter acesso instantâneo aos comandos essenciais do Azure Developer CLI e à sintaxe
- Entender a organização dos comandos por categorias funcionais e casos de uso
- Consultar exemplos práticos para cenários comuns de desenvolvimento e implantação
- Acessar comandos de solução de problemas para resolução rápida de incidentes
- Encontrar opções avançadas de configuração e personalização de forma eficiente
- Localizar comandos de gerenciamento de ambientes e fluxos de trabalho multiambiente

## Resultados de Aprendizagem

Com referência regular a este guia, você será capaz de:
- Executar comandos azd com confiança sem consultar a documentação completa
- Resolver rapidamente problemas comuns usando comandos diagnósticos apropriados
- Gerenciar eficientemente múltiplos ambientes e cenários de implantação
- Aplicar recursos avançados e opções de configuração do azd conforme necessário
- Solucionar problemas de implantação usando sequências de comandos sistemáticas
- Otimizar fluxos de trabalho por meio do uso eficaz de atalhos e opções do azd

## Comandos para Começar

### Autenticação
```bash
# Fazer login no Azure via AZD
azd auth login

# Fazer login no Azure CLI (o AZD usa isso internamente)
az login

# Verificar conta atual
az account show

# Definir assinatura padrão
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Fazer logout do AZD
azd auth logout

# Fazer logout do Azure CLI
az logout
```

### Inicialização do Projeto
```bash
# Navegar por modelos disponíveis
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

# Implantar com mensagens de confirmação desativadas
azd up --confirm-with-no-prompt

# Implantar para ambiente específico
azd up --environment production

# Implantar com parâmetros personalizados
azd up --parameter location=westus2
```

### Apenas Infraestrutura
```bash
# Provisionar recursos do Azure
azd provision

# 🧪 Visualizar alterações na infraestrutura
azd provision --preview
# Mostra uma visualização em modo de simulação do que seria criado/modificado/excluído
# Semelhante a 'terraform plan' ou 'bicep what-if' - seguro para executar, nenhuma alteração será aplicada
```

### Apenas Aplicação
```bash
# Implantar o código da aplicação
azd deploy

# Implantar serviço específico
azd deploy --service web
azd deploy --service api

# Implantar todos os serviços
azd deploy --all
```

### Compilar e Empacotar
```bash
# Construir aplicativos
azd package

# Construir serviço específico
azd package --service api
```

## 🌍 Gerenciamento de Ambientes

### Operações de Ambiente
```bash
# Listar todos os ambientes
azd env list

# Criar novo ambiente
azd env new development
azd env new staging --location westus2

# Selecionar ambiente
azd env select production

# Mostrar ambientes disponíveis
azd env list

# Atualizar estado do ambiente
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
azd config show

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

# Abrir a visão geral do Application Insights
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
# Acesse o Log Analytics pelo Portal do Azure
azd monitor --logs

# Consulte logs usando o Azure CLI
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
azd config show
```

## 🔧 Comandos Avançados

### Pipeline e CI/CD
```bash
# Configurar o GitHub Actions
azd pipeline config

# Configurar o Azure DevOps
azd pipeline config --provider azdo

# Mostrar a configuração do pipeline
azd pipeline show
```

### Gerenciamento de Infraestrutura
```bash
# Gerar modelos de infraestrutura
azd infra generate

# 🧪 Visualização e Planejamento de Infraestrutura
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

## 🤖 Comandos de IA e Extensões

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

### Comandos de Agente de IA
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

### Servidor MCP (Alpha)
```bash
# Iniciar o servidor MCP para o seu projeto
azd mcp start

# Gerenciar o consentimento de ferramentas para operações do MCP
azd copilot consent list
```

### Geração de Infraestrutura
```bash
# Gere arquivos IaC a partir da definição do seu projeto
azd infra generate

# Sintetize a infraestrutura a partir do arquivo azure.yaml
azd infra synth
```

---

## 🎯 Fluxos de Trabalho Rápidos

### Fluxo de Desenvolvimento
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

### Fluxo de Trabalho Multiambiente
```bash
# Configurar ambientes
azd env new dev
azd env new staging  
azd env new production

# Implantar em desenvolvimento
azd env select dev
azd up

# Testar e promover para homologação
azd env select staging
azd up

# Implantar em produção
azd env select production
azd up
```

### Fluxo de Resolução de Problemas
```bash
# Ativar modo de depuração
export AZD_DEBUG=true

# Verificar status da implantação
azd show

# Validar configuração
azd config show

# Abrir painel de monitoramento para logs
azd monitor --logs

# Verificar status do recurso
azd show --output json
```

## 🔍 Comandos de Depuração

### Informações de Depuração
```bash
# Ativar saída de depuração
export AZD_DEBUG=true
azd <command> --debug

# Desativar telemetria para uma saída mais limpa
export AZD_DISABLE_TELEMETRY=true

# Verificar configuração atual
azd config show

# Verificar status de autenticação
az account show
```

### Depuração de Templates
```bash
# Listar templates disponíveis com detalhes
azd template list --output json

# Mostrar informações do template
azd template show <template-name>

# Validar o template antes de inicializar
azd template validate <template-name>
```

## 📁 Comandos de Arquivos e Diretórios

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
azd config show --output json

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
azd env get-values
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
# Alternância rápida entre ambientes
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Ajuda e Documentação

### Obter Ajuda
```bash
# Ajuda geral
azd --help
azd help

# Ajuda específica do comando
azd up --help
azd env --help
azd config --help

# Mostrar informações de versão e compilação
azd version
azd version --output json
```

### Links da Documentação
```bash
# Abrir documentação no navegador
azd docs

# Mostrar documentação do modelo
azd template show <template-name> --docs
```

---

**Dica**: Adicione este guia de referência aos favoritos e use `Ctrl+F` para encontrar rapidamente os comandos de que você precisa!

---

**Navegação**
- **Lição Anterior**: [Verificações Preliminares](../docs/pre-deployment/preflight-checks.md)
- **Próxima Lição**: [Glossário](glossary.md)

---

> **💡 Quer ajuda com comandos do Azure no seu editor?** Instale [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) com `npx skills add microsoft/github-copilot-for-azure` — 37 skills para IA, Foundry, implantação, diagnóstico e muito mais.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->