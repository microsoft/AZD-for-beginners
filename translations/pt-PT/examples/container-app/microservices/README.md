# Arquitectura de Microserviços - Exemplo de Container App

⏱️ **Tempo Estimado**: 25-35 minutos | 💰 **Custo Estimado**: ~$50-100/mês | ⭐ **Complexidade**: Avançado

Uma arquitectura de microserviços **simplificada, mas funcional**, implementada em Azure Container Apps usando o AZD CLI. Este exemplo demonstra comunicação entre serviços, orquestração de contentores e monitorização com uma configuração prática de 2 serviços.

> **📚 Abordagem de Aprendizagem**: Este exemplo começa com uma arquitectura mínima de 2 serviços (API Gateway + Serviço Backend) que você pode realmente implementar e aprender. Depois de dominar esta base, fornecemos orientações para expandir para um ecossistema completo de microserviços.

## O que Vai Aprender

Ao completar este exemplo, irá:
- Implementar múltiplos contentores em Azure Container Apps
- Implementar comunicação entre serviços com rede interna
- Configurar escalabilidade baseada no ambiente e verificações de estado
- Monitorizar aplicações distribuídas com Application Insights
- Compreender padrões e melhores práticas de implementação de microserviços
- Aprender a expansão progressiva de arquitecturas simples para complexas

## Arquitetura

### Fase 1: O que Vamos Construir (Incluído Neste Exemplo)

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

**Porquê Começar Simples?**
- ✅ Implementar e compreender rapidamente (25-35 minutos)
- ✅ Aprender padrões centrais de microserviços sem complexidade
- ✅ Código funcional que pode modificar e experimentar
- ✅ Custo reduzido para aprendizagem (~$50-100/mês vs $300-1400/mês)
- ✅ Ganhar confiança antes de adicionar bases de dados e filas de mensagens

**Analogia**: Pense nisto como aprender a conduzir. Começa num parque de estacionamento vazio (2 serviços), domina o básico e depois avança para o trânsito da cidade (5+ serviços com bases de dados).

### Fase 2: Expansão Futura (Arquitetura de Referência)

Assim que dominar a arquitetura de 2 serviços, pode expandir para:

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

Veja a secção "Guia de Expansão" no final para instruções passo a passo.

## Funcionalidades Incluídas

✅ **Descoberta de Serviços**: Descoberta automática baseada em DNS entre contentores  
✅ **Balanceamento de Carga**: Balanceamento de carga incorporado entre réplicas  
✅ **Autoescalabilidade**: Escalabilidade independente por serviço baseada em pedidos HTTP  
✅ **Monitorização do Estado**: Probes de liveness e readiness para ambos os serviços  
✅ **Logging Distribuído**: Logging centralizado com Application Insights  
✅ **Rede Interna**: Comunicação segura entre serviços  
✅ **Orquestração de Contentores**: Implementação e escalabilidade automática  
✅ **Atualizações Sem Downtime**: Atualizações contínuas com gestão de revisões  

## Pré-requisitos

### Ferramentas Necessárias

Antes de começar, verifique que tem estas ferramentas instaladas:

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

### Requisitos Azure

