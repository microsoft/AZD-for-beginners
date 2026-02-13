# Modèles de coordination multi-agents

⏱️ **Durée estimée**: 60-75 minutes | 💰 **Coût estimé**: ~$100-300/month | ⭐ **Complexité**: Élevée

**📚 Parcours d'apprentissage:**
- ← Précédent: [Planification de capacité](capacity-planning.md) - Dimensionnement des ressources et stratégies de mise à l'échelle
- 🎯 **Vous êtes ici**: Modèles de coordination multi-agents (Orchestration, communication, gestion d'état)
- → Suivant: [Sélection de SKU](sku-selection.md) - Choisir les bons services Azure
- 🏠 [Accueil du cours](../../README.md)

---

## Ce que vous apprendrez

En complétant cette leçon, vous allez :
- Comprendre les modèles d'**architecture multi-agents** et quand les utiliser
- Implémenter des **modèles d'orchestration** (centralisé, décentralisé, hiérarchique)
- Concevoir des stratégies de **communication entre agents** (synchrone, asynchrone, pilotée par événements)
- Gérer l'**état partagé** entre agents distribués
- Déployer des **systèmes multi-agents** sur Azure avec AZD
- Appliquer des **modèles de coordination** à des scénarios IA réels
- Surveiller et déboguer des systèmes d'agents distribués

## Pourquoi la coordination multi-agents est importante

### L'évolution : de l'agent unique au système multi-agents

**Agent unique (Simple) :**
```
User → Agent → Response
```
- ✅ Facile à comprendre et à implémenter
- ✅ Rapide pour les tâches simples
- ❌ Limité par les capacités d'un seul modèle
- ❌ Impossible de paralléliser les tâches complexes
- ❌ Pas de spécialisation

**Système multi-agents (Avancé) :**
```
           ┌─────────────┐
           │ Orchestrator│
           └──────┬──────┘
        ┌─────────┼─────────┐
        │         │         │
    ┌───▼──┐  ┌──▼───┐  ┌──▼────┐
    │Agent1│  │Agent2│  │Agent3 │
    │(Plan)│  │(Code)│  │(Review)│
    └──────┘  └──────┘  └───────┘
```
- ✅ Agents spécialisés pour des tâches spécifiques
- ✅ Exécution parallèle pour accélérer
- ✅ Modulaire et maintenable
- ✅ Meilleur pour les flux de travail complexes
- ⚠️ Nécessite une logique de coordination

**Analogie** : L'agent unique ressemble à une personne effectuant toutes les tâches. Le système multi-agents ressemble à une équipe où chaque membre possède des compétences spécialisées (chercheur, développeur, relecteur, rédacteur) travaillant ensemble.

---

## Principaux modèles de coordination

### Modèle 1 : Coordination séquentielle (Chaîne de responsabilité)

**Quand l'utiliser** : Les tâches doivent s'exécuter dans un ordre spécifique, chaque agent se base sur la sortie précédente.

```mermaid
sequenceDiagram
    participant User as Utilisateur
    participant Orchestrator as Orchestrateur
    participant Agent1 as Agent de recherche
    participant Agent2 as Agent rédacteur
    participant Agent3 as Agent éditeur
    
    User->>Orchestrator: "Rédiger un article sur l'IA"
    Orchestrator->>Agent1: Rechercher le sujet
    Agent1-->>Orchestrator: Résultats de la recherche
    Orchestrator->>Agent2: Rédiger un brouillon (en utilisant la recherche)
    Agent2-->>Orchestrator: Brouillon de l'article
    Orchestrator->>Agent3: Éditer et améliorer
    Agent3-->>Orchestrator: Article final
    Orchestrator-->>User: Article finalisé
    
    Note over User,Agent3: Séquentiel : chaque étape attend la précédente
```
**Avantages :**
- ✅ Flux de données clair
- ✅ Facile à déboguer
- ✅ Ordre d'exécution prévisible

**Limitations :**
- ❌ Plus lent (pas de parallélisme)
- ❌ Une défaillance bloque toute la chaîne
- ❌ Ne peut pas gérer les tâches interdépendantes

**Exemples d'utilisation :**
- Pipeline de création de contenu (recherche → rédaction → édition → publication)
- Génération de code (plan → implémentation → tests → déploiement)
- Génération de rapports (collecte de données → analyse → visualisation → résumé)

---

### Modèle 2 : Coordination parallèle (Fan-Out/Fan-In)

**Quand l'utiliser** : Les tâches indépendantes peuvent s'exécuter simultanément, les résultats sont combinés à la fin.

```mermaid
graph TB
    User[Requête utilisateur]
    Orchestrator[Orchestrateur]
    Agent1[Agent d'analyse]
    Agent2[Agent de recherche]
    Agent3[Agent de données]
    Aggregator[Agrégateur de résultats]
    Response[Réponse combinée]
    
    User --> Orchestrator
    Orchestrator --> Agent1
    Orchestrator --> Agent2
    Orchestrator --> Agent3
    Agent1 --> Aggregator
    Agent2 --> Aggregator
    Agent3 --> Aggregator
    Aggregator --> Response
    
    style Orchestrator fill:#2196F3,stroke:#1976D2,stroke-width:3px,color:#fff
    style Aggregator fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**Avantages :**
- ✅ Rapide (exécution parallèle)
- ✅ Tolérant aux pannes (résultats partiels acceptables)
- ✅ Scalabilité horizontale

**Limitations :**
- ⚠️ Les résultats peuvent arriver dans le désordre
- ⚠️ Nécessite une logique d'agrégation
- ⚠️ Gestion d'état complexe

**Exemples d'utilisation :**
- Collecte de données multi-sources (APIs + bases de données + web scraping)
- Analyse concurrente (plusieurs modèles génèrent des solutions, la meilleure est sélectionnée)
- Services de traduction (traduire vers plusieurs langues simultanément)

---

### Modèle 3 : Coordination hiérarchique (Gestionnaire-Travailleur)

**Quand l'utiliser** : Flux de travail complexes avec sous-tâches, délégation nécessaire.

```mermaid
graph TB
    Master[Orchestrateur principal]
    Manager1[Responsable de recherche]
    Manager2[Responsable du contenu]
    W1[Extracteur Web]
    W2[Analyseur d'articles]
    W3[Rédacteur]
    W4[Éditeur]
    
    Master --> Manager1
    Master --> Manager2
    Manager1 --> W1
    Manager1 --> W2
    Manager2 --> W3
    Manager2 --> W4
    
    style Master fill:#FF9800,stroke:#F57C00,stroke-width:3px,color:#fff
    style Manager1 fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style Manager2 fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
```
**Avantages :**
- ✅ Gère des flux de travail complexes
- ✅ Modulaire et maintenable
- ✅ Frontières de responsabilité claires

**Limitations :**
- ⚠️ Architecture plus complexe
- ⚠️ Latence plus élevée (plusieurs couches de coordination)
- ⚠️ Nécessite une orchestration sophistiquée

**Exemples d'utilisation :**
- Traitement de documents d'entreprise (classer → acheminer → traiter → archiver)
- Pipelines de données multi-étapes (ingestion → nettoyage → transformation → analyse → rapport)
- Workflows d'automatisation complexes (planification → allocation de ressources → exécution → surveillance)

---

### Modèle 4 : Coordination pilotée par événements (Publish-Subscribe)

**Quand l'utiliser** : Les agents doivent réagir aux événements, couplage lâche souhaité.

```mermaid
sequenceDiagram
    participant Agent1 as Collecteur de données
    participant EventBus as Bus de service Azure
    participant Agent2 as Analyseur
    participant Agent3 as Notificateur
    participant Agent4 as Archiviste
    
    Agent1->>EventBus: Publier l'événement "Données reçues"
    EventBus->>Agent2: S'abonner : Analyser les données
    EventBus->>Agent3: S'abonner : Envoyer une notification
    EventBus->>Agent4: S'abonner : Archiver les données
    
    Note over Agent1,Agent4: Tous les abonnés traitent indépendamment
    
    Agent2->>EventBus: Publier l'événement "Analyse terminée"
    EventBus->>Agent3: S'abonner : Envoyer le rapport d'analyse
```
**Avantages :**
- ✅ Couplage lâche entre les agents
- ✅ Facile d'ajouter de nouveaux agents (il suffit de s'abonner)
- ✅ Traitement asynchrone
- ✅ Résilient (persistance des messages)

**Limitations :**
- ⚠️ Cohérence éventuelle
- ⚠️ Débogage complexe
- ⚠️ Difficultés d'ordonnancement des messages

**Exemples d'utilisation :**
- Systèmes de surveillance en temps réel (alertes, tableaux de bord, journaux)
- Notifications multicanales (email, SMS, push, Slack)
- Pipelines de traitement de données (plusieurs consommateurs des mêmes données)

---

### Modèle 5 : Coordination basée sur le consensus (Voting/Quorum)

**Quand l'utiliser** : Besoin d'accord de plusieurs agents avant de continuer.

```mermaid
graph TB
    Input[Tâche d'entrée]
    Agent1[Agent 1: GPT-4]
    Agent2[Agent 2: Claude]
    Agent3[Agent 3: Gemini]
    Voter[Voteur de consensus]
    Output[Sortie convenue]
    
    Input --> Agent1
    Input --> Agent2
    Input --> Agent3
    Agent1 --> Voter
    Agent2 --> Voter
    Agent3 --> Voter
    Voter --> Output
    
    style Voter fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
```
**Avantages :**
- ✅ Meilleure précision (plusieurs avis)
- ✅ Tolérant aux pannes (échecs minoritaires acceptables)
- ✅ Assurance qualité intégrée

**Limitations :**
- ❌ Coûteux (appels multiples aux modèles)
- ❌ Plus lent (attente de tous les agents)
- ⚠️ Résolution des conflits nécessaire

**Exemples d'utilisation :**
- Modération de contenu (plusieurs modèles examinent le contenu)
- Revue de code (plusieurs linters/analyseurs)
- Diagnostic médical (plusieurs modèles IA, validation par des experts)

---

## Vue d'ensemble de l'architecture

### Système multi-agents complet sur Azure

```mermaid
graph TB
    User[Utilisateur/Client API]
    APIM[Gestion des API Azure]
    Orchestrator[Service d'orchestration<br/>Application conteneur]
    ServiceBus[Bus de services Azure<br/>Hub d'événements]
    
    Agent1[Agent de recherche<br/>Application conteneur]
    Agent2[Agent rédacteur<br/>Application conteneur]
    Agent3[Agent analyste<br/>Application conteneur]
    Agent4[Agent réviseur<br/>Application conteneur]
    
    CosmosDB[(Cosmos DB<br/>État partagé)]
    Storage[Stockage Azure<br/>Artefacts]
    AppInsights[Application Insights<br/>Surveillance]
    
    User --> APIM
    APIM --> Orchestrator
    
    Orchestrator --> ServiceBus
    ServiceBus --> Agent1
    ServiceBus --> Agent2
    ServiceBus --> Agent3
    ServiceBus --> Agent4
    
    Agent1 --> CosmosDB
    Agent2 --> CosmosDB
    Agent3 --> CosmosDB
    Agent4 --> CosmosDB
    
    Agent1 --> Storage
    Agent2 --> Storage
    Agent3 --> Storage
    Agent4 --> Storage
    
    Orchestrator -.-> AppInsights
    Agent1 -.-> AppInsights
    Agent2 -.-> AppInsights
    Agent3 -.-> AppInsights
    Agent4 -.-> AppInsights
    
    style Orchestrator fill:#FF9800,stroke:#F57C00,stroke-width:3px,color:#fff
    style ServiceBus fill:#9C27B0,stroke:#7B1FA2,stroke-width:3px,color:#fff
    style CosmosDB fill:#4CAF50,stroke:#388E3C,stroke-width:3px,color:#fff
```
**Composants clés :**

| Composant | Objectif | Service Azure |
|-----------|---------|---------------|
| **Passerelle API** | Point d'entrée, limitation du débit, authentification | API Management |
| **Orchestrateur** | Coordonne les flux de travail des agents | Container Apps |
| **File de messages** | Communication asynchrone | Service Bus / Event Hubs |
| **Agents** | Travailleurs IA spécialisés | Container Apps / Functions |
| **Magasin d'état** | État partagé, suivi des tâches | Cosmos DB |
| **Stockage d'artefacts** | Documents, résultats, journaux | Blob Storage |
| **Surveillance** | Traces distribuées, journaux | Application Insights |

---

## Prérequis

### Outils requis

```bash
# Vérifier Azure Developer CLI
azd version
# ✅ Attendu : azd version 1.0.0 ou supérieure

# Vérifier Azure CLI
az --version
# ✅ Attendu : azure-cli 2.50.0 ou supérieure

# Vérifier Docker (pour les tests locaux)
docker --version
# ✅ Attendu : Docker version 20.10 ou supérieure
```

### Exigences Azure

- Abonnement Azure actif
- Autorisations pour créer :
  - Container Apps
  - Service Bus namespaces
  - Cosmos DB accounts
  - Storage accounts
  - Application Insights

### Prérequis de connaissances

Vous devriez avoir complété :
- [Gestion de la configuration](../chapter-03-configuration/configuration.md)
- [Authentification & Sécurité](../chapter-03-configuration/authsecurity.md)
- [Exemple de microservices](../../../../examples/microservices)

---

## Guide d'implémentation

### Structure du projet

```
multi-agent-system/
├── azure.yaml                    # AZD configuration
├── infra/
│   ├── main.bicep               # Main infrastructure
│   ├── core/
│   │   ├── servicebus.bicep     # Message queue
│   │   ├── cosmos.bicep         # State store
│   │   ├── storage.bicep        # Artifact storage
│   │   └── monitoring.bicep     # Application Insights
│   └── app/
│       ├── orchestrator.bicep   # Orchestrator service
│       └── agent.bicep          # Agent template
└── src/
    ├── orchestrator/            # Orchestration logic
    │   ├── app.py
    │   ├── workflows.py
    │   └── Dockerfile
    ├── agents/
    │   ├── research/            # Research agent
    │   ├── writer/              # Writer agent
    │   ├── analyst/             # Analyst agent
    │   └── reviewer/            # Reviewer agent
    └── shared/
        ├── state_manager.py     # Shared state logic
        └── message_handler.py   # Message handling
```

---

## Leçon 1 : Modèle de coordination séquentielle

### Implémentation : Pipeline de création de contenu

Construisons un pipeline séquentiel : Recherche → Rédiger → Éditer → Publier

### 1. Configuration AZD

**Fichier : `azure.yaml`**

```yaml
name: content-pipeline
metadata:
  template: multi-agent-sequential@1.0.0

services:
  orchestrator:
    project: ./src/orchestrator
    language: python
    host: containerapp
  
  research-agent:
    project: ./src/agents/research
    language: python
    host: containerapp
  
  writer-agent:
    project: ./src/agents/writer
    language: python
    host: containerapp
  
  editor-agent:
    project: ./src/agents/editor
    language: python
    host: containerapp
```

### 2. Infrastructure : Service Bus pour la coordination

**Fichier : `infra/core/servicebus.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource serviceBusNamespace 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: name
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
  properties: {
    minimumTlsVersion: '1.2'
  }
}

// Queue for orchestrator → research agent
resource researchQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'research-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
    deadLetteringOnMessageExpiration: true
  }
}

// Queue for research agent → writer agent
resource writerQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'writer-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
  }
}

