# Deploy de uma Base de Dados Microsoft SQL e Aplicação Web com AZD

⏱️ **Tempo Estimado**: 20-30 minutos | 💰 **Custo Estimado**: ~$15-25/mês | ⭐ **Complexidade**: Intermédio

Este **exemplo completo e funcional** demonstra como usar o [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) para fazer deploy de uma aplicação web Python Flask com uma Base de Dados Microsoft SQL no Azure. Todo o código está incluído e testado—não são necessárias dependências externas.

## O Que Vai Aprender

Ao completar este exemplo, irá:
- Fazer deploy de uma aplicação multi-camadas (aplicação web + base de dados) usando infraestrutura como código
- Configurar ligações seguras à base de dados sem hardcoding de segredos
- Monitorizar a saúde da aplicação com o Application Insights
- Gerir recursos Azure eficientemente com o AZD CLI
- Seguir as melhores práticas do Azure para segurança, otimização de custo e observabilidade

## Visão Geral do Cenário
- **Aplicação Web**: API REST Python Flask com conectividade à base de dados
- **Base de Dados**: Base de Dados Azure SQL com dados de exemplo
- **Infraestrutura**: Provisionada usando Bicep (templates modulares e reutilizáveis)
- **Deploy**: Totalmente automatizado com comandos `azd`
- **Monitorização**: Application Insights para logs e telemetria

## Pré-requisitos

### Ferramentas Necessárias

Antes de começar, certifique-se que tem estas ferramentas instaladas:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versão 2.50.0 ou superior)
   ```sh
   az --version
   # Saída esperada: azure-cli 2.50.0 ou superior
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versão 1.0.0 ou superior)
   ```sh
   azd version
   # Saída esperada: versão azd 1.0.0 ou superior
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (para desenvolvimento local)
   ```sh
   python --version
   # Saída esperada: Python 3.8 ou superior
   ```

