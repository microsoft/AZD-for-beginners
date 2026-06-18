# Glossary - Azure and AZD Terminology

**Referência para Todos os Capítulos**
- **📚 Course Home**: [AZD para Iniciantes](../README.md)
- **📖 Learn Basics**: [Capítulo 1: Conceitos Básicos do AZD](../docs/getting-started/azd-basics.md)
- **🤖 AI Terms**: [Capítulo 2: Desenvolvimento Orientado por IA](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introdução

Este glossário abrangente fornece definições para termos, conceitos e siglas usados no Azure Developer CLI e no desenvolvimento em nuvem Azure. Referência essencial para entender documentação técnica, solucionar problemas e comunicar-se de forma eficaz sobre projetos azd e serviços do Azure.

## Objetivos de Aprendizagem

Ao usar este glossário, você irá:
- Entender a terminologia e os conceitos essenciais do Azure Developer CLI
- Dominar o vocabulário e os termos técnicos do desenvolvimento em nuvem Azure
- Consultar eficientemente a terminologia de Infraestrutura como Código e implantação
- Compreender nomes de serviços do Azure, siglas e suas finalidades
- Acessar definições para terminologia de solução de problemas e depuração
- Aprender conceitos avançados de arquitetura e desenvolvimento no Azure

## Resultados de Aprendizagem

Com referência regular a este glossário, você será capaz de:
- Comunicar-se efetivamente usando a terminologia adequada do Azure Developer CLI
- Entender documentação técnica e mensagens de erro com mais clareza
- Navegar pelos serviços e conceitos do Azure com confiança
- Resolver problemas usando o vocabulário técnico apropriado
- Contribuir para discussões de equipe com linguagem técnica precisa
- Expandir seu conhecimento em desenvolvimento na nuvem Azure de forma sistemática

## A

**ARM Template**  
Modelo do Azure Resource Manager. Formato de Infrastructure as Code baseado em JSON usado para definir e implantar recursos do Azure de forma declarativa.

**App Service**  
Oferta de platform-as-a-service (PaaS) do Azure para hospedar aplicações web, APIs REST e backends móveis sem gerenciar infraestrutura.

**Application Insights**  
Serviço de monitoramento de performance de aplicações (APM) do Azure que fornece insights detalhados sobre desempenho, disponibilidade e uso de aplicações.

**Azure CLI**  
Interface de linha de comando para gerenciar recursos do Azure. Utilizada pelo azd para autenticação e algumas operações.

**Azure Developer CLI (azd)**  
Ferramenta de linha de comando centrada no desenvolvedor que acelera o processo de criação e implantação de aplicações no Azure usando templates e Infrastructure as Code.

**azure.yaml**  
O arquivo de configuração principal para um projeto azd que define serviços, infraestrutura e hooks de implantação.

**Azure Resource Manager (ARM)**  
Serviço de implantação e gerenciamento do Azure que fornece uma camada de gerenciamento para criar, atualizar e excluir recursos.

## B

**Bicep**  
Linguagem específica de domínio (DSL) desenvolvida pela Microsoft para implantar recursos do Azure. Oferece sintaxe mais simples que templates ARM, compilando para ARM.

**Build**  
Processo de compilação do código-fonte, instalação de dependências e preparação de aplicações para implantação.

**Blue-Green Deployment**  
Estratégia de implantação que utiliza dois ambientes de produção idênticos (azul e verde) para minimizar tempo de inatividade e risco.

## C

**Container Apps**  
Serviço de containers serverless do Azure que permite executar aplicações conteinerizadas sem gerenciar infraestrutura complexa.

**CI/CD**  
Integração Contínua/Entrega Contínua. Práticas automatizadas para integrar mudanças de código e implantar aplicações.

**Cosmos DB**  
Serviço de banco de dados multimodelo e distribuído globalmente do Azure que fornece SLAs abrangentes para throughput, latência, disponibilidade e consistência.

**Configuration**  
Configurações e parâmetros que controlam o comportamento da aplicação e as opções de implantação.

## D

**Deployment**  
Processo de instalação e configuração de aplicações e suas dependências na infraestrutura de destino.

**Docker**  
Plataforma para desenvolver, empacotar e executar aplicações usando tecnologia de conteinerização.

**Dockerfile**  
Arquivo de texto contendo instruções para construir uma imagem de container Docker.

## E

**Environment**  
Um alvo de implantação que representa uma instância específica da sua aplicação (por exemplo, development, staging, production).

**Environment Variables**  
Valores de configuração armazenados como pares chave-valor que aplicações podem acessar em tempo de execução.

**Endpoint**  
URL ou endereço de rede onde uma aplicação ou serviço pode ser acessado.

## F

**Function App**  
Serviço de computação serverless do Azure que permite executar código orientado a eventos sem gerenciar infraestrutura.

## G

**GitHub Actions**  
Plataforma CI/CD integrada com repositórios GitHub para automatizar fluxos de trabalho.

**Git**  
Sistema de controle de versão distribuído usado para rastrear alterações no código-fonte.

## H

**Hooks**  
Scripts ou comandos personalizados que são executados em pontos específicos durante o ciclo de vida de implantação (preprovision, postprovision, predeploy, postdeploy).

**Host**  
O tipo de serviço do Azure onde uma aplicação será implantada (por exemplo, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Prática de definir e gerenciar infraestrutura por meio de código em vez de processos manuais.

**Init**  
Processo de inicialização de um novo projeto azd, tipicamente a partir de um template.

## J

**JSON**  
JavaScript Object Notation. Formato de intercâmbio de dados comumente usado para arquivos de configuração e respostas de API.

**JWT**  
JSON Web Token. Padrão para transmitir informações de forma segura entre partes como um objeto JSON.

## K

**Key Vault**  
Serviço do Azure para armazenar e gerenciar com segurança segredos, chaves e certificados.

**Kusto Query Language (KQL)**  
Linguagem de consulta usada para analisar dados no Azure Monitor, Application Insights e outros serviços do Azure.

## L

**Load Balancer**  
Serviço que distribui o tráfego de rede de entrada entre múltiplos servidores ou instâncias.

**Log Analytics**  
Serviço do Azure para coletar, analisar e agir sobre dados de telemetria de ambientes em nuvem e on-premises.

## M

**Managed Identity**  
Recurso do Azure que fornece identidades automaticamente gerenciadas para serviços do Azure autenticarem-se em outros serviços do Azure.

**Microservices**  
Abordagem arquitetural em que aplicações são construídas como uma coleção de serviços pequenos e independentes.

**Monitor**  
Solução unificada de monitoramento do Azure que fornece observabilidade full-stack em aplicações e infraestrutura.

## N

**Node.js**  
Runtime JavaScript construído sobre o motor V8 do Chrome para desenvolver aplicações do lado do servidor.

**npm**  
Gerenciador de pacotes para Node.js que gerencia dependências e pacotes.

## O

**Output**  
Valores retornados a partir da implantação de infraestrutura que podem ser usados por aplicações ou outros recursos.

## P

**Package**  
Processo de preparar o código da aplicação e dependências para implantação.

**Parameters**  
Valores de entrada passados para templates de infraestrutura para customizar implantações.

**PostgreSQL**  
Sistema de banco de dados relacional de código aberto suportado como um serviço gerenciado no Azure.

**Provisioning**  
Processo de criação e configuração de recursos do Azure definidos em templates de infraestrutura.

## Q

**Quota**  
Limites na quantidade de recursos que podem ser criados em uma assinatura ou região do Azure.

## R

**Resource Group**  
Contêiner lógico para recursos do Azure que compartilham o mesmo ciclo de vida, permissões e políticas.

**Resource Token**  
String única gerada pelo azd para garantir que nomes de recursos sejam únicos entre implantações.

**REST API**  
Estilo arquitetural para projetar aplicações em rede usando métodos HTTP.

**Rollback**  
Processo de reverter para uma versão anterior de uma aplicação ou configuração de infraestrutura.

## S

**Service**  
Um componente da sua aplicação definido em azure.yaml (por exemplo, web frontend, API backend, database).

**SKU**  
Stock Keeping Unit. Representa diferentes níveis de serviço ou desempenho para recursos do Azure.

**SQL Database**  
Serviço gerenciado de banco de dados relacional do Azure baseado no Microsoft SQL Server.

**Static Web Apps**  
Serviço do Azure para construir e implantar aplicações web full-stack a partir de repositórios de código-fonte.

**Storage Account**  
Serviço do Azure que fornece armazenamento em nuvem para objetos de dados, incluindo blobs, arquivos, filas e tabelas.

**Subscription**  
Contêiner de conta do Azure que mantém grupos de recursos e recursos, com faturamento e gerenciamento de acesso associados.

## T

**Template**  
Estrutura de projeto pré-construída contendo código de aplicação, definições de infraestrutura e configuração para cenários comuns.

**Terraform**  
Ferramenta open-source de Infrastructure as Code que suporta múltiplos provedores de nuvem, incluindo o Azure.

**Traffic Manager**  
Balanceador de carga baseado em DNS do Azure para distribuir tráfego entre regiões globais do Azure.

## U

**URI**  
Uniform Resource Identifier. String que identifica um recurso específico.

**URL**  
Uniform Resource Locator. Tipo de URI que especifica onde um recurso está localizado e como recuperá-lo.

## V

**Virtual Network (VNet)**  
Bloco de construção fundamental para redes privadas no Azure, fornecendo isolamento e segmentação.

**VS Code**  
Visual Studio Code. Editor de código popular com excelente integração com Azure e azd.

## W

**Webhook**  
Callback HTTP acionado por eventos específicos, comumente usado em pipelines de CI/CD.

**What-if**  
Recurso do Azure que mostra quais mudanças seriam feitas por uma implantação sem realmente executá-la.

## Y

**YAML**  
YAML Ain't Markup Language. Padrão de serialização de dados legível por humanos usado para arquivos de configuração como azure.yaml.

## Z

**Zone**  
Localizações fisicamente separadas dentro de uma região do Azure que fornecem redundância e alta disponibilidade.

---

## Siglas Comuns

| Sigla | Forma Completa | Descrição |
|-------|----------------|-----------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Serviço de identidade e gerenciamento de acesso |
| ACR | Azure Container Registry | Serviço de registro de imagens de containers |
| AKS | Azure Kubernetes Service | Serviço gerenciado de Kubernetes |
| API | Application Programming Interface | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Serviço de implantação e gerenciamento do Azure |
| CDN | Content Delivery Network | Rede distribuída de servidores |
| CI/CD | Continuous Integration/Continuous Deployment | Práticas de desenvolvimento automatizadas |
| CLI | Command Line Interface | Interface de usuário baseada em texto |
| DNS | Domain Name System | Sistema para traduzir nomes de domínio em endereços IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versão segura do HTTP |
| IaC | Infrastructure as Code | Gerenciamento de infraestrutura por meio de código |
| JSON | JavaScript Object Notation | Formato de intercâmbio de dados |
| JWT | JSON Web Token | Formato de token para transmissão segura de informações |
| KQL | Kusto Query Language | Linguagem de consulta para serviços de dados do Azure |
| RBAC | Role-Based Access Control | Método de controle de acesso baseado em papéis de usuário |
| REST | Representational State Transfer | Estilo arquitetural para serviços web |
| SDK | Software Development Kit | Conjunto de ferramentas de desenvolvimento |
| SLA | Service Level Agreement | Compromisso com disponibilidade/desempenho do serviço |
| SQL | Structured Query Language | Linguagem para gerenciar bancos de dados relacionais |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolos criptográficos |
| URI | Uniform Resource Identifier | String que identifica um recurso |
| URL | Uniform Resource Locator | Tipo de URI que especifica localização de recurso |
| VM | Virtual Machine | Emulação de um sistema de computador |
| VNet | Virtual Network | Rede privada no Azure |
| YAML | YAML Ain't Markup Language | Padrão de serialização de dados |

---

## Mapeamentos de Nomes de Serviços do Azure

| Nome Comum | Nome Oficial do Serviço Azure | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termos Específicos ao Contexto

### Termos de Desenvolvimento
- **Hot Reload**: Atualização automática de aplicações durante o desenvolvimento sem reinício
- **Build Pipeline**: Processo automatizado para construir e testar código
- **Deployment Slot**: Ambiente de staging dentro de um App Service
- **Environment Parity**: Manter os ambientes de development, staging e production semelhantes

### Termos de Segurança
- **Managed Identity**: Recurso do Azure que fornece gerenciamento automático de credenciais
- **Key Vault**: Armazenamento seguro para segredos, chaves e certificados
- **RBAC**: Controle de acesso baseado em papéis para recursos do Azure
- **Network Security Group**: Firewall virtual para controlar o tráfego de rede

### Termos de Monitoramento
- **Telemetry**: Coleta automatizada de medições e dados
- **Application Performance Monitoring (APM)**: Monitoramento de desempenho de software
- **Log Analytics**: Serviço para coletar e analisar dados de logs
- **Alert Rules**: Notificações automatizadas baseadas em métricas ou condições

### Termos de Implantação
- **Blue-Green Deployment**: Estratégia de implantação com zero downtime
- **Canary Deployment**: Implantação gradual para um subconjunto de usuários
- **Rolling Update**: Substituição sequencial de instâncias da aplicação
- **Rollback**: Reversão para versão anterior da aplicação

---

**Dica de Uso**: Use `Ctrl+F` para pesquisar rapidamente termos específicos neste glossário. Os termos estão cruzados onde aplicável.

---

**Navegação**
- **Previous Lesson**: [Resumo](cheat-sheet.md)
- **Next Lesson**: [Perguntas Frequentes](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido usando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, por favor, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->