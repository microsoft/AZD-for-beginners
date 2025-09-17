<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-17T14:57:28+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "pt"
}
-->
# Glossário - Terminologia do Azure e AZD

**Referência para Todos os Capítulos**  
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)  
- **📖 Aprender o Básico**: [Capítulo 1: Fundamentos do AZD](../docs/getting-started/azd-basics.md)  
- **🤖 Termos de IA**: [Capítulo 2: Desenvolvimento com Foco em IA](../docs/ai-foundry/azure-ai-foundry-integration.md)  

## Introdução

Este glossário abrangente fornece definições para termos, conceitos e siglas usados no Azure Developer CLI e no desenvolvimento em nuvem do Azure. É uma referência essencial para compreender documentação técnica, resolver problemas e comunicar-se de forma eficaz sobre projetos azd e serviços do Azure.

## Objetivos de Aprendizagem

Ao utilizar este glossário, irá:  
- Compreender a terminologia e os conceitos essenciais do Azure Developer CLI  
- Dominar o vocabulário e os termos técnicos do desenvolvimento em nuvem do Azure  
- Referenciar de forma eficiente a terminologia de Infraestrutura como Código e implantação  
- Compreender os nomes, siglas e finalidades dos serviços do Azure  
- Aceder a definições para termos de resolução de problemas e depuração  
- Aprender conceitos avançados de arquitetura e desenvolvimento no Azure  

## Resultados de Aprendizagem

Com referência regular a este glossário, será capaz de:  
- Comunicar-se de forma eficaz utilizando a terminologia correta do Azure Developer CLI  
- Compreender melhor a documentação técnica e mensagens de erro  
- Navegar pelos serviços e conceitos do Azure com confiança  
- Resolver problemas utilizando o vocabulário técnico apropriado  
- Contribuir para discussões em equipa com linguagem técnica precisa  
- Expandir sistematicamente o seu conhecimento sobre desenvolvimento em nuvem no Azure  

## A

**ARM Template**  
Modelo do Azure Resource Manager. Formato JSON de Infraestrutura como Código usado para definir e implementar recursos do Azure de forma declarativa.

**App Service**  
Oferta de plataforma como serviço (PaaS) do Azure para hospedar aplicações web, APIs REST e backends móveis sem necessidade de gerir infraestrutura.

**Application Insights**  
Serviço de monitorização de desempenho de aplicações (APM) do Azure que fornece informações detalhadas sobre desempenho, disponibilidade e utilização de aplicações.

**Azure CLI**  
Interface de linha de comandos para gerir recursos do Azure. Usada pelo azd para autenticação e algumas operações.

**Azure Developer CLI (azd)**  
Ferramenta de linha de comandos centrada no desenvolvedor que acelera o processo de criação e implantação de aplicações no Azure utilizando modelos e Infraestrutura como Código.

**azure.yaml**  
Ficheiro de configuração principal de um projeto azd que define serviços, infraestrutura e ganchos de implantação.

**Azure Resource Manager (ARM)**  
Serviço de gestão e implantação do Azure que fornece uma camada de gestão para criar, atualizar e eliminar recursos.

## B

**Bicep**  
Linguagem específica de domínio (DSL) desenvolvida pela Microsoft para implementar recursos do Azure. Oferece uma sintaxe mais simples do que os modelos ARM, enquanto compila para ARM.

**Build**  
Processo de compilar código-fonte, instalar dependências e preparar aplicações para implantação.

**Blue-Green Deployment**  
Estratégia de implantação que utiliza dois ambientes de produção idênticos (azul e verde) para minimizar o tempo de inatividade e o risco.

## C

**Container Apps**  
Serviço serverless do Azure para executar aplicações em contentores sem necessidade de gerir infraestrutura complexa.

**CI/CD**  
Integração Contínua/Implantação Contínua. Práticas automatizadas para integrar alterações de código e implantar aplicações.

**Cosmos DB**  
Serviço de base de dados globalmente distribuída e multi-modelo do Azure que oferece SLAs abrangentes para taxa de transferência, latência, disponibilidade e consistência.

**Configuration**  
Definições e parâmetros que controlam o comportamento da aplicação e opções de implantação.

## D

**Deployment**  
Processo de instalar e configurar aplicações e suas dependências na infraestrutura de destino.

**Docker**  
Plataforma para desenvolver, enviar e executar aplicações utilizando tecnologia de contentorização.

**Dockerfile**  
Ficheiro de texto contendo instruções para criar uma imagem de contentor Docker.