4. **[Docker](https://www.docker.com/get-started)** (opcional, para desenvolvimento local em containers)
   ```sh
   docker --version
   # Saída esperada: Versão do Docker 20.10 ou superior
   ```

### Requisitos Azure

- Uma **subscrição Azure ativa** ([crie uma conta gratuita](https://azure.microsoft.com/free/))
- Permissões para criar recursos na sua subscrição
- Função de **Owner** ou **Contributor** na subscrição ou grupo de recursos

### Conhecimentos Pré-requisitos

Este é um exemplo de nível **intermédio**. Deve estar familiarizado com:
- Operações básicas de linha de comando
- Conceitos básicos de cloud (recursos, grupos de recursos)
- Noções básicas de aplicações web e bases de dados

**Novo no AZD?** Comece pelo [guia de Introdução](../../docs/chapter-01-foundation/azd-basics.md).

## Arquitetura

Este exemplo implementa uma arquitetura em duas camadas com aplicação web e base de dados SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Deploy dos Recursos:**
- **Grupo de Recursos**: Contentor para todos os recursos
- **Plano de Serviço de Aplicações**: Hosting baseado em Linux (tier B1 para eficiência de custo)
- **Aplicação Web**: Runtime Python 3.11 com aplicação Flask
- **Servidor SQL**: Servidor de base de dados gerido com TLS 1.2 mínimo
- **Base de Dados SQL**: Tier básico (2GB, adequado para desenvolvimento/testes)
- **Application Insights**: Monitorização e logging
- **Log Analytics Workspace**: Armazenamento centralizado de logs

**Analogia**: Pense nisto como um restaurante (app web) com um congelador de armazenagem (base de dados). Os clientes fazem pedidos pelo menu (endpoints API), e a cozinha (app Flask) vai buscar os ingredientes (dados) ao congelador. O gerente do restaurante (Application Insights) acompanha tudo o que acontece.

## Estrutura de Pastas

Todos os ficheiros estão incluídos neste exemplo—não são necessárias dependências externas:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**O Que Cada Ficheiro Faz:**
- **azure.yaml**: Indica ao AZD o que e onde fazer deploy
- **infra/main.bicep**: Orquestra todos os recursos Azure
- **infra/resources/*.bicep**: Definições individuais de recursos (modulares para reutilização)
- **src/web/app.py**: Aplicação Flask com lógica de base de dados
- **requirements.txt**: Dependências Python
- **Dockerfile**: Instruções para containerização e deploy

## Início Rápido (Passo a Passo)

### Passo 1: Clonar e Navegar

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Verificação de Sucesso**: Confirme que vê o `azure.yaml` e a pasta `infra/`:
```sh
ls
# Esperado: README.md, azure.yaml, infra/, src/
```

### Passo 2: Autenticar-se no Azure

```sh
azd auth login
```

Isto abre o browser para autenticação no Azure. Inicie sessão com as suas credenciais Azure.

**✓ Verificação de Sucesso**: Deve ver:
```
Logged in to Azure.
```

### Passo 3: Inicializar o Ambiente

```sh
azd init
```

**O que acontece**: AZD cria uma configuração local para o seu deploy.

**Prompts que verá**:
- **Nome do ambiente**: Introduza um nome curto (ex: `dev`, `myapp`)
- **Subscrição Azure**: Selecione a sua subscrição da lista
- **Localização Azure**: Escolha uma região (ex: `eastus`, `westeurope`)

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: New project initialized!
```

### Passo 4: Provisionar Recursos Azure

```sh
azd provision
```

**O que acontece**: AZD implementa toda a infraestrutura (leva 5-8 minutos):
1. Cria grupo de recursos
2. Cria SQL Server e Base de Dados
3. Cria Plano de Serviço de Aplicações
4. Cria Aplicação Web
5. Cria Application Insights
6. Configura rede e segurança

**Será solicitado para**:
- **Nome do administrador SQL**: Introduza um nome de utilizador (ex: `sqladmin`)
- **Password do administrador SQL**: Introduza uma password forte (guarde este valor!)

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 5-8 minutos

### Passo 5: Fazer Deploy da Aplicação

```sh
azd deploy
```

**O que acontece**: AZD constrói e faz deploy da sua aplicação Flask:
1. Empacota a aplicação Python
2. Constrói o container Docker
3. Faz push para o Azure Web App
4. Inicializa a base de dados com dados de exemplo
5. Inicia a aplicação

**✓ Verificação de Sucesso**: Deve ver:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tempo**: 3-5 minutos

### Passo 6: Navegar na Aplicação

```sh
azd browse
```

Isso abre a sua app web deployada no browser em `https://app-<unique-id>.azurewebsites.net`

**✓ Verificação de Sucesso**: Deve ver saída JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Passo 7: Testar os Endpoints da API

**Verificação da Saúde** (confirma ligação à base de dados):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Resposta Esperada**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Listar Produtos** (dados de exemplo):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Resposta Esperada**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Obter Produto Individual**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Verificação de Sucesso**: Todos os endpoints devolvem dados JSON sem erros.

---

**🎉 Parabéns!** Conseguiu fazer deploy com sucesso de uma aplicação web com base de dados no Azure usando o AZD.

## Mergulho na Configuração

### Variáveis de Ambiente

Os segredos são geridos de forma segura via configuração do Azure App Service—**nunca hardcoded no código-fonte**.

**Configuradas automaticamente pelo AZD**:
- `SQL_CONNECTION_STRING`: Ligação à base de dados com credenciais encriptadas
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint de telemetria para monitorização
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Permite instalação automática das dependências

**Onde os Segredos São Armazenados**:
1. Durante o `azd provision`, fornece as credenciais SQL via prompts seguros
2. O AZD guarda estes dados no ficheiro local `.azure/<env-name>/.env` (ignorados pelo Git)
3. O AZD injeta-os na configuração do Azure App Service (encriptados em repouso)
4. A aplicação lê-os via `os.getenv()` em runtime

### Desenvolvimento Local

Para teste local, crie um ficheiro `.env` a partir do exemplo:

```sh
cp .env.sample .env
# Edite o .env com a ligação à sua base de dados local
```

**Fluxo de trabalho de desenvolvimento local**:
```sh
# Instalar dependências
cd src/web
pip install -r requirements.txt

# Definir variáveis de ambiente
export SQL_CONNECTION_STRING="your-local-connection-string"

# Executar a aplicação
python app.py
```

**Testar localmente**:
```sh
curl http://localhost:8000/health
# Esperado: {"status": "healthy", "database": "connected"}
```

### Infraestrutura como Código

Todos os recursos Azure são definidos em **templates Bicep** (pasta `infra/`):

- **Design Modular**: Cada tipo de recurso tem o seu próprio ficheiro para reutilização
- **Parametrizado**: Permite personalizar SKUs, regiões, convenções de nomenclatura
- **Melhores Práticas**: Segue padrões Azure para nomes e segurança por defeito
- **Controlado por Versão**: Todas as alterações de infraestrutura são monitorizadas no Git

**Exemplo de Personalização**:
Para alterar o tier da base de dados, edite `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Melhores Práticas de Segurança

Este exemplo segue as melhores práticas de segurança do Azure:

### 1. **Sem Segredos no Código-Fonte**
- ✅ Credenciais armazenadas na configuração do Azure App Service (encriptadas)
- ✅ Ficheiros `.env` excluídos do Git via `.gitignore`
- ✅ Segredos passados via parâmetros seguros durante o provisionamento

### 2. **Ligações Encriptadas**
- ✅ TLS 1.2 como mínimo para SQL Server
- ✅ HTTPS obrigatório para a Aplicação Web
- ✅ Ligações à base de dados usam canais encriptados

### 3. **Segurança de Rede**
- ✅ Firewall do SQL Server configurado para permitir apenas serviços Azure
- ✅ Acesso público restrito (pode ser melhorado com Private Endpoints)
- ✅ FTPS desativado na aplicação web

### 4. **Autenticação & Autorização**
- ⚠️ **Atual**: Autenticação SQL (nome de utilizador/password)
- ✅ **Recomendação para Produção**: Usar Managed Identity do Azure para autenticação sem password

**Para atualizar para Managed Identity** (em produção):
1. Ativar identidade gerida na Aplicação Web
2. Conceder permissões SQL para a identidade
3. Atualizar a string de ligação para usar Managed Identity
4. Remover autenticação baseada em password

### 5. **Auditoria & Conformidade**
- ✅ Application Insights regista todos os pedidos e erros
- ✅ Auditoria da Base de Dados SQL ativada (pode ser configurada para conformidade)
- ✅ Todos os recursos estão marcados para governação

**Lista de Verificação de Segurança para Produção**:
- [ ] Ativar Azure Defender para SQL
- [ ] Configurar Private Endpoints para Base de Dados SQL
- [ ] Ativar Web Application Firewall (WAF)
- [ ] Implementar Azure Key Vault para rotação de segredos
- [ ] Configurar autenticação Azure AD
- [ ] Ativar logging diagnóstico para todos os recursos

## Otimização de Custos

**Custos Mensais Estimados** (novembro 2025):

| Recurso | SKU/Tier | Custo Estimado |
|----------|----------|----------------|
| Plano de Serviço de Aplicações | B1 (Básico) | ~$13/mês |
| Base de Dados SQL | Básico (2GB) | ~$5/mês |
| Application Insights | Pago conforme uso | ~$2/mês (baixo tráfego) |
| **Total** | | **~$20/mês** |

**💡 Dicas de Poupar Custos**:

1. **Use o Nível Grátis para Aprender**:
   - App Service: tier F1 (grátis, horas limitadas)
   - Base de Dados SQL: use Azure SQL Database serverless
   - Application Insights: 5GB/mês de ingestão gratuita

2. **Pare Recursos Quando Não Utilizar**:
   ```sh
   # Parar a aplicação web (a base de dados continua a cobrar)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Reiniciar quando necessário
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Apague Tudo Após Testar**:
   ```sh
   azd down
   ```
   Isto remove TODOS os recursos e para cobranças.

4. **SKUs de Desenvolvimento vs Produção**:
   - **Desenvolvimento**: tier básico (usado neste exemplo)
   - **Produção**: tier Standard/Premium com redundância

**Monitorização de Custos**:
- Veja custos no [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Configure alertas para evitar surpresas
- Marque todos os recursos com `azd-env-name` para facilitar o tracking

**Alternativa de Nível Grátis**:
Para fins de aprendizagem, pode modificar `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Nota**: O nível grátis tem limitações (60 min/dia CPU, sem always-on).

## Monitorização & Observabilidade

### Integração com Application Insights

Este exemplo inclui **Application Insights** para monitorização completa:

**O Que é Monitorizado**:
- ✅ Pedidos HTTP (latência, códigos de estado, endpoints)
- ✅ Erros e exceções da aplicação
- ✅ Logging personalizado da app Flask
- ✅ Estado da ligação à base de dados
- ✅ Métricas de performance (CPU, memória)

**Aceder ao Application Insights**:
1. Abra o [Portal Azure](https://portal.azure.com)
2. Navegue até ao grupo de recursos (`rg-<env-name>`)
3. Clique no recurso Application Insights (`appi-<unique-id>`)

**Consultas Úteis** (Application Insights → Logs):

**Ver Todos os Pedidos**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Encontrar Erros**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Verificar Endpoint de Saúde**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Auditoria da Base de Dados SQL

**Auditoria da Base de Dados SQL está ativada** para rastrear:
- Padrões de acesso à base de dados
- Tentativas de login falhadas
- Alterações ao esquema
- Acesso a dados (para conformidade)

**Aceder a Logs de Auditoria**:
1. Portal Azure → Base de Dados SQL → Auditoria
2. Veja logs no Log Analytics workspace

### Monitorização em Tempo Real

**Ver Métricas em Live**:
1. Application Insights → Live Metrics
2. Veja pedidos, falhas e performance em tempo real

**Configurar Alertas**:
Crie alertas para eventos críticos:
- Erros HTTP 500 > 5 em 5 minutos
- Falhas na ligação à base de dados
- Tempos de resposta elevados (>2 segundos)

**Exemplo de Criação de Alerta**:  
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```
  
## Resolução de Problemas

### Problemas Comuns e Soluções

#### 1. `azd provision` falha com "Location not available"

**Sintoma**:  
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```
  
**Solução**:  
Escolha uma região Azure diferente ou registe o fornecedor de recursos:  
```sh
az provider register --namespace Microsoft.Insights
```
  
#### 2. Falha de ligação SQL durante a implementação

**Sintoma**:  
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```
  
**Solução**:  
- Verifique se o firewall do SQL Server permite serviços Azure (configurado automaticamente)  
- Certifique-se que a palavra-passe do administrador SQL foi introduzida corretamente durante o `azd provision`  
- Assegure-se que o SQL Server está totalmente provisionado (pode demorar 2-3 minutos)

**Verifique a Ligação**:  
```sh
# No Portal Azure, vá a Base de Dados SQL → Editor de consultas
# Tente ligar-se com as suas credenciais
```
  
#### 3. Aplicação Web apresenta "Application Error"

**Sintoma**:  
O navegador mostra uma página de erro genérica.

**Solução**:  
Verifique os logs da aplicação:  
```sh
# Ver registos recentes
az webapp log tail --name <app-name> --resource-group <rg-name>
```
  
**Causas comuns**:  
- Variáveis de ambiente em falta (verifique App Service → Configuração)  
- Falha na instalação do pacote Python (verifique os logs da implementação)  
- Erro de inicialização da base de dados (verifique a conectividade SQL)

#### 4. `azd deploy` falha com "Build Error"

**Sintoma**:  
```
Error: Failed to build project
```
  
**Solução**:  
- Certifique-se de que `requirements.txt` não contém erros de sintaxe  
- Verifique se Python 3.11 está especificado em `infra/resources/web-app.bicep`  
- Confirme que o Dockerfile tem a imagem base correta

**Depure localmente**:  
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```
  
#### 5. "Unauthorized" ao executar comandos AZD

**Sintoma**:  
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```
  
**Solução**:  
Reautentique-se no Azure:  
```sh
azd auth login
az login
```
  
Verifique se tem as permissões corretas (função de Colaborador) na subscrição.

#### 6. Custos elevados da base de dados

**Sintoma**:  
Fatura inesperada do Azure.

**Solução**:  
- Verifique se se esqueceu de executar `azd down` após os testes  
- Confirme se a Base de Dados SQL está a utilizar o nível Básico (não Premium)  
- Reveja os custos em Azure Cost Management  
- Configure alertas de custo

### Obter Ajuda

**Ver todas as variáveis de ambiente AZD**:  
```sh
azd env get-values
```
  
**Verificar o estado da implementação**:  
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```
  
**Aceder aos logs da aplicação**:  
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```
  
**Precisa de mais ajuda?**  
- [Guia de Resolução de Problemas AZD](../../docs/chapter-07-troubleshooting/common-issues.md)  
- [Resolução de Problemas Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)  
- [Resolução de Problemas Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Exercícios Práticos

### Exercício 1: Verificar a sua implementação (Iniciante)

**Objetivo**: Confirmar que todos os recursos estão implementados e a aplicação funciona.

**Passos**:  
1. Liste todos os recursos no seu grupo de recursos:  
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
  
  **Esperado**: 6-7 recursos (Web App, SQL Server, Base de Dados SQL, Plano App Service, Application Insights, Log Analytics)

2. Teste todos os endpoints da API:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
  
  **Esperado**: Todos retornam JSON válido sem erros

3. Verifique o Application Insights:  
   - Aceda ao Application Insights na Azure Portal  
   - Vá a "Live Metrics"  
   - Atualize o navegador na aplicação web  
   **Esperado**: Ver requisições a aparecer em tempo real

**Critérios de Sucesso**: Todos os 6-7 recursos existem, todos os endpoints devolvem dados, Live Metrics mostra atividade.

---

### Exercício 2: Adicionar um Novo Endpoint à API (Intermédio)

**Objetivo**: Estender a aplicação Flask com um novo endpoint.

**Código inicial**: Endpoints atuais em `src/web/app.py`

**Passos**:  
1. Edite `src/web/app.py` e adicione um novo endpoint após a função `get_product()`:  
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```
  
2. Implemente a aplicação atualizada:  
   ```sh
   azd deploy
   ```
  
3. Teste o novo endpoint:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
  
  **Esperado**: Retorna produtos que correspondem a "laptop"

**Critérios de Sucesso**: Novo endpoint funciona, retorna resultados filtrados, aparece nos logs do Application Insights.

---

### Exercício 3: Adicionar Monitorização e Alertas (Avançado)

**Objetivo**: Configurar monitorização proactiva com alertas.

**Passos**:  
1. Crie um alerta para erros HTTP 500:  
   ```sh
   # Obter ID do recurso do Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Criar alerta
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```
  
2. Dispare o alerta causando erros:  
   ```sh
   # Pedido de um produto inexistente
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```
  
3. Verifique se o alerta foi ativado:  
   - Azure Portal → Alertas → Regras de Alerta  
   - Verifique o seu email (se configurado)

**Critérios de Sucesso**: Regra de alerta criada, dispara em erros, notificações são recebidas.

---

### Exercício 4: Alterações no Esquema da Base de Dados (Avançado)

**Objetivo**: Adicionar uma nova tabela e modificar a aplicação para usá-la.

**Passos**:  
1. Conecte-se à Base de Dados SQL via Editor de Consultas no Azure Portal

2. Crie uma nova tabela `categories`:  
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```
  
3. Atualize `src/web/app.py` para incluir informação de categoria nas respostas

4. Implemente e teste

**Critérios de Sucesso**: A nova tabela existe, os produtos mostram informação de categoria, aplicação funciona corretamente.

---

### Exercício 5: Implementar Cache (Especialista)

**Objetivo**: Adicionar Azure Redis Cache para melhorar desempenho.

**Passos**:  
1. Adicione Redis Cache ao `infra/main.bicep`  
2. Atualize `src/web/app.py` para armazenar em cache as consultas de produtos  
3. Meça melhoria de desempenho com Application Insights  
4. Compare tempos de resposta antes e depois do cache

**Critérios de Sucesso**: Redis está implementado, cache funciona, tempos de resposta melhoram >50%.

**Dica**: Comece com a [documentação Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Limpeza

Para evitar cobranças contínuas, elimine todos os recursos quando terminar:  

```sh
azd down
```
  
**Pedido de confirmação**:  
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```
  
Digite `y` para confirmar.

**✓ Verificação de sucesso**:  
- Todos os recursos foram eliminados da Azure Portal  
- Não há cobranças contínuas  
- Pasta local `.azure/<env-name>` pode ser apagada

**Alternativa** (manter infraestrutura, eliminar dados):  
```sh
# Apagar apenas o grupo de recursos (manter a configuração AZD)
az group delete --name rg-<env-name> --yes
```
  
## Saiba Mais

### Documentação Relacionada  
- [Documentação Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Documentação Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)  
- [Documentação Azure App Service](https://learn.microsoft.com/azure/app-service/)  
- [Documentação Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)  
- [Referência da Linguagem Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Próximos Passos Neste Curso  
- **[Exemplo Container Apps](../../../../examples/container-app)**: Implementar microserviços com Azure Container Apps  
- **[Guia de Integração AI](../../../../docs/ai-foundry)**: Adicionar capacidades AI à sua app  
- **[Melhores Práticas de Implementação](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Padrões de implementação para produção

### Tópicos Avançados  
- **Identidade Gerida**: Remover palavras-passe e usar autenticação Azure AD  
- **Endpoints Privados**: Proteger ligações à base de dados dentro de rede virtual  
- **Integração CI/CD**: Automatizar implementações com GitHub Actions ou Azure DevOps  
- **Ambientes Múltiplos**: Configurar ambientes dev, staging e produção  
- **Migrações de Base de Dados**: Usar Alembic ou Entity Framework para versionar esquema

### Comparação com Outras Abordagens

**AZD vs. ARM Templates**:  
- ✅ AZD: Abstração de nível superior, comandos mais simples  
- ⚠️ ARM: Mais verboso, controlo mais detalhado

**AZD vs. Terraform**:  
- ✅ AZD: Nativo Azure, integrado com serviços Azure  
- ⚠️ Terraform: Multi-cloud, ecossistema maior

**AZD vs. Azure Portal**:  
- ✅ AZD: Repetível, controlado por versão, automatizável  
- ⚠️ Portal: Cliques manuais, difícil de reproduzir

**Pense no AZD como**: Docker Compose para Azure — configuração simplificada para implementações complexas.

---

## Perguntas Frequentes

**P: Posso usar outra linguagem de programação?**  
R: Sim! Substitua `src/web/` por Node.js, C#, Go ou qualquer linguagem. Atualize `azure.yaml` e Bicep conforme necessário.

**P: Como adiciono mais bases de dados?**  
R: Adicione outro módulo de Base de Dados SQL em `infra/main.bicep` ou use PostgreSQL/MySQL dos serviços Azure Database.

**P: Posso usar isto em produção?**  
R: É um ponto de partida. Para produção, adicione: identidade gerida, endpoints privados, redundância, estratégia de backup, WAF e monitorização avançada.

**P: E se quiser usar contentores em vez de implementar código?**  
R: Veja o [Exemplo Container Apps](../../../../examples/container-app) que usa contentores Docker em toda a aplicação.

**P: Como me conecto à base de dados a partir da minha máquina local?**  
R: Adicione o seu IP ao firewall do SQL Server:  
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```
  
**P: Posso usar uma base de dados existente em vez de criar uma nova?**  
R: Sim, modifique `infra/main.bicep` para referenciar um SQL Server existente e atualize os parâmetros da cadeia de ligação.

---

> **Nota:** Este exemplo demonstra as melhores práticas para implementar uma aplicação web com base de dados usando AZD. Inclui código funcional, documentação abrangente e exercícios práticos para reforçar o aprendizado. Para implementações em produção, reveja requisitos de segurança, escalabilidade, conformidade e custos específicos da sua organização.

**📚 Navegação do Curso:**  
- ← Anterior: [Exemplo Container Apps](../../../../examples/container-app)  
- → Seguinte: [Guia de Integração AI](../../../../docs/ai-foundry)  
- 🏠 [Início do Curso](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso Legal**:
Este documento foi traduzido utilizando o serviço de tradução por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Embora nos esforcemos para garantir a precisão, tenha em conta que traduções automáticas podem conter erros ou imprecisões. O documento original na sua língua nativa deve ser considerado a fonte oficial. Para informações críticas, recomenda-se tradução profissional humana. Não nos responsabilizamos por quaisquer mal-entendidos ou interpretações incorretas decorrentes da utilização desta tradução.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->