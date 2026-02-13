# Glossário - Terminologia Azure e AZD

**Referência para Todos os Capítulos**
- **📚 Início do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Aprender os Básicos**: [Capítulo 1: Noções Básicas do AZD](../docs/getting-started/azd-basics.md)
- **🤖 Termos de IA**: [Capítulo 2: Desenvolvimento AI-First](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introdução

Este glossário abrangente fornece definições para termos, conceitos e acrónimos usados no Azure Developer CLI e no desenvolvimento na cloud Azure. Referência essencial para compreender documentação técnica, resolver problemas e comunicar eficazmente sobre projetos azd e serviços Azure.

## Objetivos de Aprendizagem

Ao usar este glossário, você irá:
- Compreender a terminologia e conceitos essenciais do Azure Developer CLI
- Dominar o vocabulário e termos técnicos do desenvolvimento na cloud Azure
- Referenciar termos de Infraestrutura como Código e implantação eficazmente
- Compreender nomes, acrónimos e finalidades dos serviços Azure
- Ter acesso a definições para terminologia de resolução de problemas e depuração
- Aprender conceitos avançados de arquitetura e desenvolvimento Azure

## Resultados de Aprendizagem

Com referência regular a este glossário, você poderá:
- Comunicar-se eficazmente usando a terminologia correta do Azure Developer CLI
- Compreender melhor documentação técnica e mensagens de erro
- Navegar pelos serviços e conceitos Azure com confiança
- Resolver problemas usando vocabulário técnico adequado
- Contribuir para discussões de equipa com linguagem técnica precisa
- Expandir sistematicamente o seu conhecimento em desenvolvimento na cloud Azure

## A

**ARM Template**  
Template do Azure Resource Manager. Formato baseado em JSON de Infraestrutura como Código usado para definir e implantar recursos Azure de forma declarativa.

**App Service**  
Oferta plataforma-como-serviço (PaaS) da Azure para hospedar aplicações web, APIs REST e backends móveis sem gerir infraestrutura.

**Application Insights**  
Serviço de monitorização do desempenho de aplicações (APM) da Azure que fornece insights profundos sobre desempenho, disponibilidade e utilização da aplicação.

**Azure CLI**  
Interface de linha de comandos para gerir recursos Azure. Utilizada pelo azd para autenticação e algumas operações.

**Azure Developer CLI (azd)**  
Ferramenta de linha de comandos centrada no desenvolvedor que acelera o processo de construção e implantação de aplicações para Azure usando templates e Infraestrutura como Código.

**azure.yaml**  
O ficheiro principal de configuração para um projeto azd que define serviços, infraestrutura e hooks de implantação.

**Azure Resource Manager (ARM)**  
Serviço de implantação e gestão da Azure que fornece uma camada de gestão para criar, atualizar e eliminar recursos.

## B

**Bicep**  
Linguagem específica de domínio (DSL) desenvolvida pela Microsoft para implantar recursos Azure. Oferece sintaxe mais simples que templates ARM enquanto compila para ARM.

**Build**  
Processo de compilar código-fonte, instalar dependências e preparar aplicações para implantação.

**Blue-Green Deployment**  
Estratégia de implantação que usa dois ambientes de produção idênticos (azul e verde) para minimizar tempo de inatividade e risco.

## C

**Container Apps**  
Serviço de contentores serverless da Azure que permite executar aplicações containerizadas sem gerir infraestrutura complexa.

**CI/CD**  
Integração Contínua/Entrega Contínua. Práticas automatizadas para integrar alterações de código e implantar aplicações.

**Cosmos DB**  
Serviço de base de dados multimodelo e globalmente distribuído da Azure que oferece SLAs abrangentes para throughput, latência, disponibilidade e consistência.

**Configuração**  
Definições e parâmetros que controlam o comportamento da aplicação e opções de implantação.

## D

**Deployment**  
Processo de instalar e configurar aplicações e as suas dependências na infraestrutura-alvo.

**Docker**  
Plataforma para desenvolver, distribuir e executar aplicações utilizando tecnologia de contentores.

**Dockerfile**  
Ficheiro de texto contendo instruções para construir uma imagem de contentor Docker.

## E

**Environment**  
Destino de implantação que representa uma instância específica da sua aplicação (ex.: desenvolvimento, pré-produção, produção).

**Environment Variables**  
Valores de configuração armazenados como pares chave-valor que as aplicações podem aceder em tempo de execução.

**Endpoint**  
URL ou endereço de rede onde uma aplicação ou serviço pode ser acedido.

## F

**Function App**  
Serviço de computação serverless da Azure que permite executar código baseado em eventos sem gerir infraestrutura.

## G

**GitHub Actions**  
Plataforma CI/CD integrada com repositórios GitHub para automatizar fluxos de trabalho.

**Git**  
Sistema de controlo de versões distribuído usado para rastrear alterações no código-fonte.

## H

**Hooks**  
Scripts ou comandos personalizados que são executados em pontos específicos durante o ciclo de vida da implantação (pré-provisionamento, pós-provisionamento, pré-implantação, pós-implantação).

**Host**  
Tipo de serviço Azure onde uma aplicação será implantada (ex.: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Prática de definir e gerir infraestrutura através de código em vez de processos manuais.

**Init**  
Processo de inicializar um novo projeto azd, tipicamente a partir de um template.

## J

**JSON**  
JavaScript Object Notation. Formato de intercâmbio de dados comum para ficheiros de configuração e respostas de API.

**JWT**  
JSON Web Token. Padrão para transmissão segura de informação entre partes como um objeto JSON.

## K

**Key Vault**  
Serviço da Azure para armazenar e gerir segredos, chaves e certificados de forma segura.

**Kusto Query Language (KQL)**  
Linguagem de consulta usada para analisar dados no Azure Monitor, Application Insights e outros serviços Azure.

## L

**Load Balancer**  
Serviço que distribui tráfego de rede recebido por vários servidores ou instâncias.

**Log Analytics**  
Serviço Azure para recolher, analisar e atuar sobre dados de telemetria de ambientes cloud e on-premises.

## M

**Managed Identity**  
Funcionalidade Azure que fornece às serviços Azure uma identidade automaticamente gerida para autenticação noutros serviços Azure.

**Microservices**  
Abordagem arquitetural onde aplicações são construídas como uma coleção de pequenos serviços independentes.

**Monitor**  
Solução unificada de monitorização Azure que fornece observabilidade completa em aplicações e infraestrutura.

## N

**Node.js**  
Runtime JavaScript construído sobre o motor V8 do Chrome para construir aplicações do lado do servidor.

**npm**  
Gestor de pacotes para Node.js que gere dependências e pacotes.

## O

**Output**  
Valores retornados a partir da implantação de infraestrutura que podem ser usados por aplicações ou outros recursos.

## P

**Package**  
Processo de preparar código da aplicação e dependências para implantação.

**Parameters**  
Valores de entrada passados para templates de infraestrutura para customizar implantações.

**PostgreSQL**  
Sistema de base de dados relacional open-source suportado na Azure como serviço gerido.

**Provisioning**  
Processo de criar e configurar recursos Azure definidos em templates de infraestrutura.

## Q

**Quota**  
Limites na quantidade de recursos que podem ser criados numa subscrição Azure ou região.

## R

**Resource Group**  
Contentor lógico para recursos Azure que partilham o mesmo ciclo de vida, permissões e políticas.

**Resource Token**  
String única gerada pelo azd para garantir que nomes de recursos são únicos entre implantações.

**REST API**  
Estilo arquitetural para desenhar aplicações em rede utilizando métodos HTTP.

**Rollback**  
Processo de reverter para uma versão anterior de uma aplicação ou configuração de infraestrutura.

## S

**Service**  
Componente da sua aplicação definido no azure.yaml (ex.: frontend web, backend API, base de dados).

**SKU**  
Stock Keeping Unit. Representa diferentes níveis de serviço ou desempenho para recursos Azure.

**SQL Database**  
Serviço de base de dados relacional gerido da Azure baseado no Microsoft SQL Server.

**Static Web Apps**  
Serviço Azure para construir e implantar aplicações web full-stack a partir de repositórios de código-fonte.

**Storage Account**  
Serviço Azure que fornece armazenamento cloud para objetos de dados incluindo blobs, ficheiros, filas e tabelas.

**Subscription**  
Contentor de conta Azure que detém grupos de recursos e recursos, com faturação e gestão de acessos associadas.

## T

**Template**  
Estrutura de projeto pré-construída contendo código da aplicação, definições de infraestrutura e configuração para cenários comuns.

**Terraform**  
Ferramenta open-source de Infraestrutura como Código que suporta múltiplos fornecedores cloud incluindo Azure.

**Traffic Manager**  
Balanceador de carga baseados em DNS da Azure para distribuir tráfego por regiões Azure globais.

## U

**URI**  
Identificador Uniforme de Recursos. String que identifica um recurso particular.

**URL**  
Localizador Uniforme de Recursos. Tipo de URI que especifica onde um recurso está localizado e como aceder a ele.

## V

**Virtual Network (VNet)**  
Bloco fundamental para redes privadas na Azure, fornecendo isolamento e segmentação.

**VS Code**  
Visual Studio Code. Editor de código popular com excelente integração Azure e azd.

## W

**Webhook**  
Callback HTTP disparado por eventos específicos, comummente utilizado em pipelines CI/CD.

**What-if**  
Funcionalidade Azure que mostra que alterações seriam feitas por uma implantação sem a executar de facto.

## Y

**YAML**  
YAML Ain't Markup Language. Padrão de serialização de dados legível por humanos usado para ficheiros de configuração como azure.yaml.

## Z

**Zone**  
Localizações fisicamente separadas dentro de uma região Azure que proporcionam redundância e alta disponibilidade.

---

## Acrónimos Comuns

| Acrónimo | Forma Completa | Descrição |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Serviço de gestão de identidade e acesso |
| ACR | Azure Container Registry | Serviço de registo de imagens de contentor |
| AKS | Azure Kubernetes Service | Serviço Kubernetes gerido |
| API | Application Programming Interface | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Serviço Azure de implantação e gestão |
| CDN | Content Delivery Network | Rede distribuída de servidores |
| CI/CD | Continuous Integration/Continuous Deployment | Práticas automatizadas de desenvolvimento |
| CLI | Command Line Interface | Interface de utilizador baseada em texto |
| DNS | Domain Name System | Sistema para traduzir nomes de domínio em endereços IP |
| HTTPS | Hypertext Transfer Protocol Secure | Versão segura do HTTP |
| IaC | Infrastructure as Code | Gestão de infraestrutura através de código |
| JSON | JavaScript Object Notation | Formato de intercâmbio de dados |
| JWT | JSON Web Token | Formato de token para transmissão segura de informação |
| KQL | Kusto Query Language | Linguagem de consulta para serviços de dados Azure |
| RBAC | Role-Based Access Control | Método de controlo de acesso baseado em funções de utilizador |
| REST | Representational State Transfer | Estilo arquitetural para web services |
| SDK | Software Development Kit | Conjunto de ferramentas de desenvolvimento |
| SLA | Service Level Agreement | Compromisso sobre disponibilidade/desempenho do serviço |
| SQL | Structured Query Language | Linguagem para gerir bases de dados relacionais |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocolos criptográficos |
| URI | Uniform Resource Identifier | String que identifica um recurso |
| URL | Uniform Resource Locator | Tipo de URI que especifica localização do recurso |
| VM | Virtual Machine | Emulação de um sistema informático |
| VNet | Virtual Network | Rede privada na Azure |
| YAML | YAML Ain't Markup Language | Padrão de serialização de dados |

---

## Correspondência de Nomes de Serviços Azure

| Nome Comum | Nome Oficial do Serviço Azure | Tipo de Host azd |
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
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termos Específicos de Contexto

### Termos de Desenvolvimento
- **Hot Reload**: Atualização automática das aplicações durante desenvolvimento sem reiniciar
- **Build Pipeline**: Processo automatizado para construir e testar código
- **Deployment Slot**: Ambiente de pré-produção dentro de um App Service
- **Environment Parity**: Manter ambientes de desenvolvimento, pré-produção e produção semelhantes

### Termos de Segurança
- **Managed Identity**: Funcionalidade Azure que fornece gestão automática de credenciais
- **Key Vault**: Armazenamento seguro para segredos, chaves e certificados
- **RBAC**: Controlo de acesso baseado em funções para recursos Azure
- **Network Security Group**: Firewall virtual para controlar tráfego de rede

### Termos de Monitorização
- **Telemetry**: Recolha automatizada de medições e dados
- **Application Performance Monitoring (APM)**: Monitorização do desempenho do software
- **Log Analytics**: Serviço para recolher e analisar dados de logs
- **Alert Rules**: Notificações automáticas baseadas em métricas ou condições

### Termos de Implantação
- **Blue-Green Deployment**: Estratégia de implantação sem tempo de inatividade
- **Canary Deployment**: Desdobramento gradual para um subconjunto de utilizadores
- **Rolling Update**: Substituição sequencial de instâncias da aplicação
- **Rollback**: Reversão para versão anterior da aplicação

---

**Dica de Utilização**: Use `Ctrl+F` para procurar rapidamente termos específicos neste glossário. Os termos estão interligados quando aplicável.

---

**Navegação**
- **Aula Anterior**: [Folha de Dicas](cheat-sheet.md)
- **Próxima Aula**: [Perguntas Frequentes](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, por favor tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->