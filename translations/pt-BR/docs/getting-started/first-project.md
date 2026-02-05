# Seu Primeiro Projeto - Tutorial Prático

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Próximo**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../microsoft-foundry/microsoft-foundry-integration.md)

## Introdução

Bem-vindo ao seu primeiro projeto com o Azure Developer CLI! Este tutorial prático oferece um guia completo para criar, implantar e gerenciar uma aplicação full-stack no Azure usando o azd. Você trabalhará com um aplicativo real de lista de tarefas que inclui um frontend em React, um backend API em Node.js e um banco de dados MongoDB.

## Objetivos de Aprendizado

Ao concluir este tutorial, você será capaz de:
- Dominar o fluxo de inicialização de projetos azd usando templates
- Compreender a estrutura de projetos e arquivos de configuração do Azure Developer CLI
- Executar a implantação completa de uma aplicação no Azure com provisionamento de infraestrutura
- Implementar atualizações na aplicação e estratégias de reimplantação
- Gerenciar múltiplos ambientes para desenvolvimento e testes
- Aplicar práticas de limpeza de recursos e gerenciamento de custos

## Resultados de Aprendizado

Após a conclusão, você será capaz de:
- Inicializar e configurar projetos azd a partir de templates de forma independente
- Navegar e modificar estruturas de projetos azd de maneira eficaz
- Implantar aplicações full-stack no Azure com comandos simples
- Solucionar problemas comuns de implantação e autenticação
- Gerenciar múltiplos ambientes Azure para diferentes estágios de implantação
- Implementar fluxos de implantação contínua para atualizações de aplicações

## Começando

### Lista de Pré-requisitos
- ✅ Azure Developer CLI instalado ([Guia de Instalação](installation.md))
- ✅ Azure CLI instalado e autenticado
- ✅ Git instalado no seu sistema
- ✅ Node.js 16+ (para este tutorial)
- ✅ Visual Studio Code (recomendado)

### Verifique sua Configuração
```bash
# Verificar a instalação do azd
azd version
```
### Verificar autenticação no Azure

```bash
az account show
```

### Verificar versão do Node.js
```bash
node --version
```

## Passo 1: Escolha e Inicialize um Template

Vamos começar com um template popular de aplicação de lista de tarefas que inclui um frontend em React e um backend API em Node.js.

```bash
# Navegar pelos modelos disponíveis
azd template list

# Inicializar o modelo de aplicativo de tarefas
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Siga as instruções:
# - Insira um nome para o ambiente: "dev"
# - Escolha uma assinatura (se você tiver várias)
# - Escolha uma região: "East US 2" (ou sua região preferida)
```

### O que acabou de acontecer?
- O código do template foi baixado para o seu diretório local
- Um arquivo `azure.yaml` foi criado com definições de serviços
- O código de infraestrutura foi configurado no diretório `infra/`
- Uma configuração de ambiente foi criada

## Passo 2: Explore a Estrutura do Projeto

Vamos examinar o que o azd criou para nós:

```bash
# Visualizar a estrutura do projeto
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

### Arquivos Principais para Compreender

**azure.yaml** - O coração do seu projeto azd:
```bash
# Visualizar a configuração do projeto
cat azure.yaml
```

**infra/main.bicep** - Definição da infraestrutura:
```bash
# Visualizar o código de infraestrutura
head -30 infra/main.bicep
```

## Passo 3: Personalize Seu Projeto (Opcional)

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
# Visualizar todas as variáveis de ambiente
azd env get-values
```

## Passo 4: Implante no Azure

Agora vem a parte emocionante - implantar tudo no Azure!

```bash
# Implantar infraestrutura e aplicação
azd up

# Este comando irá:
# 1. Provisionar recursos do Azure (App Service, Cosmos DB, etc.)
# 2. Construir sua aplicação
# 3. Implantar nos recursos provisionados
# 4. Exibir a URL da aplicação
```

### O que está acontecendo durante a implantação?

O comando `azd up` executa estas etapas:
1. **Provisionar** (`azd provision`) - Cria os recursos no Azure
2. **Empacotar** - Compila o código da sua aplicação
3. **Implantar** (`azd deploy`) - Implanta o código nos recursos do Azure

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
Clique no URL fornecido na saída da implantação ou acesse a qualquer momento:
```bash
# Obter endpoints da aplicação
azd show

# Abrir a aplicação no seu navegador
azd show --output json | jq -r '.services.web.endpoint'
```

### Teste o App de Lista de Tarefas
1. **Adicione um item à lista** - Clique em "Add Todo" e insira uma tarefa
2. **Marque como concluído** - Marque os itens concluídos
3. **Exclua itens** - Remova tarefas que não são mais necessárias

### Monitore Sua Aplicação
```bash
# Abra o portal do Azure para seus recursos
azd monitor

# Visualizar logs de aplicação
azd logs
```

## Passo 6: Faça Alterações e Reimplante

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

### Implante Apenas as Alterações no Código
```bash
# Implante apenas o código do aplicativo (pule a infraestrutura)
azd deploy

# Isso é muito mais rápido do que 'azd up' já que a infraestrutura já existe
```

