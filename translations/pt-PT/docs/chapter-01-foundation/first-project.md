# O Seu Primeiro Projeto - Tutorial Prático

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Seguinte**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Bem-vindo ao seu primeiro projeto com Azure Developer CLI! Este tutorial prático abrangente oferece um percurso completo para criar, implantar e gerir uma aplicação full-stack no Azure usando o azd. Vai trabalhar com uma aplicação real de lista de tarefas que inclui uma interface React, backend API Node.js e base de dados MongoDB.

## Objetivos de Aprendizagem

Ao completar este tutorial, irá:
- Dominar o fluxo de trabalho de inicialização de projeto azd usando templates
- Compreender a estrutura do projeto Azure Developer CLI e os ficheiros de configuração
- Executar a implantação completa da aplicação no Azure com provisão da infraestrutura
- Implementar atualizações da aplicação e estratégias de reimplantação
- Gerir múltiplos ambientes para desenvolvimento e testes
- Aplicar práticas de limpeza de recursos e gestão de custos

## Resultados de Aprendizagem

Após a conclusão, será capaz de:
- Inicializar e configurar projetos azd a partir de templates de forma independente
- Navegar e modificar estruturas de projeto azd eficazmente
- Implantar aplicações full-stack no Azure usando comandos únicos
- Resolver problemas comuns de implantação e autenticação
- Gerir múltiplos ambientes Azure para diferentes estágios de implantação
- Implementar fluxos de trabalho de implantação contínua para atualizações de aplicações

## Começar

### Lista de Pré-requisitos
- ✅ Azure Developer CLI instalado ([Guia de Instalação](installation.md))
- ✅ Autenticação AZD completada com `azd auth login`
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

# Verificar a autenticação do AZD
azd auth login --check-status
```

### Verifique a autenticação opcional Azure CLI

```bash
az account show
```

### Verifique a versão do Node.js
```bash
node --version
```

## Passo 1: Escolher e Inicializar um Template

Vamos começar com um template popular de aplicação de lista de tarefas que inclui frontend React e backend API Node.js.

```bash
# Navegar pelos modelos disponíveis
azd template list

# Inicializar o modelo da aplicação de tarefas
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Siga as indicações:
# - Introduza um nome para o ambiente: "dev"
# - Escolha uma subscrição (se tiver várias)
# - Escolha uma região: "East US 2" (ou a sua região preferida)
```

### O que Aconteceu?
- Transferiu o código do template para o seu diretório local
- Criou um ficheiro `azure.yaml` com definições de serviço
- Configurou o código infraestrutura na diretoria `infra/`
- Criou uma configuração de ambiente

## Passo 2: Explorar a Estrutura do Projeto

Vamos examinar o que o azd criou para nós:

```bash
# Ver a estrutura do projeto
tree /f   # Windows
# ou
find . -type f | head -20   # macOS/Linux
```

Deverá ver:
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

**azure.yaml** - O núcleo do seu projeto azd:
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

Antes de implantar, pode personalizar a aplicação:

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

## Passo 4: Implantar no Azure

Agora a parte emocionante - implantar tudo no Azure!

```bash
# Implementar infraestrutura e aplicação
azd up

# Este comando irá:
# 1. Provisionar recursos Azure (App Service, Cosmos DB, etc.)
# 2. Construir a sua aplicação
# 3. Fazer deploy para os recursos provisionados
# 4. Mostrar a URL da aplicação
```

### O que Acontece Durante a Implantação?

O comando `azd up` realiza estes passos:
1. **Provisionar** (`azd provision`) - Cria recursos Azure
2. **Empacotar** - Compila o código da aplicação
3. **Implantar** (`azd deploy`) - Implanta o código nos recursos Azure

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

### Aceda à Sua Aplicação
Clique no URL fornecido na saída da implantação, ou obtenha-o a qualquer momento:
```bash
# Obter endpoints da aplicação
azd show

# Abrir a aplicação no seu navegador
azd show --output json | jq -r '.services.web.endpoint'
```

### Testar a App de Lista de Tarefas
1. **Adicionar uma tarefa** - Clique "Add Todo" e insira uma tarefa
2. **Marcar como concluída** - Selecione as tarefas concluídas
3. **Eliminar tarefas** - Remova tarefas que já não precisa

### Monitorizar a Sua Aplicação
```bash
# Abrir portal Azure para os seus recursos
azd monitor

# Ver registos da aplicação
azd monitor --logs

# Ver métricas em tempo real
azd monitor --live
```

## Passo 6: Fazer Alterações e Reimplantar

Vamos fazer uma alteração e ver como é fácil atualizar:

### Modificar a API
```bash
# Edite o código da API
code src/api/src/routes/lists.js
```

Adicione um cabeçalho de resposta personalizado:
```javascript
// Encontre um manipulador de rota e adicione:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implantar Apenas as Alterações do Código
```bash
# Implantar apenas o código da aplicação (ignorar infraestrutura)
azd deploy

# Isto é muito mais rápido do que 'azd up' uma vez que a infraestrutura já existe
```

## Passo 7: Gerir Múltiplos Ambientes

