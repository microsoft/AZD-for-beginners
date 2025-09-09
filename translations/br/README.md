<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-09T18:48:58+00:00",
  "source_file": "README.md",
  "language_code": "br"
}
-->
# AZD Para Iniciantes

![AZD-para-iniciantes](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.br.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  

[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

Siga os passos abaixo para começar a usar esses recursos:  
1. **Faça um Fork do Repositório**: Clique [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Clone o Repositório**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Participe das Comunidades do Azure no Discord e conecte-se com especialistas e outros desenvolvedores**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 Suporte Multilíngue

#### Suporte via GitHub Action (Automatizado e Sempre Atualizado)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](./README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**Se você deseja adicionar mais idiomas, os idiomas suportados estão listados [aqui](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Introdução

Bem-vindo ao guia completo para o Azure Developer CLI (azd). Este repositório foi criado para ajudar desenvolvedores de todos os níveis, desde estudantes até profissionais, a aprender e dominar o Azure Developer CLI para implantações eficientes na nuvem. Este recurso de aprendizado estruturado oferece experiência prática com implantações na nuvem Azure, solução de problemas comuns e implementação de boas práticas para implantações bem-sucedidas de templates AZD.

## Objetivos de Aprendizado

Ao trabalhar com este repositório, você irá:  
- Dominar os fundamentos e conceitos principais do Azure Developer CLI  
- Aprender a implantar e provisionar recursos do Azure usando Infraestrutura como Código  
- Desenvolver habilidades para solucionar problemas comuns de implantação AZD  
- Compreender validações pré-implantação e planejamento de capacidade  
- Implementar boas práticas de segurança e estratégias de otimização de custos  
- Ganhar confiança para implantar aplicações prontas para produção no Azure  

## Resultados de Aprendizado

Após concluir este curso, você será capaz de:  
- Instalar, configurar e usar o Azure Developer CLI com sucesso  
- Criar e implantar aplicações usando templates AZD  
- Solucionar problemas de autenticação, infraestrutura e implantação  
- Realizar verificações pré-implantação, incluindo planejamento de capacidade e seleção de SKU  
- Implementar monitoramento, segurança e boas práticas de gerenciamento de custos  
- Integrar fluxos de trabalho AZD em pipelines de CI/CD  

## Índice

- [O que é o Azure Developer CLI?](../..)  
- [Início Rápido](../..)  
- [Documentação](../..)  
- [Exemplos e Templates](../..)  
- [Recursos](../..)  
- [Contribuindo](../..)  

## O que é o Azure Developer CLI?

Azure Developer CLI (azd) é uma interface de linha de comando voltada para desenvolvedores que acelera o processo de criação e implantação de aplicações no Azure. Ele oferece:  

- **Implantações baseadas em templates** - Use templates pré-construídos para padrões comuns de aplicação  
- **Infraestrutura como Código** - Gerencie recursos do Azure usando Bicep ou Terraform  
- **Fluxos de trabalho integrados** - Provisione, implante e monitore aplicações de forma integrada  
- **Amigável para desenvolvedores** - Otimizado para produtividade e experiência do desenvolvedor  

## Início Rápido

### Pré-requisitos  
- Assinatura do Azure  
- Azure CLI instalado  
- Git (para clonar templates)  

### Instalação  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### Sua Primeira Implantação  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

## Documentação

### Primeiros Passos  
- [**Noções Básicas do AZD**](docs/getting-started/azd-basics.md) - Conceitos e terminologia principais  
- [**Instalação e Configuração**](docs/getting-started/installation.md) - Guias de instalação específicos para cada plataforma  
- [**Configuração**](docs/getting-started/configuration.md) - Configuração de ambiente e autenticação  
- [**Seu Primeiro Projeto**](docs/getting-started/first-project.md) - Tutorial passo a passo  

### Implantação e Provisionamento  
- [**Guia de Implantação**](docs/deployment/deployment-guide.md) - Fluxos de trabalho completos de implantação  
- [**Provisionamento de Recursos**](docs/deployment/provisioning.md) - Gerenciamento de recursos do Azure  

### Verificações Pré-Implantação  
- [**Planejamento de Capacidade**](docs/pre-deployment/capacity-planning.md) - Validação de capacidade de recursos do Azure  
- [**Seleção de SKU**](docs/pre-deployment/sku-selection.md) - Escolhendo os SKUs certos do Azure  
- [**Verificações Pré-Implantação**](docs/pre-deployment/preflight-checks.md) - Scripts de validação automatizados  

### Solução de Problemas  
- [**Problemas Comuns**](docs/troubleshooting/common-issues.md) - Problemas frequentemente encontrados e soluções  
- [**Guia de Depuração**](docs/troubleshooting/debugging.md) - Estratégias de depuração passo a passo  

## Exemplos e Templates

### Templates Iniciais  
- [**Aplicação Web Simples**](../../examples/simple-web-app) - Implantação básica de aplicação web Node.js  
- [**Site Estático**](../../examples/static-website) - Hospedagem de site estático no Azure Storage  
- [**Aplicação em Container**](../../examples/container-app) - Implantação de aplicação containerizada  
- [**Aplicação com Banco de Dados**](../../examples/database-app) - Aplicação web com integração de banco de dados  

### Cenários Avançados  
- [**Microsserviços**](../../examples/microservices) - Arquitetura de aplicação com múltiplos serviços  
- [**Funções Serverless**](../../examples/serverless-function) - Implantação de Azure Functions  
- [**Exemplos de Configuração**](../../examples/configurations) - Padrões de configuração reutilizáveis  

## Recursos

### Referências Rápidas  
- [**Guia de Comandos**](resources/cheat-sheet.md) - Comandos essenciais do azd  
- [**Glossário**](resources/glossary.md) - Terminologia do Azure e azd  
- [**FAQ**](resources/faq.md) - Perguntas frequentes  
- [**Guia de Estudos**](resources/study-guide.md) - Objetivos de aprendizado e exercícios práticos  

### Recursos Externos  
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centro de Arquitetura do Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Calculadora de Preços do Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Status do Azure](https://status.azure.com/)  

## Caminho de Aprendizado

### Para Estudantes e Iniciantes  
1. Comece com [Noções Básicas do AZD](docs/getting-started/azd-basics.md)  
2. Siga o [Guia de Instalação](docs/getting-started/installation.md)  
3. Complete [Seu Primeiro Projeto](docs/getting-started/first-project.md)  
4. Pratique com [Exemplo de Aplicação Web Simples](../../examples/simple-web-app)  

### Para Desenvolvedores  
1. Revise o [Guia de Configuração](docs/getting-started/configuration.md)  
2. Estude o [Guia de Implantação](docs/deployment/deployment-guide.md)  
3. Trabalhe com [Exemplo de Aplicação com Banco de Dados](../../examples/database-app)  
4. Explore o [Exemplo de Aplicação em Container](../../examples/container-app)  

### Para Engenheiros de DevOps  
1. Domine o [Provisionamento de Recursos](docs/deployment/provisioning.md)  
2. Implemente [Verificações Pré-Implantação](docs/pre-deployment/preflight-checks.md)  
3. Pratique o [Planejamento de Capacidade](docs/pre-deployment/capacity-planning.md)  
4. Avance com o [Exemplo de Microsserviços](../../examples/microservices)  

## Contribuindo

Contribuições são bem-vindas! Leia nosso [Guia de Contribuição](CONTRIBUTING.md) para detalhes sobre:  
- Como enviar problemas e solicitações de recursos  
- Diretrizes para contribuição de código  
- Melhorias na documentação  
- Padrões da comunidade  

## Suporte

- **Problemas**: [Relate bugs e solicite recursos](https://github.com/microsoft/azd-for-beginners/issues)  
- **Discussões**: [Comunidade Microsoft Azure no Discord para perguntas e discussões](https://discord.gg/microsoft-azure)  
- **Email**: Para consultas privadas  
- **Microsoft Learn**: [Documentação oficial do Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](../../LICENSE) para detalhes.  

## 🎒 Outros Cursos

Nossa equipe produz outros cursos! Confira:  

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
- [IoT para Iniciantes](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [Desenvolvimento XR para Iniciantes](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Dominando o GitHub Copilot para Programação em Parceria com IA](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Dominando o GitHub Copilot para Desenvolvedores C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Escolha Sua Própria Aventura com Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Navegação**  
- **Próxima Aula**: [Noções Básicas do AZD](docs/getting-started/azd-basics.md)  

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.