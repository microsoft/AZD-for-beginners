# O Seu Primeiro Projeto - Tutorial Prático

**Navegação pelo Capítulo:**
- **📚 Início do Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Seguinte**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Bem-vindo ao seu primeiro projeto com Azure Developer CLI! Este tutorial prático abrangente oferece um percurso completo para criar, implementar e gerir uma aplicação full-stack no Azure usando azd. Vai trabalhar com uma aplicação real de tarefas que inclui um frontend em React, backend API em Node.js e base de dados MongoDB.

## Objetivos de Aprendizagem

Ao completar este tutorial, irá:
- Dominar o fluxo de inicialização de projetos azd utilizando templates
- Compreender a estrutura do projeto Azure Developer CLI e ficheiros de configuração
- Executar o deployment completo da aplicação no Azure com provisionamento de infraestrutura
- Implementar atualizações e estratégias de reimplantação da aplicação
- Gerir múltiplos ambientes para desenvolvimento e staging
- Aplicar práticas de limpeza de recursos e gestão de custos

## Resultados de Aprendizagem

Após a conclusão, será capaz de:
- Inicializar e configurar projetos azd a partir de templates de forma independente
- Navegar e modificar eficazmente a estrutura do projeto azd
- Implementar aplicações full-stack no Azure usando comandos únicos
- Resolver problemas comuns de deployment e de autenticação
- Gerir múltiplos ambientes Azure para diferentes fases de deployment
- Implementar workflows de deployment contínuo para atualizações da aplicação

## Começar

### Lista de Verificação de Pré-requisitos
- ✅ Azure Developer CLI instalado ([Guia de Instalação](installation.md))
- ✅ Autenticação AZD concluída com `azd auth login`
- ✅ Git instalado no seu sistema
- ✅ Node.js 16+ (para este tutorial)
- ✅ Visual Studio Code (recomendado)

Antes de continuar, execute o validador de configuração na raiz do repositório:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifique a Sua Configuração
```bash
# Verificar a instalação do azd
azd version

# Verificar a autenticação AZD
azd auth login --check-status
```

### Verifique a autenticação opcional no Azure CLI

```bash
az account show
```

### Verifique a versão do Node.js
```bash
node --version
```

## Passo 1: Escolher e Inicializar um Template

Vamos começar com um template popular de aplicação todo que inclui frontend em React e backend API em Node.js.

```bash
# Navegar pelos modelos disponíveis
azd template list

# Inicializar o template da aplicação de tarefas
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Siga as instruções:
# - Introduza um nome para o ambiente: "dev"
# - Escolha uma subscrição (se tiver várias)
# - Escolha uma região: "East US 2" (ou a sua região preferida)
```

### O Que Aconteceu?
- Transferiu o código do template para a sua diretoria local
- Criou um ficheiro `azure.yaml` com definições de serviços
- Configurou código de infraestrutura na diretoria `infra/`
- Criou uma configuração de ambiente

## Passo 2: Explorar a Estrutura do Projeto

Vamos examinar o que o azd criou para nós:

```bash
# Ver a estrutura do projeto
tree /f   # Windows
# ou
find . -type f | head -20   # macOS/Linux
```

Deve ver:
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

### Ficheiros-Chave para Compreender

**azure.yaml** - O coração do seu projeto azd:
```bash
# Ver a configuração do projeto
cat azure.yaml
```

**infra/main.bicep** - Definição da infraestrutura:
```bash
# Ver o código da infraestrutura
head -30 infra/main.bicep
```

## Passo 3: Personalizar o Seu Projeto (Opcional)

Antes de implementar, pode personalizar a aplicação:

### Modificar o Frontend
```bash
# Abrir o componente da aplicação React
code src/web/src/App.tsx
```

Faça uma alteração simples:
```typescript
// Encontre o título e altere-o
<h1>My Awesome Todo App</h1>
```

### Configurar Variáveis de Ambiente
```bash
# Definir variáveis de ambiente personalizadas
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Ver todas as variáveis de ambiente
azd env get-values
```

## Passo 4: Implementar para Azure

Agora chega a parte empolgante - implemente tudo para Azure!

```bash
# Implementar infraestrutura e aplicação
azd up

# Este comando irá:
# 1. Provisionar recursos Azure (App Service, Cosmos DB, etc.)
# 2. Construir a sua aplicação
# 3. Implantar nos recursos provisionados
# 4. Mostrar o URL da aplicação
```

### O Que Acontece Durante o Deployment?

