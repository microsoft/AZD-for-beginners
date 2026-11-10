# O Seu Primeiro Projeto - Tutorial Prático

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Arranque Rápido
- **⬅️ Anterior**: [Instalação e Configuração](installation.md)
- **➡️ Seguinte**: [Traga a Sua Própria Aplicação](bring-your-own-app.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Bem-vindo ao seu primeiro projeto com Azure Developer CLI! Vai implantar uma aplicação de tarefas com frontend React, API Node.js, e Azure Cosmos DB. O modelo mantém o nome histórico `todo-nodejs-mongo`; a sua infraestrutura atual usa Cosmos DB para NoSQL, por isso inspecione o README descarregado e o `infra/` em vez de deduzir a API da base de dados pelo nome.

> Revisado com base em `azd 1.37.2` e no template público em novembro de 2026. Exemplos abaixo usam Bash; a extração JSON requer também `jq`. Implantações Azure geram custos e não foram executadas durante esta revisão.

## Objetivos de Aprendizagem

Ao concluir este tutorial, você irá:
- Dominar o fluxo de trabalho de inicialização de projetos azd usando templates
- Compreender a estrutura do projeto Azure Developer CLI e ficheiros de configuração
- Executar a implantação completa da aplicação no Azure com provisionamento de infraestrutura
- Implementar estratégias de atualização e reimplantação da aplicação
- Gerir múltiplos ambientes para desenvolvimento e testes
- Aplicar práticas de limpeza de recursos e gestão de custos

## Resultados de Aprendizagem

Após completar, você será capaz de:
- Inicializar e configurar projetos azd a partir de templates de forma independente
- Navegar e modificar as estruturas de projetos azd eficazmente
- Implantar aplicações full-stack no Azure com comandos únicos
- Resolver problemas comuns de implantação e autenticação
- Gerir vários ambientes Azure para diferentes fases de implantação
- Implementar fluxos de trabalho de implantação contínua para atualizações de aplicações

## Começar

### Lista de Pré-requisitos
- ✅ Azure Developer CLI instalado ([Guia de Instalação](installation.md))
- ✅ Autenticação AZD concluída com `azd auth login`
- ✅ Git instalado no seu sistema
- ✅ Node.js 22 LTS (ou versão suportada exigida pelo template descarregado)
- ✅ Visual Studio Code (recomendado)

Antes de continuar, execute o validador de configuração a partir da raiz do repositório:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifique a Sua Configuração
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

## Passo 1: Escolher e Inicializar um Template

Vamos começar com um template popular para aplicação todo que inclui frontend React e API backend Node.js.

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

### O Que Aconteceu?
- Descarregou o código do template para o seu diretório local
- Criou um ficheiro `azure.yaml` com definições de serviços
- Configurou o código da infraestrutura na diretoria `infra/`
- Criou uma configuração de ambiente

## Passo 2: Explorar a Estrutura do Projeto

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

### Ficheiros-Chave a Compreender

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

## Passo 3: Personalize o Seu Projeto (Opcional)

Antes de implantar, pode personalizar a aplicação:

### Modificar o Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Faça uma alteração simples:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Configurar Variáveis de Ambiente
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Estes dois valores personalizados demonstram armazenamento local apenas. O template padrão não consome `WEBSITE_TITLE` nem `API_VERSION`, por isso não alteram a aplicação. A edição explícita acima altera o título mostrado.

## Passo 4: Implantar no Azure

Agora para a parte emocionante - implantar tudo no Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### O Que Está Acontecendo Durante a Implantação?

O fluxo de trabalho provisiona infraestrutura e embala/implanta código. A ordem exata pode ser personalizada através de `workflows.up` em `azure.yaml`; este template especifica provisionamento seguido de implantação. Não confie numa ordem universal para todos os templates.

### Saída Esperada
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Passo 5: Testar a Sua Aplicação

### Aceder à Sua Aplicação
Clique na URL fornecida na saída da implantação, ou obtenha-a a qualquer momento:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Testar a Aplicação Todo
1. **Adicionar uma tarefa** - Clique em "Add Todo" e introduza uma tarefa
2. **Marcar como concluída** - Marque as tarefas concluídas
3. **Eliminar tarefas** - Remova listas que já não precisar

### Monitorizar a Sua Aplicação
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Verifique a Sua Implantação

Antes de avançar, execute esta lista de verificação rápida para confirmar que tudo funciona de facto — não presuma que "implantação bem-sucedida" significa "aplicação funciona":

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

**A implantação está verificada quando:**
- ✅ `azd show` lista um URL de ponto final alcançável
- ✅ O URL abre no seu navegador sem erros
- ✅ Funcionalidades principais funcionam (adicionar/concluir/eliminar tarefas)
- ✅ `azd monitor --logs` mostra pedidos a chegar sem erros inesperados

Se alguma verificação falhar, vá a [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md).

## Passo 6: Fazer Alterações e Reimplantar

Vamos fazer uma alteração e ver quão fácil é atualizar:

### Modificar a API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Adicione um cabeçalho de resposta personalizado:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implantar Apenas as Alterações no Código
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Passo 7: Gerir Múltiplos Ambientes

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

## Passo 8: Limpar Recursos

Quando terminar de experimentar, faça a limpeza para evitar custos contínuos:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Aplicação Clássica vs. Aplicação com IA: Mesmo Fluxo de Trabalho

Acabou de implantar uma aplicação web tradicional. Mas e se quisesse implantar uma aplicação alimentada por IA – digamos, uma aplicação de chat suportada por Microsoft Foundry Models?

A boa notícia: **o fluxo de trabalho é idêntico.**

| Passo | Aplicação Todo Clássica | Aplicação de Chat IA |
|------|-------------------------|--------------------|
| Inicializar (diretório vazio) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autenticar | `azd auth login` | `azd auth login` |
| Implantar | `azd up` | `azd up` |
| Monitorizar | `azd monitor` | `azd monitor` |
| Limpar | `azd down --force --purge` | `azd down --force --purge` |

Os comandos do ciclo de vida são os mesmos, mas os pré-requisitos diferem. Um template IA pode requerer acesso a modelos, quota regional, ingestão de dados e configuração adicional. Leia o seu README antes da implantação; `azd up` não pode fornecer permissões ou quota em falta.

Este é o princípio central do azd: **um fluxo de trabalho, qualquer carga de trabalho.** As competências que praticou neste tutorial – inicializar, implantar, monitorizar, reimplantar e limpar – aplicam-se igualmente a aplicações e agentes IA.

---

## O Que Aprendeu

Parabéns! Você com sucesso:
- ✅ Inicializou um projeto azd a partir de um template
- ✅ Explorou a estrutura do projeto e ficheiros chave
- ✅ Implantou uma aplicação full-stack no Azure
- ✅ Fez alterações no código e reimplantou
- ✅ Geriu múltiplos ambientes
- ✅ Limpou recursos

## 🎯 Exercícios para Validar Competências

### Exercício 1: Implantar um Template Diferente (15 minutos)
**Objetivo**: Demonstrar domínio do azd init e fluxo de trabalho de implantação

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
- [ ] Aplicação implanta sem erros
- [ ] Consegue aceder ao URL da aplicação no navegador
- [ ] Aplicação funciona corretamente (adicionar/remover tarefas)
- [ ] Recursos limpos com sucesso

### Exercício 2: Personalizar Configuração (20 minutos)
**Objetivo**: Praticar armazenamento de valores locais de ambiente sem confundi-los com configuração em runtime

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
- [ ] Ambiente personalizado criado com sucesso
- [ ] Variáveis de ambiente definidas e recuperáveis
- [ ] `azd env get-value APP_TITLE` imprime `My Custom Todo App`
- [ ] Consegue explicar porque estes valores não alteram a aplicação padrão a não ser que o código/infraestrutura os consuma

### Exercício 3: Fluxo de Trabalho Multi-Ambiente (25 minutos)
**Objetivo**: Dominar gestão de ambientes e estratégias de implantação

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
- [ ] Ambos os ambientes implantados com sucesso
- [ ] Consegue alternar entre ambientes usando `azd env select`
- [ ] Variáveis de ambiente diferem entre ambientes
- [ ] Recursos limpos com sucesso em ambos os ambientes

## 📊 O Seu Progresso

**Tempo Investido**: ~60-90 minutos  
**Competências Adquiridas**:
- ✅ Inicialização de projeto baseada em template
- ✅ Provisionamento de recursos Azure
- ✅ Fluxos de trabalho de implantação de aplicações
- ✅ Gestão de ambientes
- ✅ Gestão de configuração
- ✅ Limpeza de recursos e gestão de custos

**Próximo Passo**: Está pronto para [Guia de Configuração](../chapter-03-configuration/configuration.md) para aprender padrões avançados de configuração!

## Resolução de Problemas Comuns

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

### Problemas de Porta/Network
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Passos

Agora que concluiu o seu primeiro projeto, explore estes tópicos avançados:

### 1. Personalizar Infraestrutura
- [Infraestrutura como Código](../chapter-04-infrastructure/provisioning.md)
- [Adicionar infraestrutura de base de dados](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Configurar CI/CD
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) - Fluxos de trabalho CI/CD completos
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuração de pipelines

### 3. Melhores Práticas de Produção
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) - Segurança, desempenho e monitorização

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
- [Centro de Arquitectura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Bem-Arquitectado](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidade e Suporte
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Comunidade Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Exemplos
- [Galeria Oficial de Templates](https://azure.github.io/awesome-azd/)
- [Contribuições de Templates da Comunidade](https://github.com/Azure/awesome-azd)
- [Fonte do Template Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Parabéns por completar o seu primeiro projeto azd!** Agora está pronto para criar e implantar aplicações incríveis no Azure com confiança.

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Arranque Rápido
- **⬅️ Anterior**: [Instalação e Configuração](installation.md)
- **➡️ Seguinte**: [Traga a Sua Própria Aplicação](bring-your-own-app.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->