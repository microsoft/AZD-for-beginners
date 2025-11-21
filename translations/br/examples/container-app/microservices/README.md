<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-20T23:18:02+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "br"
}
-->
# Arquitetura de Microservices - Exemplo de Aplicativo em Contêiner

⏱️ **Tempo Estimado**: 25-35 minutos | 💰 **Custo Estimado**: ~$50-100/mês | ⭐ **Complexidade**: Avançado

Uma **arquitetura de microservices simplificada, mas funcional** implantada no Azure Container Apps usando o AZD CLI. Este exemplo demonstra comunicação entre serviços, orquestração de contêineres e monitoramento com uma configuração prática de 2 serviços.

> **📚 Abordagem de Aprendizado**: Este exemplo começa com uma arquitetura mínima de 2 serviços (API Gateway + Backend Service) que você pode realmente implantar e aprender. Após dominar essa base, fornecemos orientações para expandir para um ecossistema completo de microservices.

## O que você vai aprender

Ao concluir este exemplo, você irá:
- Implantar múltiplos contêineres no Azure Container Apps
- Implementar comunicação entre serviços com rede interna
- Configurar escalonamento baseado em ambiente e verificações de saúde
- Monitorar aplicativos distribuídos com Application Insights
- Compreender padrões de implantação de microservices e melhores práticas
- Aprender expansão progressiva de arquiteturas simples para complexas

## Arquitetura

### Fase 1: O que estamos construindo (Incluído neste exemplo)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**Por que começar simples?**
- ✅ Implantar e entender rapidamente (25-35 minutos)
- ✅ Aprender padrões principais de microservices sem complexidade
- ✅ Código funcional que você pode modificar e experimentar
- ✅ Custo menor para aprendizado (~$50-100/mês vs $300-1400/mês)
- ✅ Construir confiança antes de adicionar bancos de dados e filas de mensagens

**Analogia**: Pense nisso como aprender a dirigir. Você começa em um estacionamento vazio (2 serviços), domina o básico e depois progride para o tráfego da cidade (5+ serviços com bancos de dados).

### Fase 2: Expansão futura (Arquitetura de referência)

Depois de dominar a arquitetura de 2 serviços, você pode expandir para:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Veja a seção "Guia de Expansão" no final para instruções passo a passo.

## Recursos Incluídos

✅ **Descoberta de Serviços**: Descoberta automática baseada em DNS entre contêineres  
✅ **Balanceamento de Carga**: Balanceamento de carga integrado entre réplicas  
✅ **Autoescalonamento**: Escalonamento independente por serviço baseado em solicitações HTTP  
✅ **Monitoramento de Saúde**: Probes de liveness e readiness para ambos os serviços  
✅ **Log Distribuído**: Log centralizado com Application Insights  
✅ **Rede Interna**: Comunicação segura entre serviços  
✅ **Orquestração de Contêineres**: Implantação e escalonamento automáticos  
✅ **Atualizações Sem Interrupção**: Atualizações contínuas com gerenciamento de revisões  

## Pré-requisitos

### Ferramentas Necessárias

Antes de começar, verifique se você tem estas ferramentas instaladas:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versão 1.0.0 ou superior)
   ```bash
   azd version
   # Saída esperada: versão azd 1.0.0 ou superior
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versão 2.50.0 ou superior)
   ```bash
   az --version
   # Saída esperada: azure-cli 2.50.0 ou superior
   ```

3. **[Docker](https://www.docker.com/get-started)** (para desenvolvimento/testes locais - opcional)
   ```bash
   docker --version
   # Saída esperada: versão do Docker 20.10 ou superior
   ```

### Requisitos do Azure

- Uma **assinatura ativa do Azure** ([crie uma conta gratuita](https://azure.microsoft.com/free/))
- Permissões para criar recursos na sua assinatura
- Papel de **Contribuidor** na assinatura ou grupo de recursos

### Pré-requisitos de Conhecimento

Este é um exemplo de **nível avançado**. Você deve ter:
- Concluído o [exemplo de API Flask simples](../../../../../examples/container-app/simple-flask-api) 
- Entendimento básico de arquitetura de microservices
- Familiaridade com APIs REST e HTTP
- Compreensão de conceitos de contêineres

**Novo no Container Apps?** Comece com o [exemplo de API Flask simples](../../../../../examples/container-app/simple-flask-api) primeiro para aprender o básico.

## Início Rápido (Passo a Passo)

### Passo 1: Clonar e Navegar

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Verificação de Sucesso**: Verifique se você vê `azure.yaml`:
```bash
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Passo 2: Autenticar com o Azure