O comando `azd up` realiza estes passos:
1. **Provisionar** (`azd provision`) - Cria recursos Azure
2. **Empacotar** - Compila o código da aplicação
3. **Implementar** (`azd deploy`) - Implementa o código nos recursos Azure

### Resultado Esperado
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
Clique no URL fornecido na saída do deployment, ou obtenha a qualquer momento:
```bash
# Obter os endpoints da aplicação
azd show

# Abra a aplicação no seu navegador
azd show --output json | jq -r '.services.web.endpoint'
```

### Testar a Aplicação Todo
1. **Adicionar uma tarefa** - Clique em "Add Todo" e insira uma tarefa
2. **Marcar como concluída** - Marque as tarefas concluídas
3. **Eliminar tarefas** - Remova as tarefas que já não precisa

### Monitorizar a Sua Aplicação
```bash
# Abrir portal Azure para os seus recursos
azd monitor

# Ver registos da aplicação
azd monitor --logs

# Ver métricas em direto
azd monitor --live
```

### ✅ Verifique o Seu Deployment

Antes de avançar, faça esta verificação rápida para confirmar que tudo realmente funciona—não presuma que "deploy sucedeu" significa "app funciona":

```bash
# 1. Confirme que o endpoint existe e é acessível
azd show

# 2. Teste básico ao endpoint (espera HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Verifique o endpoint de saúde se a sua aplicação disponibilizar um
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**O deployment está verificado quando:**
- ✅ `azd show` lista uma URL de endpoint acessível
- ✅ A URL abre no seu navegador sem erros
- ✅ As funcionalidades principais funcionam (adicionar/concluir/eliminar tarefas)
- ✅ `azd monitor --logs` mostra requisições a chegar sem erros inesperados

Se alguma verificação falhar, vá para [Capítulo 7: Resolução de Problemas](../chapter-07-troubleshooting/README.md).

## Passo 6: Fazer Alterações e Reimplantar

Vamos fazer uma alteração e ver como é fácil atualizar:

### Modificar a API
```bash
# Editar o código da API
code src/api/src/routes/lists.js
```

Adicione um cabeçalho de resposta personalizado:
```javascript
// Encontre um manipulador de rota e adicione:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementar Apenas as Alterações de Código
```bash
# Desplegar apenas o código da aplicação (ignorar infraestrutura)
azd deploy

# Isto é muito mais rápido do que 'azd up' pois a infraestrutura já existe
```

## Passo 7: Gerir Múltiplos Ambientes

Crie um ambiente de staging para testar alterações antes da produção:

```bash
# Criar um novo ambiente de staging
azd env new staging

# Fazer deploy para staging
azd up

# Voltar ao ambiente de desenvolvimento
azd env select dev

# Listar todos os ambientes
azd env list
```

### Comparação de Ambientes
```bash
# Ver ambiente de desenvolvimento
azd env select dev
azd show

# Ver ambiente de pré-produção
azd env select staging
azd show
```

## Passo 8: Limpar Recursos

Quando terminar de experimentar, limpe para evitar cobranças contínuas:

```bash
# Eliminar todos os recursos Azure para o ambiente atual
azd down

# Forçar a eliminação sem confirmação e limpar os recursos eliminados temporariamente
azd down --force --purge

# Eliminar ambiente específico
azd env select staging
azd down --force --purge
```

## Aplicação Clássica vs. Aplicação com AI: Mesmo Workflow

Acabou de implementar uma aplicação web tradicional. Mas e se quiser implementar uma app com AI, por exemplo, uma aplicação de chat suportada pelos Microsoft Foundry Models?

A boa notícia: **o fluxo de trabalho é idêntico.**

| Passo | App Todo Clássica | App Chat AI |
|-------|-------------------|-------------|
| Inicializar | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autenticar | `azd auth login` | `azd auth login` |
| Implementar | `azd up` | `azd up` |
| Monitorizar | `azd monitor` | `azd monitor` |
| Limpar | `azd down --force --purge` | `azd down --force --purge` |

A única diferença é o **template** que começa por usar. Um template AI inclui infraestrutura adicional (como um recurso Microsoft Foundry Models ou um índice AI Search), mas o azd trata de tudo isso por si. Não precisa de aprender comandos novos, adotar uma ferramenta diferente ou mudar a sua forma de pensar o deployment.

Este é o princípio essencial do azd: **um fluxo de trabalho, qualquer carga de trabalho.** As competências praticadas neste tutorial - inicializar, implementar, monitorizar, reimplementar e limpar - aplicam-se igualmente a aplicações e agentes AI.

---

## O Que Aprendeu

