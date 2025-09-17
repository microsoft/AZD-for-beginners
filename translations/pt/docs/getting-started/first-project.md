<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-09-17T14:48:17+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "pt"
}
-->
# O Seu Primeiro Projeto - Tutorial Prático

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Anterior**: [Instalação e Configuração](installation.md)
- **➡️ Próximo**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../ai-foundry/azure-ai-foundry-integration.md)

## Introdução

Bem-vindo ao seu primeiro projeto com Azure Developer CLI! Este tutorial prático e abrangente oferece um guia completo para criar, implementar e gerenciar uma aplicação full-stack no Azure usando o azd. Você trabalhará com uma aplicação real de lista de tarefas que inclui um frontend em React, um backend de API em Node.js e uma base de dados MongoDB.

## Objetivos de Aprendizagem

Ao concluir este tutorial, você será capaz de:
- Dominar o fluxo de inicialização de projetos azd usando templates
- Compreender a estrutura de projetos e arquivos de configuração do Azure Developer CLI
- Executar a implementação completa de uma aplicação no Azure com provisionamento de infraestrutura
- Aplicar estratégias de atualização e reimplantação de aplicações
- Gerenciar múltiplos ambientes para desenvolvimento e testes
- Adotar práticas de limpeza de recursos e gestão de custos

## Resultados de Aprendizagem

Ao final, você será capaz de:
- Inicializar e configurar projetos azd a partir de templates de forma independente
- Navegar e modificar estruturas de projetos azd com eficiência
- Implementar aplicações full-stack no Azure com comandos únicos
- Solucionar problemas comuns de implementação e autenticação
- Gerenciar múltiplos ambientes no Azure para diferentes estágios de implantação
- Implementar fluxos de implantação contínua para atualizações de aplicações

## Começando

### Lista de Pré-requisitos
- ✅ Azure Developer CLI instalado ([Guia de Instalação](installation.md))
- ✅ Azure CLI instalado e autenticado
- ✅ Git instalado no seu sistema
- ✅ Node.js 16+ (para este tutorial)
- ✅ Visual Studio Code (recomendado)

### Verificar Configuração
```bash
# Check azd installation
azd version
```
### Verificar Autenticação no Azure

```bash
az account show
```

### Verificar Versão do Node.js
```bash
node --version
```

## Passo 1: Escolher e Inicializar um Template

Vamos começar com um template popular de aplicação de lista de tarefas que inclui um frontend em React e um backend de API em Node.js.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### O Que Acabou de Acontecer?
- O código do template foi baixado para o seu diretório local
- Um arquivo `azure.yaml` foi criado com definições de serviços
- O código de infraestrutura foi configurado no diretório `infra/`
- Uma configuração de ambiente foi criada

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
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Arquivos Principais para Compreender

**azure.yaml** - O coração do seu projeto azd:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definição de infraestrutura:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Passo 3: Personalizar o Projeto (Opcional)

Antes de implementar, você pode personalizar a aplicação:

### Modificar o Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Faça uma alteração simples:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Configurar Variáveis de Ambiente
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Passo 4: Implementar no Azure

Agora vem a parte emocionante - implementar tudo no Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### O Que Está Acontecendo Durante a Implementação?

O comando `azd up` realiza os seguintes passos:
1. **Provisionar** (`azd provision`) - Cria os recursos no Azure
2. **Empacotar** - Compila o código da aplicação
3. **Implementar** (`azd deploy`) - Implementa o código nos recursos do Azure

### Saída Esperada
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Passo 5: Testar a Aplicação

### Acessar a Aplicação
Clique no URL fornecido na saída da implementação ou acesse a qualquer momento:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testar a Aplicação de Lista de Tarefas
1. **Adicionar um item à lista** - Clique em "Add Todo" e insira uma tarefa
2. **Marcar como concluído** - Marque os itens concluídos
3. **Excluir itens** - Remova tarefas que não são mais necessárias

### Monitorar a Aplicação
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Passo 6: Fazer Alterações e Reimplementar

Vamos fazer uma alteração e ver como é fácil atualizar:

### Modificar a API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Adicione um cabeçalho de resposta personalizado:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementar Apenas as Alterações de Código
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Passo 7: Gerenciar Múltiplos Ambientes

Crie um ambiente de teste para validar alterações antes de ir para produção:

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

Quando terminar de experimentar, limpe os recursos para evitar cobranças contínuas:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## O Que Você Aprendeu

Parabéns! Você conseguiu:
- Inicializar um projeto azd a partir de um template
- Explorar a estrutura do projeto e os arquivos principais
- Implementar uma aplicação full-stack no Azure
- Fazer alterações no código e reimplementar
- Gerenciar múltiplos ambientes
- Limpar recursos

## Solução de Problemas Comuns

### Erros de Autenticação
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Falhas na Implementação
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Conflitos de Nome de Recursos
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Porta/Rede
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Passos

Agora que você concluiu seu primeiro projeto, explore estes tópicos avançados:

### 1. Personalizar Infraestrutura
- [Infraestrutura como Código](../deployment/provisioning.md)
- [Adicionar bases de dados, armazenamento e outros serviços](../deployment/provisioning.md#adding-services)

### 2. Configurar CI/CD
- [Integração com GitHub Actions](../deployment/cicd-integration.md)
- [Pipelines do Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. Melhores Práticas para Produção
- [Configurações de segurança](../deployment/best-practices.md#security)
- [Otimização de desempenho](../deployment/best-practices.md#performance)
- [Monitoramento e registro de logs](../deployment/best-practices.md#monitoring)

### 4. Explorar Mais Templates
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Recursos Adicionais

### Materiais de Aprendizagem
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Bem-Arquitetado do Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidade e Suporte
- [GitHub do Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Comunidade de Desenvolvedores Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates e Exemplos
- [Galeria Oficial de Templates](https://azure.github.io/awesome-azd/)
- [Templates da Comunidade](https://github.com/Azure-Samples/azd-templates)
- [Padrões Empresariais](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Parabéns por concluir seu primeiro projeto azd!** Agora você está pronto para criar e implementar aplicações incríveis no Azure com confiança.

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Início Rápido
- **⬅️ Anterior**: [Instalação e Configuração](installation.md)
- **➡️ Próximo**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../ai-foundry/azure-ai-foundry-integration.md)
- **Próxima Aula**: [Guia de Implementação](../deployment/deployment-guide.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.