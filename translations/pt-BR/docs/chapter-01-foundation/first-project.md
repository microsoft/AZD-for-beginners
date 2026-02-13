# Seu Primeiro Projeto - Tutorial Prático

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Installation & Setup](installation.md)
- **➡️ Próximo**: [Configuration](configuration.md)
- **🚀 Próximo Capítulo**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Bem-vindo ao seu primeiro projeto com Azure Developer CLI! Este tutorial prático abrangente fornece um passo a passo completo para criar, implantar e gerenciar uma aplicação full-stack no Azure usando azd. Você trabalhará com uma aplicação real de todo que inclui um frontend em React, backend API em Node.js e banco de dados MongoDB.

## Objetivos de Aprendizagem

Ao concluir este tutorial, você irá:
- Dominar o fluxo de inicialização de projetos azd usando templates
- Entender a estrutura do projeto Azure Developer CLI e arquivos de configuração
- Executar a implantação completa da aplicação no Azure com provisionamento de infraestrutura
- Implementar atualizações de aplicação e estratégias de reimplantação
- Gerenciar múltiplos ambientes para desenvolvimento e staging
- Aplicar práticas de limpeza de recursos e gerenciamento de custos

## Resultados de Aprendizagem

Ao finalizar, você será capaz de:
- Inicializar e configurar projetos azd a partir de templates de forma independente
- Navegar e modificar estruturas de projetos azd de forma eficaz
- Implantar aplicações full-stack no Azure usando comandos únicos
- Solucionar problemas comuns de implantação e autenticação
- Gerenciar múltiplos ambientes do Azure para diferentes estágios de implantação
- Implementar fluxos de implantação contínua para atualizações de aplicação

## Começando

### Lista de Pré-requisitos
- ✅ Azure Developer CLI instalado ([Installation Guide](installation.md))
- ✅ Azure CLI instalado e autenticado
- ✅ Git instalado no seu sistema
- ✅ Node.js 16+ (para este tutorial)
- ✅ Visual Studio Code (recomendado)

### Verifique sua configuração
```bash
# Verifique a instalação do azd
azd version
```
### Verificar autenticação do Azure

```bash
az account show
```

### Verifique a versão do Node.js
```bash
node --version
```

## Etapa 1: Escolha e Inicialize um Template

Vamos começar com um template popular de aplicação todo que inclui um frontend em React e backend API em Node.js.

```bash
# Navegar pelos modelos disponíveis
azd template list

# Inicializar o modelo do aplicativo de tarefas
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Siga as instruções:
# - Digite um nome de ambiente: "dev"
# - Escolha uma assinatura (se você tiver mais de uma)
# - Escolha uma região: "East US 2" (ou sua região preferida)
```

### O que acabou de acontecer?
- Baixou o código do template para o seu diretório local
- Criou um arquivo `azure.yaml` com definições de serviço
- Configurou o código de infraestrutura no diretório `infra/`
- Criou uma configuração de ambiente

## Etapa 2: Explore a Estrutura do Projeto

Vamos examinar o que o azd criou para nós:

```bash
# Exibir a estrutura do projeto
tree /f   # Windows
# ou
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

### Arquivos Principais para Entender

**azure.yaml** - O coração do seu projeto azd:
```bash
# Visualizar a configuração do projeto
cat azure.yaml
```

**infra/main.bicep** - Definição da infraestrutura:
```bash
# Visualizar o código da infraestrutura
head -30 infra/main.bicep
```

## Etapa 3: Personalize Seu Projeto (Opcional)

Antes de implantar, você pode personalizar a aplicação:

### Modifique o Frontend
```bash
# Abra o componente do aplicativo React
code src/web/src/App.tsx
```

Faça uma alteração simples:
```typescript
// Encontre o título e altere-o
<h1>My Awesome Todo App</h1>
```

### Configure Variáveis de Ambiente
```bash
# Definir variáveis de ambiente personalizadas
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Exibir todas as variáveis de ambiente
azd env get-values
```

## Etapa 4: Implante no Azure

Agora vem a parte empolgante - implante tudo no Azure!

```bash
# Implantar infraestrutura e aplicação
azd up

# Este comando fará:
# 1. Provisionar recursos do Azure (App Service, Cosmos DB, etc.)
# 2. Construir sua aplicação
# 3. Implantar nos recursos provisionados
# 4. Exibir a URL da aplicação
```

### O que está acontecendo durante a implantação?

O comando `azd up` executa estas etapas:
1. **Provision** (`azd provision`) - Cria recursos do Azure
2. **Package** - Compila o código da sua aplicação
3. **Deploy** (`azd deploy`) - Implanta o código nos recursos do Azure

### Saída Esperada
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Etapa 5: Teste sua Aplicação

### Acesse sua Aplicação
Clique na URL fornecida na saída da implantação, ou obtenha-a a qualquer momento:
```bash
# Obter endpoints da aplicação
azd show

# Abra a aplicação no seu navegador
azd show --output json | jq -r '.services.web.endpoint'
```

### Teste a Aplicação Todo
1. **Adicione uma tarefa** - Clique em "Add Todo" e insira uma tarefa
2. **Marcar como concluída** - Marque os itens concluídos
3. **Excluir itens** - Remova tarefas que você não precisa mais

### Monitore sua Aplicação
```bash
# Abrir o portal do Azure para seus recursos
azd monitor

