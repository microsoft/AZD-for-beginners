# Seu Primeiro Projeto - Tutorial Prático

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundação & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Próximo**: [Traga Seu Próprio App](bring-your-own-app.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Bem-vindo ao seu primeiro projeto Azure Developer CLI! Você vai implementar uma aplicação de tarefas com frontend em React, API em Node.js e Azure Cosmos DB. O modelo mantém o nome histórico `todo-nodejs-mongo`; sua infraestrutura atual utiliza Cosmos DB para NoSQL, então analise o README baixado e `infra/` ao invés de inferir a API do banco de dados pelo nome.

> Revisado em relação a `azd 1.37.2` e ao template público em novembro de 2026. Os exemplos abaixo usam Bash; extração em JSON também requer `jq`. Implantações Azure geram custos e não foram executadas durante esta revisão.

## Objetivos de Aprendizagem

Ao completar este tutorial, você irá:
- Dominar o fluxo de inicialização de projeto azd usando templates
- Entender a estrutura do projeto Azure Developer CLI e arquivos de configuração
- Executar o deployment completo da aplicação no Azure com provisionamento de infraestrutura
- Implementar atualizações da aplicação e estratégias de reimplantação
- Gerenciar múltiplos ambientes para desenvolvimento e staging
- Aplicar práticas de limpeza de recursos e gerenciamento de custos

## Resultados Esperados

Após a conclusão, você será capaz de:
- Inicializar e configurar projetos azd a partir de templates de forma independente
- Navegar e modificar estruturas de projeto azd eficazmente
- Fazer deploy de aplicações full-stack no Azure usando comandos únicos
- Solucionar problemas comuns de implantação e autenticação
- Gerenciar múltiplos ambientes Azure para diferentes estágios de implantação
- Implementar fluxos de trabalho de deployment contínuo para atualizações da aplicação

## Começando

### Checklist de Pré-requisitos
- ✅ Azure Developer CLI instalado ([Guia de Instalação](installation.md))
- ✅ Autenticação AZD concluída com `azd auth login`
- ✅ Git instalado no seu sistema
- ✅ Node.js 22 LTS (ou versão suportada requerida pelo template baixado)
- ✅ Visual Studio Code (recomendado)

Antes de continuar, execute o validador de setup na raiz do repositório:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifique Sua Configuração
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Verifique a autenticação opcional do Azure CLI

```bash
az account show
```

### Verifique a versão do Node.js
```bash
node --version
```

## Passo 1: Escolha e Inicialize um Template

Vamos começar com um template popular de aplicação de tarefas que inclui frontend React e backend API em Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### O que Aconteceu?
- Código do template baixado para seu diretório local
- Criado um arquivo `azure.yaml` com definições de serviços
- Configurado código de infraestrutura no diretório `infra/`
- Criada uma configuração de ambiente

## Passo 2: Explore a Estrutura do Projeto

Vamos examinar o que o azd criou para nós:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Você deve ver:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Arquivos Chave para Entender

**azure.yaml** - O coração do seu projeto azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definição da infraestrutura:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Passo 3: Personalize Seu Projeto (Opcional)

Antes do deployment, você pode personalizar a aplicação:

### Modifique o Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Faça uma alteração simples:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Configure Variáveis de Ambiente
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Estes dois valores personalizados demonstram armazenamento local apenas. O template padrão não consome `WEBSITE_TITLE` ou `API_VERSION`, então eles não alteram o app. A edição explícita acima altera o título exibido.

## Passo 4: Implante no Azure

Agora vem a parte empolgante - implante tudo no Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### O que Acontece Durante o Deployment?

O fluxo provisiona a infraestrutura e empacota/implanta o código. A ordem exata pode ser personalizada via `workflows.up` no `azure.yaml`; este template especifica provisionar seguido por implantar. Não confie em uma ordem universal fixa para todos os templates.

### Saída Esperada
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Passo 5: Teste Sua Aplicação

### Acesse Sua Aplicação
Clique na URL fornecida na saída do deployment, ou obtenha-a a qualquer momento:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Teste o App de Tarefas
1. **Adicione um item de tarefa** - Clique em "Add Todo" e insira uma tarefa
2. **Marque como completo** - Marque as tarefas concluídas
3. **Exclua itens** - Remova tarefas que não precisa mais

### Monitore Sua Aplicação
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Verifique Sua Implantação

Antes de prosseguir, faça este rápido checklist para confirmar que tudo realmente funciona — não presuma que "deploy succeeded" significa "app funciona":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Deploy é verificado quando:**
- ✅ `azd show` lista uma URL de endpoint acessível
- ✅ A URL abre no seu navegador sem erros
- ✅ Recursos principais funcionam (adicionar/complete/excluir tarefa)
- ✅ `azd monitor --logs` mostra requisições chegando sem erros inesperados

Se alguma verificação falhar, vá para [Capítulo 7: Solução de Problemas](../chapter-07-troubleshooting/README.md).

## Passo 6: Faça Alterações e Reimplante

Vamos fazer uma alteração e ver como é fácil atualizar:

### Modifique a API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Adicione um cabeçalho de resposta customizado:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implante Apenas as Mudanças de Código
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Passo 7: Gerencie Múltiplos Ambientes

Crie um ambiente de staging para testar alterações antes da produção:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Comparação de Ambientes
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Passo 8: Limpe os Recursos

Quando terminar de experimentar, limpe para evitar cobranças contínuas:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## App Clássico vs. App Potencializado por IA: Mesmo Fluxo de Trabalho

Você acabou de implantar uma aplicação web tradicional. Mas e se quiser implantar um app com IA — por exemplo, um chat apoiado por Modelos Microsoft Foundry?

A boa notícia: **o fluxo é idêntico.**

| Passo | App Clássico Todo | App Chat IA |
|------|-----------------|-------------|
| Inicializar (diretório vazio) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autenticar | `azd auth login` | `azd auth login` |
| Implantar | `azd up` | `azd up` |
| Monitorar | `azd monitor` | `azd monitor` |
| Limpar | `azd down --force --purge` | `azd down --force --purge` |

Os comandos do ciclo de vida são os mesmos, mas os pré-requisitos diferem. Um template AI pode exigir acesso a modelo, cota regional, ingestão de dados e configuração adicional. Leia seu README antes do deployment; `azd up` não pode fornecer permissões ou cota faltantes.

Este é o princípio central do azd: **um fluxo, qualquer carga de trabalho.** As habilidades praticadas neste tutorial — inicializar, implantar, monitorar, reimplantar e limpar — se aplicam igualmente a aplicações AI e agentes.

---

## O Que Você Aprendeu

Parabéns! Você conseguiu com sucesso:
- ✅ Inicializar um projeto azd a partir de um template
- ✅ Explorar a estrutura do projeto e arquivos chave
- ✅ Implantar uma aplicação full-stack no Azure
- ✅ Fazer mudanças no código e reimplantar
- ✅ Gerenciar múltiplos ambientes
- ✅ Limpar recursos

## 🎯 Exercícios para Validar Habilidades

### Exercício 1: Implemente um Template Diferente (15 minutos)
**Objetivo**: Demonstrar domínio do fluxo azd init e deployment

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Aplicação é implantada sem erros
- [ ] Pode acessar a URL da aplicação no navegador
- [ ] Aplicação funciona corretamente (adicionar/remover tarefas)
- [ ] Recursos foram limpos com sucesso

### Exercício 2: Personalize a Configuração (20 minutos)
**Objetivo**: Praticar armazenamento de valores locais de ambiente sem confundi-los com configuração em tempo de execução

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Critérios de Sucesso:**
- [ ] Ambiente customizado criado com sucesso
- [ ] Variáveis de ambiente definidas e recuperáveis
- [ ] `azd env get-value APP_TITLE` imprime `My Custom Todo App`
- [ ] Pode explicar por que esses valores não alteram o app padrão a menos que consumidos pelo código/infraestrutura

### Exercício 3: Fluxo Multi-Ambientes (25 minutos)
**Objetivo**: Dominar gerenciamento e estratégias de deployment de ambientes

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Dois ambientes criados com configurações diferentes
- [ ] Ambos ambientes implantados com sucesso
- [ ] Pode alternar entre ambientes usando `azd env select`
- [ ] Variáveis de ambiente diferentes entre ambientes
- [ ] Ambos ambientes limpos com sucesso

## 📊 Seu Progresso

**Tempo Investido**: ~60-90 minutos  
**Habilidades Adquiridas**:
- ✅ Inicialização de projeto baseada em template
- ✅ Provisionamento de recursos Azure
- ✅ Fluxos de implantação de aplicação
- ✅ Gerenciamento de ambientes
- ✅ Gerenciamento de configuração
- ✅ Limpeza de recursos e gerenciamento de custos

**Próximo Nível**: Você está pronto para [Guia de Configuração](../chapter-03-configuration/configuration.md) para aprender padrões avançados de configuração!

## Solução de Problemas Comuns

### Erros de Autenticação
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Falhas de Implantação
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflitos de Nome de Recursos
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Porta/ Rede
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Passos

Agora que você concluiu seu primeiro projeto, explore estes tópicos avançados:

### 1. Personalizar Infraestrutura
- [Infraestrutura como Código](../chapter-04-infrastructure/provisioning.md)
- [Adicionar infraestrutura de banco de dados](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Configure CI/CD
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) - Fluxos CI/CD completos
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuração de pipeline

### 3. Boas Práticas de Produção
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) - Segurança, performance e monitoramento

### 4. Explore Mais Templates
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Recursos Adicionais

### Materiais de Aprendizagem
- [Documentação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidade & Suporte
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Comunidade Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Exemplos
- [Galeria Oficial de Templates](https://azure.github.io/awesome-azd/)
- [Contribuições de Templates da Comunidade](https://github.com/Azure/awesome-azd)
- [Fonte do Template Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Parabéns por completar seu primeiro projeto azd!** Agora você está pronto para construir e implantar aplicações incríveis no Azure com confiança.

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundação & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Próximo**: [Traga Seu Próprio App](bring-your-own-app.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->