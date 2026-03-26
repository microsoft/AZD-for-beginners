# O Seu Primeiro Projeto - Tutorial Prático

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Seguinte**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Bem-vindo ao seu primeiro projeto Azure Developer CLI! Este tutorial prático abrangente oferece um percurso completo sobre como criar, implementar e gerir uma aplicação full-stack no Azure usando azd. Vai trabalhar com uma aplicação real de todo que inclui um frontend React, backend API Node.js e base de dados MongoDB.

## Objetivos de Aprendizagem

Ao completar este tutorial, você irá:
- Dominar o fluxo de trabalho de inicialização de projetos azd usando templates
- Compreender a estrutura e os ficheiros de configuração do projeto Azure Developer CLI
- Executar a implementação completa da aplicação no Azure com provisão de infraestrutura
- Implementar atualizações da aplicação e estratégias de nova implementação
- Gerir múltiplos ambientes para desenvolvimento e preparação
- Aplicar práticas de limpeza de recursos e gestão de custos

## Resultados de Aprendizagem

Após a conclusão, será capaz de:
- Inicializar e configurar projetos azd a partir de templates de forma independente
- Navegar e modificar as estruturas de projetos azd eficazmente
- Implementar aplicações full-stack no Azure utilizando comandos únicos
- Resolver problemas comuns de implementação e autenticação
- Gerir múltiplos ambientes Azure para diferentes fases de implementação
- Implementar fluxos de trabalho de implementação contínua para atualizações da aplicação

## Começar

### Lista de Pré-requisitos
- ✅ Azure Developer CLI instalado ([Guia de Instalação](installation.md))
- ✅ Azure CLI instalado e autenticado
- ✅ Git instalado no seu sistema
- ✅ Node.js 16+ (para este tutorial)
- ✅ Visual Studio Code (recomendado)

### Verificar a Sua Configuração
```bash
# Verificar a instalação do azd
azd version
```
### Verificar autenticação Azure

```bash
az account show
```

### Verificar versão do Node.js
```bash
node --version
```

## Passo 1: Escolha e Inicialize um Template

Vamos começar com um template popular de aplicação todo que inclui frontend React e backend API Node.js.

```bash
# Navegar pelos modelos disponíveis
azd template list

# Inicializar o modelo da aplicação de tarefas
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Siga as instruções:
# - Introduza um nome para o ambiente: "dev"
# - Escolha uma subscrição (se tiver várias)
# - Escolha uma região: "East US 2" (ou a sua região preferida)
```

### O Que Aconteceu?
- O código do template foi transferido para o seu diretório local
- Foi criado um ficheiro `azure.yaml` com definições dos serviços
- Configurou-se o código de infraestrutura na diretoria `infra/`
- Criou-se uma configuração de ambiente

## Passo 2: Explore a Estrutura do Projeto

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

### Ficheiros-Chave a Compreender

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

## Passo 3: Personalize o Seu Projeto (Opcional)

Antes de implementar, pode personalizar a aplicação:

### Modificar o Frontend
```bash
# Abra o componente da aplicação React
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

## Passo 4: Implementar no Azure

Agora a parte emocionante - implemente tudo no Azure!

```bash
# Implementar infraestrutura e aplicação
azd up

# Este comando irá:
# 1. Provisionar recursos Azure (App Service, Cosmos DB, etc.)
# 2. Construir a sua aplicação
# 3. Implementar nos recursos provisionados
# 4. Exibir a URL da aplicação
```

### O Que Está Acontecendo Durante a Implementação?

O comando `azd up` realiza estes passos:
1. **Provisionar** (`azd provision`) - Cria recursos Azure
2. **Empacotar** - Compila o código da aplicação
3. **Implementar** (`azd deploy`) - Implementa o código nos recursos Azure

### Saída Esperada
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Passo 5: Teste a Sua Aplicação

### Aceda à Sua Aplicação
Clique no URL fornecido na saída da implementação, ou obtenha-o a qualquer momento:
```bash
# Obter pontos finais da aplicação
azd show

# Abra a aplicação no seu navegador
azd show --output json | jq -r '.services.web.endpoint'
```

### Testar a App Todo
1. **Adicionar um item todo** - Clique em "Add Todo" e introduza uma tarefa
2. **Marcar como concluído** - Marque os itens concluídos
3. **Eliminar itens** - Remova todos os itens que já não precisa

### Monitorizar a Sua Aplicação
```bash
# Abrir o portal Azure para os seus recursos
azd monitor

# Ver os registos da aplicação
azd monitor --logs

# Ver métricas em tempo real
azd monitor --live
```

## Passo 6: Fazer Alterações e Nova Implementação

Vamos fazer uma alteração e ver como é fácil atualizar:

### Modificar a API
```bash
# Editar o código API
code src/api/src/routes/lists.js
```

Adicione um cabeçalho de resposta personalizado:
```javascript
// Encontre um manipulador de rota e adicione:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementar Apenas as Alterações do Código
```bash
# Faça o deploy apenas do código da aplicação (ignorar infraestrutura)
azd deploy

# Isto é muito mais rápido do que 'azd up' uma vez que a infraestrutura já existe
```

## Passo 7: Gerir Múltiplos Ambientes

Crie um ambiente de preparação para testar alterações antes da produção:

```bash
# Criar um novo ambiente de staging
azd env new staging

# Fazer deploy para staging
azd up

# Voltar para o ambiente de desenvolvimento
azd env select dev

# Listar todos os ambientes
azd env list
```

