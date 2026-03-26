# Exemplo Simples de API Flask - Container App

**Percurso de Aprendizagem:** Principiante ⭐ | **Duração:** 25-35 minutos | **Custo:** 0-15$/mês

Uma API REST Python Flask completa e funcional, implementada em Azure Container Apps usando Azure Developer CLI (azd). Este exemplo demonstra a implementação de containers, o autoescalamento e os fundamentos da monitorização.

## 🎯 O Que Vai Aprender

- Implementar uma aplicação Python em container para Azure  
- Configurar autoescalamento com escala para zero  
- Implementar sondas de saúde e verificações de prontidão  
- Monitorizar registos e métricas de aplicação  
- Usar Azure Developer CLI para implementação rápida

## 📦 O Que Está Incluído

✅ **Aplicação Flask** - API REST completa com operações CRUD (`src/app.py`)  
✅ **Dockerfile** - Configuração do container pronta para produção  
✅ **Infraestrutura Bicep** - Ambiente Container Apps e implementação da API  
✅ **Configuração AZD** - Implementação com um único comando  
✅ **Sondas de Saúde** - Verificações de liveness e readiness configuradas  
✅ **Autoescalamento** - 0-10 réplicas baseado no tráfego HTTP  

## Arquitetura

```mermaid
graph TD
    subgraph ACA[Ambiente Azure Container Apps]
        Flask[Contentor API Flask<br/>Pontos de verificação de saúde<br/>API REST<br/>Escalonamento automático 0-10 réplicas]
        AppInsights[Application Insights]
    end
```
## Pré-requisitos

