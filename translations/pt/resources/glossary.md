<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-09T18:06:26+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "pt"
}
-->
# Glossário - Terminologia do Azure Developer CLI

## Introdução

Este glossário abrangente fornece definições para termos, conceitos e acrônimos usados no Azure Developer CLI e no desenvolvimento em nuvem Azure. Referência essencial para compreender documentação técnica, resolver problemas e comunicar-se eficazmente sobre projetos azd e serviços Azure.

## Objetivos de Aprendizagem

Ao utilizar este glossário, você irá:
- Compreender a terminologia e os conceitos essenciais do Azure Developer CLI
- Dominar o vocabulário e os termos técnicos do desenvolvimento em nuvem Azure
- Referenciar eficientemente a terminologia de Infraestrutura como Código e implantação
- Entender os nomes, acrônimos e propósitos dos serviços Azure
- Acessar definições para termos de resolução de problemas e depuração
- Aprender conceitos avançados de arquitetura e desenvolvimento Azure

## Resultados de Aprendizagem

Com referência regular a este glossário, você será capaz de:
- Comunicar-se eficazmente utilizando a terminologia correta do Azure Developer CLI
- Compreender mais claramente a documentação técnica e mensagens de erro
- Navegar pelos serviços e conceitos do Azure com confiança
- Resolver problemas utilizando o vocabulário técnico apropriado
- Contribuir para discussões em equipe com linguagem técnica precisa
- Expandir sistematicamente seu conhecimento sobre desenvolvimento em nuvem Azure

## A

**ARM Template**  
Template do Azure Resource Manager. Formato JSON baseado em Infraestrutura como Código usado para definir e implantar recursos Azure de forma declarativa.

**App Service**  
Oferta de plataforma como serviço (PaaS) do Azure para hospedar aplicações web, APIs REST e backends móveis sem necessidade de gerenciar infraestrutura.

**Application Insights**  
Serviço de monitoramento de desempenho de aplicações (APM) do Azure que fornece insights profundos sobre desempenho, disponibilidade e uso de aplicações.

**Azure CLI**  
Interface de linha de comando para gerenciar recursos Azure. Usada pelo azd para autenticação e algumas operações.

**Azure Developer CLI (azd)**  
Ferramenta de linha de comando voltada para desenvolvedores que acelera o processo de criação e implantação de aplicações no Azure utilizando templates e Infraestrutura como Código.

**azure.yaml**  
Arquivo principal de configuração de um projeto azd que define serviços, infraestrutura e ganchos de implantação.

**Azure Resource Manager (ARM)**  
Serviço de implantação e gerenciamento do Azure que fornece uma camada de gerenciamento para criar, atualizar e excluir recursos.

## B

**Bicep**  
Linguagem específica de domínio (DSL) desenvolvida pela Microsoft para implantar recursos Azure. Oferece uma sintaxe mais simples que os templates ARM enquanto compila para ARM.

**Build**  
Processo de compilar código-fonte, instalar dependências e preparar aplicações para implantação.

**Blue-Green Deployment**  
Estratégia de implantação que utiliza dois ambientes de produção idênticos (azul e verde) para minimizar o tempo de inatividade e os riscos.

## C

**Container Apps**  
Serviço de contêiner sem servidor do Azure que permite executar aplicações containerizadas sem gerenciar infraestrutura complexa.

**CI/CD**  
Integração Contínua/Implantação Contínua. Práticas automatizadas para integrar alterações de código e implantar aplicações.

**Cosmos DB**  
Serviço de banco de dados globalmente distribuído e multi-modelo do Azure que oferece SLAs abrangentes para throughput, latência, disponibilidade e consistência.

**Configuration**  
Configurações e parâmetros que controlam o comportamento da aplicação e opções de implantação.

## D

**Deployment**  
Processo de instalar e configurar aplicações e suas dependências na infraestrutura de destino.

**Docker**  
Plataforma para desenvolver, enviar e executar aplicações utilizando tecnologia de containerização.

**Dockerfile**  
Arquivo de texto contendo instruções para construir uma imagem de contêiner Docker.

## E

**Environment**  
Um alvo de implantação que representa uma instância específica da sua aplicação (ex.: desenvolvimento, staging, produção).

**Environment Variables**  
Valores de configuração armazenados como pares chave-valor que as aplicações podem acessar em tempo de execução.

**Endpoint**  
URL ou endereço de rede onde uma aplicação ou serviço pode ser acessado.

## F

**Function App**  
Serviço de computação sem servidor do Azure que permite executar código orientado a eventos sem gerenciar infraestrutura.

## G