# Exibir logs do aplicativo
azd monitor --logs

# Exibir métricas em tempo real
azd monitor --live
```

## Etapa 6: Faça Alterações e Reimplante

Vamos fazer uma alteração e ver como é fácil atualizar:

### Modifique a API
```bash
# Edite o código da API
code src/api/src/routes/lists.js
```

Adicione um cabeçalho de resposta personalizado:
```javascript
// Encontre um manipulador de rota e adicione:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implemente Apenas as Alterações de Código
```bash
# Implantar apenas o código da aplicação (ignorar infraestrutura)
azd deploy

# Isso é muito mais rápido do que 'azd up' já que a infraestrutura já existe
```

## Etapa 7: Gerencie Múltiplos Ambientes

Crie um ambiente de staging para testar alterações antes da produção:

```bash
# Criar um novo ambiente de homologação
azd env new staging

# Implantar no ambiente de homologação
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

## Etapa 8: Limpe os Recursos

Quando terminar de experimentar, faça a limpeza para evitar cobranças contínuas:

```bash
# Excluir todos os recursos do Azure do ambiente atual
azd down

# Forçar exclusão sem confirmação e purgar recursos excluídos temporariamente
azd down --force --purge

# Excluir ambiente específico
azd env select staging
azd down --force --purge
```

## O que você aprendeu

Parabéns! Você:
- ✅ Inicializou um projeto azd a partir de um template
- ✅ Explorou a estrutura do projeto e arquivos-chave
- ✅ Implantou uma aplicação full-stack no Azure
- ✅ Fez alterações no código e reimplantou
- ✅ Gerenciou múltiplos ambientes
- ✅ Realizou a limpeza dos recursos

## 🎯 Exercícios de Validação de Habilidades

### Exercício 1: Implemente um Template Diferente (15 minutos)
**Objetivo**: Demonstrar domínio do fluxo azd init e de implantação

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
- [ ] A aplicação é implantada sem erros
- [ ] É possível acessar a URL da aplicação no navegador
- [ ] A aplicação funciona corretamente (adicionar/remover tarefas)
- [ ] Todos os recursos foram limpos com sucesso

### Exercício 2: Personalize a Configuração (20 minutos)
**Objetivo**: Praticar a configuração de variáveis de ambiente

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
- [ ] A aplicação é implantada com a configuração personalizada
- [ ] É possível verificar as configurações personalizadas na aplicação implantada

### Exercício 3: Fluxo de Trabalho Multi-Ambiente (25 minutos)
**Objetivo**: Dominar o gerenciamento de ambientes e estratégias de implantação

```bash
# Criar ambiente de desenvolvimento
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Anotar URL do ambiente de desenvolvimento
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Criar ambiente de homologação
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Anotar URL do ambiente de homologação
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Comparar ambientes
azd env list

# Testar ambos os ambientes
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Limpar ambos os ambientes
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Dois ambientes criados com configurações diferentes
- [ ] Ambos os ambientes implantados com sucesso
- [ ] É possível alternar entre ambientes usando `azd env select`
- [ ] As variáveis de ambiente diferem entre os ambientes
- [ ] Ambos os ambientes foram limpos com sucesso

## 📊 Seu Progresso

**Tempo Investido**: ~60-90 minutos  
**Habilidades Adquiridas**:
- ✅ Inicialização de projetos baseada em templates
- ✅ Provisionamento de recursos do Azure
- ✅ Fluxos de implantação de aplicações
- ✅ Gerenciamento de ambientes
- ✅ Gerenciamento de configuração
- ✅ Limpeza de recursos e gerenciamento de custos

**Próximo Nível**: Você está pronto para o [Configuration Guide](configuration.md) para aprender padrões avançados de configuração!

## Solução de Problemas Comuns

### Erros de Autenticação
```bash
# Reautenticar no Azure
az login

# Verificar acesso à assinatura
az account show
```

### Falhas de Implantação
```bash
# Ativar logs de depuração
export AZD_DEBUG=true
azd up --debug

# Visualizar logs do aplicativo no Azure
azd monitor --logs

# Para Container Apps, use a CLI do Azure:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflitos de Nome de Recursos
```bash
# Use um nome de ambiente exclusivo
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Porta/Rede
```bash
# Verificar se as portas estão disponíveis
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Passos

Agora que você concluiu seu primeiro projeto, explore estes tópicos avançados:

### 1. Personalizar a Infraestrutura
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configurar CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Fluxos completos de CI/CD
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuração de pipelines

### 3. Boas Práticas para Produção
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Segurança, desempenho e monitoramento

### 4. Explore mais Templates
```bash
# Navegue pelos modelos por categoria
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Experimente diferentes stacks de tecnologia
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Recursos Adicionais

### Materiais de Aprendizado
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidade e Suporte
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Modelos e Exemplos
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Parabéns por concluir seu primeiro projeto azd!** Você agora está pronto para construir e implantar aplicações incríveis no Azure com confiança.

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Installation & Setup](installation.md)
- **➡️ Próximo**: [Configuration](configuration.md)
- **🚀 Próximo Capítulo**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Próxima Aula**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Isenção de responsabilidade:

Este documento foi traduzido usando o serviço de tradução por IA Co-op Translator (https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a contratação de uma tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->