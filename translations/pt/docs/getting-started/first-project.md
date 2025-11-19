<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-19T20:07:52+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "pt"
}
-->
# O Seu Primeiro Projeto - Tutorial Prático

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Próximo**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../microsoft-foundry/microsoft-foundry-integration.md)

## Introdução

Bem-vindo ao seu primeiro projeto com o Azure Developer CLI! Este tutorial prático e abrangente oferece um guia completo para criar, implementar e gerir uma aplicação full-stack no Azure utilizando o azd. Vai trabalhar com uma aplicação real de lista de tarefas (todo) que inclui um frontend em React, um backend API em Node.js e uma base de dados MongoDB.

## Objetivos de Aprendizagem

Ao concluir este tutorial, irá:
- Dominar o fluxo de inicialização de projetos azd utilizando templates
- Compreender a estrutura de projetos e ficheiros de configuração do Azure Developer CLI
- Executar a implementação completa de uma aplicação no Azure com provisionamento de infraestrutura
- Implementar atualizações na aplicação e estratégias de reimplantação
- Gerir múltiplos ambientes para desenvolvimento e testes
- Aplicar práticas de limpeza de recursos e gestão de custos

## Resultados de Aprendizagem

Após a conclusão, será capaz de:
- Inicializar e configurar projetos azd a partir de templates de forma independente
- Navegar e modificar estruturas de projetos azd de forma eficaz
- Implementar aplicações full-stack no Azure com comandos simples
- Resolver problemas comuns de implementação e autenticação
- Gerir múltiplos ambientes Azure para diferentes fases de implementação
- Implementar fluxos de implantação contínua para atualizações de aplicações

## Começando

### Lista de Verificação de Pré-requisitos
- ✅ Azure Developer CLI instalado ([Guia de Instalação](installation.md))
- ✅ Azure CLI instalado e autenticado
- ✅ Git instalado no seu sistema
- ✅ Node.js 16+ (para este tutorial)
- ✅ Visual Studio Code (recomendado)

### Verificar a Configuração
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

## Passo 1: Escolher e Inicializar um Template

Vamos começar com um template popular de aplicação de lista de tarefas que inclui um frontend em React e um backend API em Node.js.

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
# - Escolha uma região: "Leste dos EUA 2" (ou a sua região preferida)
```

### O Que Aconteceu?
- O código do template foi descarregado para o seu diretório local
- Foi criado um ficheiro `azure.yaml` com definições de serviços
- O código de infraestrutura foi configurado no diretório `infra/`
- Foi criada uma configuração de ambiente

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

## Passo 4: Implementar no Azure

Agora vem a parte emocionante - implementar tudo no Azure!

```bash
# Implementar infraestrutura e aplicação
azd up

# Este comando irá:
# 1. Provisionar recursos do Azure (App Service, Cosmos DB, etc.)
# 2. Construir a sua aplicação
# 3. Implementar nos recursos provisionados
# 4. Exibir o URL da aplicação
```

### O Que Acontece Durante a Implementação?

O comando `azd up` realiza os seguintes passos:
1. **Provisionar** (`azd provision`) - Cria os recursos no Azure
2. **Empacotar** - Compila o código da sua aplicação
3. **Implementar** (`azd deploy`) - Implementa o código nos recursos do Azure

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
Clique no URL fornecido no resultado da implementação ou obtenha-o a qualquer momento:
```bash
# Obter os endpoints da aplicação
azd show

# Abrir a aplicação no seu navegador
azd show --output json | jq -r '.services.web.endpoint'
```

### Testar a Aplicação de Lista de Tarefas
1. **Adicionar um item à lista** - Clique em "Add Todo" e insira uma tarefa
2. **Marcar como concluído** - Assinale os itens concluídos
3. **Eliminar itens** - Remova tarefas que já não precisa

### Monitorizar a Sua Aplicação
```bash
# Abrir o portal Azure para os seus recursos
azd monitor

# Ver registos da aplicação
azd logs
```

## Passo 6: Fazer Alterações e Reimplementar

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

### Implementar Apenas as Alterações no Código
```bash
# Implementar apenas o código da aplicação (ignorar infraestrutura)
azd deploy

# Isto é muito mais rápido do que 'azd up' uma vez que a infraestrutura já existe
```

## Passo 7: Gerir Múltiplos Ambientes

Crie um ambiente de teste para verificar alterações antes de as colocar em produção:

```bash
# Criar um novo ambiente de staging
azd env new staging