```bash
azd auth login
```

Isso abrirá seu navegador para autenticação no Azure. Faça login com suas credenciais do Azure.

**✓ Verificação de Sucesso**: Você deve ver:
```
Logged in to Azure.
```

### Passo 3: Inicializar o Ambiente

```bash
azd init
```

**Perguntas que você verá**:
- **Nome do ambiente**: Insira um nome curto (ex.: `microservices-dev`)
- **Assinatura do Azure**: Selecione sua assinatura
- **Localização do Azure**: Escolha uma região (ex.: `eastus`, `westeurope`)

**✓ Verificação de Sucesso**: Você deve ver:
```
SUCCESS: New project initialized!
```

### Passo 4: Implantar Infraestrutura e Serviços

```bash
azd up
```

**O que acontece** (leva de 8 a 12 minutos):
1. Cria o ambiente de Container Apps
2. Cria o Application Insights para monitoramento
3. Constrói o contêiner do API Gateway (Node.js)
4. Constrói o contêiner do Product Service (Python)
5. Implanta ambos os contêineres no Azure
6. Configura rede e verificações de saúde
7. Configura monitoramento e logs

**✓ Verificação de Sucesso**: Você deve ver:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tempo**: 8-12 minutos

### Passo 5: Testar a Implantação

```bash
# Obter o endpoint do gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testar a saúde do API Gateway
curl $GATEWAY_URL/health

# Saída esperada:
# {"status":"saudável","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Teste o serviço de produtos através do gateway**:
```bash
# Listar produtos
curl $GATEWAY_URL/api/products

