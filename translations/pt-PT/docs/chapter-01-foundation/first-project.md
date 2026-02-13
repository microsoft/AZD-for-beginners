# O Seu Primeiro Projeto - Tutorial Prático

**Chapter Navigation:**
- **📚 Página do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Arranque Rápido
- **⬅️ Anterior**: [Instalação e Configuração](installation.md)
- **➡️ Seguinte**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introdução

Bem-vindo ao seu primeiro projeto com o Azure Developer CLI! Este tutorial prático e abrangente fornece um passo a passo completo para criar, implantar e gerir uma aplicação full-stack no Azure usando o azd. Vai trabalhar com uma aplicação todo real que inclui um frontend React, um backend API em Node.js e uma base de dados MongoDB.

## Objetivos de Aprendizagem

Ao concluir este tutorial, você irá:
- Dominar o fluxo de inicialização de projetos azd usando modelos
- Compreender a estrutura do projeto Azure Developer CLI e ficheiros de configuração
- Executar a implantação completa da aplicação no Azure com provisão de infraestrutura
- Implementar atualizações da aplicação e estratégias de reimplantação
- Gerir múltiplos ambientes para desenvolvimento e staging
- Aplicar práticas de limpeza de recursos e gestão de custos

## Resultados de Aprendizagem

Após a conclusão, você será capaz de:
- Inicializar e configurar projetos azd a partir de modelos de forma independente
- Navegar e modificar estruturas de projeto azd eficazmente
- Implantar aplicações full-stack no Azure usando comandos únicos
- Resolver problemas comuns de implantação e questões de autenticação
- Gerir múltiplos ambientes Azure para diferentes fases de implantação
- Implementar fluxos de deployment contínuo para atualizações de aplicações

## Começar

### Lista de Pré-requisitos
- ✅ Azure Developer CLI instalado ([Guia de Instalação](installation.md))
- ✅ Azure CLI instalado e autenticado
- ✅ Git instalado no seu sistema
- ✅ Node.js 16+ (para este tutorial)
- ✅ Visual Studio Code (recomendado)

### Verifique a sua Configuração
```bash
# Verificar a instalação do azd
azd version
```
### Verificar autenticação do Azure

```bash
az account show
```

### Verificar versão do Node.js
```bash
node --version
```

## Passo 1: Escolher e Inicializar um Modelo

Comecemos com um modelo popular de aplicação de tarefas (todo) que inclui um frontend React e um backend API em Node.js.

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
# - Escolha uma região: "East US 2" (ou a região que preferir)
```

### O que acabou de acontecer?
- Transferiu o código do modelo para o seu diretório local
- Criou um ficheiro `azure.yaml` com definições de serviços
- Configurou código de infraestrutura no diretório `infra/`
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

### Ficheiros Principais a Compreender

**azure.yaml** - O núcleo do seu projeto azd:
```bash
# Ver a configuração do projeto
cat azure.yaml
```

**infra/main.bicep** - Definição de infraestrutura:
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
# Implementar a infraestrutura e a aplicação
azd up

# Este comando irá:
# 1. Provisionar recursos do Azure (App Service, Cosmos DB, etc.)
# 2. Compilar a sua aplicação
# 3. Implantar nos recursos provisionados
# 4. Exibir a URL da aplicação
```

### O que está a acontecer durante a implantação?

O comando `azd up` executa estes passos:
1. **Provisionar** (`azd provision`) - Cria recursos no Azure
2. **Empacotar** - Compila o código da sua aplicação
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

### Aceder à Sua Aplicação
Clique na URL fornecida na saída da implantação, ou obtenha-a a qualquer momento:
```bash
# Obter endpoints da aplicação
azd show

# Abra a aplicação no seu navegador
azd show --output json | jq -r '.services.web.endpoint'
```

### Testar a Aplicação de Tarefas
1. **Adicionar um item** - Clique em "Adicionar Tarefa" e introduza uma tarefa
2. **Marcar como concluído** - Assinale os itens concluídos
3. **Eliminar itens** - Remova tarefas que já não necessita

### Monitorizar a Sua Aplicação
```bash
# Abrir o portal do Azure para os seus recursos
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
# Editar o código da API
code src/api/src/routes/lists.js
```

Adicionar um cabeçalho de resposta personalizado:
```javascript
// Encontre um manipulador de rota e adicione:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implantar Apenas as Alterações de Código
```bash
# Implantar apenas o código da aplicação (omitir a infraestrutura)
azd deploy

# Isto é muito mais rápido do que 'azd up' pois a infraestrutura já existe
```

## Passo 7: Gerir Múltiplos Ambientes

Crie um ambiente de staging para testar alterações antes da produção:

```bash
# Criar um novo ambiente de staging
azd env new staging

# Implantar no ambiente de staging
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