## Passo 7: Gerencie Múltiplos Ambientes

Crie um ambiente de teste para validar alterações antes da produção:

```bash
# Criar um novo ambiente de preparação
azd env new staging

# Implantar na preparação
azd up

# Voltar para o ambiente de desenvolvimento
azd env select dev

# Listar todos os ambientes
azd env list
```

### Comparação de Ambientes
```bash
# Visualizar ambiente de desenvolvimento
azd env select dev
azd show

# Visualizar ambiente de homologação
azd env select staging
azd show
```

## Passo 8: Limpe os Recursos

Quando terminar de experimentar, limpe os recursos para evitar cobranças contínuas:

```bash
# Excluir todos os recursos do Azure para o ambiente atual
azd down

# Forçar exclusão sem confirmação e purgar recursos excluídos temporariamente
azd down --force --purge

# Excluir ambiente específico
azd env select staging
azd down --force --purge
```

## O que Você Aprendeu

Parabéns! Você conseguiu:
- ✅ Inicializar um projeto azd a partir de um template
- ✅ Explorar a estrutura do projeto e os arquivos principais
- ✅ Implantar uma aplicação full-stack no Azure
- ✅ Fazer alterações no código e reimplantar
- ✅ Gerenciar múltiplos ambientes
- ✅ Limpar os recursos

## 🎯 Exercícios de Validação de Habilidades

### Exercício 1: Implante um Template Diferente (15 minutos)
**Objetivo**: Demonstrar domínio do fluxo de inicialização e implantação do azd

```bash
# Experimente a pilha Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifique a implantação
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] Aplicação implantada sem erros
- [ ] URL da aplicação acessível no navegador
- [ ] Aplicação funcionando corretamente (adicionar/remover tarefas)
- [ ] Todos os recursos limpos com sucesso

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
- [ ] Variáveis de ambiente configuradas e acessíveis
- [ ] Aplicação implantada com configuração personalizada
- [ ] Configurações personalizadas verificadas na aplicação implantada

### Exercício 3: Fluxo de Trabalho com Múltiplos Ambientes (25 minutos)
**Objetivo**: Dominar o gerenciamento de ambientes e estratégias de implantação

```bash
# Criar ambiente de desenvolvimento
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Anotar URL de desenvolvimento
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Criar ambiente de homologação
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Anotar URL de homologação
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
- [ ] Capacidade de alternar entre ambientes usando `azd env select`
- [ ] Variáveis de ambiente diferentes entre os ambientes
- [ ] Ambos os ambientes limpos com sucesso

## 📊 Seu Progresso

**Tempo Investido**: ~60-90 minutos  
**Habilidades Adquiridas**:
- ✅ Inicialização de projetos baseados em templates
- ✅ Provisionamento de recursos no Azure
- ✅ Fluxos de trabalho de implantação de aplicações
- ✅ Gerenciamento de ambientes
- ✅ Gerenciamento de configurações
- ✅ Limpeza de recursos e gerenciamento de custos

**Próximo Nível**: Você está pronto para o [Guia de Configuração](configuration.md) e aprender padrões avançados de configuração!

## Solução de Problemas Comuns

### Erros de Autenticação
```bash
# Reautenticar com Azure
az login

# Verificar acesso à assinatura
az account show
```

### Falhas na Implantação
```bash
# Ativar registro de depuração
export AZD_DEBUG=true
azd up --debug

# Visualizar logs detalhados
azd logs --service api
azd logs --service web
```

### Conflitos de Nome de Recursos
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

Agora que você concluiu seu primeiro projeto, explore estes tópicos avançados:

### 1. Personalize a Infraestrutura
- [Infraestrutura como Código](../deployment/provisioning.md)
- [Adicione bancos de dados, armazenamento e outros serviços](../deployment/provisioning.md#adding-services)

### 2. Configure CI/CD
- [Integração com GitHub Actions](../deployment/cicd-integration.md)
- [Pipelines do Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. Melhores Práticas para Produção
- [Configurações de segurança](../deployment/best-practices.md#security)
- [Otimização de desempenho](../deployment/best-practices.md#performance)
- [Monitoramento e logs](../deployment/best-practices.md#monitoring)

### 4. Explore Mais Templates
```bash
# Navegue por modelos por categoria
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Experimente diferentes pilhas de tecnologia
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Recursos Adicionais

### Materiais de Aprendizado
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Framework Bem-Arquitetado do Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidade & Suporte
- [GitHub do Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Comunidade de Desenvolvedores Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Exemplos
- [Galeria Oficial de Templates](https://azure.github.io/awesome-azd/)
- [Templates da Comunidade](https://github.com/Azure-Samples/azd-templates)
- [Padrões Empresariais](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Parabéns por concluir seu primeiro projeto azd!** Agora você está pronto para criar e implantar aplicações incríveis no Azure com confiança.

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Próximo**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../microsoft-foundry/microsoft-foundry-integration.md)
- **Próxima Aula**: [Guia de Implantação](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->