# Saída esperada:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Teclado","price":79.99,"stock":150}
# ]
```

**✓ Verificação de Sucesso**: Ambos os endpoints retornam dados JSON sem erros.

---

**🎉 Parabéns!** Você implantou uma arquitetura de microservices no Azure!

## Estrutura do Projeto

Todos os arquivos de implementação estão incluídos—este é um exemplo completo e funcional:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**O que cada componente faz:**

**Infraestrutura (infra/)**:
- `main.bicep`: Orquestra todos os recursos do Azure e suas dependências
- `core/container-apps-environment.bicep`: Cria o ambiente de Container Apps e o Azure Container Registry
- `core/monitor.bicep`: Configura o Application Insights para log distribuído
- `app/*.bicep`: Definições individuais de aplicativos em contêiner com escalonamento e verificações de saúde

**API Gateway (src/api-gateway/)**:
- Serviço voltado ao público que roteia solicitações para serviços de backend
- Implementa logs, tratamento de erros e encaminhamento de solicitações
- Demonstra comunicação HTTP entre serviços

**Product Service (src/product-service/)**:
- Serviço interno com catálogo de produtos (em memória para simplicidade)
- API REST com verificações de saúde
- Exemplo de padrão de microservice de backend

## Visão Geral dos Serviços

### API Gateway (Node.js/Express)

**Porta**: 8080  
**Acesso**: Público (ingress externo)  
**Propósito**: Roteia solicitações recebidas para os serviços de backend apropriados  

**Endpoints**:
- `GET /` - Informações do serviço
- `GET /health` - Endpoint de verificação de saúde
- `GET /api/products` - Encaminha para o serviço de produtos (listar todos)
- `GET /api/products/:id` - Encaminha para o serviço de produtos (obter por ID)

**Principais Recursos**:
- Roteamento de solicitações com axios
- Log centralizado
- Tratamento de erros e gerenciamento de tempo limite
- Descoberta de serviços via variáveis de ambiente
- Integração com Application Insights

**Destaque de Código** (`src/api-gateway/app.js`):
```javascript
// Comunicação interna de serviço
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Porta**: 8000  
**Acesso**: Somente interno (sem ingress externo)  
**Propósito**: Gerencia o catálogo de produtos com dados em memória  

**Endpoints**:
- `GET /` - Informações do serviço
- `GET /health` - Endpoint de verificação de saúde
- `GET /products` - Lista todos os produtos
- `GET /products/<id>` - Obtém produto por ID

**Principais Recursos**:
- API RESTful com Flask
- Armazenamento de produtos em memória (simples, sem necessidade de banco de dados)
- Monitoramento de saúde com probes
- Log estruturado
- Integração com Application Insights

**Modelo de Dados**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**Por que somente interno?**
O serviço de produtos não é exposto publicamente. Todas as solicitações devem passar pelo API Gateway, que fornece:
- Segurança: Ponto de acesso controlado
- Flexibilidade: Pode alterar o backend sem afetar os clientes
- Monitoramento: Log centralizado de solicitações

## Compreendendo a Comunicação entre Serviços

### Como os Serviços se Comunicam

Neste exemplo, o API Gateway se comunica com o Product Service usando **chamadas HTTP internas**:

```javascript
// Gateway de API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Fazer requisição HTTP interna
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Pontos-chave**:

1. **Descoberta baseada em DNS**: O Container Apps fornece automaticamente DNS para serviços internos
   - FQDN do Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplificado como: `http://product-service` (o Container Apps resolve isso)

2. **Sem Exposição Pública**: O Product Service tem `external: false` no Bicep
   - Apenas acessível dentro do ambiente de Container Apps
   - Não pode ser alcançado pela internet

3. **Variáveis de Ambiente**: URLs de serviços são injetados no momento da implantação
   - O Bicep passa o FQDN interno para o gateway
   - Nenhum URL hardcoded no código do aplicativo

**Analogia**: Pense nisso como salas de escritório. O API Gateway é a recepção (voltada ao público), e o Product Service é uma sala de escritório (somente interna). Os visitantes devem passar pela recepção para chegar a qualquer sala.

## Opções de Implantação

### Implantação Completa (Recomendada)

```bash
# Implantar infraestrutura e ambos os serviços
azd up
```

Isso implanta:
1. Ambiente de Container Apps
2. Application Insights
3. Container Registry
4. Contêiner do API Gateway
5. Contêiner do Product Service

**Tempo**: 8-12 minutos

### Implantar Serviço Individual

```bash
# Implante apenas um serviço (após o azd up inicial)
azd deploy api-gateway

# Ou implante o serviço de produto
azd deploy product-service
```

**Caso de Uso**: Quando você atualizou o código em um serviço e deseja reimplantar apenas aquele serviço.

### Atualizar Configuração

```bash
# Alterar parâmetros de escala
azd env set GATEWAY_MAX_REPLICAS 30

# Reimplantar com nova configuração
azd up
```

## Configuração

### Configuração de Escalonamento

Ambos os serviços estão configurados com autoescalonamento baseado em HTTP em seus arquivos Bicep:

**API Gateway**:
- Réplicas mínimas: 2 (sempre pelo menos 2 para disponibilidade)
- Réplicas máximas: 20
- Trigger de escalonamento: 50 solicitações simultâneas por réplica

**Product Service**:
- Réplicas mínimas: 1 (pode escalar para zero, se necessário)
- Réplicas máximas: 10
- Trigger de escalonamento: 100 solicitações simultâneas por réplica

**Personalizar Escalonamento** (em `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Alocação de Recursos

**API Gateway**:
- CPU: 1.0 vCPU
- Memória: 2 GiB
- Motivo: Lida com todo o tráfego externo

**Product Service**:
- CPU: 0.5 vCPU
- Memória: 1 GiB
- Motivo: Operações leves em memória

### Verificações de Saúde

Ambos os serviços incluem probes de liveness e readiness:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**O que isso significa**:
- **Liveness**: Se a verificação de saúde falhar, o Container Apps reinicia o contêiner
- **Readiness**: Se não estiver pronto, o Container Apps para de rotear tráfego para aquela réplica

## Monitoramento e Observabilidade

### Visualizar Logs de Serviço

```bash
# Transmitir logs do API Gateway
azd logs api-gateway --follow

# Visualizar logs recentes do serviço de produtos
azd logs product-service --tail 100

# Visualizar todos os logs de ambos os serviços
azd logs --follow
```

**Saída Esperada**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Consultas no Application Insights

Acesse o Application Insights no Portal do Azure e execute estas consultas:

**Encontrar Solicitações Lentas**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Rastrear Chamadas entre Serviços**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Taxa de Erro por Serviço**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volume de Solicitações ao Longo do Tempo**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Acessar o Painel de Monitoramento

```bash
# Obter detalhes do Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Abrir monitoramento do Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Métricas em Tempo Real

1. Navegue até o Application Insights no Portal do Azure
2. Clique em "Live Metrics"
3. Veja solicitações, falhas e desempenho em tempo real
4. Teste executando: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Exercícios Práticos

[Nota: Veja os exercícios completos acima na seção "Exercícios Práticos" para exercícios detalhados passo a passo, incluindo verificação de implantação, modificação de dados, testes de autoescalonamento, tratamento de erros e adição de um terceiro serviço.]

## Análise de Custos

### Custos Mensais Estimados (Para Este Exemplo de 2 Serviços)

| Recurso | Configuração | Custo Estimado |
|----------|--------------|----------------|
| API Gateway | 2-20 réplicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 réplicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Tier básico | $5 |
| Application Insights | 1-2 GB/mês | $5-10 |
| Log Analytics | 1 GB/mês | $3 |
| **Total** | | **$58-243/mês** |

**Divisão de Custos por Uso**:
- **Tráfego leve** (testes/aprendizado): ~$60/mês
- **Tráfego moderado** (pequena produção): ~$120/mês
- **Tráfego alto** (períodos movimentados): ~$240/mês

### Dicas de Otimização de Custos

1. **Escalar para Zero no Desenvolvimento**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Usar Plano de Consumo para Cosmos DB** (quando você adicioná-lo):
   - Pague apenas pelo que usar
   - Sem cobrança mínima

3. **Configurar Amostragem no Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Amostrar 50% das solicitações
   ```

4. **Limpar Quando Não Necessário**:
   ```bash
   azd down
   ```

### Opções de Tier Gratuito
Para aprendizado/testes, considere:
- Use créditos gratuitos do Azure (primeiros 30 dias)
- Mantenha o número mínimo de réplicas
- Exclua após os testes (sem cobranças contínuas)

---

## Limpeza

Para evitar cobranças contínuas, exclua todos os recursos:

```bash
azd down --force --purge
```

**Prompt de Confirmação**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Digite `y` para confirmar.

**O que será excluído**:
- Ambiente de Container Apps
- Ambos os Container Apps (gateway e serviço de produtos)
- Registro de Contêiner
- Application Insights
- Workspace do Log Analytics
- Grupo de Recursos

**✓ Verificar Limpeza**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Deve retornar vazio.

---

## Guia de Expansão: De 2 para 5+ Serviços

Depois de dominar esta arquitetura de 2 serviços, veja como expandir:

### Fase 1: Adicionar Persistência de Banco de Dados (Próximo Passo)

**Adicionar Cosmos DB para o Serviço de Produtos**:

1. Crie `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Atualize o serviço de produtos para usar o Cosmos DB em vez de dados em memória

3. Custo adicional estimado: ~US$ 25/mês (serverless)

### Fase 2: Adicionar Terceiro Serviço (Gerenciamento de Pedidos)

**Criar Serviço de Pedidos**:

1. Nova pasta: `src/order-service/` (Python/Node.js/C#)
2. Novo Bicep: `infra/app/order-service.bicep`
3. Atualize o API Gateway para rotear `/api/orders`
4. Adicione Azure SQL Database para persistência de pedidos

**A arquitetura se torna**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Adicionar Comunicação Assíncrona (Service Bus)

**Implementar Arquitetura Orientada a Eventos**:

1. Adicione Azure Service Bus: `infra/core/servicebus.bicep`
2. O Serviço de Produtos publica eventos "ProductCreated"
3. O Serviço de Pedidos assina eventos de produtos
4. Adicione Serviço de Notificação para processar eventos

**Padrão**: Request/Response (HTTP) + Event-Driven (Service Bus)

### Fase 4: Adicionar Autenticação de Usuário

**Implementar Serviço de Usuário**:

1. Crie `src/user-service/` (Go/Node.js)
2. Adicione Azure AD B2C ou autenticação JWT personalizada
3. O API Gateway valida os tokens
4. Os serviços verificam permissões de usuário

### Fase 5: Preparação para Produção

**Adicione Estes Componentes**:
- Azure Front Door (balanceamento de carga global)
- Azure Key Vault (gerenciamento de segredos)
- Azure Monitor Workbooks (dashboards personalizados)
- Pipeline CI/CD (GitHub Actions)
- Deployments Blue-Green
- Identidade Gerenciada para todos os serviços

**Custo Total da Arquitetura em Produção**: ~US$ 300-1.400/mês

---

## Saiba Mais

### Documentação Relacionada
- [Documentação do Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Guia de Arquitetura de Microsserviços](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights para Rastreamento Distribuído](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Próximos Passos Neste Curso
- ← Anterior: [API Flask Simples](../../../../../examples/container-app/simple-flask-api) - Exemplo inicial de contêiner único
- → Próximo: [Guia de Integração com IA](../../../../../examples/docs/ai-foundry) - Adicione capacidades de IA
- 🏠 [Página Inicial do Curso](../../README.md)

### Comparação: Quando Usar o Quê

**Container App Único** (Exemplo de API Flask Simples):
- ✅ Aplicações simples
- ✅ Arquitetura monolítica
- ✅ Rápido para implantar
- ❌ Escalabilidade limitada
- **Custo**: ~US$ 15-50/mês

**Microsserviços** (Este exemplo):
- ✅ Aplicações complexas
- ✅ Escalabilidade independente por serviço
- ✅ Autonomia de equipe (diferentes serviços, diferentes equipes)
- ❌ Mais complexo de gerenciar
- **Custo**: ~US$ 60-250/mês

**Kubernetes (AKS)**:
- ✅ Máximo controle e flexibilidade
- ✅ Portabilidade multi-cloud
- ✅ Rede avançada
- ❌ Requer expertise em Kubernetes
- **Custo**: ~US$ 150-500/mês no mínimo

**Recomendação**: Comece com Container Apps (este exemplo), migre para AKS apenas se precisar de recursos específicos do Kubernetes.

---

## Perguntas Frequentes

**P: Por que apenas 2 serviços em vez de 5+?**  
R: Progressão educacional. Domine os fundamentos (comunicação entre serviços, monitoramento, escalabilidade) com um exemplo simples antes de adicionar complexidade. Os padrões aprendidos aqui se aplicam a arquiteturas com 100 serviços.

**P: Posso adicionar mais serviços por conta própria?**  
R: Com certeza! Siga o guia de expansão acima. Cada novo serviço segue o mesmo padrão: crie a pasta src, crie o arquivo Bicep, atualize o azure.yaml, implante.

**P: Isso está pronto para produção?**  
R: É uma base sólida. Para produção, adicione: identidade gerenciada, Key Vault, bancos de dados persistentes, pipeline CI/CD, alertas de monitoramento e estratégia de backup.

**P: Por que não usar Dapr ou outro service mesh?**  
R: Mantenha simples para aprendizado. Depois de entender o networking nativo do Container Apps, você pode adicionar Dapr para cenários avançados.

**P: Como faço para depurar localmente?**  
R: Execute os serviços localmente com Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**P: Posso usar diferentes linguagens de programação?**  
R: Sim! Este exemplo mostra Node.js (gateway) + Python (serviço de produtos). Você pode misturar qualquer linguagem que rode em contêineres.

**P: E se eu não tiver créditos do Azure?**  
R: Use o nível gratuito do Azure (primeiros 30 dias com novas contas) ou implante para períodos curtos de teste e exclua imediatamente.

---

> **🎓 Resumo do Caminho de Aprendizado**: Você aprendeu a implantar uma arquitetura multi-serviço com escalabilidade automática, rede interna, monitoramento centralizado e padrões prontos para produção. Esta base o prepara para sistemas distribuídos complexos e arquiteturas de microsserviços empresariais.

**📚 Navegação do Curso:**
- ← Anterior: [API Flask Simples](../../../../../examples/container-app/simple-flask-api)
- → Próximo: [Exemplo de Integração com Banco de Dados](../../../../../examples/database-app)
- 🏠 [Página Inicial do Curso](../../README.md)
- 📖 [Melhores Práticas para Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se a tradução profissional feita por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->