# Ver ambiente de pré-produção
azd env select staging
azd show
```

## Passo 8: Limpar Recursos

Quando terminar de experimentar, limpe para evitar encargos contínuos:

```bash
# Eliminar todos os recursos do Azure para o ambiente atual
azd down

# Forçar a eliminação sem confirmação e purgar recursos eliminados temporariamente
azd down --force --purge

# Eliminar um ambiente específico
azd env select staging
azd down --force --purge
```

## O que Aprendeu

Parabéns! Concluiu com sucesso:
- ✅ Inicializou um projeto azd a partir de um modelo
- ✅ Explorou a estrutura do projeto e os ficheiros principais
- ✅ Implantou uma aplicação full-stack no Azure
- ✅ Fez alterações de código e reimplantou
- ✅ Geriu múltiplos ambientes
- ✅ Limpou recursos

## 🎯 Exercícios de Validação de Competências

### Exercício 1: Implantar um Modelo Diferente (15 minutos)
**Objetivo**: Demonstrar domínio do fluxo de inicialização e implantação do azd

```bash
# Experimentar a stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verificar a implementação
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] A aplicação é implantada sem erros
- [ ] Consegue aceder à URL da aplicação no navegador
- [ ] A aplicação funciona corretamente (adicionar/remover tarefas)
- [ ] Eliminou com sucesso todos os recursos

### Exercício 2: Personalizar Configuração (20 minutos)
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
- [ ] A aplicação é implantada com configuração personalizada
- [ ] Consegue verificar as definições personalizadas na aplicação implantada

### Exercício 3: Fluxo de Trabalho Multi-Ambiente (25 minutos)
**Objetivo**: Dominar a gestão de ambientes e estratégias de implantação

```bash
# Criar ambiente de desenvolvimento
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Anotar a URL do ambiente de desenvolvimento
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Criar ambiente de homologação
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Anotar a URL do ambiente de homologação
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Comparar os ambientes
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
- [ ] Consegue alternar entre ambientes usando `azd env select`
- [ ] As variáveis de ambiente diferem entre ambientes
- [ ] Limpou ambos os ambientes com sucesso

## 📊 O Seu Progresso

**Tempo Investido**: ~60-90 minutos  
**Competências Adquiridas**:
- ✅ Inicialização de projeto baseada em modelos
- ✅ Provisão de recursos Azure
- ✅ Fluxos de implantação de aplicações
- ✅ Gestão de ambientes
- ✅ Gestão de configuração
- ✅ Limpeza de recursos e gestão de custos

**Próximo Nível**: Está pronto para o [Guia de Configuração](configuration.md) para aprender padrões avançados de configuração!

## Resolução de Problemas Comuns

### Erros de Autenticação
```bash
# Reautenticar no Azure
az login

# Verificar o acesso à subscrição
az account show
```

### Falhas de Implantação
```bash
# Ativar registo de depuração
export AZD_DEBUG=true
azd up --debug

# Ver registos da aplicação no Azure
azd monitor --logs

# Para Container Apps, utilize a CLI do Azure:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflitos de Nomes de Recursos
```bash
# Use um nome de ambiente único
azd env new dev-$(whoami)-$(date +%s)
```

### Problemas de Porta/Rede
```bash
# Verificar se as portas estão disponíveis
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Passos

Agora que completou o seu primeiro projeto, explore estes tópicos avançados:

### 1. Personalizar Infraestrutura
- [Infraestrutura como Código](../chapter-04-infrastructure/provisioning.md)
- [Adicionar bases de dados, armazenamento e outros serviços](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Configurar CI/CD
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) - Fluxos de CI/CD completos
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Configuração de pipelines

### 3. Melhores Práticas para Produção
- [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md) - Segurança, desempenho e monitorização

### 4. Explorar Mais Modelos
```bash
# Explorar modelos por categoria
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
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Comunidade e Suporte
- [GitHub do Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Comunidade de Desenvolvedores Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Modelos e Exemplos
- [Galeria Oficial de Modelos](https://azure.github.io/awesome-azd/)
- [Modelos da Comunidade](https://github.com/Azure-Samples/azd-templates)
- [Padrões Empresariais](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Parabéns por concluir o seu primeiro projeto com o azd!** Agora está pronto para construir e implantar aplicações incríveis no Azure com confiança.

---

**Chapter Navigation:**
- **📚 Página do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos e Arranque Rápido
- **⬅️ Anterior**: [Instalação e Configuração](installation.md)
- **➡️ Seguinte**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com IA em Primeiro Lugar](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Próxima Aula**: [Guia de Implantação](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Isenção de responsabilidade**:
Este documento foi traduzido utilizando o serviço de tradução por inteligência artificial [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos empenhemos em garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritativa. Para informação crítica, recomenda-se a tradução profissional por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas que decorram da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->