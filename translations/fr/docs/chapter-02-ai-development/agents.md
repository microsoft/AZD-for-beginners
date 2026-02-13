# Agents d'IA avec Azure Developer CLI

**Navigation du chapitre:**
- **📚 Page du cours**: [AZD For Beginners](../../README.md)
- **📖 Chapitre courant**: Chapitre 2 - Développement axé sur l'IA
- **⬅️ Précédent**: [Déploiement de modèles IA](ai-model-deployment.md)
- **➡️ Suivant**: [Pratiques d'IA en production](production-ai-practices.md)
- **🚀 Avancé**: [Solutions multi-agents](../../examples/retail-scenario.md)

---

## Introduction

Les agents d'IA sont des programmes autonomes capables de percevoir leur environnement, de prendre des décisions et d'effectuer des actions pour atteindre des objectifs spécifiques. Contrairement aux simples chatbots qui répondent à des invites, les agents peuvent :

- **Utiliser des outils** - Appeler des APIs, rechercher dans des bases de données, exécuter du code
- **Planifier et raisonner** - Décomposer des tâches complexes en étapes
- **Apprendre du contexte** - Maintenir une mémoire et adapter le comportement
- **Collaborer** - Travailler avec d'autres agents (systèmes multi-agents)

Ce guide vous montre comment déployer des agents d'IA sur Azure en utilisant Azure Developer CLI (azd).

## Objectifs d'apprentissage

En complétant ce guide, vous allez :
- Comprendre ce que sont les agents d'IA et en quoi ils diffèrent des chatbots
- Déployer des modèles d'agents préconstruits avec AZD
- Configurer Foundry Agents pour des agents personnalisés
- Implémenter des modèles d'agents de base (utilisation d'outils, RAG, multi-agent)
- Surveiller et déboguer des agents déployés

## Résultats d'apprentissage

Une fois terminé, vous serez capable de :
- Déployer des applications d'agents d'IA sur Azure avec une seule commande
- Configurer les outils et capacités des agents
- Implémenter la génération augmentée par récupération (RAG) avec des agents
- Concevoir des architectures multi-agents pour des flux de travail complexes
- Résoudre les problèmes courants de déploiement des agents

---

## 🤖 Qu'est-ce qui distingue un agent d'un chatbot ?

| Feature | Chatbot | AI Agent |
|---------|---------|----------|
| **Behavior** | Responds to prompts | Takes autonomous actions |
| **Tools** | None | Can call APIs, search, execute code |
| **Memory** | Session-based only | Persistent memory across sessions |
| **Planning** | Single response | Multi-step reasoning |
| **Collaboration** | Single entity | Can work with other agents |

### Analogie simple

- **Chatbot** = Une personne serviable répondant aux questions à un guichet d'information
- **Agent d'IA** = Un assistant personnel qui peut passer des appels, prendre des rendez-vous et accomplir des tâches pour vous

---

## 🚀 Démarrage rapide : déployez votre premier agent

### Option 1: Foundry Agents Template (Recommended)

```bash
# Initialiser le modèle d'agents IA
azd init --template get-started-with-ai-agents

# Déployer sur Azure
azd up
```

**Ce qui est déployé:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (pour RAG)
- ✅ Azure Container Apps (interface web)
- ✅ Application Insights (monitoring)

**Temps:** ~15-20 minutes
**Coût:** ~$100-150/month (development)

### Option 2: OpenAI Agent with Prompty

```bash
# Initialiser le modèle d'agent basé sur Prompty
azd init --template agent-openai-python-prompty

# Déployer sur Azure
azd up
```

**Ce qui est déployé:**
- ✅ Azure Functions (exécution serverless de l'agent)
- ✅ Azure OpenAI
- ✅ Fichiers de configuration Prompty
- ✅ Exemple d'implémentation d'agent

**Temps:** ~10-15 minutes
**Coût:** ~$50-100/month (development)

### Option 3: RAG Chat Agent

```bash
# Initialiser le modèle de chat RAG
azd init --template azure-search-openai-demo

# Déployer sur Azure
azd up
```

**Ce qui est déployé:**
- ✅ Azure OpenAI
- ✅ Azure AI Search avec données d'exemple
- ✅ Pipeline de traitement de documents
- ✅ Interface de chat avec citations

**Temps:** ~15-25 minutes
**Coût:** ~$80-150/month (development)

---

## 🏗️ Modèles d'architecture des agents

### Modèle 1: Agent unique avec outils

Le modèle d'agent le plus simple - un agent pouvant utiliser plusieurs outils.

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**Idéal pour:**
- Bots de support client
- Assistants de recherche
- Agents d'analyse de données

**AZD Template:** `azure-search-openai-demo`

### Modèle 2: Agent RAG (Retrieval-Augmented Generation)

Un agent qui récupère des documents pertinents avant de générer des réponses.

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**Idéal pour:**
- Bases de connaissances d'entreprise
- Systèmes de Q&R de documents
- Recherche juridique et conformité

**AZD Template:** `azure-search-openai-demo`

### Modèle 3: Système multi-agent

Plusieurs agents spécialisés travaillant ensemble sur des tâches complexes.

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**Idéal pour:**
- Génération de contenu complexe
- Flux de travail multi-étapes
- Tâches nécessitant différentes expertises

**En savoir plus:** [Multi-Agent Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Configuration des outils des agents

Les agents deviennent puissants lorsqu'ils peuvent utiliser des outils. Voici comment configurer des outils courants :

### Configuration des outils dans Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Définir des outils personnalisés
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# Créer un agent avec des outils
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Configuration de l'environnement

```bash
# Configurer les variables d'environnement spécifiques à l'agent
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Déployer avec la configuration mise à jour
azd deploy
```

---

## 📊 Surveillance des agents

### Intégration Application Insights

Tous les templates d'agent AZD incluent Application Insights pour la surveillance :

```bash
# Ouvrir le tableau de bord de surveillance
azd monitor --overview

# Voir les journaux en temps réel
azd monitor --logs

# Voir les métriques en temps réel
azd monitor --live
```

### Principales métriques à suivre

| Metric | Description | Target |
|--------|-------------|--------|
| Response Latency | Time to generate response | < 5 seconds |
| Token Usage | Tokens per request | Monitor for cost |
| Tool Call Success Rate | % of successful tool executions | > 95% |
| Error Rate | Failed agent requests | < 1% |
| User Satisfaction | Feedback scores | > 4.0/5.0 |

### Journalisation personnalisée pour les agents

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 Considérations sur les coûts

### Coûts mensuels estimés par modèle

| Pattern | Dev Environment | Production |
|---------|-----------------|------------|
| Single Agent | $50-100 | $200-500 |
| RAG Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 agents) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Conseils d'optimisation des coûts

1. **Utilisez GPT-4o-mini pour les tâches simples**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implémentez la mise en cache pour les requêtes répétées**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Définissez des limites de tokens**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Limiter la longueur de la réponse
   )
   ```

4. **Mettez à l'échelle à zéro lorsqu'il n'est pas utilisé**
   ```bash
   # Les Container Apps se mettent automatiquement à l'échelle jusqu'à zéro
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Dépannage des agents