## E

**Environment**  
Destino de implantação que representa uma instância específica da sua aplicação (por exemplo, desenvolvimento, staging, produção).

**Environment Variables**  
Valores de configuração armazenados como pares chave-valor que as aplicações podem aceder em tempo de execução.

**Endpoint**  
URL ou endereço de rede onde uma aplicação ou serviço pode ser acedido.

## F

**Function App**  
Serviço de computação serverless do Azure que permite executar código orientado a eventos sem necessidade de gerir infraestrutura.

## G

**GitHub Actions**  
Plataforma de CI/CD integrada com repositórios GitHub para automatizar fluxos de trabalho.

**Git**  
Sistema de controlo de versões distribuído usado para rastrear alterações no código-fonte.

## H

**Hooks**  
Scripts ou comandos personalizados que são executados em pontos específicos durante o ciclo de vida da implantação (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Tipo de serviço do Azure onde uma aplicação será implantada (por exemplo, appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Prática de definir e gerir infraestrutura através de código em vez de processos manuais.

**Init**  
Processo de inicializar um novo projeto azd, normalmente a partir de um modelo.

## J

**JSON**  
JavaScript Object Notation. Formato de intercâmbio de dados comumente usado para ficheiros de configuração e respostas de APIs.

**JWT**  
JSON Web Token. Padrão para transmitir informações de forma segura entre partes como um objeto JSON.

## K

**Key Vault**  
Serviço do Azure para armazenar e gerir de forma segura segredos, chaves e certificados.

**Kusto Query Language (KQL)**  
Linguagem de consulta usada para analisar dados no Azure Monitor, Application Insights e outros serviços do Azure.

## L

**Load Balancer**  
Serviço que distribui tráfego de rede de entrada entre vários servidores ou instâncias.

**Log Analytics**  
Serviço do Azure para recolher, analisar e agir sobre dados de telemetria de ambientes na nuvem e locais.

## M

**Managed Identity**  
Funcionalidade do Azure que fornece uma identidade gerida automaticamente para serviços do Azure autenticarem-se em outros serviços do Azure.

**Microservices**  
Abordagem arquitetónica onde aplicações são construídas como uma coleção de pequenos serviços independentes.

**Monitor**  
Solução unificada de monitorização do Azure que fornece observabilidade de pilha completa em aplicações e infraestrutura.

## N

**Node.js**  
Runtime JavaScript construído sobre o motor JavaScript V8 do Chrome para criar aplicações do lado do servidor.

**npm**  
Gestor de pacotes para Node.js que gere dependências e pacotes.

## O

**Output**  
Valores retornados da implantação de infraestrutura que podem ser usados por aplicações ou outros recursos.

## P

**Package**  
Processo de preparar o código da aplicação e dependências para implantação.

**Parameters**  
Valores de entrada passados para modelos de infraestrutura para personalizar implantações.

**PostgreSQL**  
Sistema de base de dados relacional open-source suportado como serviço gerido no Azure.

**Provisioning**  
Processo de criar e configurar recursos do Azure definidos em modelos de infraestrutura.

## Q

**Quota**  
Limites na quantidade de recursos que podem ser criados numa subscrição ou região do Azure.

## R

**Resource Group**  
Contêiner lógico para recursos do Azure que partilham o mesmo ciclo de vida, permissões e políticas.

**Resource Token**  
String única gerada pelo azd para garantir que os nomes dos recursos sejam únicos entre implantações.

**REST API**  
Estilo arquitetónico para projetar aplicações em rede utilizando métodos HTTP.

**Rollback**  
Processo de reverter para uma versão anterior de uma aplicação ou configuração de infraestrutura.

## S

**Service**  
Componente da sua aplicação definido no azure.yaml (por exemplo, frontend web, backend API, base de dados).

**SKU**  
Unidade de Manutenção de Estoque. Representa diferentes níveis de serviço ou desempenho para recursos do Azure.

**SQL Database**  
Serviço de base de dados relacional gerido do Azure baseado no Microsoft SQL Server.

**Static Web Apps**  
Serviço do Azure para criar e implantar aplicações web full-stack a partir de repositórios de código-fonte.

**Storage Account**  
Serviço do Azure que fornece armazenamento na nuvem para objetos de dados, incluindo blobs, ficheiros, filas e tabelas.

**Subscription**  
Contêiner de conta do Azure que mantém grupos de recursos e recursos, com gestão associada de faturação e acesso.

## T

**Template**  
Estrutura de projeto pré-construída contendo código de aplicação, definições de infraestrutura e configuração para cenários comuns.

**Terraform**  
Ferramenta open-source de Infraestrutura como Código que suporta múltiplos fornecedores de nuvem, incluindo o Azure.

**Traffic Manager**  
Balanceador de carga baseado em DNS do Azure para distribuir tráfego entre regiões globais do Azure.

## U

**URI**  
Identificador Uniforme de Recursos. String que identifica um recurso específico.

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
Funcionalidade do Azure que mostra quais alterações seriam feitas por uma implantação sem realmente executá-la.

## Y

**YAML**  
YAML Ain't Markup Language. Padrão de serialização de dados legível por humanos usado para ficheiros de configuração como azure.yaml.

## Z

**Zone**  
Localizações fisicamente separadas dentro de uma região do Azure que fornecem redundância e alta disponibilidade.

---

## Siglas Comuns

| Sigla | Forma Completa | Descrição |
|-------|----------------|-----------|
| AAD | Azure Active Directory | Serviço de gestão de identidade e acesso |
| ACR | Azure Container Registry | Serviço de registo de imagens de contentores |
| AKS | Azure Kubernetes Service | Serviço gerido de Kubernetes |
| API | Application Programming Interface | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Serviço de gestão e implantação do Azure |
| CDN | Content Delivery Network | Rede distribuída de servidores |
| CI/CD | Continuous Integration/Continuous Deployment | Práticas automatizadas de desenvolvimento |
| CLI | Command Line Interface | Interface de utilizador baseada em texto |
| DNS | Domain Name System | Sistema para traduzir nomes de domínio em endereços IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versão segura do HTTP |
| IaC | Infrastructure as Code | Gestão de infraestrutura através de código |
| JSON | JavaScript Object Notation | Formato de intercâmbio de dados |
| JWT | JSON Web Token | Formato de token para transmissão segura de informações |
| KQL | Kusto Query Language | Linguagem de consulta para serviços de dados do Azure |
| RBAC | Role-Based Access Control | Método de controlo de acesso baseado em funções |
| REST | Representational State Transfer | Estilo arquitetónico para serviços web |
| SDK | Software Development Kit | Coleção de ferramentas de desenvolvimento |
| SLA | Service Level Agreement | Compromisso com disponibilidade/desempenho do serviço |
| SQL | Structured Query Language | Linguagem para gerir bases de dados relacionais |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolos criptográficos |
| URI | Uniform Resource Identifier | String que identifica um recurso |
| URL | Uniform Resource Locator | Tipo de URI que especifica a localização de um recurso |
| VM | Virtual Machine | Emulação de um sistema informático |
| VNet | Virtual Network | Rede privada no Azure |
| YAML | YAML Ain't Markup Language | Padrão de serialização de dados |

---

## Mapeamento de Nomes de Serviços do Azure

| Nome Comum | Nome Oficial do Serviço do Azure | Tipo de Host azd |
|------------|----------------------------------|------------------|
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
- **Environment Parity**: Manter os ambientes de desenvolvimento, staging e produção semelhantes  

### Termos de Segurança
- **Managed Identity**: Funcionalidade do Azure que fornece gestão automática de credenciais  
- **Key Vault**: Armazenamento seguro para segredos, chaves e certificados  
- **RBAC**: Controlo de acesso baseado em funções para recursos do Azure  
- **Network Security Group**: Firewall virtual para controlar o tráfego de rede  

### Termos de Monitorização
- **Telemetry**: Recolha automatizada de medições e dados  
- **Application Performance Monitoring (APM)**: Monitorização do desempenho de software  
- **Log Analytics**: Serviço para recolher e analisar dados de logs  
- **Alert Rules**: Notificações automáticas baseadas em métricas ou condições  

### Termos de Implantação
- **Blue-Green Deployment**: Estratégia de implantação sem tempo de inatividade  
- **Canary Deployment**: Implantação gradual para um subconjunto de utilizadores  
- **Rolling Update**: Substituição sequencial de instâncias de aplicação  
- **Rollback**: Reversão para uma versão anterior da aplicação  

---

**Dica de Utilização**: Use `Ctrl+F` para procurar rapidamente termos específicos neste glossário. Os termos estão interligados onde aplicável.

---

**Navegação**  
- **Lição Anterior**: [Cheat Sheet](cheat-sheet.md)  
- **Próxima Lição**: [FAQ](faq.md)  

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original no seu idioma nativo deve ser considerado a fonte oficial. Para informações críticas, recomenda-se uma tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.