// Queue for writer agent → editor agent
resource editorQueue 'Microsoft.ServiceBus/namespaces/queues@2022-10-01-preview' = {
  parent: serviceBusNamespace
  name: 'editor-tasks'
  properties: {
    maxDeliveryCount: 3
    lockDuration: 'PT5M'
  }
}

output namespace string = serviceBusNamespace.name
output connectionString string = listKeys('${serviceBusNamespace.id}/AuthorizationRules/RootManageSharedAccessKey', serviceBusNamespace.apiVersion).primaryConnectionString
```

### 3. Gestionnaire d'état partagé

**Fichier : `src/shared/state_manager.py`**

```python
from azure.cosmos import CosmosClient, PartitionKey
from datetime import datetime
import os

class StateManager:
    """Manages shared state across agents using Cosmos DB"""
    
    def __init__(self):
        endpoint = os.environ['COSMOS_ENDPOINT']
        key = os.environ['COSMOS_KEY']
        
        self.client = CosmosClient(endpoint, key)
        self.database = self.client.get_database_client('agent-state')
        self.container = self.database.get_container_client('tasks')
    
    def create_task(self, task_id: str, task_type: str, input_data: dict):
        """Create a new task"""
        task = {
            'id': task_id,
            'type': task_type,
            'status': 'pending',
            'input': input_data,
            'created_at': datetime.utcnow().isoformat(),
            'steps': []
        }
        self.container.create_item(task)
        return task
    
    def update_task_step(self, task_id: str, step_name: str, result: dict):
        """Update task with completed step"""
        task = self.container.read_item(task_id, partition_key=task_id)
        
        task['steps'].append({
            'name': step_name,
            'completed_at': datetime.utcnow().isoformat(),
            'result': result
        })
        
        self.container.replace_item(task_id, task)
        return task
    
    def complete_task(self, task_id: str, final_result: dict):
        """Mark task as complete"""
        task = self.container.read_item(task_id, partition_key=task_id)
        task['status'] = 'completed'
        task['result'] = final_result
        task['completed_at'] = datetime.utcnow().isoformat()
        self.container.replace_item(task_id, task)
        return task
    
    def get_task(self, task_id: str):
        """Retrieve task state"""
        return self.container.read_item(task_id, partition_key=task_id)