### Problèmes courants et solutions

<details>
<summary><strong>❌ L'agent ne répond pas aux appels d'outils</strong></summary>

```bash
# Vérifier que les outils sont correctement enregistrés
azd show

# Vérifier le déploiement d'OpenAI
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Vérifier les journaux de l'agent
azd monitor --logs
```

**Causes courantes:**
- Incompatibilité de la signature de la fonction de l'outil
- Permissions requises manquantes
- Point de terminaison de l'API non accessible
</details>

<details>
<summary><strong>❌ Latence élevée dans les réponses de l'agent</strong></summary>

```bash
# Vérifiez Application Insights pour les goulots d'étranglement
azd monitor --live

# Envisagez d'utiliser un modèle plus rapide
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Conseils d'optimisation:**
- Utilisez des réponses en streaming
- Mettez en place la mise en cache des réponses
- Réduisez la taille de la fenêtre de contexte
</details>

<details>
<summary><strong>❌ L'agent retourne des informations incorrectes ou inventées</strong></summary>

```python
# Améliorer avec de meilleurs messages système
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Ajouter la récupération pour l'ancrage
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Fonder les réponses sur des documents
)
```
</details>

<details>
<summary><strong>❌ Erreurs de dépassement de la limite de tokens</strong></summary>

```python
# Implémenter la gestion de la fenêtre de contexte
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Estimation approximative
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Exercices pratiques

### Exercice 1: Déployer un agent basique (20 minutes)

**Objectif:** Déployez votre premier agent d'IA avec AZD

```bash
# Étape 1 : Initialiser le modèle
azd init --template get-started-with-ai-agents

# Étape 2 : Se connecter à Azure
azd auth login

# Étape 3 : Déployer
azd up

# Étape 4 : Tester l'agent
# Ouvrez l'URL affichée dans la sortie

# Étape 5 : Nettoyer
azd down --force --purge
```

**Critères de réussite:**
- [ ] L'agent répond aux questions
- [ ] Peut accéder au tableau de bord de surveillance
- [ ] Ressources nettoyées avec succès

### Exercice 2: Ajouter un outil personnalisé (30 minutes)

**Objectif:** Étendre un agent avec un outil personnalisé

1. Déployez le modèle d'agent
2. Créez une nouvelle fonction d'outil :
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # Appel d'API au service météorologique
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Enregistrez l'outil auprès de l'agent
4. Testez que l'agent utilise le nouvel outil

**Critères de réussite:**
- [ ] L'agent reconnaît les requêtes liées à la météo
- [ ] L'outil est appelé correctement
- [ ] La réponse inclut des informations météo

### Exercice 3: Construire un agent RAG (45 minutes)

**Objectif:** Créer un agent qui répond aux questions à partir de vos documents

```bash
# Déployer le gabarit RAG
azd init --template azure-search-openai-demo
azd up

# Téléversez vos documents
# (Suivez le guide d'ingestion de données du gabarit)

# Testez avec des questions spécifiques au domaine
```

**Critères de réussite:**
- [ ] L'agent répond à partir des documents téléchargés
- [ ] Les réponses incluent des citations
- [ ] Aucune hallucination sur les questions hors sujet

---

## 📚 Prochaines étapes

Maintenant que vous comprenez les agents d'IA, explorez ces sujets avancés :

| Topic | Description | Link |
|-------|-------------|------|
| **Multi-Agent Systems** | Build systems with multiple collaborating agents | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Coordination Patterns** | Learn orchestration and communication patterns | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Production Deployment** | Enterprise-ready agent deployment | [Production AI Practices](production-ai-practices.md) |
| **Agent Evaluation** | Test and evaluate agent performance | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Ressources supplémentaires

### Documentation officielle
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### Modèles AZD pour agents
- [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Ressources communautaires
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigation**
- **Leçon précédente**: [Déploiement de modèles IA](ai-model-deployment.md)
- **Leçon suivante**: [Pratiques d'IA en production](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction automatique par IA Co-op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle réalisée par un traducteur humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->