# Implementar no staging
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

# Ver ambiente de teste
azd env select staging
azd show
```

## Passo 8: Limpar Recursos

Quando terminar de experimentar, limpe os recursos para evitar custos contínuos:

```bash
# Eliminar todos os recursos do Azure para o ambiente atual
azd down

# Forçar eliminação sem confirmação e purgar recursos eliminados temporariamente
azd down --force --purge

# Eliminar ambiente específico
azd env select staging
azd down --force --purge
```

## O Que Aprendeu

Parabéns! Conseguiu:
- ✅ Inicializar um projeto azd a partir de um template
- ✅ Explorar a estrutura do projeto e os ficheiros principais
- ✅ Implementar uma aplicação full-stack no Azure
- ✅ Fazer alterações no código e reimplementar
- ✅ Gerir múltiplos ambientes
- ✅ Limpar recursos

## 🎯 Exercícios de Validação de Competências

### Exercício 1: Implementar um Template Diferente (15 minutos)
**Objetivo**: Demonstrar domínio do fluxo de inicialização e implementação do azd

```bash
# Experimente a stack Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifique a implementação
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Limpar
azd down --force --purge
```

**Critérios de Sucesso:**
- [ ] A aplicação é implementada sem erros
- [ ] É possível aceder ao URL da aplicação no navegador
- [ ] A aplicação funciona corretamente (adicionar/remover tarefas)
- [ ] Todos os recursos foram limpos com sucesso

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

# Implementar com configuração personalizada
azd up
```

**Critérios de Sucesso:**
- [ ] Ambiente personalizado criado com sucesso
- [ ] Variáveis de ambiente configuradas e acessíveis
- [ ] A aplicação é implementada com a configuração personalizada
- [ ] É possível verificar as definições personalizadas na aplicação implementada

### Exercício 3: Fluxo de Trabalho com Múltiplos Ambientes (25 minutos)
**Objetivo**: Dominar a gestão de ambientes e estratégias de implementação

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
- [ ] É possível alternar entre ambientes usando `azd env select`
- [ ] As variáveis de ambiente diferem entre os ambientes
- [ ] Ambos os ambientes foram limpos com sucesso

## 📊 O Seu Progresso

**Tempo Investido**: ~60-90 minutos  
**Competências Adquiridas**:
- ✅ Inicialização de projetos baseados em templates
- ✅ Provisionamento de recursos Azure
- ✅ Fluxos de trabalho de implementação de aplicações
- ✅ Gestão de ambientes
- ✅ Gestão de configurações
- ✅ Limpeza de recursos e gestão de custos

**Próximo Nível**: Está pronto para o [Guia de Configuração](configuration.md) para aprender padrões avançados de configuração!

## Resolução de Problemas Comuns

### Erros de Autenticação
```bash
# Reautenticar com o Azure
az login

# Verificar acesso à subscrição
az account show
```

### Falhas na Implementação
```bash
# Ativar registo de depuração
export AZD_DEBUG=true
azd up --debug

# Ver registos detalhados
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
# Verificar se as portas estão disponíveis
netstat -an | grep :3000
netstat -an | grep :3100
```

## Próximos Passos

Agora que concluiu o seu primeiro projeto, explore estes tópicos avançados:

### 1. Personalizar Infraestrutura
- [Infraestrutura como Código](../deployment/provisioning.md)
- [Adicionar bases de dados, armazenamento e outros serviços](../deployment/provisioning.md#adding-services)

### 2. Configurar CI/CD
- [Integração com GitHub Actions](../deployment/cicd-integration.md)
- [Pipelines do Azure DevOps](../deployment/cicd-integration.md#azure-devops)

### 3. Melhores Práticas para Produção
- [Configurações de segurança](../deployment/best-practices.md#security)
- [Otimização de desempenho](../deployment/best-practices.md#performance)
- [Monitorização e registo](../deployment/best-practices.md#monitoring)

### 4. Explorar Mais Templates
```bash
# Navegar por modelos por categoria
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Experimentar diferentes pilhas de tecnologia
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Recursos Adicionais

### Materiais de Aprendizagem
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

**Parabéns por concluir o seu primeiro projeto azd!** Agora está pronto para criar e implementar aplicações incríveis no Azure com confiança.

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Instalação & Configuração](installation.md)
- **➡️ Próximo**: [Configuração](configuration.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../microsoft-foundry/microsoft-foundry-integration.md)
- **Próxima Aula**: [Guia de Implementação](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->