**GitHub Actions**  
Plataforma CI/CD integrada com repositórios GitHub para automatizar fluxos de trabalho.

**Git**  
Sistema de controle de versão distribuído usado para rastrear alterações no código-fonte.

## H

**Hooks**  
Scripts ou comandos personalizados que são executados em pontos específicos durante o ciclo de vida de implantação (preprovision, postprovision, predeploy, postdeploy).

**Host**  
O tipo de serviço Azure onde uma aplicação será implantada (ex.: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Prática de definir e gerenciar infraestrutura por meio de código em vez de processos manuais.

**Init**  
Processo de inicializar um novo projeto azd, geralmente a partir de um template.

## J

**JSON**  
JavaScript Object Notation. Formato de intercâmbio de dados comumente usado para arquivos de configuração e respostas de APIs.

**JWT**  
JSON Web Token. Padrão para transmitir informações de forma segura entre partes como um objeto JSON.

## K

**Key Vault**  
Serviço do Azure para armazenar e gerenciar de forma segura segredos, chaves e certificados.

**Kusto Query Language (KQL)**  
Linguagem de consulta usada para analisar dados no Azure Monitor, Application Insights e outros serviços Azure.

## L

**Load Balancer**  
Serviço que distribui o tráfego de rede recebido entre vários servidores ou instâncias.

**Log Analytics**  
Serviço do Azure para coletar, analisar e agir sobre dados de telemetria de ambientes em nuvem e locais.

## M

**Managed Identity**  
Recurso do Azure que fornece às aplicações uma identidade gerida automaticamente para autenticação em outros serviços Azure.

**Microservices**  
Abordagem arquitetural onde aplicações são construídas como uma coleção de pequenos serviços independentes.

**Monitor**  
Solução unificada de monitoramento do Azure que oferece observabilidade completa em aplicações e infraestrutura.

## N

**Node.js**  
Runtime JavaScript construído sobre o motor V8 do Chrome para criar aplicações do lado do servidor.

**npm**  
Gerenciador de pacotes para Node.js que gerencia dependências e pacotes.

## O

**Output**  
Valores retornados da implantação de infraestrutura que podem ser usados por aplicações ou outros recursos.

## P

**Package**  
Processo de preparar o código da aplicação e dependências para implantação.

**Parameters**  
Valores de entrada passados para templates de infraestrutura para personalizar implantações.

**PostgreSQL**  
Sistema de banco de dados relacional de código aberto suportado como serviço gerido no Azure.

**Provisioning**  
Processo de criar e configurar recursos Azure definidos em templates de infraestrutura.

## Q

**Quota**  
Limites na quantidade de recursos que podem ser criados em uma assinatura ou região Azure.

## R

**Resource Group**  
Contêiner lógico para recursos Azure que compartilham o mesmo ciclo de vida, permissões e políticas.

**Resource Token**  
String única gerada pelo azd para garantir que os nomes de recursos sejam únicos entre implantações.

**REST API**  
Estilo arquitetural para projetar aplicações em rede utilizando métodos HTTP.

**Rollback**  
Processo de reverter para uma versão anterior de uma aplicação ou configuração de infraestrutura.

## S

**Service**  
Um componente da sua aplicação definido no azure.yaml (ex.: frontend web, backend API, banco de dados).

**SKU**  
Unidade de Manutenção de Estoque. Representa diferentes níveis de serviço ou desempenho para recursos Azure.

**SQL Database**  
Serviço de banco de dados relacional gerido do Azure baseado no Microsoft SQL Server.

**Static Web Apps**  
Serviço do Azure para criar e implantar aplicações web full-stack a partir de repositórios de código-fonte.

**Storage Account**  
Serviço do Azure que fornece armazenamento em nuvem para objetos de dados, incluindo blobs, arquivos, filas e tabelas.

**Subscription**  
Contêiner de conta Azure que mantém grupos de recursos e recursos, com gerenciamento de cobrança e acesso associado.

## T

**Template**  
Estrutura de projeto pré-construída contendo código de aplicação, definições de infraestrutura e configuração para cenários comuns.

**Terraform**  
Ferramenta de Infraestrutura como Código de código aberto que suporta múltiplos provedores de nuvem, incluindo Azure.

**Traffic Manager**  
Balanceador de carga baseado em DNS do Azure para distribuir tráfego entre regiões globais do Azure.

## U

**URI**  
Identificador Uniforme de Recursos. String que identifica um recurso específico.

**URL**  
Localizador Uniforme de Recursos. Tipo de URI que especifica onde um recurso está localizado e como recuperá-lo.

## V

**Virtual Network (VNet)**  
Bloco fundamental para redes privadas no Azure, fornecendo isolamento e segmentação.

**VS Code**  
Visual Studio Code. Editor de código popular com excelente integração com Azure e azd.

## W

**Webhook**  
Callback HTTP acionado por eventos específicos, comumente usado em pipelines CI/CD.

**What-if**  
Recurso do Azure que mostra quais alterações seriam feitas por uma implantação sem realmente executá-la.

## Y

**YAML**  
YAML Ain't Markup Language. Padrão de serialização de dados legível por humanos usado para arquivos de configuração como azure.yaml.

## Z

**Zone**  
Locais fisicamente separados dentro de uma região Azure que fornecem redundância e alta disponibilidade.

---

## Acrônimos Comuns

| Acrônimo | Forma Completa | Descrição |
|---------|----------------|-----------|
| AAD | Azure Active Directory | Serviço de gerenciamento de identidade e acesso |
| ACR | Azure Container Registry | Serviço de registro de imagens de contêiner |
| AKS | Azure Kubernetes Service | Serviço Kubernetes gerido |
| API | Application Programming Interface | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Serviço de implantação e gerenciamento do Azure |
| CDN | Content Delivery Network | Rede distribuída de servidores |
| CI/CD | Continuous Integration/Continuous Deployment | Práticas automatizadas de desenvolvimento |
| CLI | Command Line Interface | Interface de usuário baseada em texto |
| DNS | Domain Name System | Sistema para traduzir nomes de domínio em endereços IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versão segura do HTTP |
| IaC | Infrastructure as Code | Gerenciamento de infraestrutura por meio de código |
| JSON | JavaScript Object Notation | Formato de intercâmbio de dados |
| JWT | JSON Web Token | Formato de token para transmissão segura de informações |
| KQL | Kusto Query Language | Linguagem de consulta para serviços de dados Azure |
| RBAC | Role-Based Access Control | Método de controle de acesso baseado em funções |
| REST | Representational State Transfer | Estilo arquitetural para serviços web |
| SDK | Software Development Kit | Coleção de ferramentas de desenvolvimento |
| SLA | Service Level Agreement | Compromisso com disponibilidade/desempenho de serviço |
| SQL | Structured Query Language | Linguagem para gerenciar bancos de dados relacionais |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolos criptográficos |
| URI | Uniform Resource Identifier | String que identifica um recurso |
| URL | Uniform Resource Locator | Tipo de URI que especifica a localização de um recurso |
| VM | Virtual Machine | Emulação de um sistema computacional |
| VNet | Virtual Network | Rede privada no Azure |
| YAML | YAML Ain't Markup Language | Padrão de serialização de dados |

---

## Mapeamento de Nomes de Serviços Azure

| Nome Comum | Nome Oficial do Serviço Azure | Tipo de Host azd |
|------------|-------------------------------|------------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termos Específicos de Contexto

### Termos de Desenvolvimento
- **Hot Reload**: Atualização automática de aplicações durante o desenvolvimento sem reiniciar
- **Build Pipeline**: Processo automatizado para construir e testar código
- **Deployment Slot**: Ambiente de staging dentro de um App Service
- **Environment Parity**: Manter ambientes de desenvolvimento, staging e produção semelhantes

### Termos de Segurança
- **Managed Identity**: Recurso do Azure que fornece gerenciamento automático de credenciais
- **Key Vault**: Armazenamento seguro para segredos, chaves e certificados
- **RBAC**: Controle de acesso baseado em funções para recursos Azure
- **Network Security Group**: Firewall virtual para controlar tráfego de rede

### Termos de Monitoramento
- **Telemetry**: Coleta automatizada de medições e dados
- **Application Performance Monitoring (APM)**: Monitoramento de desempenho de software
- **Log Analytics**: Serviço para coletar e analisar dados de logs
- **Alert Rules**: Notificações automáticas baseadas em métricas ou condições

### Termos de Implantação
- **Blue-Green Deployment**: Estratégia de implantação sem tempo de inatividade
- **Canary Deployment**: Implantação gradual para um subconjunto de usuários
- **Rolling Update**: Substituição sequencial de instâncias de aplicação
- **Rollback**: Reversão para uma versão anterior da aplicação

---

**Dica de Uso**: Use `Ctrl+F` para buscar rapidamente termos específicos neste glossário. Os termos são referenciados cruzadamente onde aplicável.

---

**Navegação**
- **Lição Anterior**: [Cheat Sheet](cheat-sheet.md)
- **Próxima Lição**: [FAQ](faq.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, é importante notar que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.