### Necessário
- **Azure Developer CLI (azd)** - [Guia de instalação](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Subscrição Azure** - [Conta gratuita](https://azure.microsoft.com/free/)
- **Docker Desktop** - [Instalar Docker](https://www.docker.com/products/docker-desktop/) (para testes locais)

### Verificar Pré-requisitos

```bash
# Verificar a versão do azd (necessário 1.5.0 ou superior)
azd version

# Verificar login no Azure
azd auth login

# Verificar Docker (opcional, para testes locais)
docker --version
```

## ⏱️ Cronologia de Implementação

| Fase | Duração | O Que Acontece |
|-------|----------|--------------||
| Configuração do ambiente | 30 segundos | Criar ambiente azd |
| Construção do container | 2-3 minutos | Docker build da aplicação Flask |
| Provisionamento da infraestrutura | 3-5 minutos | Criar Container Apps, registo, monitorização |
| Implementar aplicação | 2-3 minutos | Enviar imagem e implementar em Container Apps |
| **Total** | **8-12 minutos** | Implementação completa pronta |

## Início Rápido

```bash
# Navegar para o exemplo
cd examples/container-app/simple-flask-api

# Inicializar o ambiente (escolher nome único)
azd env new myflaskapi

# Desplegar tudo (infraestrutura + aplicação)
azd up
# Ser-lhe-á pedido para:
# 1. Selecionar subscrição Azure
# 2. Escolher localização (ex., eastus2)
# 3. Esperar 8-12 minutos pela implantação

# Obter o seu endpoint da API
azd env get-values

# Testar a API
curl $(azd env get-value API_ENDPOINT)/health
```

**Saída Esperada:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ Verificar Implementação

### Passo 1: Verificar Estado da Implementação

```bash
# Ver serviços implementados
azd show

# A saída esperada mostra:
# - Serviço: api
# - Endpoint: https://ca-api-[env].xxx.azurecontainerapps.io
# - Estado: Em execução
```

### Passo 2: Testar Endpoints da API

```bash
# Obter endpoint da API
API_URL=$(azd env get-value API_ENDPOINT)

# Testar saúde
curl $API_URL/health

# Testar endpoint raiz
curl $API_URL/

# Criar um item
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# Obter todos os itens
curl $API_URL/api/items
```

**Critérios de Sucesso:**
- ✅ Endpoint de health retorna HTTP 200
- ✅ Endpoint root mostra informações da API
- ✅ POST cria item e retorna HTTP 201
- ✅ GET retorna os itens criados

### Passo 3: Ver Logs

```bash
# Transmita logs em direto usando azd monitor
azd monitor --logs

# Ou use o Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Deve ver:
# - Mensagens de arranque do Gunicorn
# - Logs de pedidos HTTP
# - Logs de informações da aplicação
```

## Estrutura do Projeto

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Endpoints da API

| Endpoint | Método | Descrição |
|----------|--------|-------------|
| `/health` | GET | Verificação de saúde |
| `/api/items` | GET | Listar todos os itens |
| `/api/items` | POST | Criar novo item |
| `/api/items/{id}` | GET | Obter item específico |
| `/api/items/{id}` | PUT | Atualizar item |
| `/api/items/{id}` | DELETE | Eliminar item |

## Configuração

### Variáveis de Ambiente

```bash
# Definir configuração personalizada
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### Configuração de Escalamento

A API escala automaticamente com base no tráfego HTTP:  
- **Réplicas mínimas**: 0 (escala para zero quando ocioso)  
- **Réplicas máximas**: 10  
- **Pedidos concorrentes por réplica**: 50  

## Desenvolvimento

### Executar Localmente

```bash
# Instalar dependências
cd src
pip install -r requirements.txt

# Executar a aplicação
python app.py

# Testar localmente
curl http://localhost:8000/health
```

### Construir e Testar Container

```bash
# Construir imagem Docker
docker build -t flask-api:local ./src

# Executar contentor localmente
docker run -p 8000:8000 flask-api:local

# Testar contentor
curl http://localhost:8000/health
```

## Implementação

### Implementação Completa

```bash
# Implementar a infraestrutura e a aplicação
azd up
```

### Implementação Apenas Código

```bash
# Implantar apenas o código da aplicação (infraestrutura inalterada)
azd deploy api
```

### Atualizar Configuração

```bash
# Atualizar variáveis de ambiente
azd env set API_KEY "new-api-key"

# Reimplantar com nova configuração
azd deploy api
```

## Monitorização

### Ver Logs

```bash
# Transmita logs em direto utilizando azd monitor
azd monitor --logs

# Ou utilize a Azure CLI para Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Veja as últimas 100 linhas
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Monitorizar Métricas

```bash
# Abrir dashboard do Azure Monitor
azd monitor --overview

# Ver métricas específicas
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## Testes

### Verificação de Saúde

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

Resposta esperada:  
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### Criar Item

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### Obter Todos os Items

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Otimização de Custos

Esta implementação usa escala para zero, assim só paga quando a API está a processar pedidos:

- **Custo ocioso**: ~0$/mês (escala para zero)  
- **Custo ativo**: ~0,000024$/segundo por réplica  
- **Custo mensal esperado** (uso leve): 5-15$

### Reduzir Custos Mais

```bash
# Reduzir o número máximo de réplicas para desenvolvimento
azd env set MAX_REPLICAS 3

# Usar tempo de espera ocioso mais curto
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutos
```

## Resolução de Problemas

### Container Não Arranca

```bash
# Verificar logs do contentor usando Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Verificar a construção da imagem Docker localmente
docker build -t test ./src
```

### API Não Acessível

```bash
# Verificar se o ingresso é externo
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Tempos de Resposta Elevados

```bash
# Verificar utilização da CPU/Memória
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Aumentar recursos se necessário
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Limpeza

```bash
# Apagar todos os recursos
azd down --force --purge
```

## Próximos Passos

### Expandir Este Exemplo

1. **Adicionar Base de Dados** - Integrar Azure Cosmos DB ou SQL Database  
   ```bash
   # Adicionar módulo Cosmos DB ao infra/main.bicep
   # Atualizar app.py com ligação à base de dados
   ```

2. **Adicionar Autenticação** - Implementar Azure AD ou chaves API  
   ```python
   # Adicionar middleware de autenticação ao app.py
   from functools import wraps
   ```

3. **Configurar CI/CD** - Workflow GitHub Actions  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Adicionar Identidade Gerida** - Acesso seguro a serviços Azure  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### Exemplos Relacionados

- **[Aplicação Base de Dados](../../../../../examples/database-app)** - Exemplo completo com SQL Database  
- **[Microserviços](../../../../../examples/container-app/microservices)** - Arquitetura multi-serviço  
- **[Guia Mestre Container Apps](../README.md)** - Todos os padrões de containers  

### Recursos de Aprendizagem

- 📚 [Curso AZD Para Principiantes](../../../README.md) - Página principal do curso  
- 📚 [Padrões Container Apps](../README.md) - Mais padrões de implementação  
- 📚 [Galeria de Templates AZD](https://azure.github.io/awesome-azd/) - Templates da comunidade  

## Recursos Adicionais

### Documentação
- **[Documentação Flask](https://flask.palletsprojects.com/)** - Guia do framework Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Documentação oficial Azure  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referência dos comandos azd  

### Tutoriais
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Implementar a tua primeira aplicação  
- **[Python no Azure](https://learn.microsoft.com/azure/developer/python/)** - Guia de desenvolvimento Python  
- **[Linguagem Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infraestrutura como código  

### Ferramentas
- **[Portal Azure](https://portal.azure.com)** - Gerir recursos visualmente  
- **[Extensão Azure VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integração IDE  

---

**🎉 Parabéns!** Implementou uma API Flask pronta para produção em Azure Container Apps com autoescalamento e monitorização.

**Perguntas?** [Abra um issue](https://github.com/microsoft/AZD-for-beginners/issues) ou consulte o [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:  
Este documento foi traduzido utilizando o serviço de tradução automática [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, por favor note que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informação crítica, recomenda-se a tradução profissional realizada por humanos. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->