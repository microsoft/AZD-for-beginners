<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T09:58:23+00:00",
  "source_file": "README.md",
  "language_code": "pt"
}
-->
# AZD Para Iniciantes

![AZD-para-iniciantes](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.pt.png) 

Siga estes passos para começar a utilizar estes recursos:
1. **Faça um Fork do Repositório**: Clique [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone o Repositório**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Junte-se às Comunidades Azure Discord e conecte-se com especialistas e outros programadores**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Suporte Multilíngue

#### Suportado via GitHub Action (Automatizado e Sempre Atualizado)

[Francês](../fr/README.md) | [Espanhol](../es/README.md) | [Alemão](../de/README.md) | [Russo](../ru/README.md) | [Árabe](../ar/README.md) | [Persa (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinês (Simplificado)](../zh/README.md) | [Chinês (Tradicional, Macau)](../mo/README.md) | [Chinês (Tradicional, Hong Kong)](../hk/README.md) | [Chinês (Tradicional, Taiwan)](../tw/README.md) | [Japonês](../ja/README.md) | [Coreano](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepalês](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Português (Portugal)](./README.md) | [Português (Brasil)](../br/README.md) | [Italiano](../it/README.md) | [Polaco](../pl/README.md) | [Turco](../tr/README.md) | [Grego](../el/README.md) | [Tailandês](../th/README.md) | [Sueco](../sv/README.md) | [Dinamarquês](../da/README.md) | [Norueguês](../no/README.md) | [Finlandês](../fi/README.md) | [Holandês](../nl/README.md) | [Hebraico](../he/README.md) | [Vietnamita](../vi/README.md) | [Indonésio](../id/README.md) | [Malaio](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Húngaro](../hu/README.md) | [Checo](../cs/README.md) | [Eslovaco](../sk/README.md) | [Romeno](../ro/README.md) | [Búlgaro](../bg/README.md) | [Sérvio (Cirílico)](../sr/README.md) | [Croata](../hr/README.md) | [Esloveno](../sl/README.md) | [Ucraniano](../uk/README.md) | [Birmanês (Myanmar)](../my/README.md)

**Se desejar suporte para idiomas adicionais, os idiomas disponíveis estão listados [aqui](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Introdução

Bem-vindo ao guia completo para Azure Developer CLI (azd). Este repositório foi criado para ajudar programadores de todos os níveis, desde estudantes até profissionais, a aprender e dominar o Azure Developer CLI para implementações eficientes na nuvem. Este recurso de aprendizagem estruturado oferece experiência prática com implementações na nuvem Azure, resolução de problemas comuns e aplicação de boas práticas para o sucesso na implementação de templates AZD.

## Objetivos de Aprendizagem

Ao trabalhar com este repositório, você irá:
- Dominar os fundamentos e conceitos principais do Azure Developer CLI
- Aprender a implementar e provisionar recursos Azure usando Infraestrutura como Código
- Desenvolver habilidades para resolver problemas comuns de implementação AZD
- Compreender validações pré-implementação e planeamento de capacidade
- Aplicar boas práticas de segurança e estratégias de otimização de custos
- Ganhar confiança na implementação de aplicações prontas para produção no Azure

## Resultados de Aprendizagem

Após concluir este curso, você será capaz de:
- Instalar, configurar e utilizar o Azure Developer CLI com sucesso
- Criar e implementar aplicações usando templates AZD
- Resolver problemas de autenticação, infraestrutura e implementação
- Realizar verificações pré-implementação, incluindo planeamento de capacidade e seleção de SKU
- Implementar boas práticas de monitorização, segurança e gestão de custos
- Integrar fluxos de trabalho AZD em pipelines CI/CD

## Índice

- [O que é Azure Developer CLI?](../..)
- [Introdução Rápida](../..)
- [Documentação](../..)
- [Exemplos e Templates](../..)
- [Recursos](../..)
- [Contribuindo](../..)

## O que é Azure Developer CLI?

Azure Developer CLI (azd) é uma interface de linha de comando centrada no programador que acelera o processo de criação e implementação de aplicações no Azure. Ele oferece:

- **Implementações baseadas em templates** - Utilize templates pré-construídos para padrões comuns de aplicações
- **Infraestrutura como Código** - Gerencie recursos Azure usando Bicep ou Terraform
- **Fluxos de trabalho integrados** - Provisione, implemente e monitore aplicações de forma integrada
- **Focado no programador** - Otimizado para produtividade e experiência do programador

## Introdução Rápida

### Pré-requisitos
- Subscrição Azure
- Azure CLI instalado
- Git (para clonar templates)

### Instalação
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Sua Primeira Implementação
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## Documentação

### Primeiros Passos
- [**Fundamentos do AZD**](docs/getting-started/azd-basics.md) - Conceitos principais e terminologia
- [**Instalação e Configuração**](docs/getting-started/installation.md) - Guias de instalação específicos para cada plataforma
- [**Configuração**](docs/getting-started/configuration.md) - Configuração do ambiente e autenticação
- [**Seu Primeiro Projeto**](docs/getting-started/first-project.md) - Tutorial passo a passo

### Implementação e Provisionamento
- [**Guia de Implementação**](docs/deployment/deployment-guide.md) - Fluxos de trabalho completos de implementação
- [**Provisionamento de Recursos**](docs/deployment/provisioning.md) - Gestão de recursos Azure

### Verificações Pré-Implementação
- [**Planeamento de Capacidade**](docs/pre-deployment/capacity-planning.md) - Validação de capacidade de recursos Azure
- [**Seleção de SKU**](docs/pre-deployment/sku-selection.md) - Escolhendo os SKUs certos do Azure
- [**Verificações Pré-Implementação**](docs/pre-deployment/preflight-checks.md) - Scripts de validação automatizados

### Resolução de Problemas
- [**Problemas Comuns**](docs/troubleshooting/common-issues.md) - Problemas frequentemente encontrados e soluções
- [**Guia de Depuração**](docs/troubleshooting/debugging.md) - Estratégias passo a passo para depuração

## Exemplos e Templates
- [**Exemplos**]([examples/README.md) - Exemplos práticos, templates e cenários reais para ajudar você a aprender Azure Developer CLI através de prática. Cada exemplo fornece código completo, templates de infraestrutura e instruções detalhadas para diferentes arquiteturas de aplicações e padrões de implementação.

### Laboratório Prático/Workshop
- [**AZD Para Iniciantes**](workshop/README.md) - Este workshop irá focar no template Get Started with AI Agents AZD e fornecer práticas recomendadas para implementação de serviços Azure AI usando AZD

## Recursos

### Referências Rápidas
- [**Folha de Comandos**](resources/cheat-sheet.md) - Comandos essenciais do azd
- [**Glossário**](resources/glossary.md) - Terminologia do Azure e azd
- [**FAQ**](resources/faq.md) - Perguntas frequentes
- [**Guia de Estudo**](resources/study-guide.md) - Objetivos de aprendizagem abrangentes e exercícios práticos

### Recursos Externos
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro de Arquitetura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculadora de Preços Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status do Azure](https://status.azure.com/)

## Caminho de Aprendizagem

### Para Estudantes e Iniciantes
1. Comece com [Fundamentos do AZD](docs/getting-started/azd-basics.md)
2. Siga o [Guia de Instalação](docs/getting-started/installation.md)
3. Complete [Seu Primeiro Projeto](docs/getting-started/first-project.md)
4. Pratique com [Exemplo de Aplicação Web Simples](../../examples/simple-web-app)

### Para Programadores
1. Revise o [Guia de Configuração](docs/getting-started/configuration.md)
2. Estude o [Guia de Implementação](docs/deployment/deployment-guide.md)
3. Trabalhe com [Exemplo de Aplicação com Base de Dados](../../examples/database-app)
4. Explore o [Exemplo de Aplicação em Contêiner](../../examples/container-app)

### Para Engenheiros DevOps
1. Domine o [Provisionamento de Recursos](docs/deployment/provisioning.md)
2. Implemente [Verificações Pré-Implementação](docs/pre-deployment/preflight-checks.md)
3. Pratique [Planeamento de Capacidade](docs/pre-deployment/capacity-planning.md)
4. Avance com o [Exemplo de Microserviços](../../examples/microservices)

## Contribuindo

Contribuições são bem-vindas! Por favor, leia o nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:
- Como submeter problemas e pedidos de funcionalidades
- Diretrizes para contribuição de código
- Melhorias na documentação
- Padrões da comunidade

## Suporte

- **Problemas**: [Reporte bugs e solicite funcionalidades](https://github.com/microsoft/azd-for-beginners/issues)
- **Discussões**: [Comunidade Microsoft Azure Discord para perguntas e discussões](https://discord.gg/microsoft-azure)
- **Email**: Para consultas privadas
- **Microsoft Learn**: [Documentação oficial do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](../../LICENSE) para detalhes.

## 🎒 Outros Cursos

Nossa equipa produz outros cursos! Confira:

- [**NOVO** Protocolo de Contexto de Modelo (MCP) Para Iniciantes](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Agentes de IA para Iniciantes](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [IA Generativa para Iniciantes usando .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [IA Generativa para Iniciantes](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [IA Generativa para Iniciantes usando Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML para Iniciantes](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Ciência de Dados para Iniciantes](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [IA para Iniciantes](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cibersegurança para Iniciantes](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Desenvolvimento Web para Iniciantes](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT para Principiantes](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [Desenvolvimento XR para Principiantes](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Dominando o GitHub Copilot para Programação em Par com IA](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Dominando o GitHub Copilot para Desenvolvedores C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Escolha a Sua Própria Aventura com Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Navegação**  
- **Próxima Aula**: [Fundamentos do AZD](docs/getting-started/azd-basics.md)  

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.