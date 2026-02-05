# Arquitetura de Microserviços - Exemplo de Aplicação em Contêiner

⏱️ **Tempo Estimado**: 25-35 minutos | 💰 **Custo Estimado**: ~$50-100/mês | ⭐ **Complexidade**: Avançado

Uma **arquitetura de microserviços simplificada, mas funcional**, implantada no Azure Container Apps usando o AZD CLI. Este exemplo demonstra comunicação entre serviços, orquestração de contêineres e monitorização com uma configuração prática de 2 serviços.

> **📚 Abordagem de Aprendizagem**: Este exemplo começa com uma arquitetura mínima de 2 serviços (API Gateway + Backend Service) que pode ser realmente implantada e aprendida. Após dominar esta base, fornecemos orientações para expandir para um ecossistema completo de microserviços.

## O que Vai Aprender

Ao concluir este exemplo, você irá:
- Implantar múltiplos contêineres no Azure Container Apps
- Implementar comunicação entre serviços com rede interna
- Configurar escalonamento baseado no ambiente e verificações de integridade
- Monitorizar aplicações distribuídas com o Application Insights
- Compreender padrões de implantação de microserviços e melhores práticas
- Aprender a expandir progressivamente de arquiteturas simples para complexas

## Arquitetura

### Fase 1: O que Estamos Construindo (Incluído neste Exemplo)

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

**Por que Começar Simples?**
- ✅ Implantar e entender rapidamente (25-35 minutos)
- ✅ Aprender padrões básicos de microserviços sem complexidade
- ✅ Código funcional que pode ser modificado e experimentado
- ✅ Custo mais baixo para aprendizado (~$50-100/mês vs $300-1400/mês)
- ✅ Ganhar confiança antes de adicionar bases de dados e filas de mensagens

**Analogia**: Pense nisso como aprender a conduzir. Você começa num parque de estacionamento vazio (2 serviços), domina o básico e depois progride para o trânsito da cidade (5+ serviços com bases de dados).

### Fase 2: Expansão Futura (Arquitetura de Referência)

Depois de dominar a arquitetura de 2 serviços, pode expandir para:

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

Consulte a seção "Guia de Expansão" no final para instruções passo a passo.

## Funcionalidades Incluídas

✅ **Descoberta de Serviços**: Descoberta automática baseada em DNS entre contêineres  
✅ **Balanceamento de Carga**: Balanceamento de carga integrado entre réplicas  
✅ **Autoescalonamento**: Escalonamento independente por serviço baseado em pedidos HTTP  
✅ **Monitorização de Integridade**: Probes de liveness e readiness para ambos os serviços  
✅ **Registo Distribuído**: Registo centralizado com Application Insights  
✅ **Rede Interna**: Comunicação segura entre serviços  
✅ **Orquestração de Contêineres**: Implantação e escalonamento automáticos  
✅ **Atualizações Sem Interrupções**: Atualizações contínuas com gestão de revisões  

## Pré-requisitos

### Ferramentas Necessárias

Antes de começar, verifique se tem estas ferramentas instaladas:

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

