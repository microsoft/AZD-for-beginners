# Folha de Dicas de Comandos - Comandos AZD Essenciais

**Referência Rápida para Todos os Capítulos**
- **📚 Início do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Arranque Rápido**: [Capítulo 1: Fundamentação & Arranque Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos AI**: [Capítulo 2: Desenvolvimento AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avançado**: [Capítulo 4: Infraestrutura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introdução

Esta folha de dicas abrangente fornece uma referência rápida para os comandos mais utilizados da Azure Developer CLI, organizados por categoria com exemplos práticos. Perfeita para consultas rápidas durante o desenvolvimento, resolução de problemas e operações diárias com projetos azd.

## Objetivos de Aprendizagem

Ao usar esta folha de dicas, irá:
- Ter acesso instantâneo aos comandos essenciais da Azure Developer CLI e à sua sintaxe
- Compreender a organização dos comandos por categorias funcionais e casos de uso
- Consultar exemplos práticos para cenários comuns de desenvolvimento e implantação
- Aceder a comandos de diagnóstico para resolução rápida de problemas
- Encontrar opções avançadas de configuração e personalização de forma eficiente
- Localizar comandos para gestão de ambientes e fluxos de trabalho multi-ambiente

## Resultados de Aprendizagem

Com a consulta regular a esta folha de dicas, será capaz de:
- Executar comandos azd com confiança sem necessidade de consultar documentação completa
- Resolver rapidamente problemas comuns usando os comandos de diagnóstico adequados
- Gerir múltiplos ambientes e cenários de implantação de forma eficiente
- Aplicar funcionalidades avançadas e opções de configuração azd conforme necessário
- Diagnosticar problemas de implantação usando sequências sistemáticas de comandos
- Otimizar fluxos de trabalho através da utilização eficaz de atalhos e opções azd

## Comandos Iniciais

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
# Desplegar tudo (provisionar + desplegar)
azd up

# Desplegar com mensagens de confirmação desativadas
azd up --confirm-with-no-prompt

# Desplegar para ambiente específico
azd up --environment production

# Desplegar com parâmetros personalizados
azd up --parameter location=westus2
```

### Apenas Infraestrutura
```bash
# Providenciar recursos Azure
azd provision

# 🧪 Pré-visualizar alterações na infraestrutura
azd provision --preview
# Mostra uma visão de execução simulada do que seria criado/modificado/eliminado
# Semelhante a 'terraform plan' ou 'bicep what-if' - seguro de executar, sem alterações aplicadas
```

### Apenas Aplicação
```bash
# Implementar código da aplicação
azd deploy

# Implementar serviço específico
azd deploy --service web
azd deploy --service api

# Implementar todos os serviços
azd deploy --all
```

### Construir e Empacotar
```bash
# Restaurar (descarregar) dependências da aplicação
azd restore

# Restaurar um serviço específico
azd restore --service api

# Construir um artefacto para implantação sem implantar
azd package

# Construir serviço específico
azd package --service api
```

> **`azd restore`** descarrega as dependências da sua aplicação (npm, pip, NuGet, Maven, etc.). É executado automaticamente durante `azd package` e `azd deploy`, pelo que raramente necessita de o chamar diretamente—execute manualmente para pré-buscar dependências (por exemplo, para aquecer uma cache de CI ou trabalhar offline posteriormente).

> **`azd package`** constrói o artefacto implantável (uma imagem de container ou zip) **sem** o enviar para o Azure. Use este comando isoladamente para verificar se uma compilação tem sucesso, inspecionar o resultado, ou produzir um artefacto que outro processo irá implantar mais tarde. `azd deploy` empacota automaticamente, pelo que só precisa de `azd package` quando quer o artefacto sem implantar.

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

# Definir predefinições globais
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remover configuração
azd config unset defaults.location

# Reiniciar todas as configurações
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

## 📊 Monitorização e Diagnóstico

### Painel de Monitorização
```bash
# Abrir o painel de monitorização do portal Azure
azd monitor

# Abrir métricas em tempo real do Application Insights
azd monitor --live

# Abrir a lâmina de registos do Application Insights
azd monitor --logs

# Abrir a vista geral do Application Insights
azd monitor --overview
```

### Visualização de Logs de Container
```bash
# Ver registos através do Azure CLI (para Aplicações de Contentores)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Seguir os registos em tempo real
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

# Eliminar recursos apagados de forma temporária
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

# 🧪 Pré-visualização e Planeamento da Infraestrutura
azd provision --preview
# Simula o provisionamento da infraestrutura sem implementar
# Analisa os modelos Bicep/Terraform e mostra:
# - Recursos a adicionar (verde +)
# - Recursos a modificar (amarelo ~)
# - Recursos a eliminar (vermelho -)
# Seguro para executar - nenhuma alteração real feita no ambiente Azure

# Sintetizar infraestrutura a partir do azure.yaml
azd infra synth
```

### Informação do Projeto
```bash
# Mostrar estado do projeto e endpoints
azd show

# Mostrar informações detalhadas do projeto em JSON
azd show --output json

# Obter endpoints do serviço
azd show --output json | jq '.services'
```

## 🤖 Comandos AI & Extensões

### Extensões AZD
```bash
# Listar todas as extensões disponíveis (incluindo IA)
azd extension list

# Instalar a extensão dos agentes Foundry
azd extension install azure.ai.agents

# Instalar a extensão de competências dos agentes (pré-visualização)
azd extension install azure.ai.skills

# Instalar a extensão de ligações Foundry (pré-visualização)
azd extension install azure.ai.connections

# Instalar a extensão de ajuste fino
azd extension install azure.ai.finetune

# Instalar a extensão de modelos personalizados
azd extension install azure.ai.models

# Atualizar todas as extensões instaladas
azd extension upgrade --all
```

### Comandos do Agente AI
```bash
# Inicializar um projeto de agente a partir de um manifesto
azd ai agent init -m <manifest-path-or-uri>

# Apontar para um projeto Foundry específico
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Especificar o diretório de origem do agente
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Escolher um destino de alojamento
azd ai agent init -m agent-manifest.yaml --host containerapp

# Testar um agente implantado (imprime latência + tempo para o primeiro byte)
azd ai agent invoke

# Mostrar a configuração do endpoint ao vivo
azd ai agent endpoint show

# Gerar um conjunto de dados de avaliação e depois otimizar o agente
azd ai agent eval generate
azd ai agent optimize

# Descarregar o código fonte implantado de um agente alojado baseado em código
azd ai agent code download

# Eliminar um agente alojado e todas as suas versões (--force termina sessões ativas)
azd ai agent delete --force
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

# Desdobrar para desenvolvimento
azd env new dev
azd up

# Fazer alterações e redesdobrar
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

# Desplegar para desenvolvimento
azd env select dev
azd up

# Testar e promover para staging
azd env select staging
azd up

# Desplegar para produção
azd env select production
azd up
```

### Fluxo de Trabalho de Resolução de Problemas
```bash
# Ativar modo de depuração
export AZD_DEBUG=true

# Verificar estado de implementação
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
# Listar os modelos disponíveis com detalhes
azd template list --output json

# Mostrar informações do modelo
azd template show <template-name>

# Validar o modelo antes de iniciar
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

# Mostrar diretório de configuração do azd
echo $AZD_CONFIG_DIR  # Normalmente ~/.azd
```

## 🎨 Formatação de Saída

### Saída JSON
```bash
# Obter saída JSON para scripting
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

### Validação de Implantação
```bash
#!/bin/bash
# Validação pré-implantação
azd show
azd provision --preview  # Pré-visualizar alterações antes de implantar
az account show
```

### Comparação de Ambiente
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

# Verificar estado da implementação
azd show --output json
```

### Comandos de Recuperação
```bash
# Recuperar de implantação falhada - limpar e reimplantar
azd down --force --purge
azd up

# Reprovisionar apenas a infraestrutura
azd provision

# Reimplantar apenas a aplicação
azd deploy
```

## 💡 Dicas Avançadas

### Aliases para Fluxos de Trabalho Mais Rápidos
```bash
# Adicione ao seu .bashrc ou .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Atalhos de Funções
```bash
# Troca rápida de ambiente
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

# Mostrar versão e informações da compilação
azd version
azd version --output json
```

### Ligações para Documentação
```bash
# Abrir documentação no navegador
azd docs

# Mostrar documentação do modelo
azd template show <template-name> --docs
```

---

**Dica**: Adicione esta folha de dicas aos favoritos e use `Ctrl+F` para encontrar rapidamente os comandos de que precisa!

---

**Navegação**
- **Lição Anterior**: [Verificações Pré-Implantação](../docs/pre-deployment/preflight-checks.md)
- **Próxima Lição**: [Glossário](glossary.md)

---

> **💡 Quer ajuda de comandos Azure no seu editor?** Instale [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) com `npx skills add microsoft/github-copilot-for-azure` — 37 skills para AI, Foundry, implantação, diagnóstico e muito mais.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->