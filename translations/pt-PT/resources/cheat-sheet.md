# Folha de Comandos - Comandos Essenciais do AZD

**Referência Rápida para Todos os Capítulos**
- **📚 Início do Curso**: [AZD For Beginners](../README.md)
- **📖 Início Rápido**: [Capítulo 1: Fundamentos & Início Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desenvolvimento AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avançado**: [Capítulo 4: Infraestrutura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introdução

Esta folha de comandos abrangente oferece referência rápida para os comandos do Azure Developer CLI mais utilizados, organizados por categoria com exemplos práticos. Perfeita para consultas rápidas durante o desenvolvimento, resolução de problemas e operações diárias com projetos azd.

## Objetivos de Aprendizagem

Ao usar esta folha de comandos, você irá:
- Ter acesso instantâneo a comandos essenciais do Azure Developer CLI e à sua sintaxe
- Compreender a organização dos comandos por categorias funcionais e casos de uso
- Consultar exemplos práticos para cenários comuns de desenvolvimento e implementação
- Aceder a comandos de resolução de problemas para rápida resolução de questões
- Encontrar opções avançadas de configuração e personalização de forma eficiente
- Localizar comandos para gestão de ambientes e fluxos de trabalho multi-ambiente

## Resultados de Aprendizagem

Com a referência regular a esta folha de comandos, você será capaz de:
- Executar comandos azd com confiança sem necessidade de consultar a documentação completa
- Resolver rapidamente problemas comuns usando comandos de diagnóstico apropriados
- Gerir eficientemente múltiplos ambientes e cenários de implementação
- Aplicar funcionalidades avançadas do azd e opções de configuração conforme necessário
- Diagnosticar problemas de implantação usando sequências sistemáticas de comandos
- Otimizar fluxos de trabalho através do uso eficaz de atalhos e opções do azd

## Comandos para Começar

### Autenticação
```bash
# Iniciar sessão no Azure via AZD
azd auth login

# Iniciar sessão no Azure CLI (o AZD usa isto internamente)
az login

# Verificar a conta atual
az account show

# Definir a subscrição predefinida
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Terminar sessão no AZD
azd auth logout

# Terminar sessão no Azure CLI
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

## Comandos Principais de Implementação

### Fluxo Completo de Implementação
```bash
# Implementar tudo (provisionar + implementar)
azd up

# Implementar com prompts de confirmação desativados
azd up --confirm-with-no-prompt

# Implementar para ambiente específico
azd up --environment production

# Implementar com parâmetros personalizados
azd up --parameter location=westus2
```

### Infraestrutura Apenas
```bash
# Provisionar recursos Azure
azd provision

# 🧪 Pré-visualizar alterações de infraestrutura
azd provision --preview
# Mostra uma vista de simulação do que recursos seriam criados/modificados/eliminados
# Semelhante a 'terraform plan' ou 'bicep what-if' - seguro para executar, sem alterações aplicadas
```

### Aplicação Apenas
```bash
# Desplegar código da aplicação
azd deploy

# Desplegar serviço específico
azd deploy --service web
azd deploy --service api

# Desplegar todos os serviços
azd deploy --all
```

### Construir e Empacotar
```bash
# Construir aplicações
azd package

# Construir serviço específico
azd package --service api
```

## 🌍 Gestão de Ambientes

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
# Listar toda a configuração
azd config show

# Definir predefinições globais
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remover configuração
azd config unset defaults.location

# Repor toda a configuração
azd config reset
```

### Configuração do Projeto
```bash
# Validar azure.yaml
azd config validate

# Mostrar informação do projeto
azd show

# Obter pontos finais de serviço
azd show --output json
```

## 📊 Monitorização e Diagnóstico

### Painel de Monitorização
```bash
# Abrir painel de monitorização do portal Azure
azd monitor

# Abrir métricas em tempo real do Application Insights
azd monitor --live

# Abrir painel de registos do Application Insights
azd monitor --logs

# Abrir visão geral do Application Insights
azd monitor --overview
```

### Visualizar Logs de Contentores
```bash
# Ver registos através do Azure CLI (para Aplicações de Contentor)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Acompanhar registos em tempo real
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Ver registos a partir do Portal Azure
azd monitor --logs
```

### Consultas Log Analytics
```bash
# Aceder ao Log Analytics via Portal Azure
azd monitor --logs

# Consultar logs usando Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comandos de Manutenção

### Limpeza
```bash
# Remover todos os recursos do Azure
azd down

# Forçar eliminação sem confirmação
azd down --force

# Eliminar permanentemente recursos apagados temporariamente
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

# Ver configuração atual
azd config show
```

## 🔧 Comandos Avançados

### Pipeline e CI/CD
```bash
# Configurar GitHub Actions
azd pipeline config

# Configurar Azure DevOps
azd pipeline config --provider azdo

# Mostrar configuração do pipeline
azd pipeline show
```

### Gestão de Infraestrutura
```bash
# Gerar modelos de infraestrutura
azd infra generate

# 🧪 Pré-visualização e Planeamento de Infraestrutura
azd provision --preview
# Simula o provisionamento da infraestrutura sem implementar
# Analisa modelos Bicep/Terraform e mostra:
# - Recursos a serem adicionados (verde +)
# - Recursos a serem modificados (amarelo ~)
# - Recursos a serem eliminados (vermelho -)
# Seguro para executar - nenhuma alteração real feita ao ambiente Azure

# Sintetizar infraestrutura a partir de azure.yaml
azd infra synth
```

### Informação do Projeto
```bash
# Mostrar estado do projeto e pontos finais
azd show

# Mostrar informações detalhadas do projeto em JSON
azd show --output json

# Obter pontos finais do serviço
azd show --output json | jq '.services'
```

## 🤖 Comandos de IA & Extensões

### Extensões AZD
```bash
# Listar todas as extensões disponíveis (incluindo IA)
azd extension list

# Instalar a extensão dos agentes Foundry
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

# Escolher um alvo de alojamento
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Servidor MCP (Alfa)
```bash
# Inicie o servidor MCP para o seu projeto
azd mcp start

# Gerir o consentimento da ferramenta para operações MCP
azd copilot consent list
```

### Geração de Infraestrutura
```bash
# Gerar ficheiros IaC a partir da definição do seu projeto
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

# Implementar em desenvolvimento
azd env new dev
azd up

# Fazer alterações e reimplantar
azd deploy

# Abrir painel de monitorização
azd monitor --live
```

### Fluxo de Trabalho Multi-Ambiente
```bash
# Configurar ambientes
azd env new dev
azd env new staging  
azd env new production

# Desdobrar para desenvolvimento
azd env select dev
azd up

# Testar e promover para preparação
azd env select staging
azd up

# Desdobrar para produção
azd env select production
azd up
```

### Fluxo de Trabalho de Resolução de Problemas
```bash
# Ativar modo de depuração
export AZD_DEBUG=true

# Verificar estado da implantação
azd show

# Validar configuração
azd config show

# Abrir painel de monitorização para registos
azd monitor --logs

# Verificar estado dos recursos
azd show --output json
```

## 🔍 Comandos de Depuração

### Informação de Depuração
```bash
# Ativar saída de depuração
export AZD_DEBUG=true
azd <command> --debug

# Desativar telemetria para saída mais limpa
export AZD_DISABLE_TELEMETRY=true

# Verificar configuração atual
azd config show

# Verificar estado da autenticação
az account show
```

### Depuração de Templates
```bash
# Listar modelos disponíveis com detalhes
azd template list --output json

# Mostrar informação do modelo
azd template show <template-name>

# Validar modelo antes da inicialização
azd template validate <template-name>
```

## 📁 Comandos de Ficheiros e Diretórios

### Estrutura do Projeto
```bash
# Mostrar estrutura do diretório atual
tree /f  # Windows
find . -type f  # Linux/macOS

# Navegar para o diretório raiz do projeto azd
cd $(azd root)

# Mostrar o diretório de configuração do azd
echo $AZD_CONFIG_DIR  # Normalmente ~/.azd
```

## 🎨 Formatação de Saída

### Saída JSON
```bash
# Obtenha a saída JSON para scripts
azd show --output json
azd env list --output json
azd config show --output json

# Analise com jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Saída em Tabela
```bash
# Formatar como tabela
azd env list --output table

# Ver serviços implantados
azd show --output json | jq '.services | keys'
```

## 🔧 Combinações Comuns de Comandos

### Script de Verificação de Saúde
```bash
#!/bin/bash
# Verificação rápida de estado
azd show
azd env get-values
azd monitor --logs
```

### Validação de Implementação
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

# Configuração AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Configuração da aplicação
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandos de Emergência

### Correções Rápidas
```bash
# Reiniciar autenticação
az account clear
az login

# Forçar atualização do ambiente
azd env refresh

# Reimplantar todos os serviços
azd deploy

# Verificar estado da implantação
azd show --output json
```

### Comandos de Recuperação
```bash
# Recuperar de implementação falhada - limpar e reimplantar
azd down --force --purge
azd up

# Reprovisionar apenas a infraestrutura
azd provision

# Reimplantar apenas a aplicação
azd deploy
```

## 💡 Dicas Profissionais

### Alias para Fluxo de Trabalho mais Rápido
```bash
# Adicione ao seu .bashrc ou .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Atalhos de Funções
```bash
# Mudança rápida de ambiente
azd-env() {
    azd env select $1 && azd show
}

# Implantação rápida com monitorização
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Estado do ambiente
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

# Mostrar versão e informações de compilação
azd version
azd version --output json
```

### Links de Documentação
```bash
# Abrir documentação no navegador
azd docs

# Mostrar documentação do modelo
azd template show <template-name> --docs
```

---

**Dica**: Adicione esta folha de comandos aos favoritos e use `Ctrl+F` para encontrar rapidamente os comandos de que precisa!

---

**Navegação**
- **Lição Anterior**: [Verificações Pré-Implementação](../docs/pre-deployment/preflight-checks.md)
- **Lição Seguinte**: [Glossário](glossary.md)

---

> **💡 Quer ajuda com comandos Azure no seu editor?** Instale [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) com `npx skills add microsoft/github-copilot-for-azure` — 37 skills para IA, Foundry, implementação, diagnósticos e mais.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, é recomendada uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->