### Comparação de Ambientes
```bash
# Ver ambiente de desenvolvimento
azd env select dev
azd show

# Ver ambiente de homologação
azd env select staging
azd show
```

## Passo 8: Limpar Recursos

Quando terminar de experimentar, limpe para evitar custos contínuos:

```bash
# Eliminar todos os recursos do Azure para o ambiente atual
azd down

# Forçar eliminação sem confirmação e purgar recursos eliminados temporariamente
azd down --force --purge

# Eliminar ambiente específico
azd env select staging
azd down --force --purge
```

## App Clássica vs App AI-Potenciada: Mesma Workflow

Acabou de implementar uma aplicação web tradicional. Mas e se quisesse implementar uma aplicação com AI — por exemplo, uma app de chat suportada por Microsoft Foundry Models?

A boa notícia: **o workflow é idêntico.**

| Passo | App Todo Clássica | App AI Chat |
|------|------------------|-------------|
| Inicializar | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autenticar | `azd auth login` | `azd auth login` |
| Implementar | `azd up` | `azd up` |
| Monitorizar | `azd monitor` | `azd monitor` |
| Limpar | `azd down --force --purge` | `azd down --force --purge` |

A única diferença é o **template** de partida. Um template AI inclui infraestrutura adicional (como um recurso Microsoft Foundry Models ou um índice AI Search), mas o azd trata de tudo isso para si. Não precisa de aprender comandos novos, adotar uma ferramenta diferente, ou mudar a forma como pensa sobre implementação.

Este é o princípio central do azd: **um workflow, qualquer carga de trabalho.** As competências que praticou neste tutorial — inicializar, implementar, monitorizar, nova implementação e limpar — aplicam-se igualmente a aplicações e agentes AI.

---

## O Que Aprendeu

Parabéns! Concluiu com sucesso:
- ✅ Inicializou um projeto azd a partir de um template
- ✅ Explorou a estrutura do projeto e ficheiros chave
- ✅ Implementou uma aplicação full-stack no Azure
- ✅ Fez alterações ao código e implementou novamente
- ✅ Geriu múltiplos ambientes
- ✅ Limpou recursos

## 🎯 Exercícios de Validação de Competências

### Exercício 1: Implementar um Template Diferente (15 minutos)
**Objetivo**: Demonstrar domínio do azd init e fluxo de trabalho de implementação

```bash
# Experimente a stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verificar implementação
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Aplicação implementa sem erros
- [ ] Pode aceder ao URL da aplicação no navegador
- [ ] Aplicação funciona corretamente (adicionar/remover todos)
- [ ] Recursos limpos com sucesso

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

# Desplegar com configuração personalizada
azd up
```

**Critérios de Sucesso:**
- [ ] Ambiente personalizado criado com sucesso
- [ ] Variáveis de ambiente definidas e acessíveis
- [ ] Aplicação implementada com configuração personalizada
- [ ] Pode verificar configurações personalizadas na app implementada

### Exercício 3: Workflow Multi-Ambiente (25 minutos)
**Objetivo**: Dominar gestão de ambientes e estratégias de implementação

```bash
# Criar ambiente de desenvolvimento
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Anotar URL de desenvolvimento
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Criar ambiente de teste
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Anotar URL de teste
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
- [ ] Ambos ambientes implementados com sucesso
- [ ] Pode alternar entre ambientes usando `azd env select`
- [ ] Variáveis de ambiente diferem entre ambientes
- [ ] Ambos ambientes limpos com sucesso

## 📊 O Seu Progresso

**Tempo Investido**: ~60-90 minutos  
**Competências Adquiridas**:
- ✅ Inicialização de projeto baseada em template
- ✅ Provisão de recursos Azure
- ✅ Fluxos de trabalho de implementação de aplicação
- ✅ Gestão de ambientes
- ✅ Gestão de configuração
- ✅ Limpeza de recursos e gestão de custos

**Próximo Nível**: Já está pronto para o [Guia de Configuração](configuration.md) para aprender padrões avançados de configuração!

## Resolução de Problemas Comuns

### Erros de Autenticação
```bash
# Reautenticar com Azure
az login

# Verificar acesso à subscrição
az account show
```

### Falhas na Implementação
```bash
# Ativar registo de depuração
export AZD_DEBUG=true
azd up --debug

# Ver registos da aplicação no Azure
azd monitor --logs

# Para Container Apps, use a Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflitos de Nome de Recursos
```bash
# Utilize um nome de ambiente único
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Porta/Network
```bash
# Verifique se as portas estão disponíveis
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Passos

Agora que completou o seu primeiro projeto, explore estes tópicos avançados:

### 1. Personalizar Infraestrutura
- [Infraestrutura como Código](../chapter-04-infrastructure/provisioning.md)
- [Adicionar bases de dados, armazenamento e outros serviços](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configurar CI/CD
- [Guia de Implementação](../chapter-04-infrastructure/deployment-guide.md) - Workflows completos de CI/CD
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuração de pipelines

### 3. Boas Práticas de Produção
- [Guia de Implementação](../chapter-04-infrastructure/deployment-guide.md) - Segurança, desempenho e monitorização

### 4. Explore Mais Templates
```bash
# Navegue pelos templates por categoria
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Experimente diferentes conjuntos de tecnologias
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Recursos Adicionais

### Materiais de Aprendizagem
- [Documentação Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

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

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Seguinte**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Próxima Aula**: [Guia de Implementação](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor tenha em conta que traduções automatizadas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas resultantes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->