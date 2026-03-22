# Folha de Consulta Rápida de Comandos - Comandos Essenciais do AZD

**Referência Rápida para Todos os Capítulos**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Início Rápido**: [Capítulo 1: Fundamentos & Início Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desenvolvimento AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avançado**: [Capítulo 4: Infraestrutura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introdução

Esta folha de consulta abrangente fornece referência rápida para os comandos mais usados da Azure Developer CLI, organizados por categoria com exemplos práticos. Perfeita para consultas rápidas durante o desenvolvimento, resolução de problemas e operações diárias com projetos azd.

## Objetivos de Aprendizagem

Ao usar esta folha de consulta, você irá:
- Ter acesso instantâneo aos comandos e sintaxe essenciais do Azure Developer CLI
- Compreender a organização dos comandos por categorias funcionais e casos de uso
- Referenciar exemplos práticos para cenários comuns de desenvolvimento e implantação
- Aceder a comandos de resolução de problemas para rápida resolução de questões
- Encontrar opções avançadas de configuração e personalização eficientemente
- Localizar comandos para gestão de ambientes e fluxos de trabalho multi-ambiente

## Resultados de Aprendizagem

Com o uso regular desta folha de consulta, você será capaz de:
- Executar comandos azd com confiança sem recorrer à documentação completa
- Resolver rapidamente problemas comuns usando comandos de diagnóstico apropriados
- Gerir eficientemente múltiplos ambientes e cenários de implantação
- Aplicar funcionalidades avançadas e opções de configuração do azd conforme necessário
- Diagnosticar problemas de implantação usando sequências sistemáticas de comandos
- Otimizar fluxos de trabalho através do uso eficaz de atalhos e opções do azd

## Comandos para Iniciar

### Autenticação
```bash
# Iniciar sessão no Azure via AZD
azd auth login

# Iniciar sessão no Azure CLI (AZD usa isto internamente)
az login

# Verificar conta atual
az account show

# Definir subscrição predefinida
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

# Inicializar a partir do modelo
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
# Implantar tudo (provisionar + implantar)
azd up

# Implantar com os pedidos de confirmação desativados
azd up --confirm-with-no-prompt

# Implantar para um ambiente específico
azd up --environment production

# Implantar com parâmetros personalizados
azd up --parameter location=westus2
```

### Apenas Infraestrutura
```bash
# Provisione recursos do Azure
azd provision

# 🧪 Pré-visualizar alterações na infraestrutura
azd provision --preview
# Mostra uma visualização simulada dos recursos que seriam criados/modificados/eliminados
# Semelhante a 'terraform plan' ou 'bicep what-if' - seguro de executar, sem alterações aplicadas
```

### Apenas Aplicação
```bash
# Descarregar o código da aplicação
azd deploy

# Descarregar o serviço específico
azd deploy --service web
azd deploy --service api

# Descarregar todos os serviços
azd deploy --all
```

### Construir e Empacotar
```bash
# Construir aplicações
azd package

# Construir serviço específico
azd package --service api
```

## 🌍 Gestão de Ambiente

### Operações de Ambiente
```bash
# Listar todos os ambientes
azd env list

# Criar novo ambiente
azd env new development
azd env new staging --location westus2

# Selecionar ambiente
azd env select production

# Mostrar ambiente atual
azd env show

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
azd config list

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

# Mostrar informações do projeto
azd show

# Obter pontos finais do serviço
azd show --output json
```

## 📊 Monitorização e Diagnósticos

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
# Ver logs via Azure CLI (para Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Seguir logs em tempo real
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Ver logs no Portal Azure
azd monitor --logs
```

### Consultas de Análise de Logs
```bash
# Aceder à Análise de Logs através do Portal Azure
azd monitor --logs

# Consultar logs usando o Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Comandos de Manutenção

### Limpeza
```bash
# Remover todos os recursos Azure
azd down

# Forçar eliminação sem confirmação
azd down --force

# Purgar recursos eliminados suavemente
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
azd config list
```

## 🔧 Comandos Avançados

### Pipeline e CI/CD
```bash
# Configurar GitHub Actions
azd pipeline config

# Configurar Azure DevOps
azd pipeline config --provider azdo

# Mostrar configuração da pipeline
azd pipeline show
```

### Gestão de Infraestrutura
```bash
# Gerar modelos de infraestrutura
azd infra generate

# 🧪 Pré-visualização e Planeamento de Infraestrutura
azd provision --preview
# Simula o fornecimento de infraestrutura sem implementar
# Analisa modelos Bicep/Terraform e mostra:
# - Recursos a adicionar (verde +)
# - Recursos a modificar (amarelo ~)
# - Recursos a eliminar (vermelho -)
# Seguro para executar - não são feitas alterações reais no ambiente Azure

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

# Instalar a extensão de afinação fina
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

# Direcionar para um projeto Foundry específico
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Especificar o diretório fonte do agente
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Escolher um destino de alojamento
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Servidor MCP (Alpha)
```bash
# Inicie o servidor MCP para o seu projeto
azd mcp start

# Gerir o consentimento da ferramenta para operações MCP
azd mcp consent
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

# Implementar para desenvolvimento
azd env new dev
azd up

# Fazer alterações e reimplementar
azd deploy

# Abrir painel de monitorização
azd monitor --live
```

### Fluxo Multi-Ambiente
```bash
# Configurar ambientes
azd env new dev
azd env new staging  
azd env new production

# Fazer o deploy para desenvolvimento
azd env select dev
azd up

# Testar e promover para staging
azd env select staging
azd up

# Fazer o deploy para produção
azd env select production
azd up
```

### Fluxo de Resolução de Problemas
```bash
# Ativar modo de depuração
export AZD_DEBUG=true

# Verificar estado da implementação
azd show

# Validar configuração
azd config list

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

# Desativar telemetria para uma saída mais limpa
export AZD_DISABLE_TELEMETRY=true

# Verificar configuração atual
azd config list

# Verificar estado de autenticação
az account show
```

### Depuração de Template
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

# Navegar até à raiz do projeto azd
cd $(azd root)

# Mostrar diretório de configuração azd
echo $AZD_CONFIG_DIR  # Normalmente ~/.azd
```

## 🎨 Formatação de Saída

### Saída JSON
```bash
# Obter saída JSON para scripting
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

# Ver serviços implementados
azd show --output json | jq '.services | keys'
```

## 🔧 Combinações Comuns de Comandos

### Script de Verificação de Saúde
```bash
#!/bin/bash
# Verificação rápida do estado de saúde
azd show
azd env show
azd monitor --logs
```

### Validação de Implantação
```bash
#!/bin/bash
# Validação pré-implementação
azd show
azd provision --preview  # Pré-visualizar alterações antes da implementação
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

# Configuração da aplicação
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Comandos de Emergência

### Correções Rápidas
```bash
# Repor autenticação
az account clear
az login

# Forçar atualização do ambiente
azd env refresh

# Reimplantar todos os serviços
azd deploy

# Verificar o estado da implementação
azd show --output json
```

### Comandos de Recuperação
```bash
# Recuperar de uma implantação falhada - limpar e implantar novamente
azd down --force --purge
azd up

# Rever provisionamento apenas da infraestrutura
azd provision

# Implantar novamente apenas a aplicação
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
# Troca rápida de ambiente
azd-env() {
    azd env select $1 && azd show
}

# Implementação rápida com monitorização
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Estado do ambiente
azd-status() {
    echo "Current environment:"
    azd env show
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

# Ajuda específica para comando
azd up --help
azd env --help
azd config --help

# Mostrar versão e informação de compilação
azd version
azd version --output json
```

### Links para Documentação
```bash
# Abrir documentação no navegador
azd docs

# Mostrar documentação do modelo
azd template show <template-name> --docs
```

---

**Dica**: Adicione esta folha de consulta aos favoritos e use `Ctrl+F` para encontrar rapidamente os comandos de que precisa!

---

**Navegação**
- **Aula Anterior**: [Verificações Pré-Implantação](../docs/pre-deployment/preflight-checks.md)
- **Próxima Aula**: [Glossário](glossary.md)

---

> **💡 Quer ajuda com comandos Azure no seu editor?** Instale [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) com `npx skills add microsoft/github-copilot-for-azure` — 37 skills para IA, Foundry, implantação, diagnósticos e mais.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, por favor tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional por um ser humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->