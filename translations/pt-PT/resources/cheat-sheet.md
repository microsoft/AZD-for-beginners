# Folha de Consulta Rápida de Comandos - Comandos Essenciais AZD

**Referência Rápida para Todos os Capítulos**
- **📚 Início do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Início Rápido**: [Capítulo 1: Fundamentos & Início Rápido](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Comandos de IA**: [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avançado**: [Capítulo 4: Infraestrutura como Código](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introdução

Esta folha de consulta rápida abrangente fornece referência rápida para os comandos mais usados do Azure Developer CLI, organizados por categoria com exemplos práticos. Perfeita para consultas rápidas durante o desenvolvimento, resolução de problemas e operações diárias com projetos azd.

## Objetivos de Aprendizagem

Ao usar esta folha de consulta, você irá:
- Ter acesso instantâneo aos comandos essenciais do Azure Developer CLI e sua sintaxe
- Compreender a organização dos comandos por categorias funcionais e casos de uso
- Consultar exemplos práticos para cenários comuns de desenvolvimento e implantação
- Aceder a comandos de resolução de problemas para rápida resolução de questões
- Encontrar opções avançadas de configuração e personalização de forma eficiente
- Localizar comandos de gestão de ambientes e fluxos de trabalho multi-ambiente

## Resultados de Aprendizagem

Com a referência regular a esta folha, você será capaz de:
- Executar comandos azd com confiança sem referir a documentação completa
- Resolver rapidamente problemas comuns usando comandos de diagnóstico apropriados
- Gerir múltiplos ambientes e cenários de implantação de forma eficiente
- Aplicar funcionalidades avançadas do azd e opções de configuração conforme necessário
- Diagnosticar problemas de implantação usando sequências sistemáticas de comandos
- Otimizar fluxos de trabalho através do uso eficaz de atalhos e opções azd

## Comandos para Começar

### Autenticação
```bash
# Iniciar sessão no Azure via AZD
azd auth login

# Iniciar sessão na CLI do Azure (AZD usa isto por baixo dos panos)
az login

# Verificar conta atual
az account show

# Definir subscrição predefinida
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Terminar sessão do AZD
azd auth logout

# Terminar sessão da CLI do Azure
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

## Comandos Core de Implantação

### Fluxo Completo de Implantação
```bash
# Implantar tudo (provisionar + implantar)
azd up

# Implantar com pedidos de confirmação desativados
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

# 🧪 Pré-visualizar alterações na infraestrutura
azd provision --preview
# Mostra uma visão simulada dos recursos que seriam criados/modificados/eliminados
# Semelhante ao 'terraform plan' ou 'bicep what-if' - seguro de executar, sem alterações aplicadas
```

### Apenas Aplicação
```bash
# Implantar código da aplicação
azd deploy

# Implantar serviço específico
azd deploy --service web
azd deploy --service api

# Implantar todos os serviços
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

# Definir padrões globais
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remover configuração
azd config unset defaults.location

# Repor toda a configuração
azd config reset
```

### Configuração de Projeto
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
# Abrir painel de monitorização do portal Azure
azd monitor

# Abrir métricas em direto do Application Insights
azd monitor --live

# Abrir painel de registos do Application Insights
azd monitor --logs

# Abrir visão geral do Application Insights
azd monitor --overview
```

### Visualizar Logs de Contentores
```bash
# Ver logs através do Azure CLI (para Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Seguir logs em tempo real
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Ver logs no Portal Azure
azd monitor --logs
```

### Consultas Log Analytics
```bash
# Aceder ao Log Analytics através do Portal Azure
azd monitor --logs

# Consultar registos usando Azure CLI
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

# Purgar recursos apagados temporariamente
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

# Mostrar configuração do pipeline
azd pipeline show
```

### Gestão de Infraestrutura
```bash
# Gerar modelos de infraestrutura
azd infra generate

# 🧪 Pré-visualização e Planeamento da Infraestrutura
azd provision --preview
# Simula o provisionamento da infraestrutura sem a implementar
# Analisa os modelos Bicep/Terraform e mostra:
# - Recursos a adicionar (verde +)
# - Recursos a modificar (amarelo ~)
# - Recursos a eliminar (vermelho -)
# Seguro para executar - sem alterações reais feitas no ambiente Azure

# Sintetizar infraestrutura a partir do azure.yaml
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

## 🎯 Fluxos Rápidos de Trabalho

### Fluxo de Desenvolvimento
```bash
# Iniciar novo projeto
azd init --template todo-nodejs-mongo
cd my-project

# Fazer deploy para desenvolvimento
azd env new dev
azd up

# Fazer alterações e fazer redeploy
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

# Implantar para desenvolvimento
azd env select dev
azd up

# Testar e promover para staging
azd env select staging
azd up

# Implantar para produção
azd env select production
azd up
```

### Fluxo de Resolução de Problemas
```bash
# Ativar modo de depuração
export AZD_DEBUG=true

# Verificar estado da implantação
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

# Verificar estado da autenticação
az account show
```

### Depuração de Template
```bash
# Listar modelos disponíveis com detalhes
azd template list --output json

# Mostrar informação do modelo
azd template show <template-name>

# Validar modelo antes de iniciar
azd template validate <template-name>
```

## 📁 Comandos de Ficheiros e Diretórios

### Estrutura do Projeto
```bash
# Mostrar a estrutura do diretório atual
tree /f  # Windows
find . -type f  # Linux/macOS

# Navegar para a raiz do projeto azd
cd $(azd root)

# Mostrar o diretório de configuração do azd
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

# Ver serviços implantados
azd show --output json | jq '.services | keys'
```

## 🔧 Combinações Comuns de Comandos

### Script de Verificação de Estado
```bash
#!/bin/bash
# Verificação rápida de estado
azd show
azd env show
azd monitor --logs
```

### Validação de Implantação
```bash
#!/bin/bash
# Validação pré-implementação
azd show
azd provision --preview  # Pré-visualizar alterações antes de implementar
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

### Variáveis Comuns de Ambiente
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
# Recuperar de uma implementação falhada - limpar e reimplementar
azd down --force --purge
azd up

# Reprovisionar apenas a infraestrutura
azd provision

# Reimplementar apenas a aplicação
azd deploy
```

## 💡 Dicas Profissionais

### Aliases para um Fluxo mais Rápido
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

# Ajuda específica do comando
azd up --help
azd env --help
azd config --help

# Mostrar versão e informações de compilação
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

**Dica**: Guarde esta folha de consulta e use `Ctrl+F` para encontrar rapidamente os comandos de que precisa!

---

**Navegação**
- **Lição Anterior**: [Verificações Preliminares](../docs/pre-deployment/preflight-checks.md)
- **Lição Seguinte**: [Glossário](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se tradução profissional realizada por um humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->