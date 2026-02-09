# API Flask Simples - Exemplo de Aplicação Container

**Roteiro de Aprendizagem:** Iniciante ⭐ | **Tempo:** 25-35 minutos | **Custo:** 0-15$/mês

Uma API REST Python Flask completa e funcional implantada no Azure Container Apps usando o Azure Developer CLI (azd). Este exemplo demonstra implantação de containers, auto-escalonamento e noções básicas de monitorização.

## 🎯 O que Vai Aprender

- Implantar uma aplicação Python conteinerizada no Azure  
- Configurar auto-escalonamento com escala para zero  
- Implementar verificações de saúde e de prontidão  
- Monitorizar logs e métricas da aplicação  
- Utilizar o Azure Developer CLI para implantação rápida  

## 📦 O que Está Incluído

✅ **Aplicação Flask** - API REST completa com operações CRUD (`src/app.py`)  
✅ **Dockerfile** - Configuração do container pronta para produção  
✅ **Infraestrutura Bicep** - Ambiente Container Apps e implantação da API  
✅ **Configuração AZD** - Implantação com um comando  
✅ **Verificações de Saúde** - Configuradas liveness e readiness  
✅ **Auto-escalonamento** - 0-10 réplicas baseadas na carga HTTP  

## Arquitetura

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## Pré-Requisitos

