<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-17T21:33:12+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "br"
}
-->
# Glossário - Terminologia do Azure e AZD

**Referência para Todos os Capítulos**
- **📚 Página Inicial do Curso**: [AZD Para Iniciantes](../README.md)
- **📖 Aprenda o Básico**: [Capítulo 1: Fundamentos do AZD](../docs/getting-started/azd-basics.md)
- **🤖 Termos de IA**: [Capítulo 2: Desenvolvimento Orientado por IA](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Introdução

Este glossário abrangente fornece definições de termos, conceitos e acrônimos usados no Azure Developer CLI e no desenvolvimento em nuvem do Azure. É uma referência essencial para entender a documentação técnica, solucionar problemas e comunicar-se de forma eficaz sobre projetos azd e serviços do Azure.

## Objetivos de Aprendizagem

Ao usar este glossário, você irá:
- Compreender a terminologia e os conceitos essenciais do Azure Developer CLI
- Dominar o vocabulário e os termos técnicos do desenvolvimento em nuvem do Azure
- Referenciar de forma eficiente a terminologia de Infraestrutura como Código e implantação
- Entender os nomes dos serviços do Azure, acrônimos e seus propósitos
- Acessar definições para solucionar problemas e depurar terminologia
- Aprender conceitos avançados de arquitetura e desenvolvimento no Azure

## Resultados de Aprendizagem

Com referência regular a este glossário, você será capaz de:
- Comunicar-se de forma eficaz usando a terminologia correta do Azure Developer CLI
- Entender a documentação técnica e mensagens de erro com mais clareza
- Navegar pelos serviços e conceitos do Azure com confiança
- Solucionar problemas usando o vocabulário técnico apropriado
- Contribuir para discussões em equipe com linguagem técnica precisa
- Expandir sistematicamente seu conhecimento sobre desenvolvimento em nuvem no Azure

## A

**ARM Template**  
Template do Azure Resource Manager. Formato JSON de Infraestrutura como Código usado para definir e implantar recursos do Azure de forma declarativa.

**App Service**  
Oferta de plataforma como serviço (PaaS) do Azure para hospedar aplicativos web, APIs REST e backends móveis sem gerenciar infraestrutura.

**Application Insights**  
Serviço de monitoramento de desempenho de aplicativos (APM) do Azure que fornece insights profundos sobre desempenho, disponibilidade e uso de aplicativos.

**Azure CLI**  
Interface de linha de comando para gerenciar recursos do Azure. Usada pelo azd para autenticação e algumas operações.

**Azure Developer CLI (azd)**  
Ferramenta de linha de comando voltada para desenvolvedores que acelera o processo de criação e implantação de aplicativos no Azure usando templates e Infraestrutura como Código.

**azure.yaml**  
Arquivo de configuração principal de um projeto azd que define serviços, infraestrutura e ganchos de implantação.

**Azure Resource Manager (ARM)**  
Serviço de implantação e gerenciamento do Azure que fornece uma camada de gerenciamento para criar, atualizar e excluir recursos.

## B

**Bicep**  
Linguagem específica de domínio (DSL) desenvolvida pela Microsoft para implantar recursos do Azure. Oferece uma sintaxe mais simples que os templates ARM enquanto compila para ARM.

**Build**  
Processo de compilar código-fonte, instalar dependências e preparar aplicativos para implantação.

**Blue-Green Deployment**  
Estratégia de implantação que utiliza dois ambientes de produção idênticos (azul e verde) para minimizar o tempo de inatividade e os riscos.

## C

**Container Apps**  
Serviço de contêiner sem servidor do Azure que permite executar aplicativos conteinerizados sem gerenciar infraestrutura complexa.

**CI/CD**  
Integração Contínua/Implantação Contínua. Práticas automatizadas para integrar alterações de código e implantar aplicativos.

**Cosmos DB**  
Serviço de banco de dados globalmente distribuído e multi-modelo do Azure que oferece SLAs abrangentes para throughput, latência, disponibilidade e consistência.

**Configuration**  
Configurações e parâmetros que controlam o comportamento do aplicativo e as opções de implantação.

## D

**Deployment**  
Processo de instalar e configurar aplicativos e suas dependências na infraestrutura de destino.

**Docker**  
Plataforma para desenvolver, enviar e executar aplicativos usando tecnologia de conteinerização.

**Dockerfile**  
Arquivo de texto contendo instruções para construir uma imagem de contêiner Docker.

## E

**Environment**  
Um alvo de implantação que representa uma instância específica do seu aplicativo (ex.: desenvolvimento, homologação, produção).

**Environment Variables**  
Valores de configuração armazenados como pares chave-valor que os aplicativos podem acessar em tempo de execução.

**Endpoint**  
URL ou endereço de rede onde um aplicativo ou serviço pode ser acessado.

## F

**Function App**  
Serviço de computação sem servidor do Azure que permite executar código orientado por eventos sem gerenciar infraestrutura.

## G

**GitHub Actions**  
Plataforma de CI/CD integrada a repositórios GitHub para automatizar fluxos de trabalho.

**Git**  
Sistema de controle de versão distribuído usado para rastrear alterações no código-fonte.

## H

**Hooks**  
Scripts ou comandos personalizados que são executados em pontos específicos durante o ciclo de vida de implantação (preprovision, postprovision, predeploy, postdeploy).

**Host**  
O tipo de serviço do Azure onde um aplicativo será implantado (ex.: appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Prática de definir e gerenciar infraestrutura por meio de código em vez de processos manuais.

**Init**  
Processo de inicializar um novo projeto azd, normalmente a partir de um template.

## J

**JSON**  
JavaScript Object Notation. Formato de intercâmbio de dados comumente usado para arquivos de configuração e respostas de APIs.

**JWT**  
JSON Web Token. Padrão para transmitir informações de forma segura entre partes como um objeto JSON.

## K

**Key Vault**  
Serviço do Azure para armazenar e gerenciar de forma segura segredos, chaves e certificados.

**Kusto Query Language (KQL)**  
Linguagem de consulta usada para analisar dados no Azure Monitor, Application Insights e outros serviços do Azure.

## L

**Load Balancer**  
Serviço que distribui o tráfego de rede recebido entre vários servidores ou instâncias.

**Log Analytics**  
Serviço do Azure para coletar, analisar e agir sobre dados de telemetria de ambientes em nuvem e locais.

## M

**Managed Identity**  
Recurso do Azure que fornece aos serviços do Azure uma identidade gerenciada automaticamente para autenticação em outros serviços do Azure.

**Microservices**  
Abordagem arquitetural onde aplicativos são construídos como uma coleção de pequenos serviços independentes.

**Monitor**  
Solução de monitoramento unificada do Azure que fornece observabilidade completa em aplicativos e infraestrutura.

## N

**Node.js**  
Runtime JavaScript construído sobre o motor JavaScript V8 do Chrome para criar aplicativos do lado do servidor.

**npm**  
Gerenciador de pacotes para Node.js que gerencia dependências e pacotes.

## O

**Output**  
Valores retornados da implantação de infraestrutura que podem ser usados por aplicativos ou outros recursos.

## P

**Package**  
Processo de preparar o código do aplicativo e dependências para implantação.

**Parameters**  
Valores de entrada passados para templates de infraestrutura para personalizar implantações.

**PostgreSQL**  
Sistema de banco de dados relacional de código aberto suportado como serviço gerenciado no Azure.

**Provisioning**  
Processo de criar e configurar recursos do Azure definidos em templates de infraestrutura.

## Q

**Quota**  
Limites na quantidade de recursos que podem ser criados em uma assinatura ou região do Azure.

## R

**Resource Group**  
Contêiner lógico para recursos do Azure que compartilham o mesmo ciclo de vida, permissões e políticas.

**Resource Token**  
String única gerada pelo azd para garantir que os nomes dos recursos sejam únicos entre implantações.

**REST API**  
Estilo arquitetural para projetar aplicativos em rede usando métodos HTTP.

**Rollback**  
Processo de reverter para uma versão anterior de um aplicativo ou configuração de infraestrutura.

## S

**Service**  
Um componente do seu aplicativo definido no azure.yaml (ex.: frontend web, backend API, banco de dados).

**SKU**  
Unidade de Manutenção de Estoque. Representa diferentes níveis de serviço ou desempenho para recursos do Azure.

**SQL Database**  
Serviço de banco de dados relacional gerenciado do Azure baseado no Microsoft SQL Server.

**Static Web Apps**  
Serviço do Azure para construir e implantar aplicativos web full-stack a partir de repositórios de código-fonte.

**Storage Account**  
Serviço do Azure que fornece armazenamento em nuvem para objetos de dados, incluindo blobs, arquivos, filas e tabelas.

**Subscription**  
Contêiner de conta do Azure que mantém grupos de recursos e recursos, com gerenciamento de cobrança e acesso associado.

## T

**Template**  
Estrutura de projeto pré-construída contendo código de aplicativo, definições de infraestrutura e configuração para cenários comuns.

**Terraform**  
Ferramenta de Infraestrutura como Código de código aberto que suporta vários provedores de nuvem, incluindo o Azure.

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
Callback HTTP acionado por eventos específicos, comumente usado em pipelines de CI/CD.

**What-if**  
Recurso do Azure que mostra quais alterações seriam feitas por uma implantação sem realmente executá-la.

## Y

**YAML**  
YAML Ain't Markup Language. Padrão de serialização de dados legível por humanos usado para arquivos de configuração como azure.yaml.

## Z

**Zone**  
Locais fisicamente separados dentro de uma região do Azure que fornecem redundância e alta disponibilidade.

---

## Acrônimos Comuns

| Acrônimo | Forma Completa | Descrição |
|---------|----------------|-----------|
| AAD | Azure Active Directory | Serviço de gerenciamento de identidade e acesso |
| ACR | Azure Container Registry | Serviço de registro de imagens de contêiner |
| AKS | Azure Kubernetes Service | Serviço Kubernetes gerenciado |
| API | Interface de Programação de Aplicações | Conjunto de protocolos para construir software |
| ARM | Azure Resource Manager | Serviço de implantação e gerenciamento do Azure |
| CDN | Rede de Distribuição de Conteúdo | Rede distribuída de servidores |
| CI/CD | Integração Contínua/Implantação Contínua | Práticas automatizadas de desenvolvimento |
| CLI | Interface de Linha de Comando | Interface de usuário baseada em texto |
| DNS | Sistema de Nomes de Domínio | Sistema para traduzir nomes de domínio em endereços IP |
| HTTPS | Protocolo de Transferência de Hipertexto Seguro | Versão segura do HTTP |
| IaC | Infraestrutura como Código | Gerenciamento de infraestrutura por meio de código |
| JSON | JavaScript Object Notation | Formato de intercâmbio de dados |
| JWT | JSON Web Token | Formato de token para transmissão segura de informações |
| KQL | Kusto Query Language | Linguagem de consulta para serviços de dados do Azure |
| RBAC | Controle de Acesso Baseado em Funções | Método de controle de acesso baseado em funções de usuário |
| REST | Transferência de Estado Representacional | Estilo arquitetural para serviços web |
| SDK | Kit de Desenvolvimento de Software | Coleção de ferramentas de desenvolvimento |
| SLA | Acordo de Nível de Serviço | Compromisso com disponibilidade/desempenho de serviço |
| SQL | Linguagem de Consulta Estruturada | Linguagem para gerenciar bancos de dados relacionais |
| SSL/TLS | Camada de Soquetes Seguros/Segurança da Camada de Transporte | Protocolos criptográficos |
| URI | Identificador Uniforme de Recursos | String que identifica um recurso |
| URL | Localizador Uniforme de Recursos | Tipo de URI que especifica a localização de um recurso |
| VM | Máquina Virtual | Emulação de um sistema de computador |
| VNet | Rede Virtual | Rede privada no Azure |
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
- **Hot Reload**: Atualização automática de aplicativos durante o desenvolvimento sem reiniciar
- **Build Pipeline**: Processo automatizado para construir e testar código
- **Deployment Slot**: Ambiente de homologação dentro de um App Service
- **Environment Parity**: Manter os ambientes de desenvolvimento, homologação e produção semelhantes

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
- **Blue-Green Deployment**: Estratégia de implantação sem tempo de inatividade
- **Canary Deployment**: Implantação gradual para um subconjunto de usuários
- **Rolling Update**: Substituição sequencial de instâncias de aplicativos
- **Rollback**: Reversão para uma versão anterior do aplicativo

---

**Dica de Uso**: Use `Ctrl+F` para buscar rapidamente termos específicos neste glossário. Os termos são referenciados cruzadamente onde aplicável.

---

**Navegação**
- **Lição Anterior**: [Cheat Sheet](cheat-sheet.md)
- **Próxima Lição**: [FAQ](faq.md)

---

**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.