<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "88986b920b82d096f82d6583f5e0a6e6",
  "translation_date": "2025-09-17T14:49:20+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "pt"
}
-->
# AZD Básico - Compreender o Azure Developer CLI

# AZD Básico - Conceitos e Fundamentos Essenciais

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido
- **⬅️ Anterior**: [Visão Geral do Curso](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Próximo**: [Instalação & Configuração](installation.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../ai-foundry/azure-ai-foundry-integration.md)

## Introdução

Esta lição apresenta o Azure Developer CLI (azd), uma ferramenta poderosa de linha de comando que acelera a sua jornada desde o desenvolvimento local até a implementação no Azure. Você aprenderá os conceitos fundamentais, os recursos principais e entenderá como o azd simplifica a implementação de aplicações nativas na nuvem.

## Objetivos de Aprendizagem

Ao final desta lição, você será capaz de:
- Compreender o que é o Azure Developer CLI e seu propósito principal
- Aprender os conceitos essenciais de templates, ambientes e serviços
- Explorar os recursos principais, incluindo desenvolvimento orientado por templates e Infraestrutura como Código
- Entender a estrutura e o fluxo de trabalho de projetos azd
- Estar preparado para instalar e configurar o azd no seu ambiente de desenvolvimento

## Resultados de Aprendizagem

Após concluir esta lição, você será capaz de:
- Explicar o papel do azd nos fluxos de trabalho modernos de desenvolvimento na nuvem
- Identificar os componentes da estrutura de um projeto azd
- Descrever como templates, ambientes e serviços funcionam em conjunto
- Compreender os benefícios da Infraestrutura como Código com azd
- Reconhecer diferentes comandos do azd e seus propósitos

## O que é o Azure Developer CLI (azd)?

O Azure Developer CLI (azd) é uma ferramenta de linha de comando projetada para acelerar sua jornada desde o desenvolvimento local até a implementação no Azure. Ele simplifica o processo de criação, implementação e gestão de aplicações nativas na nuvem no Azure.

## Conceitos Essenciais

### Templates
Os templates são a base do azd. Eles contêm:
- **Código da aplicação** - Seu código-fonte e dependências
- **Definições de infraestrutura** - Recursos do Azure definidos em Bicep ou Terraform
- **Arquivos de configuração** - Configurações e variáveis de ambiente
- **Scripts de implementação** - Fluxos de trabalho automatizados de implementação

### Ambientes
Os ambientes representam diferentes alvos de implementação:
- **Desenvolvimento** - Para testes e desenvolvimento
- **Staging** - Ambiente de pré-produção
- **Produção** - Ambiente de produção ao vivo

Cada ambiente mantém seu próprio:
- Grupo de recursos do Azure
- Configurações específicas
- Estado de implementação

### Serviços
Os serviços são os blocos de construção da sua aplicação:
- **Frontend** - Aplicações web, SPAs
- **Backend** - APIs, microsserviços
- **Base de dados** - Soluções de armazenamento de dados
- **Armazenamento** - Armazenamento de arquivos e blobs

## Recursos Principais

### 1. Desenvolvimento Orientado por Templates
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infraestrutura como Código
- **Bicep** - Linguagem específica do Azure
- **Terraform** - Ferramenta de infraestrutura multi-nuvem
- **Templates ARM** - Templates do Azure Resource Manager

### 3. Fluxos de Trabalho Integrados
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Gestão de Ambientes
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Estrutura de Projeto

Uma estrutura típica de projeto azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Arquivos de Configuração

### azure.yaml
O principal arquivo de configuração do projeto:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Configuração específica do ambiente:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Fluxos de Trabalho Comuns

### Iniciando um Novo Projeto
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Ciclo de Desenvolvimento
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Compreendendo `azd down --force --purge`
O comando `azd down --force --purge` é uma forma poderosa de desmontar completamente o seu ambiente azd e todos os recursos associados. Aqui está um resumo do que cada parâmetro faz:
```
--force
```
- Ignora os prompts de confirmação.
- Útil para automação ou scripts onde a entrada manual não é viável.
- Garante que o processo de desmontagem ocorra sem interrupções, mesmo que o CLI detecte inconsistências.

```
--purge
```
Exclui **todos os metadados associados**, incluindo:
Estado do ambiente  
Pasta local `.azure`  
Informações de implementação em cache  
Impede que o azd "lembre" implementações anteriores, o que pode causar problemas como grupos de recursos incompatíveis ou referências obsoletas de registro.

### Por que usar ambos?
Quando você encontra problemas com `azd up` devido a estados persistentes ou implementações parciais, esta combinação garante um **novo começo**.

É especialmente útil após exclusões manuais de recursos no portal do Azure ou ao alternar templates, ambientes ou convenções de nomenclatura de grupos de recursos.

### Gerindo Múltiplos Ambientes
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Comandos de Navegação

### Descoberta
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Gestão de Projetos
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Monitorização
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Melhores Práticas

### 1. Use Nomes Significativos
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Aproveite os Templates
- Comece com templates existentes
- Personalize conforme suas necessidades
- Crie templates reutilizáveis para sua organização

### 3. Isolamento de Ambientes
- Use ambientes separados para desenvolvimento/staging/produção
- Nunca implemente diretamente na produção a partir da máquina local
- Utilize pipelines de CI/CD para implementações em produção

### 4. Gestão de Configuração
- Use variáveis de ambiente para dados sensíveis
- Mantenha a configuração sob controle de versão
- Documente configurações específicas de cada ambiente

## Progressão de Aprendizagem

### Iniciante (Semana 1-2)
1. Instalar o azd e autenticar
2. Implementar um template simples
3. Compreender a estrutura do projeto
4. Aprender comandos básicos (up, down, deploy)

### Intermediário (Semana 3-4)
1. Personalizar templates
2. Gerir múltiplos ambientes
3. Compreender o código de infraestrutura
4. Configurar pipelines de CI/CD

### Avançado (Semana 5+)
1. Criar templates personalizados
2. Padrões avançados de infraestrutura
3. Implementações em múltiplas regiões
4. Configurações de nível empresarial

## Próximos Passos

**📖 Continue o Aprendizado do Capítulo 1:**
- [Instalação & Configuração](installation.md) - Instale e configure o azd
- [Seu Primeiro Projeto](first-project.md) - Tutorial prático completo
- [Guia de Configuração](configuration.md) - Opções avançadas de configuração

**🎯 Pronto para o Próximo Capítulo?**
- [Capítulo 2: Desenvolvimento com Foco em IA](../ai-foundry/azure-ai-foundry-integration.md) - Comece a criar aplicações de IA

## Recursos Adicionais

- [Visão Geral do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galeria de Templates](https://azure.github.io/awesome-azd/)
- [Exemplos da Comunidade](https://github.com/Azure-Samples)

---

**Navegação do Capítulo:**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../../README.md)
- **📖 Capítulo Atual**: Capítulo 1 - Fundamentos & Início Rápido  
- **⬅️ Anterior**: [Visão Geral do Curso](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ Próximo**: [Instalação & Configuração](installation.md)
- **🚀 Próximo Capítulo**: [Capítulo 2: Desenvolvimento com Foco em IA](../ai-foundry/azure-ai-foundry-integration.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.