Parabéns! Completou com sucesso:
- ✅ Inicialização de projeto azd a partir de um template
- ✅ Exploração da estrutura do projeto e ficheiros chave
- ✅ Deployment de uma aplicação full-stack no Azure
- ✅ Fez alterações no código e reimplantou
- ✅ Geriu múltiplos ambientes
- ✅ Limpou recursos

## 🎯 Exercícios para Validação de Competências

### Exercício 1: Implementar Um Template Diferente (15 minutos)
**Objetivo**: Demonstrar domínio do azd init e workflow de deployment

```bash
# Experimente a stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verificar a implantação
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] A aplicação implementa sem erros
- [ ] Consegue aceder ao URL da aplicação no navegador
- [ ] A aplicação funciona corretamente (adicionar/remover tarefas)
- [ ] Limpou com sucesso todos os recursos

### Exercício 2: Personalizar Configuração (20 minutos)
**Objetivo**: Praticar configuração de variáveis de ambiente

```bash
cd my-first-azd-app

# Criar ambiente personalizado
azd env new custom-config

# Definir variáveis personalizadas
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verificar variáveis
azd env get-values | grep APP_TITLE

# Implantar com configuração personalizada
azd up
```

**Critérios de Sucesso:**
- [ ] Ambiente personalizado criado com sucesso
- [ ] Variáveis de ambiente definidas e recuperáveis
- [ ] Aplicação implementa com configuração personalizada
- [ ] Pode verificar definições personalizadas na app implementada

### Exercício 3: Workflow Multi-Ambiente (25 minutos)
**Objetivo**: Dominar gestão de ambientes e estratégias de deployment

```bash
# Criar ambiente de desenvolvimento
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Anotar URL de desenvolvimento
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Criar ambiente de staging
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Anotar URL de staging
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Comparar ambientes
azd env list

# Testar ambos os ambientes
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Limpar ambos
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Dois ambientes criados com configurações diferentes
- [ ] Ambos os ambientes implementados com sucesso
- [ ] Consegue alternar entre ambientes usando `azd env select`
- [ ] Variáveis de ambiente diferem entre ambientes
- [ ] Limpou com sucesso ambos os ambientes

## 📊 O Seu Progresso

**Tempo Investido**: ~60-90 minutos  
**Competências Adquiridas**:
- ✅ Inicialização de projetos baseada em templates
- ✅ Provisionamento de recursos Azure
- ✅ Workflows de deployment de aplicações
- ✅ Gestão de ambientes
- ✅ Gestão de configuração
- ✅ Limpeza de recursos e gestão de custos

**Próximo Nível**: Está pronto para o [Guia de Configuração](configuration.md) para aprender padrões avançados de configuração!

## Resolução de Problemas Comuns

### Erros de Autenticação
```bash
# Reautenticar com Azure
az login

# Verificar acesso à subscrição
az account show
```

### Falhas no Deployment
```bash
# Ativar o registo de depuração
export AZD_DEBUG=true
azd up --debug

# Ver registos da aplicação no Azure
azd monitor --logs

# Para aplicações em contentores, use o Azure CLI:
# az containerapp logs show --name <nome-app> --resource-group <nome-rg> --follow
```

### Conflitos de Nomes de Recursos
```bash
# Use um nome de ambiente único
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Porta/Network
```bash
# Verificar se as portas estão disponíveis
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Passos

Agora que completou o seu primeiro projeto, explore estes tópicos avançados:

### 1. Personalizar Infraestrutura
- [Infraestrutura como Código](../chapter-04-infrastructure/provisioning.md)
- [Adicionar bases de dados, armazenamentos e outros serviços](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configurar CI/CD
- [Guia de Deployment](../chapter-04-infrastructure/deployment-guide.md) - Workflows completos de CI/CD
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuração de pipelines

### 3. Boas Práticas para Produção
- [Guia de Deployment](../chapter-04-infrastructure/deployment-guide.md) - Segurança, performance, e monitorização

### 4. Explore Mais Templates
```bash
# Navegar por modelos por categoria
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Experimente diferentes pilhas de tecnologia
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Recursos Adicionais

### Materiais de Aprendizagem
- [Documentação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidade & Suporte
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Comunidade Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Exemplos
- [Galeria Oficial de Templates](https://azure.github.io/awesome-azd/)
- [Templates da Comunidade](https://github.com/Azure-Samples/azd-templates)
- [Padrões Empresariais](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Parabéns por completar o seu primeiro projeto azd!** Está agora pronto para construir e implementar aplicações incríveis no Azure com confiança.

---

**Navegação pelo Capítulo:**
- **📚 Início do Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Seguinte**: [Traga a Sua Própria Aplicação](bring-your-own-app.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->