Crie um ambiente de staging para testar alterações antes da produção:

```bash
# Criar um novo ambiente de preparação
azd env new staging

# Fazer deploy para preparação
azd up

# Voltar ao ambiente de desenvolvimento
azd env select dev

# Listar todos os ambientes
azd env list
```

### Comparação dos Ambientes
```bash
# Ver ambiente de desenvolvimento
azd env select dev
azd show

# Ver ambiente de pré-produção
azd env select staging
azd show
```

## Passo 8: Limpar Recursos

Quando terminar de experimentar, faça limpeza para evitar cobranças contínuas:

```bash
# Eliminar todos os recursos Azure para o ambiente atual
azd down

# Forçar a eliminação sem confirmação e limpar recursos eliminados temporariamente
azd down --force --purge

# Eliminar ambiente específico
azd env select staging
azd down --force --purge
```

## Aplicação Clássica vs. Aplicação AI-Powered: Mesmo Fluxo de Trabalho

Acabou de implantar uma aplicação web tradicional. Mas e se quiser implantar uma aplicação alimentada por IA - por exemplo, uma aplicação de chat apoiada por Microsoft Foundry Models?

A boa notícia: **o fluxo de trabalho é idêntico.**

| Passo | App Todo Clássica | App Chat AI |
|------|-------------------|-------------|
| Inicializar | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autenticar | `azd auth login` | `azd auth login` |
| Implantar | `azd up` | `azd up` |
| Monitorizar | `azd monitor` | `azd monitor` |
| Limpar | `azd down --force --purge` | `azd down --force --purge` |

A única diferença é o **template** de partida. Um template de IA inclui infraestrutura adicional (como um recurso Microsoft Foundry Models ou um índice AI Search), mas o azd trata de tudo isso para si. Não precisa de aprender novos comandos, adotar outra ferramenta, ou mudar a forma como pensa na implantação.

Este é o princípio central do azd: **um fluxo de trabalho, qualquer carga de trabalho.** As competências que praticou neste tutorial—inicializar, implantar, monitorizar, reimplantar e limpar—aplicam-se igualmente a aplicações e agentes AI.

---

## O que Aprendeu

Parabéns! Conseguiu:
- ✅ Inicializar um projeto azd a partir de um template
- ✅ Explorar a estrutura do projeto e ficheiros-chave
- ✅ Implantar uma aplicação full-stack no Azure
- ✅ Fazer alterações no código e reimplantar
- ✅ Gerir múltiplos ambientes
- ✅ Limpar recursos

## 🎯 Exercícios de Validação de Competências

### Exercício 1: Implantar um Template Diferente (15 minutos)
**Objetivo**: Demonstrar domínio do azd init e fluxo de implantação

```bash
# Experimente a stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verificar implantação
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Aplicação implantada sem erros
- [ ] Acesso ao URL da aplicação no navegador
- [ ] Aplicação funciona corretamente (adicionar/remoção de tarefas)
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

# Implementar com configuração personalizada
azd up
```

**Critérios de Sucesso:**
- [ ] Ambiente personalizado criado com sucesso
- [ ] Variáveis de ambiente definidas e recuperáveis
- [ ] Aplicação implantada com configuração personalizada
- [ ] Configurações personalizadas verificadas na app implantada

### Exercício 3: Fluxo Multi-Ambiente (25 minutos)
**Objetivo**: Dominar gestão de ambientes e estratégias de implantação

```bash
# Criar ambiente de desenvolvimento
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Anotar URL de desenvolvimento
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Criar ambiente de pré-produção
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Anotar URL de pré-produção
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
- [ ] Ambos os ambientes implantados com sucesso
- [ ] Capaz de alternar entre ambientes usando `azd env select`
- [ ] Variáveis de ambiente diferem entre ambientes
- [ ] Limpeza bem sucedida de ambos ambientes

## 📊 O Seu Progresso

**Tempo Investido**: ~60-90 minutos  
**Competências Adquiridas**:
- ✅ Inicialização de projeto baseada em template
- ✅ Provisão de recursos Azure
- ✅ Fluxos de trabalho de implantação de aplicações
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

### Falhas na Implantação
```bash
# Ativar o registo de depuração
export AZD_DEBUG=true
azd up --debug

# Ver os registos da aplicação no Azure
azd monitor --logs

# Para Container Apps, use o Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflitos de Nome de Recurso
```bash
# Use um nome de ambiente único
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Porta/Rede
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
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) - Fluxos completos de CI/CD
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuração de pipelines

### 3. Melhores Práticas para Produção
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) - Segurança, performance e monitorização

### 4. Explore Mais Templates
```bash
# Navegar por modelos por categoria
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Experimentar diferentes pilhas tecnológicas
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
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
- [Templates da Comunidade](https://github.com/Azure-Samples/azd-templates)
- [Padrões Empresariais](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Parabéns por completar o seu primeiro projeto azd!** Agora está pronto para construir e implantar aplicações incríveis no Azure com confiança.

---

**Navegação do Capítulo:**
- **📚 Início do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Seguinte**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Próxima Lição**: [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos por garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->