- Uma **subscripção Azure ativa** ([crie uma conta gratuita](https://azure.microsoft.com/free/))
- Permissões para criar recursos na sua subscrição
- Papel de **Colaborador** na subscrição ou grupo de recursos

### Conhecimentos Pré-requisitos

Este é um exemplo de **nível avançado**. Deve ter:
- Completo o [exemplo Simple Flask API](../../../../../examples/container-app/simple-flask-api) 
- Compreensão básica de arquitectura de microserviços
- Familiaridade com APIs REST e HTTP
- Entendimento dos conceitos de contentores

**Novo em Container Apps?** Comece pelo [exemplo Simple Flask API](../../../../../examples/container-app/simple-flask-api) para aprender o básico.

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

### Passo 2: Autenticar no Azure

```bash
azd auth login
```

Isto abre o seu navegador para autenticação no Azure. Inicie sessão com as suas credenciais Azure.

**✓ Verificação de Sucesso**: Deve ver:
```
Logged in to Azure.
```

### Passo 3: Inicializar o Ambiente

```bash
azd init
```

**Perguntas que irá ver**:
- **Nome do Ambiente**: Introduza um nome curto (p.ex., `microservices-dev`)
- **Subscripção Azure**: Selecione a sua subscrição
- **Localização Azure**: Escolha uma região (p.ex. `eastus`, `westeurope`)

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: New project initialized!
```

### Passo 4: Deploy da Infraestrutura e Serviços

```bash
azd up
```

**O que acontece** (leva 8-12 minutos):
1. Cria ambiente de Container Apps
2. Cria Application Insights para monitorização
3. Constrói o contentor API Gateway (Node.js)
4. Constrói o contentor Product Service (Python)
5. Implementa ambos os contentores no Azure
6. Configura rede e verificações de estado
7. Configura monitorização e logging

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Tempo**: 8-12 minutos

### Passo 5: Testar a Implementação

```bash
# Obter o endpoint do gateway
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testar a saúde do API Gateway
curl $GATEWAY_URL/health

# Saída esperada:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testar o serviço de produto via gateway**:
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

**🎉 Parabéns!** Implementou uma arquitectura de microserviços no Azure!

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
- `main.bicep`: Orquestra todos os recursos Azure e suas dependências
- `core/container-apps-environment.bicep`: Cria o ambiente Container Apps e o Azure Container Registry
- `core/monitor.bicep`: Configura Application Insights para logging distribuído
- `app/*.bicep`: Definições individuais das apps container com escalabilidade e verificações de estado

**API Gateway (src/api-gateway/)**:
- Serviço público que encaminha pedidos para serviços backend
- Implementa logging, gestão de erros e encaminhamento de pedidos
- Demonstra comunicação HTTP entre serviços

**Product Service (src/product-service/)**:
- Serviço interno com catálogo de produtos (em memória para simplicidade)
- API REST com verificações de estado
- Exemplo de padrão backend de microserviços

## Visão Geral dos Serviços

### API Gateway (Node.js/Express)

**Porta**: 8080  
**Acesso**: Público (entrada externa)  
**Objetivo**: Encaminha pedidos recebidos para os serviços backend apropriados  

**Endpoints**:
- `GET /` - Informação do serviço
- `GET /health` - Endpoint de verificação de estado
- `GET /api/products` - Encaminha para o serviço de produtos (listar todos)
- `GET /api/products/:id` - Encaminha para o serviço de produtos (obter por ID)

**Principais Funcionalidades**:
- Encaminhamento de pedidos com axios
- Logging centralizado
- Gestão de erros e timeouts
- Descoberta de serviços via variáveis de ambiente
- Integração com Application Insights

**Destaque do Código** (`src/api-gateway/app.js`):
```javascript
// Comunicação interna de serviço
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Porta**: 8000  
**Acesso**: Apenas interno (sem entrada externa)  
**Objetivo**: Gere catálogo de produtos com dados em memória  

**Endpoints**:
- `GET /` - Informação do serviço
- `GET /health` - Endpoint de verificação de estado
- `GET /products` - Lista todos os produtos
- `GET /products/<id>` - Obtém produto por ID

**Principais Funcionalidades**:
- API RESTful com Flask
- Armazenamento de produtos em memória (simples, sem base de dados)
- Monitorização de saúde com probes
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

**Porquê Apenas Interno?**
O serviço de produtos não é exposto publicamente. Todos os pedidos devem passar pelo API Gateway, que oferece:
- Segurança: Ponto de acesso controlado
- Flexibilidade: Pode alterar o backend sem afetar clientes
- Monitorização: Logging centralizado de pedidos

## Compreendendo a Comunicação entre Serviços

### Como os Serviços Comunicamse

Neste exemplo, o API Gateway comunica com o Product Service usando **chamadas HTTP internas**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Fazer pedido HTTP interno
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Pontos-chave**:

1. **Descoberta Baseada em DNS**: Container Apps fornece DNS automático para serviços internos
   - FQDN do Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplificado como: `http://product-service` (resolvido por Container Apps)

2. **Sem Exposição Pública**: Product Service tem `external: false` no Bicep
   - Apenas acessível dentro do ambiente Container Apps
   - Não acessível da internet

3. **Variáveis de Ambiente**: URLs dos serviços são injectadas na implementação
   - Bicep passa o FQDN interno para o gateway
   - Sem URLs hardcoded no código da aplicação

**Analogia**: Pense nisto como salas de escritório. O API Gateway é a receção (público) e o Product Service é uma sala interna. Visitantes têm de passar pela receção para chegar a qualquer sala.

## Opções de Implementação

### Implementação Completa (Recomendado)

```bash
# Implantar infraestrutura e ambos os serviços
azd up
```

Isto implementa:
1. Ambiente de Container Apps
2. Application Insights
3. Container Registry
4. Contentor do API Gateway
5. Contentor do Product Service

**Tempo**: 8-12 minutos

### Implementar Serviço Individual

```bash
# Implementar apenas um serviço (após o azd up inicial)
azd deploy api-gateway

# Ou implementar o serviço do produto
azd deploy product-service
```

**Caso de Uso**: Quando atualizou código num serviço e quer implementar apenas esse serviço.

### Atualizar Configuração

```bash
# Alterar os parâmetros de escala
azd env set GATEWAY_MAX_REPLICAS 30

# Reimplantar com nova configuração
azd up
```

## Configuração

### Configuração de Escalabilidade

Ambos os serviços estão configurados com autoescalabilidade baseada em HTTP nos seus ficheiros Bicep:

**API Gateway**:
- Réplicas mínimas: 2 (sempre pelo menos 2 para disponibilidade)
- Réplicas máximas: 20
- Gatilho de escala: 50 pedidos concorrentes por réplica

**Product Service**:
- Réplicas mínimas: 1 (pode escalar para zero se necessário)
- Réplicas máximas: 10
- Gatilho de escala: 100 pedidos concorrentes por réplica

**Personalize a Escala** (em `infra/app/*.bicep`):
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
- Razão: Gere todo o tráfego externo

**Product Service**:
- CPU: 0.5 vCPU
- Memória: 1 GiB
- Razão: Operações leves em memória

### Verificações de Estado

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

**O Que Isto Significa**:
- **Liveness**: Se falhar a verificação, Container Apps reinicia o contentor
- **Readiness**: Se não estiver pronto, Container Apps deixa de encaminhar tráfego para a réplica



## Monitorização & Observabilidade

### Ver Logs dos Serviços

```bash
# Ver registos usando azd monitor
azd monitor --logs

# Ou use o Azure CLI para aplicações de contentores específicas:
# Transmitir registos do API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Ver registos recentes do serviço de produto
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Resultado Esperado**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Consultas Application Insights

Aceda ao Application Insights no Portal Azure, depois execute estas consultas:

**Encontrar Pedidos Lentos**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Rastrear Chamadas Serviço-a-Serviço**:
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

### Aceder ao Dashboard de Monitorização

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

1. Navegue para Application Insights no Portal Azure
2. Clique em "Live Metrics"
3. Veja pedidos, falhas e desempenho em tempo real
4. Teste executando: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Exercícios Práticos

[Nota: Veja os exercícios completos acima na secção "Practical Exercises" para exercícios detalhados passo a passo incluindo verificação da implementação, modificação de dados, testes de autoescalabilidade, gestão de erros e adição de um terceiro serviço.]

## Análise de Custos

### Custos Mensais Estimados (Para Este Exemplo de 2 Serviços)

| Recurso | Configuração | Custo Estimado |
|----------|--------------|----------------|
| API Gateway | 2-20 réplicas, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 réplicas, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Nível básico | $5 |
| Application Insights | 1-2 GB/mês | $5-10 |
| Log Analytics | 1 GB/mês | $3 |
| **Total** | | **$58-243/mês** |

**Quebra de Custos por Uso**:
- **Tráfego leve** (teste/aprendizagem): ~$60/mês
- **Tráfego moderado** (produção pequena): ~$120/mês
- **Tráfego alto** (picos ocupados): ~$240/mês

### Dicas para Otimização de Custos

1. **Escalar para Zero Durante Desenvolvimento**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Usar Plano de Consumo para Cosmos DB** (quando adicionar):
   - Pague apenas pelo que usa
   - Sem custo mínimo

3. **Configurar Amostragem no Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Amostrar 50% dos pedidos
   ```

4. **Limpar Recursos Quando Não Necessário**:
   ```bash
   azd down
   ```

### Opções de Nível Gratuito
Para aprendizagem/testes, considere:
- Use créditos gratuitos do Azure (primeiros 30 dias)
- Mantenha o número mínimo de réplicas
- Apague após o teste (sem encargos contínuos)

---

## Limpeza

Para evitar encargos contínuos, elimine todos os recursos:

```bash
azd down --force --purge
```

**Pedido de Confirmação**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Escreva `y` para confirmar.

**O Que É Apagado**:
- Ambiente Container Apps
- Ambos os Container Apps (gateway & serviço de produto)
- Container Registry
- Application Insights
- Espaço de trabalho Log Analytics
- Grupo de Recursos

**✓ Verificar Limpeza**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Deve retornar vazio.

---

## Guia de Expansão: De 2 para 5+ Serviços

Depois de dominar esta arquitetura de 2 serviços, eis como expandir:

### Fase 1: Adicionar Persistência de Base de Dados (Próximo Passo)

**Adicionar Cosmos DB para o Serviço de Produto**:

1. Criar `infra/core/cosmos.bicep`:
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

2. Atualizar o serviço de produto para usar Cosmos DB em vez de dados em memória

3. Custo adicional estimado: ~25$/mês (serverless)

### Fase 2: Adicionar Terceiro Serviço (Gestão de Pedidos)

**Criar Serviço de Pedidos**:

1. Nova pasta: `src/order-service/` (Python/Node.js/C#)
2. Novo Bicep: `infra/app/order-service.bicep`
3. Atualizar o API Gateway para direcionar `/api/orders`
4. Adicionar Azure SQL Database para persistência de pedidos

**A arquitetura torna-se**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Fase 3: Adicionar Comunicação Assíncrona (Service Bus)

**Implementar Arquitetura Orientada a Eventos**:

1. Adicionar Azure Service Bus: `infra/core/servicebus.bicep`
2. Serviço de Produto publica eventos "ProductCreated"
3. Serviço de Pedidos subscreve aos eventos de produtos
4. Adicionar Serviço de Notificações para processar os eventos

**Padrão**: Pedido/Resposta (HTTP) + Orientado a Eventos (Service Bus)

### Fase 4: Adicionar Autenticação de Utilizadores

**Implementar Serviço de Utilizadores**:

1. Criar `src/user-service/` (Go/Node.js)
2. Adicionar Azure AD B2C ou autenticação JWT personalizada
3. API Gateway valida tokens
4. Serviços verificam permissões dos utilizadores

### Fase 5: Preparação para Produção

**Adicionar Estes Componentes**:
- Azure Front Door (balanceamento global de carga)
- Azure Key Vault (gestão de segredos)
- Azure Monitor Workbooks (dashboards personalizados)
- Pipeline CI/CD (GitHub Actions)
- Deployments Blue-Green
- Managed Identity para todos os serviços

**Custo completo da arquitetura de produção**: ~300-1.400$/mês

---

## Saiba Mais

### Documentação Relacionada
- [Documentação Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Guia de Arquitectura de Microserviços](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights para Tracing Distribuído](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Próximos Passos Neste Curso
- ← Anterior: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Exemplo iniciante com um único container
- → Seguinte: [Guia de Integração AI](../../../../../examples/docs/ai-foundry) - Adicionar capacidades AI
- 🏠 [Início do Curso](../../README.md)

### Comparação: Quando Usar Cada Um

**App de Container Único** (exemplo Simple Flask API):
- ✅ Aplicações simples
- ✅ Arquitetura monolítica
- ✅ Rápido de implantar
- ❌ Escalabilidade limitada
- **Custo**: ~15-50$/mês

**Microserviços** (este exemplo):
- ✅ Aplicações complexas
- ✅ Escalabilidade independente por serviço
- ✅ Autonomia de equipa (serviços diferentes, equipas diferentes)
- ❌ Mais complexo de gerir
- **Custo**: ~60-250$/mês

**Kubernetes (AKS)**:
- ✅ Controlo e flexibilidade máximos
- ✅ Portabilidade multi-cloud
- ✅ Networking avançado
- ❌ Requer especialização em Kubernetes
- **Custo**: mínimo ~150-500$/mês

**Recomendação**: Comece com Container Apps (este exemplo), avance para AKS apenas se precisar de funcionalidades específicas do Kubernetes.

---

## Perguntas Frequentes

**Q: Por que usar só 2 serviços em vez de 5+?**  
R: Progressão educativa. Domine os fundamentos (comunicação entre serviços, monitorização, escalabilidade) com um exemplo simples antes de adicionar complexidade. Os padrões aprendidos aplicam-se a arquiteturas com 100 serviços.

**Q: Posso adicionar mais serviços eu próprio?**  
R: Absolutamente! Siga o guia de expansão acima. Cada novo serviço segue o mesmo padrão: criar pasta src, criar ficheiro Bicep, atualizar azure.yaml, implantar.

**Q: Isto está pronto para produção?**  
R: É uma base sólida. Para produção, adicione: identidade gerida, Key Vault, bases de dados persistentes, pipeline CI/CD, alertas de monitorização e estratégia de backups.

**Q: Por que não usar Dapr ou outro service mesh?**  
R: Mantenha simples para aprender. Depois de compreender a rede nativa do Container Apps, pode adicionar Dapr para cenários avançados.

**Q: Como faço debug localmente?**  
R: Execute os serviços localmente com Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Q: Posso usar linguagens de programação diferentes?**  
R: Sim! Este exemplo mostra Node.js (gateway) + Python (serviço de produto). Pode misturar qualquer linguagem que corra em containers.

**Q: E se não tiver créditos Azure?**  
R: Use o nível gratuito do Azure (primeiros 30 dias em novas contas) ou faça deploy para testes curtos e apague imediatamente.

---

> **🎓 Resumo do Percurso de Aprendizagem**: Aprendeu a implantar uma arquitetura multi-serviços com escalabilidade automática, networking interno, monitorização centralizada e padrões preparados para produção. Esta base prepara para sistemas distribuídos complexos e arquiteturas de microserviços empresariais.

**📚 Navegação do Curso:**
- ← Anterior: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Seguinte: [Exemplo de Integração de Base de Dados](../../../../../examples/database-app)
- 🏠 [Início do Curso](../../../README.md)
- 📖 [Boas Práticas Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos pela precisão, esteja ciente de que as traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se a tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->