```

### 4. Service orchestrateur

**Fichier : `src/orchestrator/app.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

# Connexion au Service Bus
servicebus_connection_str = os.environ['SERVICEBUS_CONNECTION_STRING']
servicebus_client = ServiceBusClient.from_connection_string(servicebus_connection_str)

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy', 'service': 'orchestrator'})

@app.route('/create-content', methods=['POST'])
def create_content():
    """
    Sequential workflow: Research → Write → Edit → Publish
    """
    data = request.json
    topic = data.get('topic')
    
    if not topic:
        return jsonify({'error': 'Topic required'}), 400
    
    # Créer une tâche dans le magasin d'état
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='content_creation',
        input_data={'topic': topic}
    )
    
    # Envoyer un message à l'agent de recherche (première étape)
    sender = servicebus_client.get_queue_sender('research-tasks')
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'next_queue': 'writer-tasks'  # Où envoyer les résultats
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'sequential',
        'steps': ['research', 'write', 'edit', 'publish'],
        'message': 'Content creation pipeline initiated'
    }), 202

@app.route('/task/<task_id>', methods=['GET'])
def get_task_status(task_id):
    """Check task status"""
    try:
        task = state_manager.get_task(task_id)
        return jsonify(task)
    except Exception as e:
        return jsonify({'error': str(e)}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### 5. Agent de recherche

**Fichier : `src/agents/research/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
import time
from shared.state_manager import StateManager

# Initialiser les clients
state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_research_task(message_data):
    """Process research request and pass to writer"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    next_queue = message_data['next_queue']
    
    print(f"🔬 Researching: {topic}")
    
    # Appeler Azure OpenAI pour la recherche
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a research assistant. Provide comprehensive research on the given topic."},
            {"role": "user", "content": f"Research this topic thoroughly: {topic}"}
        ],
        max_tokens=1500
    )
    
    research_results = response.choices[0].message.content
    
    # Mettre à jour l'état
    state_manager.update_task_step(
        task_id=task_id,
        step_name='research',
        result={'research': research_results}
    )
    
    # Envoyer à l'agent suivant (rédacteur)
    sender = servicebus_client.get_queue_sender(next_queue)
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'research': research_results,
            'next_queue': 'editor-tasks'
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    print(f"✅ Research complete for task {task_id}")

def main():
    """Listen to research queue"""
    receiver = servicebus_client.get_queue_receiver('research-tasks')
    
    print("🔬 Research Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_research_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error processing message: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 6. Agent rédacteur

**Fichier : `src/agents/writer/app.py`**

```python
from azure.servicebus import ServiceBusClient, ServiceBusMessage
from openai import AzureOpenAI
import json
import os
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_writing_task(message_data):
    """Write article based on research"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    research = message_data['research']
    next_queue = message_data['next_queue']
    
    print(f"✍️ Writing article: {topic}")
    
    # Appeler Azure OpenAI pour rédiger l'article
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are a professional writer. Write engaging, well-structured articles."},
            {"role": "user", "content": f"Based on this research:\n\n{research}\n\nWrite a comprehensive article about: {topic}"}
        ],
        max_tokens=2000
    )
    
    article_draft = response.choices[0].message.content
    
    # Mettre à jour l'état
    state_manager.update_task_step(
        task_id=task_id,
        step_name='writing',
        result={'draft': article_draft}
    )
    
    # Envoyer au rédacteur
    sender = servicebus_client.get_queue_sender(next_queue)
    message = ServiceBusMessage(
        body=json.dumps({
            'task_id': task_id,
            'topic': topic,
            'draft': article_draft
        }),
        content_type='application/json'
    )
    
    with sender:
        sender.send_messages(message)
    
    print(f"✅ Article draft complete for task {task_id}")

def main():
    """Listen to writer queue"""
    receiver = servicebus_client.get_queue_receiver('writer-tasks')
    
    print("✍️ Writer Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_writing_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 7. Agent éditeur

**Fichier : `src/agents/editor/app.py`**

```python
from azure.servicebus import ServiceBusClient
from openai import AzureOpenAI
import json
import os
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

openai_client = AzureOpenAI(
    api_key=os.environ['AZURE_OPENAI_API_KEY'],
    api_version="2024-02-01",
    azure_endpoint=os.environ['AZURE_OPENAI_ENDPOINT']
)

def process_editing_task(message_data):
    """Edit and finalize article"""
    task_id = message_data['task_id']
    topic = message_data['topic']
    draft = message_data['draft']
    
    print(f"📝 Editing article: {topic}")
    
    # Appeler Azure OpenAI pour modifier
    response = openai_client.chat.completions.create(
        model="gpt-4",
        messages=[
            {"role": "system", "content": "You are an expert editor. Improve grammar, clarity, and structure."},
            {"role": "user", "content": f"Edit and improve this article:\n\n{draft}"}
        ],
        max_tokens=2000
    )
    
    final_article = response.choices[0].message.content
    
    # Marquer la tâche comme terminée
    state_manager.complete_task(
        task_id=task_id,
        final_result={
            'topic': topic,
            'final_article': final_article,
            'word_count': len(final_article.split())
        }
    )
    
    print(f"✅ Article finalized for task {task_id}")

def main():
    """Listen to editor queue"""
    receiver = servicebus_client.get_queue_receiver('editor-tasks')
    
    print("📝 Editor Agent started, listening for tasks...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_editing_task(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

### 8. Déployer et tester

```bash
# Initialiser et déployer
azd init
azd up

# Obtenir l'URL de l'orchestrateur
ORCHESTRATOR_URL=$(azd env get-values | grep ORCHESTRATOR_URL | cut -d '=' -f2 | tr -d '"')

# Créer du contenu
curl -X POST $ORCHESTRATOR_URL/create-content \
  -H "Content-Type: application/json" \
  -d '{"topic": "The Future of AI in Healthcare"}'
```

**✅ Sortie attendue :**
```json
{
  "task_id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "status": "started",
  "workflow": "sequential",
  "steps": ["research", "write", "edit", "publish"],
  "message": "Content creation pipeline initiated"
}
```

**Vérifier la progression des tâches :**
```bash
TASK_ID="a1b2c3d4-e5f6-7890-abcd-ef1234567890"
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Sortie attendue (terminé) :**
```json
{
  "id": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "type": "content_creation",
  "status": "completed",
  "steps": [
    {
      "name": "research",
      "completed_at": "2025-11-19T10:30:00Z",
      "result": {"research": "..."}
    },
    {
      "name": "writing",
      "completed_at": "2025-11-19T10:32:00Z",
      "result": {"draft": "..."}
    }
  ],
  "result": {
    "topic": "The Future of AI in Healthcare",
    "final_article": "...",
    "word_count": 1500
  }
}
```

---

## Leçon 2 : Modèle de coordination parallèle

### Implémentation : Agrégateur de recherche multi-sources

Construisons un système parallèle qui rassemble des informations de plusieurs sources simultanément.

### Orchestrateur parallèle

**Fichier : `src/orchestrator/parallel_workflow.py`**

```python
from flask import Flask, request, jsonify
from azure.servicebus import ServiceBusClient, ServiceBusMessage
import json
import uuid
import os
from shared.state_manager import StateManager

app = Flask(__name__)
state_manager = StateManager()

servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

@app.route('/research-parallel', methods=['POST'])
def research_parallel():
    """
    Parallel workflow: Multiple agents work simultaneously
    """
    data = request.json
    query = data.get('query')
    
    task_id = str(uuid.uuid4())
    task = state_manager.create_task(
        task_id=task_id,
        task_type='parallel_research',
        input_data={
            'query': query,
            'agents': ['web', 'academic', 'news', 'social']
        }
    )
    
    # Diffusion : Envoyer simultanément à tous les agents
    agents = [
        ('web-research-queue', 'web'),
        ('academic-research-queue', 'academic'),
        ('news-research-queue', 'news'),
        ('social-research-queue', 'social')
    ]
    
    for queue_name, agent_type in agents:
        sender = servicebus_client.get_queue_sender(queue_name)
        message = ServiceBusMessage(
            body=json.dumps({
                'task_id': task_id,
                'query': query,
                'agent_type': agent_type,
                'result_queue': 'aggregation-queue'
            }),
            content_type='application/json'
        )
        
        with sender:
            sender.send_messages(message)
    
    return jsonify({
        'task_id': task_id,
        'status': 'started',
        'workflow': 'parallel',
        'agents_dispatched': 4,
        'message': 'Parallel research initiated'
    }), 202

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
```

### Logique d'agrégation

**Fichier : `src/agents/aggregator/app.py`**

```python
from azure.servicebus import ServiceBusClient
import json
import os
from collections import defaultdict
from shared.state_manager import StateManager

state_manager = StateManager()
servicebus_client = ServiceBusClient.from_connection_string(
    os.environ['SERVICEBUS_CONNECTION_STRING']
)

# Suivre les résultats par tâche
task_results = defaultdict(list)
expected_agents = 4  # web, académique, actualités, réseaux sociaux

def process_result(message_data):
    """Aggregate results from parallel agents"""
    task_id = message_data['task_id']
    agent_type = message_data['agent_type']
    result = message_data['result']
    
    # Stocker le résultat
    task_results[task_id].append({
        'agent': agent_type,
        'data': result
    })
    
    print(f"📊 Received result from {agent_type} agent ({len(task_results[task_id])}/{expected_agents})")
    
    # Vérifier si tous les agents ont terminé (fan-in)
    if len(task_results[task_id]) == expected_agents:
        print(f"✅ All agents completed for task {task_id}. Aggregating...")
        
        # Combiner les résultats
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'summary': generate_summary(task_results[task_id])
        }
        
        # Marquer comme terminé
        state_manager.complete_task(task_id, aggregated)
        
        # Nettoyer
        del task_results[task_id]
        
        print(f"✅ Aggregation complete for task {task_id}")

def generate_summary(results):
    """Generate summary from all sources"""
    summaries = [r['data'].get('summary', '') for r in results]
    return '\n\n'.join(summaries)

def main():
    """Listen to aggregation queue"""
    receiver = servicebus_client.get_queue_receiver('aggregation-queue')
    
    print("📊 Aggregator started, listening for results...")
    
    with receiver:
        while True:
            messages = receiver.receive_messages(max_wait_time=5)
            for message in messages:
                try:
                    message_data = json.loads(str(message))
                    process_result(message_data)
                    receiver.complete_message(message)
                except Exception as e:
                    print(f"❌ Error: {e}")
                    receiver.abandon_message(message)

if __name__ == '__main__':
    main()
```

**Avantages du modèle parallèle :**
- ⚡ **4x plus rapide** (les agents s'exécutent simultanément)
- 🔄 **Tolérant aux pannes** (résultats partiels acceptables)
- 📈 **Extensible** (ajouter plus d'agents facilement)

---

## Exercices pratiques

### Exercice 1 : Ajouter la gestion des délais ⭐⭐ (Moyen)

**Objectif** : Implémenter la logique de timeout afin que l'agrégateur n'attende pas indéfiniment les agents lents.

**Étapes**:

1. **Ajouter le suivi des délais à l'agrégateur :**

```python
from datetime import datetime, timedelta

task_timeouts = {}  # task_id -> heure_d'expiration

def process_result(message_data):
    task_id = message_data['task_id']
    
    # Définir un délai d'attente pour le premier résultat
    if task_id not in task_timeouts:
        task_timeouts[task_id] = datetime.utcnow() + timedelta(seconds=30)
    
    task_results[task_id].append({
        'agent': message_data['agent_type'],
        'data': message_data['result']
    })
    
    # Vérifier si terminé ou si le délai est expiré
    if len(task_results[task_id]) == expected_agents or \
       datetime.utcnow() > task_timeouts[task_id]:
        
        print(f"📊 Aggregating with {len(task_results[task_id])}/{expected_agents} results")
        
        aggregated = {
            'query': message_data['query'],
            'sources': task_results[task_id],
            'completed_agents': len(task_results[task_id]),
            'timed_out': len(task_results[task_id]) < expected_agents
        }
        
        state_manager.complete_task(task_id, aggregated)
        
        # Nettoyage
        del task_results[task_id]
        del task_timeouts[task_id]
```

2. **Tester avec des délais artificiels :**

```python
# Dans un agent, ajoutez un délai pour simuler un traitement lent
import time
time.sleep(35)  # Dépasse le délai d'attente de 30 secondes
```

3. **Déployer et vérifier :**

```bash
azd deploy aggregator

# Soumettre la tâche
curl -X POST $ORCHESTRATOR_URL/research-parallel \
  -H "Content-Type: application/json" \
  -d '{"query": "AI safety research"}'

# Vérifier les résultats après 30 secondes
curl $ORCHESTRATOR_URL/task/$TASK_ID
```

**✅ Critères de réussite :**
- ✅ La tâche se termine après 30 secondes même si des agents sont incomplets
- ✅ La réponse indique des résultats partiels (`"timed_out": true`)
- ✅ Les résultats disponibles sont retournés (3 sur 4 agents)

**Durée**: 20-25 minutes

---

### Exercice 2 : Implémenter la logique de réessai ⭐⭐⭐ (Avancé)

**Objectif** : Réessayer automatiquement les tâches d'agents en échec avant d'abandonner.

**Étapes**:

1. **Ajouter le suivi des réessais à l'orchestrateur :**

```python
from dataclasses import dataclass
from typing import Dict

@dataclass
class RetryConfig:
    max_retries: int = 3
    backoff_seconds: int = 5

retry_counts: Dict[str, int] = {}  # identifiant_message -> nombre_de_retentatives

def send_with_retry(queue_name: str, message_data: dict, retry_config: RetryConfig):
    """Send message with retry metadata"""
    message_id = message_data.get('message_id', str(uuid.uuid4()))
    message_data['message_id'] = message_id
    message_data['retry_count'] = retry_counts.get(message_id, 0)
    message_data['max_retries'] = retry_config.max_retries
    
    sender = servicebus_client.get_queue_sender(queue_name)
    message = ServiceBusMessage(
        body=json.dumps(message_data),
        content_type='application/json',
        message_id=message_id
    )
    
    with sender:
        sender.send_messages(message)
```

2. **Ajouter un gestionnaire de réessai aux agents :**

```python
def process_with_retry(message, receiver, process_func):
    """Process message with automatic retry on failure"""
    try:
        message_data = json.loads(str(message))
        
        # Traiter le message
        process_func(message_data)
        
        # Succès - terminé
        receiver.complete_message(message)
        
    except Exception as e:
        message_id = message.message_id
        retry_count = message_data.get('retry_count', 0)
        max_retries = message_data.get('max_retries', 3)
        
        if retry_count < max_retries:
            # Réessayer: abandonner et remettre en file d'attente avec le compteur incrémenté
            print(f"⚠️ Retry {retry_count + 1}/{max_retries} for message {message_id}")
            
            message_data['retry_count'] = retry_count + 1
            
            # Renvoyer dans la même file d'attente avec un délai
            time.sleep(5 * (retry_count + 1))  # Attente exponentielle
            send_with_retry(queue_name, message_data, RetryConfig())
            
            receiver.complete_message(message)  # Supprimer l'original
        else:
            # Nombre maximal de tentatives dépassé - déplacer vers la file d'attente des lettres mortes
            print(f"❌ Max retries exceeded for message {message_id}")
            receiver.dead_letter_message(
                message,
                reason="MaxRetriesExceeded",
                error_description=str(e)
            )
```

3. **Surveiller la file de lettres mortes (dead letter queue) :**

```python
def monitor_dead_letters():
    """Check dead letter queue for failed messages"""
    receiver = servicebus_client.get_queue_receiver(
        'research-queue',
        sub_queue='deadletter'
    )
    
    with receiver:
        messages = receiver.receive_messages(max_wait_time=5)
        for message in messages:
            print(f"☠️ Dead letter: {message.message_id}")
            print(f"Reason: {message.dead_letter_reason}")
            print(f"Description: {message.dead_letter_error_description}")
```

**✅ Critères de réussite :**
- ✅ Les tâches échouées sont réessayées automatiquement (jusqu'à 3 fois)
- ✅ Backoff exponentiel entre les réessais (5s, 10s, 15s)
- ✅ Après le nombre max de réessais, les messages vont dans la dead letter queue
- ✅ La dead letter queue peut être surveillée et rejouée

**Durée**: 30-40 minutes

---

### Exercice 3 : Implémenter un coupe-circuit ⭐⭐⭐ (Avancé)

**Objectif** : Empêcher les défaillances en cascade en arrêtant les requêtes vers les agents en échec.

**Étapes**:

1. **Créer une classe de coupe-circuit :**

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Fonctionnement normal
    OPEN = "open"          # Défaillant, rejeter les requêtes
    HALF_OPEN = "half_open"  # Test pour vérifier s'il est rétabli

class CircuitBreaker:
    def __init__(self, failure_threshold=5, timeout_seconds=60):
        self.failure_threshold = failure_threshold
        self.timeout_seconds = timeout_seconds
        self.failure_count = 0
        self.last_failure_time = None
        self.state = CircuitState.CLOSED
    
    def call(self, func):
        """Execute function with circuit breaker protection"""
        if self.state == CircuitState.OPEN:
            # Vérifier si le délai d'attente est écoulé
            if datetime.utcnow() - self.last_failure_time > timedelta(seconds=self.timeout_seconds):
                self.state = CircuitState.HALF_OPEN
                print("🔄 Circuit breaker: HALF_OPEN (testing)")
            else:
                raise Exception(f"Circuit breaker OPEN for agent. Try again in {self.timeout_seconds}s")
        
        try:
            result = func()
            
            # Succès
            if self.state == CircuitState.HALF_OPEN:
                self.state = CircuitState.CLOSED
                self.failure_count = 0
                print("✅ Circuit breaker: CLOSED (recovered)")
            
            return result
            
        except Exception as e:
            self.failure_count += 1
            self.last_failure_time = datetime.utcnow()
            
            if self.failure_count >= self.failure_threshold:
                self.state = CircuitState.OPEN
                print(f"🔴 Circuit breaker: OPEN (too many failures)")
            
            raise e
```

2. **Appliquer aux appels d'agents :**

```python
# Dans l'orchestrateur
agent_circuits = {
    'web': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'academic': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'news': CircuitBreaker(failure_threshold=5, timeout_seconds=60),
    'social': CircuitBreaker(failure_threshold=5, timeout_seconds=60)
}

def send_to_agent(agent_type, message_data):
    """Send with circuit breaker protection"""
    circuit = agent_circuits[agent_type]
    
    try:
        circuit.call(lambda: send_message(agent_type, message_data))
    except Exception as e:
        print(f"⚠️ Skipping {agent_type} agent: {e}")
        # Continuer avec d'autres agents
```

3. **Tester le coupe-circuit :**

```bash
# Simuler des échecs répétés (arrêter un agent)
az containerapp stop --name web-research-agent --resource-group rg-agents

# Envoyer plusieurs requêtes
for i in {1..10}; do
  curl -X POST $ORCHESTRATOR_URL/research-parallel \
    -H "Content-Type: application/json" \
    -d '{"query": "test query '$i'"}'
  sleep 2
done

# Vérifier les journaux - on devrait voir le circuit ouvert après 5 échecs
# Utilisez Azure CLI pour les journaux de Container App:
az containerapp logs show --name orchestrator --resource-group $RG_NAME --tail 50
```

**✅ Critères de réussite :**
- ✅ Après 5 échecs, le circuit s'ouvre (rejette les requêtes)
- ✅ Après 60 secondes, le circuit passe en semi-ouvert (teste la récupération)
- ✅ Les autres agents continuent de fonctionner normalement
- ✅ Le circuit se referme automatiquement lorsque l'agent se rétablit

**Durée**: 40-50 minutes

---

## Surveillance et débogage

### Traçage distribué avec Application Insights

**Fichier : `src/shared/tracing.py`**

```python
from opencensus.ext.azure.log_exporter import AzureLogHandler
from opencensus.ext.azure.trace_exporter import AzureExporter
from opencensus.trace import config_integration
from opencensus.trace.tracer import Tracer
from opencensus.trace.samplers import AlwaysOnSampler
import logging
import os

# Configurer le traçage
config_integration.trace_integrations(['requests', 'logging'])

connection_string = os.environ.get('APPLICATIONINSIGHTS_CONNECTION_STRING')

# Créer un traceur
tracer = Tracer(
    exporter=AzureExporter(connection_string=connection_string),
    sampler=AlwaysOnSampler()
)

# Configurer la journalisation
logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(connection_string=connection_string))
logger.setLevel(logging.INFO)

def trace_agent_call(agent_name, task_id, operation):
    """Trace agent operations"""
    with tracer.span(name=f'{agent_name}.{operation}') as span:
        span.add_attribute('agent', agent_name)
        span.add_attribute('task_id', task_id)
        span.add_attribute('operation', operation)
        
        try:
            result = operation()
            span.add_attribute('status', 'success')
            return result
        except Exception as e:
            span.add_attribute('status', 'error')
            span.add_attribute('error', str(e))
            raise
```

### Requêtes Application Insights

**Suivre les workflows multi-agents :**

```kusto
// Trace complete workflow for a task
traces
| where customDimensions.task_id == "a1b2c3d4-..."
| project timestamp, message, customDimensions.agent, customDimensions.operation
| order by timestamp asc
```

**Comparaison des performances des agents :**

```kusto
// Compare agent execution times
dependencies
| where name contains "agent"
| summarize 
    avg_duration = avg(duration),
    p95_duration = percentile(duration, 95),
    count = count()
  by agent = tostring(customDimensions.agent)
| order by avg_duration desc
```

**Analyse des échecs :**

```kusto
// Find which agents fail most
exceptions
| where customDimensions.agent != ""
| summarize 
    failure_count = count(),
    unique_errors = dcount(outerMessage)
  by agent = tostring(customDimensions.agent)
| order by failure_count desc
```

---

## Analyse des coûts

### Coûts du système multi-agents (estimations mensuelles)

| Composant | Configuration | Coût |
|-----------|--------------|------|
| **Orchestrateur** | 1 Container App (1 vCPU, 2GB) | $30-50 |
| **4 Agents** | 4 Container Apps (0.5 vCPU, 1GB chacun) | $60-120 |
| **Service Bus** | Niveau Standard, 10M messages | $10-20 |
| **Cosmos DB** | Serverless, 5GB de stockage, 1M RUs | $25-50 |
| **Blob Storage** | 10GB de stockage, 100K opérations | $5-10 |
| **Application Insights** | 5GB d'ingestion | $10-15 |
| **Azure OpenAI** | GPT-4, 10M tokens | $100-300 |
| **Total** | | **$240-565/mois** |

### Stratégies d'optimisation des coûts

1. **Utiliser le serverless lorsque possible :**
   ```bicep
   // Cosmos DB serverless (no minimum cost)
   properties: {
     databaseAccountOfferType: 'Standard'
     capabilities: [{ name: 'EnableServerless' }]
   }
   ```

2. **Réduire l'échelle des agents à zéro lorsqu'ils sont inactifs :**
   ```bicep
   scale: {
     minReplicas: 0  // Scale to zero when no messages
     maxReplicas: 10
   }
   ```

3. **Utiliser le traitement par lots pour Service Bus :**
   ```python
   # Envoyer des messages par lots (moins cher)
   sender.send_messages([message1, message2, message3])
   ```

4. **Mettre en cache les résultats fréquemment utilisés :**
   ```python
   # Utilisez Azure Cache pour Redis
   if cache.exists(query_hash):
       return cache.get(query_hash)
   ```

---

## Bonnes pratiques

### ✅ À FAIRE :

1. **Utiliser des opérations idempotentes**
   ```python
   # L'agent peut traiter en toute sécurité le même message plusieurs fois
   def process_task(task_id):
       if state_manager.task_exists(task_id):
           print(f"Task {task_id} already processed, skipping")
           return
       # Traitement de la tâche...
   ```

2. **Mettre en place une journalisation complète**
   ```python
   logger.info(f"Agent: {agent_name}, Task: {task_id}, Action: {action}")
   ```

3. **Utiliser des identifiants de corrélation**
   ```python
   # Transmettre task_id tout au long du flux de travail
   message_data = {
       'task_id': task_id,  # ID de corrélation
       'timestamp': datetime.utcnow().isoformat()
   }
   ```

4. **Définir le TTL des messages (time-to-live)**
   ```bicep
   properties: {
     defaultMessageTimeToLive: 'PT1H'  // 1 hour max
   }
   ```

5. **Surveiller les files de lettres mortes**
   ```python
   # Surveillance régulière des messages échoués
   monitor_dead_letters()
   ```

### ❌ À NE PAS FAIRE :

1. **Ne pas créer de dépendances circulaires**
   ```python
   # ❌ MAUVAIS: Agent A → Agent B → Agent A (boucle infinie)
   # ✅ BON: Définir un graphe orienté acyclique (DAG) clair
   ```

2. **Ne pas bloquer les threads des agents**
   ```python
   # ❌ MAUVAIS: Attente synchrone
   while not task_complete:
       time.sleep(1)
   
   # ✅ BON: Utiliser les fonctions de rappel de la file d'attente de messages
   ```

3. **Ne pas ignorer les échecs partiels**
   ```python
   # ❌ MAUVAIS : Faire échouer l'ensemble du flux de travail si un agent échoue
   # ✅ BON : Renvoyer des résultats partiels avec des indicateurs d'erreur
   ```

4. **Ne pas utiliser de réessais infinis**
   ```python
   # ❌ MAUVAIS: réessayer indéfiniment
   # ✅ BON: max_retries = 3, puis file de lettres mortes
   ```

---

## Guide de dépannage

### Problème : Messages bloqués dans la file

**Symptômes :**
- Les messages s'accumulent dans la file
- Les agents ne traitent pas
- Le statut de la tâche est bloqué sur "pending"

**Diagnostic :**
```bash
# Vérifier la profondeur de la file d'attente
az servicebus queue show \
  --namespace-name mybus \
  --name research-tasks \
  --query "countDetails"

# Vérifier les journaux de l'agent à l'aide de l'Azure CLI
az containerapp logs show --name research-agent --resource-group $RG_NAME --tail 50
```

**Solutions :**

1. **Augmenter le nombre de réplicas d'agents :**
   ```bash
   az containerapp update \
     --name research-agent \
     --min-replicas 3 \
     --max-replicas 10
   ```

2. **Vérifier la file de lettres mortes :**
   ```bash
   az servicebus queue show \
     --namespace-name mybus \
     --name research-tasks \
     --query "countDetails.deadLetterMessageCount"
   ```

---

### Problème : Délai d'attente de la tâche / ne se termine jamais

**Symptômes :**
- Le statut de la tâche reste "in_progress"
- Certains agents terminent, d'autres non
- Aucun message d'erreur

**Diagnostic :**
```bash
# Vérifier l'état de la tâche
curl $ORCHESTRATOR_URL/task/$TASK_ID

# Vérifier Application Insights
# Exécuter la requête : traces | where customDimensions.task_id == "..."
```

**Solutions :**

1. **Implémenter un délai d'attente dans l'agrégateur (Exercice 1)**

2. **Vérifier les défaillances des agents à l'aide d'Azure Monitor :**
   ```bash
   # Afficher les journaux via azd monitor
   azd monitor --logs
   
   # Ou utilisez Azure CLI pour consulter les journaux d'une application de conteneur spécifique
   az containerapp logs show --name <agent-name> --resource-group $RG_NAME --follow | grep "ERROR\|FAIL"
   ```

3. **Vérifier que tous les agents sont en cours d'exécution :**
   ```bash
   az containerapp list \
     --resource-group rg-agents \
     --query "[].{name:name, status:properties.runningStatus}"
   ```

---

## En savoir plus

### Documentation officielle
- [Azure Service Bus](https://learn.microsoft.com/azure/service-bus-messaging/service-bus-messaging-overview)
- [Cosmos DB](https://learn.microsoft.com/azure/cosmos-db/introduction)
- [Container Apps DAPR](https://learn.microsoft.com/azure/container-apps/dapr-overview)
- [Modèles de conception multi-agents](https://learn.microsoft.com/azure/architecture/guide/ai/multi-agent-systems)

### Étapes suivantes dans ce cours
- ← Précédent : [Planification de la capacité](capacity-planning.md)
- → Suivant : [Sélection des SKU](sku-selection.md)
- 🏠 [Accueil du cours](../../README.md)

### Exemples connexes
- [Exemple de microservices](../../../../examples/microservices) - Modèles de communication entre services
- [Exemple Azure OpenAI](../../../../examples/azure-openai-chat) - Intégration IA

---

## Résumé

**Vous avez appris :**
- ✅ Cinq modèles de coordination (séquentiel, parallèle, hiérarchique, piloté par les événements, consensus)
- ✅ Architecture multi-agents sur Azure (Service Bus, Cosmos DB, Container Apps)
- ✅ Gestion de l'état entre agents distribués
- ✅ Gestion des délais d'attente, des tentatives de nouvelle exécution et des coupe-circuits
- ✅ Surveillance et débogage des systèmes distribués
- ✅ Stratégies d'optimisation des coûts

**Points clés :**
1. **Choisir le bon modèle** - Séquentiel pour les flux de travail ordonnés, parallèle pour la rapidité, piloté par les événements pour la flexibilité
2. **Gérer l'état avec soin** - Utiliser Cosmos DB ou similaire pour l'état partagé
3. **Gérer les échecs de manière robuste** - Délais d'attente, nouvelles tentatives, coupe-circuits, files de lettres mortes
4. **Tout surveiller** - Le traçage distribué est essentiel pour le débogage
5. **Optimiser les coûts** - Mettre à l'échelle jusqu'à zéro, utiliser le serverless, implémenter la mise en cache

**Prochaines étapes :**
1. Terminer les exercices pratiques
2. Construire un système multi-agents pour votre cas d'utilisation
3. Étudier [Sélection des SKU](sku-selection.md) pour optimiser les performances et les coûts

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'être précis, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour les informations critiques, une traduction professionnelle effectuée par un traducteur humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->