# Arquitetura de Microsserviços - Exemplo de Container App

⏱️ **Tempo estimado**: 25-35 minutos | 💰 **Custo estimado**: ~$50-100/mês | ⭐ **Complexidade**: Avançado

Uma arquitetura de microsserviços **simplificada, mas funcional**, implantada no Azure Container Apps usando o AZD CLI. Este exemplo demonstra comunicação entre serviços, orquestração de contêineres e monitoramento com uma configuração prática de 2 serviços.

> **📚 Abordagem de Aprendizado**: Este exemplo começa com uma arquitetura mínima de 2 serviços (API Gateway + Serviço Backend) que você pode realmente implantar e aprender. Depois de dominar esta base, fornecemos orientações para expandir para um ecossistema completo de microsserviços.

## O que você aprenderá

Ao completar este exemplo, você irá:
- Implantar vários contêineres no Azure Container Apps
- Implementar comunicação entre serviços com rede interna
- Configurar escalonamento baseado em ambiente e verificações de integridade
- Monitorar aplicações distribuídas com Application Insights
- Entender padrões de implantação de microsserviços e melhores práticas
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
- ✅ Aprender padrões essenciais de microsserviços sem complexidade
- ✅ Código funcional que você pode modificar e experimentar
- ✅ Menor custo para aprendizado (~$50-100/mês vs $300-1400/mês)
- ✅ Construir confiança antes de adicionar bancos de dados e filas de mensagens

**Analogia**: Pense nisso como aprender a dirigir. Você começa com um estacionamento vazio (2 serviços), domina o básico e depois progride para o tráfego da cidade (5+ serviços com bancos de dados).

### Fase 2: Expansão Futura (Arquitetura de Referência)

Uma vez que você dominar a arquitetura de 2 serviços, você pode expandir para:

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
✅ **Balanceamento de Carga**: Balanceamento de carga embutido entre réplicas  
✅ **Escalonamento Automático**: Escalonamento independente por serviço baseado em requisições HTTP  
✅ **Monitoramento de Integridade**: Probes de liveness e readiness para ambos os serviços  
✅ **Logging Distribuído**: Logs centralizados com Application Insights  
✅ **Rede Interna**: Comunicação segura entre serviços  
✅ **Orquestração de Contêineres**: Implantação e escalonamento automáticos  
✅ **Atualizações sem Downtime**: Atualizações contínuas com gerenciamento de revisões  

## Pré-requisitos

### Ferramentas necessárias

Antes de começar, verifique se você tem estas ferramentas instaladas:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versão 1.0.0 ou superior)
   ```bash
   azd version
   # Saída esperada: azd versão 1.0.0 ou superior
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

- Uma **assinatura do Azure** ativa ([crie uma conta gratuita](https://azure.microsoft.com/free/))
- Permissões para criar recursos em sua assinatura
- Função **Contributor** na assinatura ou grupo de recursos

### Conhecimentos prévios necessários

Este é um exemplo de **nível avançado**. Você deve ter:
- Concluído o [exemplo Simple Flask API](../../../../../examples/container-app/simple-flask-api) 
- Entendimento básico da arquitetura de microsserviços
- Familiaridade com APIs REST e HTTP
- Entendimento de conceitos de contêineres

**Novo no Container Apps?** Comece com o [exemplo Simple Flask API](../../../../../examples/container-app/simple-flask-api) primeiro para aprender o básico.

## Início Rápido (Passo a Passo)

### Etapa 1: Clonar e Navegar

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Verificação de Sucesso**: Verifique se você vê `azure.yaml`:
```bash
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Etapa 2: Autenticar no Azure

```bash
azd auth login
```

Isto abre seu navegador para autenticação no Azure. Faça login com suas credenciais do Azure.

**✓ Verificação de Sucesso**: Você verá:
```
Logged in to Azure.
```

### Etapa 3: Inicializar o Ambiente

```bash
azd init
```

**Solicitações que você verá**:
- **Nome do ambiente**: Insira um nome curto (ex.: `microservices-dev`)
- **Assinatura do Azure**: Selecione sua assinatura
- **Localização do Azure**: Escolha uma região (ex.: `eastus`, `westeurope`)

**✓ Verificação de Sucesso**: Você verá:
```
SUCCESS: New project initialized!
```

### Etapa 4: Implantar Infraestrutura e Serviços

```bash
azd up
```

**O que acontece** (leva 8-12 minutos):
1. Cria o ambiente do Container Apps
2. Cria o Application Insights para monitoramento
3. Constrói o contêiner do API Gateway (Node.js)
4. Constrói o contêiner do Product Service (Python)
5. Implanta ambos os contêineres no Azure
6. Configura rede e verificações de integridade
7. Configura monitoramento e logging