### Necessário
- **Azure Developer CLI (azd)** - [Guia de instalação](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **Assinatura Azure** - [Conta gratuita](https://azure.microsoft.com/free/)  
- **Docker Desktop** - [Instalar Docker](https://www.docker.com/products/docker-desktop/) (para testes locais)  

### Verificar Pré-Requisitos

```bash
# Verificar a versão do azd (necessita da 1.5.0 ou superior)
azd version

# Verificar login no Azure
azd auth login

# Verificar Docker (opcional, para testes locais)
docker --version
```

## ⏱️ Tempo de Implantação

| Fase | Duração | O que Acontece |
|-------|----------|--------------||
| Configuração do ambiente | 30 segundos | Criação do ambiente azd |
| Construção do container | 2-3 minutos | Docker build da app Flask |
| Provisão da infraestrutura | 3-5 minutos | Criação de Container Apps, registo, monitorização |
| Implantação da aplicação | 2-3 minutos | Push da imagem e implantação no Container Apps |
| **Total** | **8-12 minutos** | Implantação completa pronta |

## Início Rápido

```bash
# Navegar para o exemplo
cd examples/container-app/simple-flask-api

# Inicializar o ambiente (escolher nome único)
azd env new myflaskapi

# Desplegar tudo (infraestrutura + aplicação)
azd up
# Será solicitado que:
# 1. Selecione a subscrição Azure
# 2. Escolha a localização (por exemplo, eastus2)
# 3. Aguarde 8-12 minutos para o deployment

# Obtenha o endpoint da API
azd env get-values

# Teste a API
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

## ✅ Verificar Implantação

### Passo 1: Verificar Estado da Implantação

```bash
# Ver serviços implantados
azd show

# A saída esperada mostra:
# - Serviço: api
# - Ponto final: https://ca-api-[env].xxx.azurecontainerapps.io
# - Estado: Em execução
```

### Passo 2: Testar Endpoints da API

```bash
# Obter endpoint da API
API_URL=$(azd env get-value API_ENDPOINT)

# Testar estado
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
- ✅ Endpoint de saúde retorna HTTP 200  
- ✅ Endpoint raiz mostra informação da API  
- ✅ POST cria item e retorna HTTP 201  
- ✅ GET retorna itens criados  

### Passo 3: Visualizar Logs

```bash
# Transmita logs em direto utilizando azd monitor
azd monitor --logs

# Ou use o Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Deve ver:
# - Mensagens de arranque do Gunicorn
# - Logs de pedidos HTTP
# - Logs de informação da aplicação
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

### Configuração de Escalonamento

A API escala automaticamente com base no tráfego HTTP:  
- **Mínimo de Réplicas**: 0 (escala para zero quando ocioso)  
- **Máximo de Réplicas**: 10  
- **Pedidos Concorrentes por Réplica**: 50  

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

## Implantação

### Implantação Completa

```bash
# Desplegar infraestrutura e aplicação
azd up
```

### Implantação Apenas Código

```bash
# Despachar apenas código da aplicação (infraestrutura inalterada)
azd deploy api
```

### Atualizar Configuração

```bash
# Atualizar variáveis de ambiente
azd env set API_KEY "new-api-key"

# Redistribuir com nova configuração
azd deploy api
```

## Monitorização

### Ver Logs

```bash
# Transmita logs em direto usando azd monitor
azd monitor --logs

# Ou utilize o Azure CLI para Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# Veja as últimas 100 linhas
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### Monitorizar Métricas

```bash
# Abrir painel do Azure Monitor
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

### Obter Todos os Itens

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## Otimização de Custos

Esta implantação usa escala para zero, então só paga quando a API está a processar pedidos:  

- **Custo ocioso**: ~0$/mês (escala para zero)  
- **Custo ativo**: ~0.000024$/segundo por réplica  
- **Custo mensal esperado** (uso leve): 5-15$  

### Reduzir Custos Adicionais

```bash
# Reduzir o número máximo de réplicas para dev
azd env set MAX_REPLICAS 3

# Usar um tempo limite de inatividade mais curto
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 minutos
```

## Solução de Problemas

### O Container Não Arranca

```bash
# Verificar logs do contentor usando Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# Verificar construções de imagem Docker localmente
docker build -t test ./src
```

### API Não Está Acessível

```bash
# Verificar se o ingresso é externo
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### Tempos de Resposta Elevados

```bash
# Verificar utilização de CPU/Memória
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# Aumentar recursos se necessário
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## Limpeza

```bash
# Eliminar todos os recursos
azd down --force --purge
```

## Próximos Passos

### Expandir Este Exemplo

1. **Adicionar Base de Dados** - Integrar Azure Cosmos DB ou SQL Database  
   ```bash
   # Adicionar módulo Cosmos DB a infra/main.bicep
   # Atualizar app.py com a ligação à base de dados
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
- **[Microsserviços](../../../../../examples/container-app/microservices)** - Arquitetura multi-serviços  
- **[Guia Mestre Container Apps](../README.md)** - Todos os padrões de containers  

### Recursos de Aprendizagem

- 📚 [Curso AZD Para Iniciantes](../../../README.md) - Página principal do curso  
- 📚 [Padrões Container Apps](../README.md) - Mais padrões de implantação  
- 📚 [Galeria de Templates AZD](https://azure.github.io/awesome-azd/) - Templates da comunidade  

## Recursos Adicionais

### Documentação
- **[Documentação Flask](https://flask.palletsprojects.com/)** - Guia do framework Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - Documentação oficial Azure  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referência de comandos azd  

### Tutoriais
- **[Início Rápido Container Apps](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - Implante sua primeira app  
- **[Python no Azure](https://learn.microsoft.com/azure/developer/python/)** - Guia de desenvolvimento Python  
- **[Linguagem Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - Infraestrutura como código  

### Ferramentas
- **[Portal Azure](https://portal.azure.com)** - Gestão visual de recursos  
- **[Extensão Azure para VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - Integração IDE  

---

**🎉 Parabéns!** Implantou uma API Flask pronta para produção no Azure Container Apps com auto-escalonamento e monitorização.

**Dúvidas?** [Abra uma issue](https://github.com/microsoft/AZD-for-beginners/issues) ou consulte as [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Apesar de esforçarmo-nos pela precisão, por favor tenha em conta que as traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte autorizada. Para informações críticas, recomenda-se uma tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações erradas decorrentes do uso desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->