- Uma **subscrição ativa do Azure** ([crie uma conta gratuita](https://azure.microsoft.com/free/))
- Permissões para criar recursos na sua subscrição
- Papel de **Colaborador** na subscrição ou grupo de recursos

### Conhecimentos Necessários

Este é um exemplo de **nível avançado**. Deve ter:
- Concluído o [exemplo de API Flask Simples](../../../../../examples/container-app/simple-flask-api) 
- Compreensão básica da arquitetura de microserviços
- Familiaridade com APIs REST e HTTP
- Entendimento de conceitos de contêineres

**Novo no Container Apps?** Comece com o [exemplo de API Flask Simples](../../../../../examples/container-app/simple-flask-api) primeiro para aprender o básico.

## Início Rápido (Passo a Passo)

### Passo 1: Clonar e Navegar

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Verificação de Sucesso**: Verifique se vê `azure.yaml`:
```bash
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Passo 2: Autenticar com o Azure

```bash
azd auth login
```

Isto abrirá o seu navegador para autenticação no Azure. Inicie sessão com as suas credenciais do Azure.

**✓ Verificação de Sucesso**: Deve ver:
```
Logged in to Azure.
```

### Passo 3: Inicializar o Ambiente

```bash
azd init
```

**Perguntas que verá**:
- **Nome do ambiente**: Insira um nome curto (ex.: `microservices-dev`)
- **Subscrição do Azure**: Selecione a sua subscrição
- **Localização do Azure**: Escolha uma região (ex.: `eastus`, `westeurope`)

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: New project initialized!
```

### Passo 4: Implantar Infraestrutura e Serviços

```bash
azd up
```

**O que acontece** (leva 8-12 minutos):
1. Cria o ambiente do Container Apps
2. Cria o Application Insights para monitorização
3. Constrói o contêiner do API Gateway (Node.js)
4. Constrói o contêiner do Product Service (Python)
5. Implanta ambos os contêineres no Azure
6. Configura rede e verificações de integridade
7. Configura monitorização e registo

**✓ Verificação de Sucesso**: Deve ver:
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

**Testar o serviço de produtos através do gateway**:
```bash
# Listar produtos
curl $GATEWAY_URL/api/products

# Saída esperada:
# [
#   {"id":1,"name":"Portátil","price":999.99,"stock":50},
#   {"id":2,"name":"Rato","price":29.99,"stock":200},
#   {"id":3,"name":"Teclado","price":79.99,"stock":150}
# ]
```

**✓ Verificação de Sucesso**: Ambos os endpoints retornam dados JSON sem erros.

---

**🎉 Parabéns!** Implantou uma arquitetura de microserviços no Azure!

## Estrutura do Projeto

Todos os ficheiros de implementação estão incluídos—este é um exemplo completo e funcional:

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

**O que Cada Componente Faz:**

**Infraestrutura (infra/)**:
- `main.bicep`: Orquestra todos os recursos do Azure e suas dependências
- `core/container-apps-environment.bicep`: Cria o ambiente do Container Apps e o Azure Container Registry
- `core/monitor.bicep`: Configura o Application Insights para registo distribuído
- `app/*.bicep`: Definições individuais de contêineres com escalonamento e verificações de integridade

**API Gateway (src/api-gateway/)**:
- Serviço público que encaminha pedidos para serviços de backend
- Implementa registo, gestão de erros e encaminhamento de pedidos
- Demonstra comunicação HTTP entre serviços

**Product Service (src/product-service/)**:
- Serviço interno com catálogo de produtos (em memória para simplicidade)
- API REST com verificações de integridade
- Exemplo de padrão de microserviço de backend

## Visão Geral dos Serviços

### API Gateway (Node.js/Express)

**Porta**: 8080  
**Acesso**: Público (ingresso externo)  
**Propósito**: Encaminha pedidos recebidos para os serviços de backend apropriados  

**Endpoints**:
- `GET /` - Informação do serviço
- `GET /health` - Endpoint de verificação de integridade
- `GET /api/products` - Encaminha para o serviço de produtos (listar todos)
- `GET /api/products/:id` - Encaminha para o serviço de produtos (obter por ID)

**Principais Funcionalidades**:
- Encaminhamento de pedidos com axios
- Registo centralizado
- Gestão de erros e timeouts
- Descoberta de serviços via variáveis de ambiente
- Integração com Application Insights

**Destaque de Código** (`src/api-gateway/app.js`):
```javascript
// Comunicação interna do serviço
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Porta**: 8000  
**Acesso**: Apenas interno (sem ingresso externo)  
**Propósito**: Gere o catálogo de produtos com dados em memória  

**Endpoints**:
- `GET /` - Informação do serviço
- `GET /health` - Endpoint de verificação de integridade
- `GET /products` - Lista todos os produtos
- `GET /products/<id>` - Obtém produto por ID

**Principais Funcionalidades**:
- API RESTful com Flask
- Armazenamento de produtos em memória (simples, sem base de dados necessária)
- Monitorização de integridade com probes
- Registo estruturado
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

**Por que Apenas Interno?**
O serviço de produtos não é exposto publicamente. Todos os pedidos devem passar pelo API Gateway, que fornece:
- Segurança: Ponto de acesso controlado
- Flexibilidade: Pode alterar o backend sem afetar os clientes
- Monitorização: Registo centralizado de pedidos

## Compreendendo a Comunicação entre Serviços

### Como os Serviços se Comunicarem

Neste exemplo, o API Gateway comunica com o Product Service usando **chamadas HTTP internas**:

```javascript
// Gateway de API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Fazer pedido HTTP interno
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Pontos-Chave**:

1. **Descoberta Baseada em DNS**: O Container Apps fornece automaticamente DNS para serviços internos
   - FQDN do Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplificado como: `http://product-service` (o Container Apps resolve isso)

2. **Sem Exposição Pública**: O Product Service tem `external: false` no Bicep
   - Apenas acessível dentro do ambiente do Container Apps
   - Não pode ser alcançado pela internet

3. **Variáveis de Ambiente**: URLs dos serviços são injetados no momento da implantação
   - O Bicep passa o FQDN interno para o gateway
   - Sem URLs hardcoded no código da aplicação

**Analogia**: Pense nisso como salas de escritório. O API Gateway é a receção (voltada para o público), e o Product Service é uma sala de escritório (apenas interna). Os visitantes devem passar pela receção para chegar a qualquer sala.

## Opções de Implantação

### Implantação Completa (Recomendada)

```bash
# Implementar infraestrutura e ambos os serviços
azd up
```

Isto implanta:
1. Ambiente do Container Apps
2. Application Insights
3. Container Registry
4. Contêiner do API Gateway
5. Contêiner do Product Service

**Tempo**: 8-12 minutos

### Implantar Serviço Individual

```bash
# Implementar apenas um serviço (após o azd up inicial)
azd deploy api-gateway

# Ou implementar o serviço de produto
azd deploy product-service
```

**Caso de Uso**: Quando atualizou o código num serviço e quer reimplantar apenas esse serviço.

### Atualizar Configuração

```bash
# Alterar parâmetros de escala
azd env set GATEWAY_MAX_REPLICAS 30

# Reimplementar com nova configuração
azd up
```

## Configuração

### Configuração de Escalonamento

Ambos os serviços estão configurados com autoescalonamento baseado em HTTP nos seus ficheiros Bicep:

**API Gateway**:
- Réplicas mínimas: 2 (sempre pelo menos 2 para disponibilidade)
- Réplicas máximas: 20
- Gatilho de escalonamento: 50 pedidos concorrentes por réplica

**Product Service**:
- Réplicas mínimas: 1 (pode escalar para zero, se necessário)
- Réplicas máximas: 10
- Gatilho de escalonamento: 100 pedidos concorrentes por réplica

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
- Razão: Lida com todo o tráfego externo

**Product Service**:
- CPU: 0.5 vCPU
- Memória: 1 GiB
- Razão: Operações leves em memória

### Verificações de Integridade

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

**O que Isso Significa**:
- **Liveness**: Se a verificação de integridade falhar, o Container Apps reinicia o contêiner
- **Readiness**: Se não estiver pronto, o Container Apps para de encaminhar tráfego para essa réplica

## Monitorização e Observabilidade

### Ver Logs de Serviço

```bash
# Transmitir registos do API Gateway
azd logs api-gateway --follow

# Ver registos recentes do serviço de produtos
azd logs product-service --tail 100

# Ver todos os registos de ambos os serviços
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

**Encontrar Pedidos Lentos**:
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

**Taxa de Erros por Serviço**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volume de Pedidos ao Longo do Tempo**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Acessar o Painel de Monitorização

```bash
# Obter detalhes do Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Abrir monitorização do Portal Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Métricas em Tempo Real

1. Navegue até o Application Insights no Portal do Azure
2. Clique em "Live Metrics"
3. Veja pedidos, falhas e desempenho em tempo real
4. Teste executando: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Exercícios Práticos

[Nota: Consulte os exercícios completos acima na seção "Exercícios Práticos" para exercícios detalhados passo a passo, incluindo verificação de implantação, modificação de dados, testes de autoescalonamento, gestão de erros e adição de um terceiro serviço.]

## Análise de Custos

### Custos Mensais Estimados (Para Este Exemplo de 2 Serviços)

| Recurso | Configuração | Custo Estimado |
|---------|--------------|----------------|
| API Gateway | 2-20 réplicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 réplicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Nível básico | $5 |
| Application Insights | 1-2 GB/mês | $5-10 |
| Log Analytics | 1 GB/mês | $3 |
| **Total** | | **$58-243/mês** |

**Divisão de Custos por Uso**:
- **Tráfego leve** (testes/aprendizado): ~$60/mês
- **Tráfego moderado** (pequena produção): ~$120/mês
- **Tráfego intenso** (períodos movimentados): ~$240/mês

### Dicas de Otimização de Custos

1. **Escalar para Zero no Desenvolvimento**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Usar Plano de Consumo para Cosmos DB** (quando adicioná-lo):
   - Pague apenas pelo que usar
   - Sem cobrança mínima

3. **Definir Amostragem no Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Amostrar 50% dos pedidos
   ```

4. **Limpar Quando Não Necessário**:
   ```bash
   azd down
   ```

### Opções de Nível Gratuito
Para aprendizagem/testes, considere:
- Utilize créditos gratuitos do Azure (primeiros 30 dias)
- Mantenha o número mínimo de réplicas
- Elimine após os testes (sem custos contínuos)

---

## Limpeza

Para evitar custos contínuos, elimine todos os recursos:

```bash
azd down --force --purge
```

**Prompt de Confirmação**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Digite `y` para confirmar.

**O que será eliminado**:
- Ambiente de Container Apps
- Ambos os Container Apps (gateway e serviço de produtos)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verificar Limpeza**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Deve retornar vazio.

---

## Guia de Expansão: De 2 para 5+ Serviços

Depois de dominar esta arquitetura de 2 serviços, veja como expandir:

### Fase 1: Adicionar Persistência de Base de Dados (Próximo Passo)

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

3. Custo adicional estimado: ~25 USD/mês (serverless)

### Fase 2: Adicionar Terceiro Serviço (Gestão de Pedidos)

**Criar Serviço de Pedidos**:

1. Nova pasta: `src/order-service/` (Python/Node.js/C#)
2. Novo Bicep: `infra/app/order-service.bicep`
3. Atualize o API Gateway para rotear `/api/orders`
4. Adicione Azure SQL Database para persistência de pedidos

**A arquitetura torna-se**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Adicionar Comunicação Assíncrona (Service Bus)

**Implementar Arquitetura Orientada a Eventos**:

1. Adicione Azure Service Bus: `infra/core/servicebus.bicep`
2. O Serviço de Produtos publica eventos "ProductCreated"
3. O Serviço de Pedidos subscreve aos eventos de produtos
4. Adicione um Serviço de Notificações para processar eventos

**Padrão**: Request/Response (HTTP) + Orientado a Eventos (Service Bus)

### Fase 4: Adicionar Autenticação de Utilizadores

**Implementar Serviço de Utilizadores**:

1. Crie `src/user-service/` (Go/Node.js)
2. Adicione Azure AD B2C ou autenticação JWT personalizada
3. O API Gateway valida os tokens
4. Os serviços verificam permissões de utilizadores

### Fase 5: Preparação para Produção

**Adicione Estes Componentes**:
- Azure Front Door (balanceamento de carga global)
- Azure Key Vault (gestão de segredos)
- Azure Monitor Workbooks (dashboards personalizados)
- Pipeline CI/CD (GitHub Actions)
- Implementações Blue-Green
- Managed Identity para todos os serviços

**Custo Total da Arquitetura em Produção**: ~300-1.400 USD/mês

---

## Saiba Mais

### Documentação Relacionada
- [Documentação do Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Guia de Arquitetura de Microserviços](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights para Rastreamento Distribuído](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Próximos Passos Neste Curso
- ← Anterior: [API Flask Simples](../../../../../examples/container-app/simple-flask-api) - Exemplo inicial de um único container
- → Próximo: [Guia de Integração com IA](../../../../../examples/docs/ai-foundry) - Adicionar capacidades de IA
- 🏠 [Página Inicial do Curso](../../README.md)

### Comparação: Quando Usar o Quê

**Single Container App** (Exemplo de API Flask Simples):
- ✅ Aplicações simples
- ✅ Arquitetura monolítica
- ✅ Rápido de implementar
- ❌ Escalabilidade limitada
- **Custo**: ~15-50 USD/mês

**Microserviços** (Este exemplo):
- ✅ Aplicações complexas
- ✅ Escalabilidade independente por serviço
- ✅ Autonomia de equipas (diferentes serviços, diferentes equipas)
- ❌ Mais complexo de gerir
- **Custo**: ~60-250 USD/mês

**Kubernetes (AKS)**:
- ✅ Máximo controlo e flexibilidade
- ✅ Portabilidade multi-cloud
- ✅ Networking avançado
- ❌ Requer expertise em Kubernetes
- **Custo**: ~150-500 USD/mês no mínimo

**Recomendação**: Comece com Container Apps (este exemplo), migre para AKS apenas se precisar de funcionalidades específicas do Kubernetes.

---

## Perguntas Frequentes

**P: Por que apenas 2 serviços em vez de 5+?**  
R: Progressão educacional. Domine os fundamentos (comunicação entre serviços, monitorização, escalabilidade) com um exemplo simples antes de adicionar complexidade. Os padrões aprendidos aqui aplicam-se a arquiteturas com 100 serviços.

**P: Posso adicionar mais serviços por conta própria?**  
R: Claro! Siga o guia de expansão acima. Cada novo serviço segue o mesmo padrão: crie a pasta src, crie o ficheiro Bicep, atualize o azure.yaml, implemente.

**P: Isto está pronto para produção?**  
R: É uma base sólida. Para produção, adicione: managed identity, Key Vault, bases de dados persistentes, pipeline CI/CD, alertas de monitorização e estratégia de backup.

**P: Por que não usar Dapr ou outro service mesh?**  
R: Mantenha simples para aprendizagem. Depois de entender o networking nativo do Container Apps, pode adicionar Dapr para cenários avançados.

**P: Como faço debug localmente?**  
R: Execute os serviços localmente com Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**P: Posso usar diferentes linguagens de programação?**  
R: Sim! Este exemplo mostra Node.js (gateway) + Python (serviço de produtos). Pode misturar quaisquer linguagens que funcionem em containers.

**P: E se eu não tiver créditos do Azure?**  
R: Utilize o nível gratuito do Azure (primeiros 30 dias com novas contas) ou implemente para períodos curtos de teste e elimine imediatamente.

---

> **🎓 Resumo do Caminho de Aprendizagem**: Aprendeu a implementar uma arquitetura multi-serviço com escalabilidade automática, networking interno, monitorização centralizada e padrões prontos para produção. Esta base prepara-o para sistemas distribuídos complexos e arquiteturas de microserviços empresariais.

**📚 Navegação do Curso:**
- ← Anterior: [API Flask Simples](../../../../../examples/container-app/simple-flask-api)
- → Próximo: [Exemplo de Integração com Base de Dados](../../../../../examples/database-app)
- 🏠 [Página Inicial do Curso](../../README.md)
- 📖 [Melhores Práticas para Container Apps](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, esteja ciente de que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autoritária. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas resultantes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->