# Glossário - Terminologia do Azure e AZD

**Referência para Todos os Capítulos**
- **📚 Página do Curso**: [AZD For Beginners](../README.md)
- **📖 Aprender o Básico**: [Capítulo 1: Noções Básicas do AZD](../docs/getting-started/azd-basics.md)
- **🤖 Termos de IA**: [Capítulo 2: Desenvolvimento com Foco em IA](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introdução

Este glossário abrangente fornece definições para termos, conceitos e siglas usados no Azure Developer CLI e no desenvolvimento em nuvem Azure. Referência essencial para entender documentação técnica, solucionar problemas e comunicar-se efetivamente sobre projetos azd e serviços do Azure.

## Objetivos de Aprendizagem

Ao usar este glossário, você irá:
- Compreender a terminologia e os conceitos essenciais do Azure Developer CLI
- Dominar o vocabulário e os termos técnicos de desenvolvimento em nuvem Azure
- Referenciar termos de Infraestrutura como Código e implantação de forma eficiente
- Compreender nomes de serviços do Azure, siglas e suas finalidades
- Acessar definições para termos de solução de problemas e depuração
- Aprender conceitos avançados de arquitetura e desenvolvimento no Azure

## Resultados de Aprendizagem

Com referência regular a este glossário, você será capaz de:
- Comunicar-se efetivamente usando a terminologia correta do Azure Developer CLI
- Entender melhor a documentação técnica e mensagens de erro
- Navegar pelos serviços e conceitos do Azure com confiança
- Solucionar problemas usando vocabulário técnico adequado
- Contribuir em discussões de equipe com linguagem técnica precisa
- Expandir seu conhecimento em desenvolvimento em nuvem Azure de forma sistemática

## A

**Modelo ARM**  
Modelo do Azure Resource Manager. Formato de Infraestrutura como Código baseado em JSON usado para definir e implantar recursos do Azure de forma declarativa.

**App Service**  
Oferta plataforma como serviço (PaaS) do Azure para hospedar aplicações web, APIs REST e back-ends móveis sem gerenciar infraestrutura.

**Application Insights**  
Serviço de monitoramento de performance de aplicações (APM) do Azure que fornece insights aprofundados sobre desempenho, disponibilidade e uso de aplicações.

**Azure CLI**  
Interface de linha de comando para gerenciar recursos do Azure. Usada pelo azd para autenticação e algumas operações.

**Azure Developer CLI (azd)**  
Ferramenta de linha de comando centrada no desenvolvedor que acelera o processo de construir e implantar aplicações no Azure usando templates e Infraestrutura como Código.

**azure.yaml**  
O arquivo de configuração principal de um projeto azd que define serviços, infraestrutura e hooks de implantação.

**Azure Resource Manager (ARM)**  
Serviço de implantação e gerenciamento do Azure que fornece uma camada de gerenciamento para criar, atualizar e excluir recursos.

## B

**Bicep**  
Linguagem específica de domínio (DSL) desenvolvida pela Microsoft para implantar recursos do Azure. Fornece sintaxe mais simples que templates ARM, compilando para ARM.

**Compilação**  
O processo de compilar código-fonte, instalar dependências e preparar aplicações para implantação.

**Implantação Blue-Green**  
Estratégia de implantação que usa dois ambientes de produção idênticos (blue e green) para minimizar tempo de inatividade e risco.

## C

**Container Apps**  
Serviço de containers serverless do Azure que permite executar aplicações conteinerizadas sem gerenciar infraestrutura complexa.

**CI/CD**  
Integração Contínua/Entrega Contínua. Práticas automatizadas para integrar mudanças de código e implantar aplicações.

**Cosmos DB**  
Serviço de banco de dados multimodelo e globalmente distribuído do Azure que fornece SLAs abrangentes para throughput, latência, disponibilidade e consistência.

**Configuração**  
Configurações e parâmetros que controlam o comportamento da aplicação e opções de implantação.

## D

**Implantação**  
O processo de instalar e configurar aplicações e suas dependências na infraestrutura alvo.

**Docker**  
Plataforma para desenvolver, distribuir e executar aplicações usando tecnologia de conteinerização.

**Dockerfile**  
Arquivo de texto contendo instruções para construir uma imagem de container Docker.

## E

**Ambiente**  
Um destino de implantação que representa uma instância específica da sua aplicação (por exemplo, desenvolvimento, staging, produção).

**Variáveis de Ambiente**  
Valores de configuração armazenados como pares chave-valor que as aplicações podem acessar em tempo de execução.

**Endpoint**  
URL ou endereço de rede onde uma aplicação ou serviço pode ser acessado.

## F

**Function App**  
Serviço de computação serverless do Azure que permite executar código orientado a eventos sem gerenciar infraestrutura.

## G

**GitHub Actions**  
Plataforma de CI/CD integrada a repositórios GitHub para automação de workflows.

**Git**  
Sistema de controle de versão distribuído usado para rastrear mudanças no código-fonte.

## H

**Hooks**  
Scripts ou comandos personalizados que executam em pontos específicos durante o ciclo de vida da implantação (preprovision, postprovision, predeploy, postdeploy).

**Host**  
O tipo de serviço do Azure onde uma aplicação será implantada (por exemplo, appservice, containerapp, function).

## I

**Infraestrutura como Código (IaC)**  
Prática de definir e gerenciar infraestrutura por meio de código em vez de processos manuais.

**Init**  
O processo de inicializar um novo projeto azd, tipicamente a partir de um template.

## J

**JSON**  
JavaScript Object Notation. Formato de troca de dados comumente usado para arquivos de configuração e respostas de API.

**JWT**  
JSON Web Token. Padrão para transmitir informações com segurança entre partes como um objeto JSON.

## K

**Key Vault**  
Serviço do Azure para armazenar e gerenciar com segurança segredos, chaves e certificados.

**Kusto Query Language (KQL)**  
Linguagem de consulta usada para analisar dados no Azure Monitor, Application Insights e outros serviços Azure.

## L

**Load Balancer**  
Serviço que distribui o tráfego de rede entre múltiplos servidores ou instâncias.

**Log Analytics**  
Serviço do Azure para coletar, analisar e agir sobre dados de telemetria de ambientes em nuvem e on-premises.

## M

**Managed Identity**  
Recurso do Azure que fornece aos serviços do Azure uma identidade gerenciada automaticamente para autenticar em outros serviços do Azure.

**Microservices**  
Abordagem arquitetural onde aplicações são construídas como uma coleção de serviços pequenos e independentes.

**Monitor**  
Solução unificada de monitoramento do Azure que fornece observabilidade completa em aplicações e infraestrutura.

## N

**Node.js**  
Runtime JavaScript construído sobre o motor V8 do Chrome para construir aplicações do lado do servidor.

**npm**  
Gerenciador de pacotes para Node.js que gerencia dependências e pacotes.

## O

**Output**  
Valores retornados de uma implantação de infraestrutura que podem ser usados por aplicações ou outros recursos.

## P

**Pacote**  
O processo de preparar o código da aplicação e dependências para implantação.

**Parâmetros**  
Valores de entrada passados para templates de infraestrutura para personalizar implantações.

**PostgreSQL**  
Sistema de banco de dados relacional de código aberto suportado como serviço gerenciado no Azure.

**Provisionamento**  
O processo de criar e configurar recursos do Azure definidos em templates de infraestrutura.

## Q

**Quota**  
Limites na quantidade de recursos que podem ser criados em uma assinatura ou região do Azure.

## R

**Grupo de Recursos**  
Contêiner lógico para recursos do Azure que compartilham o mesmo ciclo de vida, permissões e políticas.

**Token de Recurso**  
String única gerada pelo azd para garantir que nomes de recursos sejam únicos entre implantações.

**REST API**  
Estilo arquitetural para projetar aplicações em rede usando métodos HTTP.

**Rollback**  
Processo de reverter para uma versão anterior de uma aplicação ou configuração de infraestrutura.

## S

**Serviço**  
Um componente da sua aplicação definido em azure.yaml (por exemplo, front-end web, back-end de API, banco de dados).

**SKU**  
Stock Keeping Unit. Representa diferentes camadas de serviço ou níveis de desempenho para recursos do Azure.

**SQL Database**  
Serviço de banco de dados relacional gerenciado do Azure baseado no Microsoft SQL Server.

**Static Web Apps**  
Serviço do Azure para construir e implantar aplicações web full-stack a partir de repositórios de código-fonte.

**Storage Account**  
Serviço do Azure que fornece armazenamento em nuvem para objetos de dados incluindo blobs, arquivos, filas e tabelas.

**Subscription**  
Contêiner de conta do Azure que contém grupos de recursos e recursos, com faturamento e gerenciamento de acesso associados.

## T

**Template**  
Estrutura de projeto pré-construída contendo código da aplicação, definições de infraestrutura e configuração para cenários comuns.

**Terraform**  
Ferramenta open-source de Infraestrutura como Código que suporta múltiplos provedores de nuvem, incluindo Azure.

**Traffic Manager**  
Balanceador de carga baseado em DNS do Azure para distribuir tráfego entre regiões globais do Azure.

## U

**URI**  
Identificador Uniforme de Recursos. String que identifica um recurso particular.

**URL**  
Localizador Uniforme de Recursos. Tipo de URI que especifica onde um recurso está localizado e como recuperá-lo.

## V

**Virtual Network (VNet)**  
Bloco de construção fundamental para redes privadas no Azure, fornecendo isolamento e segmentação.

**VS Code**  
Visual Studio Code. Editor de código popular com excelente integração com Azure e azd.

## W

**Webhook**  
Callback HTTP acionado por eventos específicos, comumente usado em pipelines de CI/CD.

**What-if**  
Recurso do Azure que mostra quais mudanças seriam feitas por uma implantação sem executá-la de fato.

## Y

**YAML**  
YAML Ain't Markup Language. Padrão de serialização de dados legível por humanos usado para arquivos de configuração como azure.yaml.

## Z

**Zone**  
Locais fisicamente separados dentro de uma região do Azure que fornecem redundância e alta disponibilidade.

---

## Acrônimos Comuns

| Sigla | Forma Completa | Descrição |
|-------|----------------|-----------|
| AAD | Azure Active Directory | Serviço de gerenciamento de identidade e acesso |
| ACR | Azure Container Registry | Serviço de registro de imagens de container |
| AKS | Azure Kubernetes Service | Serviço gerenciado de Kubernetes |
| API | Interface de Programação de Aplicações | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Serviço de implantação e gerenciamento do Azure |
| CDN | Content Delivery Network | Rede distribuída de servidores |
| CI/CD | Continuous Integration/Continuous Deployment | Práticas automatizadas de desenvolvimento |
| CLI | Command Line Interface | Interface de linha de comando |
| DNS | Domain Name System | Sistema para traduzir nomes de domínio em endereços IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versão segura do HTTP |
| IaC | Infrastructure as Code | Gerenciamento de infraestrutura por meio de código |
| JSON | JavaScript Object Notation | Formato de troca de dados |
| JWT | JSON Web Token | Formato de token para transmissão segura de informações |
| KQL | Kusto Query Language | Linguagem de consulta para serviços de dados do Azure |
| RBAC | Role-Based Access Control | Método de controle de acesso baseado em funções |
| REST | Representational State Transfer | Estilo arquitetural para serviços web |
| SDK | Software Development Kit | Conjunto de ferramentas de desenvolvimento |
| SLA | Service Level Agreement | Compromisso com disponibilidade/desempenho do serviço |
| SQL | Structured Query Language | Linguagem para gerenciar bancos de dados relacionais |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolos criptográficos |
| URI | Uniform Resource Identifier | String identificando um recurso |
| URL | Uniform Resource Locator | Tipo de URI que especifica a localização de um recurso |
| VM | Virtual Machine | Emulação de um sistema computacional |
| VNet | Virtual Network | Rede virtual no Azure |
| YAML | YAML Ain't Markup Language | Padrão de serialização de dados |

---

## Mapeamentos de Nomes de Serviços do Azure

| Nome Comum | Nome Oficial do Serviço Azure | azd Host Type |
|------------|-------------------------------|---------------|
| Aplicação Web | Azure App Service | `appservice` |
| Aplicação de API | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Função | Azure Functions | `function` |
| Site Estático | Azure Static Web Apps | `staticwebapp` |
| Banco de Dados | Azure Database for PostgreSQL | `postgres` |
| Banco NoSQL | Azure Cosmos DB | `cosmosdb` |
| Armazenamento | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Busca | Azure Cognitive Search | `search` |
| Mensageria | Azure Service Bus | `servicebus` |

---

## Termos Específicos por Contexto

### Termos de Desenvolvimento
- **Hot Reload**: Atualização automática das aplicações durante o desenvolvimento sem reiniciar
- **Build Pipeline**: Processo automatizado para construir e testar código
- **Deployment Slot**: Ambiente de staging dentro de um App Service
- **Environment Parity**: Manter ambientes de desenvolvimento, staging e produção semelhantes

### Termos de Segurança
- **Managed Identity**: Recurso do Azure que fornece gerenciamento automático de credenciais
- **Key Vault**: Armazenamento seguro para segredos, chaves e certificados
- **RBAC**: Controle de acesso baseado em funções para recursos do Azure
- **Network Security Group**: Firewall virtual para controlar o tráfego de rede

### Termos de Monitoramento
- **Telemetry**: Coleta automatizada de medições e dados
- **Application Performance Monitoring (APM)**: Monitoramento de desempenho de software
- **Log Analytics**: Serviço para coletar e analisar dados de logs
- **Alert Rules**: Notificações automatizadas baseadas em métricas ou condições

### Termos de Implantação
- **Blue-Green Deployment**: Estratégia de implantação sem downtime
- **Canary Deployment**: Implantação gradual para um subconjunto de usuários
- **Rolling Update**: Substituição sequencial de instâncias de aplicação
- **Rollback**: Reversão para versão anterior da aplicação

---

**Dica de Uso**: Use `Ctrl+F` para buscar rapidamente termos específicos neste glossário. Os termos são referenciados cruzadamente quando aplicável.

---

**Navegação**
- **Aula Anterior**: [Resumo Rápido](cheat-sheet.md)
- **Próxima Aula**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Isenção de responsabilidade:

Este documento foi traduzido usando o serviço de tradução por IA Co-op Translator (https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original, em seu idioma nativo, deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se uma tradução profissional realizada por um tradutor humano. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->