**✓ Verificação de Sucesso**: Você verá:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tempo**: 8-12 minutos

### Etapa 5: Testar a Implantação

```bash
# Obter o endpoint do gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testar a saúde do API Gateway
curl $GATEWAY_URL/health

# Saída esperada:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testar o serviço de produto através do gateway**:
```bash
# Listar produtos
curl $GATEWAY_URL/api/products

# Saída esperada:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Keyboard","price":79.99,"stock":150}
# ]
```

**✓ Verificação de Sucesso**: Ambos endpoints retornam dados JSON sem erros.

---

**🎉 Parabéns!** Você implantou uma arquitetura de microsserviços no Azure!

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
- `core/container-apps-environment.bicep`: Cria o ambiente do Container Apps e o Azure Container Registry
- `core/monitor.bicep`: Configura o Application Insights para logging distribuído
- `app/*.bicep`: Definições individuais dos container apps com escalonamento e verificações de integridade

**API Gateway (src/api-gateway/)**:
- Serviço voltado ao público que encaminha requisições para serviços de backend
- Implementa logging, tratamento de erros e encaminhamento de requisições
- Demonstra comunicação HTTP entre serviços

**Product Service (src/product-service/)**:
- Serviço interno com catálogo de produtos (em memória para simplicidade)
- API REST com verificações de integridade
- Exemplo de padrão de microserviço de backend

## Visão Geral dos Serviços

### API Gateway (Node.js/Express)

**Porta**: 8080  
**Acesso**: Público (ingresso externo)  
**Objetivo**: Encaminhar requisições recebidas para os serviços de backend  

**Endpoints**:
- `GET /` - Informações do serviço
- `GET /health` - Endpoint de verificação de integridade
- `GET /api/products` - Encaminha para o product service (listar todos)
- `GET /api/products/:id` - Encaminha para o product service (obter por ID)

**Principais Recursos**:
- Roteamento de requisições com axios
- Logging centralizado
- Tratamento de erros e gerenciamento de timeout
- Descoberta de serviços via variáveis de ambiente
- Integração com Application Insights

**Destaque de Código** (`src/api-gateway/app.js`):
```javascript
// Comunicação interna entre serviços
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Serviço de Produto (Python/Flask)

**Porta**: 8000  
**Acesso**: Somente interno (sem ingresso externo)  
**Objetivo**: Gerencia catálogo de produtos com dados em memória  

**Endpoints**:
- `GET /` - Informações do serviço
- `GET /health` - Endpoint de verificação de integridade
- `GET /products` - Listar todos os produtos
- `GET /products/<id>` - Obter produto por ID

**Principais Recursos**:
- API RESTful com Flask
- Repositório de produtos em memória (simples, sem necessidade de banco de dados)
- Monitoramento de integridade com probes
- Logging estruturado
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
O serviço de produto não é exposto publicamente. Todas as requisições devem passar pelo API Gateway, que fornece:
- Segurança: Ponto de acesso controlado
- Flexibilidade: Pode alterar o backend sem impactar clientes
- Monitoramento: Logging de requisições centralizado

## Entendendo a Comunicação entre Serviços

### Como os serviços se comunicam entre si

Neste exemplo, o API Gateway se comunica com o Product Service usando **chamadas HTTP internas**:

```javascript
// Gateway de API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Fazer requisição HTTP interna
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Pontos-chave**:

1. **Descoberta baseada em DNS**: Container Apps fornece automaticamente DNS para serviços internos
   - Product Service FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplificado como: `http://product-service` (o Container Apps resolve isso)

2. **Sem exposição pública**: Product Service tem `external: false` no Bicep
   - Acessível apenas dentro do ambiente do Container Apps
   - Não pode ser alcançado pela internet

3. **Variáveis de Ambiente**: URLs dos serviços são injetadas no momento da implantação
   - O Bicep passa o FQDN interno para o gateway
   - Sem URLs hardcoded no código da aplicação

**Analogia**: Pense nisso como salas de escritório. O API Gateway é a recepção (voltada ao público), e o Product Service é uma sala do escritório (apenas interna). Visitantes devem passar pela recepção para chegar a qualquer sala.

## Opções de Implantação

### Implantação Completa (Recomendada)

```bash
# Implantar a infraestrutura e ambos os serviços
azd up
```

Isto implanta:
1. Ambiente do Container Apps
2. Application Insights
3. Container Registry
4. Contêiner do API Gateway
5. Contêiner do Product Service

**Tempo**: 8-12 minutos

### Implantar Serviço Individualmente

```bash
# Implantar apenas um serviço (após o azd up inicial)
azd deploy api-gateway

# Ou implantar o serviço de produto
azd deploy product-service
```

**Caso de uso**: Quando você atualizou o código em um serviço e quer reimplantar apenas esse serviço.

### Atualizar Configuração

```bash
# Alterar parâmetros de dimensionamento
azd env set GATEWAY_MAX_REPLICAS 30

# Reimplantar com nova configuração
azd up
```

## Configuração

### Configuração de Escalonamento

Ambos os serviços estão configurados com escalonamento automático baseado em HTTP em seus arquivos Bicep:

**API Gateway**:
- Réplicas mín.: 2 (sempre pelo menos 2 para disponibilidade)
- Réplicas máx.: 20
- Gatilho de escala: 50 requisições concorrentes por réplica

**Product Service**:
- Réplicas mín.: 1 (pode escalar até zero se necessário)
- Réplicas máx.: 10
- Gatilho de escala: 100 requisições concorrentes por réplica

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

**O que isso significa**:
- **Liveness**: Se a verificação de integridade falhar, o Container Apps reinicia o contêiner
- **Readiness**: Se não estiver pronto, o Container Apps para de rotear tráfego para essa réplica



## Monitoramento e Observabilidade

### Visualizar Logs do Serviço

```bash
# Veja os logs usando azd monitor
azd monitor --logs

# Ou use o Azure CLI para Container Apps específicos:
# Transmita os logs do API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Veja os logs recentes do serviço de produto
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Saída Esperada**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Consultas do Application Insights

Acesse o Application Insights no Portal do Azure, então execute estas consultas:

**Encontrar Requisições Lentas**:
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

**Volume de Requisições ao Longo do Tempo**:
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

# Abrir o monitoramento do Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Métricas em Tempo Real

1. Navegue até o Application Insights no Portal do Azure
2. Clique em "Live Metrics"
3. Veja requisições, falhas e desempenho em tempo real
4. Teste executando: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Exercícios Práticos

[Nota: Veja os exercícios completos acima na seção "Exercícios Práticos" para exercícios detalhados passo a passo, incluindo verificação da implantação, modificação de dados, testes de autoescalonamento, tratamento de erros e adição de um terceiro serviço.]

## Análise de Custos

### Custos Mensais Estimados (para este exemplo de 2 serviços)

| Recurso | Configuração | Custo Estimado |
|----------|--------------|----------------|
| API Gateway | 2-20 réplicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 réplicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Basic tier | $5 |
| Application Insights | 1-2 GB/mês | $5-10 |
| Log Analytics | 1 GB/mês | $3 |
| **Total** | | **$58-243/mês** |

**Distribuição de Custo por Uso**:
- **Tráfego leve** (teste/aprendizado): ~$60/mês
- **Tráfego moderado** (pequena produção): ~$120/mês
- **Tráfego alto** (períodos intensos): ~$240/mês

### Dicas de Otimização de Custos

1. **Escalar para zero em desenvolvimento**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Use o Plano de Consumo para o Cosmos DB** (quando você adicioná-lo):
   - Pague apenas pelo que usar
   - Sem cobrança mínima

3. **Defina amostragem no Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Amostre 50% das requisições
   ```

4. **Limpe os recursos quando não precisar**:
   ```bash
   azd down
   ```

### Opções de Camada Gratuita
Para aprendizado/testes, considere:
- Use créditos gratuitos do Azure (primeiros 30 dias)
- Mantenha o mínimo de réplicas
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

**O que é excluído**:
- Ambiente do Container Apps
- Ambos os Container Apps (gateway & serviço de produto)
- Registro de Container
- Application Insights
- Espaço de Trabalho do Log Analytics
- Grupo de Recursos

**✓ Verificar limpeza**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Deve retornar vazio.

---

## Guia de Expansão: De 2 para 5+ serviços

Depois de dominar esta arquitetura de 2 serviços, veja como expandir:

### Fase 1: Adicionar persistência de banco de dados (Próximo passo)

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

2. Atualize o serviço de produto para usar Cosmos DB em vez de dados em memória

3. Custo adicional estimado: ~$25/mês (serverless)

### Fase 2: Adicionar terceiro serviço (Gerenciamento de Pedidos)

**Criar Serviço de Pedidos**:

1. Nova pasta: `src/order-service/` (Python/Node.js/C#)
2. Novo Bicep: `infra/app/order-service.bicep`
3. Atualize o API Gateway para rotear `/api/orders`
4. Adicione Azure SQL Database para persistência de pedidos

**Arquitetura se torna**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Adicionar comunicação assíncrona (Service Bus)

**Implementar Arquitetura Orientada a Eventos**:

1. Adicione Azure Service Bus: `infra/core/servicebus.bicep`
2. O Serviço de Produto publica eventos "ProductCreated"
3. O Serviço de Pedidos se inscreve em eventos de produto
4. Adicione o Serviço de Notificações para processar eventos

**Padrão**: Requisição/Resposta (HTTP) + Orientado a Eventos (Service Bus)

### Fase 4: Adicionar autenticação de usuário

**Implementar Serviço de Usuário**:

1. Crie `src/user-service/` (Go/Node.js)
2. Adicione Azure AD B2C ou autenticação JWT customizada
3. O API Gateway valida tokens
4. Os serviços verificam permissões do usuário

### Fase 5: Prontidão para Produção

**Adicione estes componentes**:
- Azure Front Door (balanceamento de carga global)
- Azure Key Vault (gerenciamento de segredos)
- Azure Monitor Workbooks (dashboards personalizados)
- Pipeline CI/CD (GitHub Actions)
- Implantações Blue-Green
- Identidade Gerenciada para todos os serviços

**Custo da arquitetura completa em produção**: ~$300-1,400/mês

---

## Saiba Mais

### Documentação Relacionada
- [Documentação do Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Guia de Arquitetura de Microsserviços](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights para rastreamento distribuído](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentação do Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Próximos passos neste curso
- ← Anterior: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Exemplo iniciante de contêiner único
- → Próximo: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Adicionar capacidades de IA
- 🏠 [Início do Curso](../../README.md)

### Comparação: Quando Usar Cada Um

**Aplicativo de Contêiner Único** (exemplo Simple Flask API):
- ✅ Aplicações simples
- ✅ Arquitetura monolítica
- ✅ Rápido de implantar
- ❌ Escalabilidade limitada
- **Custo**: ~$15-50/mês

**Microsserviços** (este exemplo):
- ✅ Aplicações complexas
- ✅ Escalonamento independente por serviço
- ✅ Autonomia de equipe (serviços diferentes, equipes diferentes)
- ❌ Mais complexo de gerenciar
- **Custo**: ~$60-250/mês

**Kubernetes (AKS)**:
- ✅ Controle e flexibilidade máximos
- ✅ Portabilidade multi-cloud
- ✅ Rede avançada
- ❌ Requer expertise em Kubernetes
- **Custo**: mínimo de ~$150-500/mês

**Recomendação**: Comece com Container Apps (este exemplo), migre para AKS somente se precisar de recursos específicos do Kubernetes.

---

## Perguntas Frequentes

**Q: Por que apenas 2 serviços em vez de 5+?**  
A: Progressão educacional. Domine os fundamentos (comunicação entre serviços, monitoramento, escalonamento) com um exemplo simples antes de adicionar complexidade. Os padrões que você aprende aqui se aplicam a arquiteturas com 100 serviços.

**Q: Posso adicionar mais serviços por conta própria?**  
A: Absolutamente! Siga o guia de expansão acima. Cada novo serviço segue o mesmo padrão: crie a pasta src, crie o arquivo Bicep, atualize o azure.yaml, faça o deploy.

**Q: Isto é pronto para produção?**  
A: É uma base sólida. Para produção, adicione: identidade gerenciada, Key Vault, bancos de dados persistentes, pipeline CI/CD, alertas de monitoramento e estratégia de backup.

**Q: Por que não usar Dapr ou outro service mesh?**  
A: Mantenha simples para aprendizado. Depois que entender o networking nativo do Container Apps, você pode adicionar Dapr para cenários avançados.

**Q: Como faço para depurar localmente?**  
A: Execute os serviços localmente com Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Posso usar diferentes linguagens de programação?**  
A: Sim! Este exemplo mostra Node.js (gateway) + Python (serviço de produto). Você pode misturar quaisquer linguagens que rodem em containers.

**Q: E se eu não tiver créditos do Azure?**  
A: Use o nível gratuito do Azure (primeiros 30 dias para contas novas) ou faça deploy por curtos períodos de teste e exclua imediatamente.

---

> **🎓 Resumo do Caminho de Aprendizado**: Você aprendeu a implantar uma arquitetura multi-serviço com escalonamento automático, rede interna, monitoramento centralizado e padrões prontos para produção. Essa base prepara você para sistemas distribuídos complexos e arquiteturas de microsserviços empresariais.

**📚 Navegação do Curso:**
- ← Anterior: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Próximo: [Exemplo de Integração com Banco de Dados](../../../../../examples/database-app)
- 🏠 [Início do Curso](../../../README.md)
- 📖 [Melhores Práticas do Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Isenção de responsabilidade:
Este documento foi traduzido usando o serviço de tradução por IA Co-op Translator (https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que traduções automatizadas podem conter erros ou imprecisões. O documento original em seu idioma nativo deve ser considerado a fonte autoritativa. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações equivocadas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->